#!/usr/bin/env bash
# Checks that your agent system's files are set up the way OpenCode reads them.
# GitHub runs this on every pull request. You can also run it yourself: bash scripts/check-agent-files.sh
set -u
fail=0
problem() { echo "PROBLEM: $1"; fail=1; }
shopt -s nullglob

[ -f AGENTS.md ] || problem "AGENTS.md is missing from the top of the repo"

agents=(.opencode/agents/*.md)
[ ${#agents[@]} -gt 0 ] || problem "No agent files in .opencode/agents"
for f in "${agents[@]}"; do
  head -1 "$f" | grep -q '^---' || problem "$f needs to start with --- and its settings"
  grep -q '^description:' "$f" || problem "$f has no description"
  grep -q '^mode:' "$f" || problem "$f has no mode"
  grep -Eq '^permissions?:' "$f" || problem "$f has no permission block"
done

for d in .opencode/skills/*/; do
  s="${d}SKILL.md"
  if [ ! -f "$s" ]; then problem "${d} has no SKILL.md"; continue; fi
  name=$(basename "$d")
  grep -Eq "^name: *${name} *$" "$s" || problem "$s needs the line name: ${name}, matching its folder name"
  grep -q '^description:' "$s" || problem "$s has no description"
done

for f in .opencode/commands/*.md; do
  [ -s "$f" ] || problem "$f is empty"
done

if [ "$fail" -eq 0 ]; then echo "All agent files look right."; fi
exit "$fail"
