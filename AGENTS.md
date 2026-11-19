# AGENTS.md

Who this system is for, the team that builds club slide decks, the folders it works in, the quality standards it must meet, and the rules every agent follows.

## Who this system is for

- **The club.** This system produces club slide decks for the club and its analyst.
- **It produces:** finished club slide decks, made from an outline, using the club's PowerPoint template.
- **It's for:** the club and its analyst.
- **It starts from these inputs:** the analyst's section outline and the club's PowerPoint template.

_Source: Part 1 of the system design (objective rows, drafted from design context)._

## The team

### Agents

Each agent has one job and runs as a subagent.

- **Layout agent** (`.opencode/agents/layout.md`) — picks which club-template layout each slide uses and places each outline point into a holding box with nothing filled in yet.
  _Source: Part 2, Agent 1 card; Part 8 one-path order ("picks layout")._
- **Fill agent** (`.opencode/agents/fill.md`) — puts each point from the outline into its box, one point per box, transcribing only, no added text.
  _Source: Part 2, Agent 2 card; Part 8 one-path order ("fills text")._
- **Checker agent** (`.opencode/agents/checker.md`) — inspects the finished deck against the quality standards and reports any slide that fails, without editing.
  _Source: Part 2, Agent 3 card; Part 8 one-path order ("checks the slides")._

### Skills

Each skill is a method an agent follows the same way every time.

- **Layout-matching** (`.opencode/skills/layout-matching/SKILL.md`) — used by the Layout agent.
  _Source: Part 3, Skill 1._
- **Point-mapping** (`.opencode/skills/point-mapping/SKILL.md`) — used by the Fill agent.
  _Source: Part 3, Skill 2._
- **Standards-checking** (`.opencode/skills/standards-checking/SKILL.md`) — used by the Checker agent.
  _Source: Part 3, Skill 3._

### The person who makes a call

- The **analyst** reviews the finished deck and the checker's report. The system stops before the analyst's decision on the run path. _Source: Part 4, Agent 2/3 cards ("saved for the analyst to review"); Part 7 Human decision 1 occurs at/after this point._

## The folders

- **`sources/`** — the inputs the system reads: the analyst's section outline, the club PowerPoint template, the design-rules file, and the sample/reference decks.
  _Source: Part 4 Sources._
- **`drafts/`** — work in progress: the deck skeleton and the filled deck during the run.
  _Source: Part 2 output fields (handoffs between agents); mapped to drafts as in-progress files._
- **`outputs/`** — the finished result: the final deck and the checker's pass/fail report.
  _Source: Part 2 output fields (finished deck, pass/fail report)._

## Quality standards

Every agent's output must meet these standards. _Source: Part 1 table._

1. Every text box uses only the club template's fonts and colors. — checked by the Checker agent.
2. Every slide uses one of the template's built-in layouts. — done by the Layout agent; checked by the Checker agent.
3. No overlapping boxes, misaligned columns, or clip art. — checked by the Checker agent.
4. Every line of text on a slide comes from the outline. Nothing is added as filler. — done by the Fill agent; checked by the Checker agent.
5. Each box on a slide holds one point from the outline, and no point appears in more than one box. — done by the Fill agent; checked by the Checker agent.

## Rules every agent follows

1. Use only the club template's fonts, colors, and built-in layouts (standards 1 and 2). _Source: Part 1._
2. Do not create overlapping boxes, misaligned columns, or clip art (standard 3). _Source: Part 1._
3. Every line of text must come from the outline; do not add filler (standard 4). _Source: Part 1, Skill 2._
4. Put exactly one outline point in each box; never repeat a point (standard 5). _Source: Part 1, Skill 2._
5. Never change what the outline says or how a point is framed (e.g. example vs recommendation). _Source: Part 7, Human decision 1; Skill 2 Rule 4._
6. Per the file plan, the sources live in `sources/`; the Layout agent reads from `sources/`, and the Fill and Checker agents read outputs/handoffs from `drafts/` and `outputs/`. Agents write work in progress to `drafts/` and finished results to `outputs/`.
7. No agent may act on materials that are not in `sources/` or explicitly named as inputs in `AGENTS.md`.