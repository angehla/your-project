---
description: Merge my pull request after its checks pass
agent: git-helper
---

Merge the pull request for the branch I'm on. $ARGUMENTS

1. Run gh pr checks.
2. If any check is still running, tell me to wait a minute and run /ship again. Stop.
3. If a check failed, run gh run list --branch with this branch's name and --limit 1, then gh run view with that run's ID and --log-failed. Tell me in plain words what failed and which file, and recommend a fix. Don't merge. Stop.
4. If every check passed, show me the pull request title, then merge it with gh pr merge --squash --delete-branch.
5. Find the default branch with gh repo view --json defaultBranchRef --jq .defaultBranchRef.name. Switch back to it with git switch, then run git pull.
6. Show me git log --oneline -3 and tell me the merge is done.
