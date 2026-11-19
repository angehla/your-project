---
description: Save my work on a branch and open a pull request on GitHub
agent: git-helper
---

Save my work to GitHub. What I changed, in my words: $ARGUMENTS

1. Run git status and git diff --stat. Tell me in plain words which files changed.
2. If any changed file looks like a key, a password, a .env file, or notes with real names, stop and tell me. Don't save it.
3. Run git branch --show-current. If I'm on the default branch, usually main, make a new branch named for the change, like add-fact-checker, with git switch -c.
4. Add the changes and commit them with a one-line message that starts with a verb.
5. Push the branch to GitHub with git push -u origin and the branch name.
6. If this branch doesn't have a pull request yet, open one with gh pr create. Use the commit message as the title. In the body, fill in What changed and Why from the pull request template. Leave the boxes under How I tested it and Before I merge for me to check.
7. Show me the pull request link. Run gh pr checks and tell me which checks are still running. Remind me to run /ship when they pass.
