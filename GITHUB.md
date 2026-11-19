# Git and GitHub Best Practices

Agents can change a lot of files fast. These habits make sure you can always see what changed, go back if something breaks, and never leak a key or a real name. They're the same habits software teams use every day.

Your GitHub kit sets most of this up for you. This guide explains what it does and why.

## The words you need

| Word | What it means |
| --- | --- |
| Repo | A project folder that Git is tracking |
| Commit | A save point with a one-line note about what changed |
| Branch | A copy of your work where you try a change without touching main |
| main | The working version of your system. It should always run |
| Push | Upload your commits to GitHub |
| Pull request | A request to merge a branch into main. GitHub runs checks on it first |
| Check | An automatic test GitHub runs on every pull request |
| Merge | Add a branch's changes to main |

## How every change moves

Every change follows the same path, even when you're the only one working on the project:

- **Branch:** start a branch for one change, like add-fact-checker.
- **Commit:** save your work on that branch.
- **Push:** upload the branch to GitHub.
- **Pull request:** open one. GitHub runs its checks.
- **Merge:** when every check passes, merge it into main.

In OpenCode, two commands do this for you:

| Type this | What happens |
| --- | --- |
| /save Added the fact checker | The Git Helper agent makes a branch if you need one, commits, pushes, and opens a pull request |
| /ship | The Git Helper checks that every check passed, merges the pull request, and brings main up to date on your laptop |

OpenCode asks before each command that changes something. Read what it wants to run, then choose Allow once.

## Why bother with pull requests when you work alone

- **main always runs.** A half-finished change lives on its branch until it works.
- **The checks catch mistakes before they land.** A key, a broken agent file, or a skill with the wrong name gets flagged on the pull request.
- **You get a record.** Each pull request says what changed, why, and how you tested it. That's most of your Milestone 4 Test and Revision Log, already written.

## What the checks do

| Check | What it looks for | If it fails |
| --- | --- | --- |
| No secrets | Keys, passwords, and tokens anywhere in your changes | Don't merge. Remove the key, and if it's a real key, revoke it and make a new one. Then tell me |
| Agent files | AGENTS.md exists, every agent file has a description, a mode, and a permission block, and every skill's name matches its folder | Fix the file it names. The error says what's missing |
| Markdown | Formatting problems in AGENTS.md and your .opencode files that can confuse a model | Ask OpenCode to fix the formatting in the file it names |

Run /ship to see why a check failed. The Git Helper reads the error and explains it in plain words.

## Commit small and often

- **Commit before you ask an agent for a big change.** If you don't like the result, you can go back.
- **Commit after something works.** Your next change might break it.
- **One change per branch.** Adding the fact checker and rewriting a skill are two branches.

## Write messages future you can use

- Start with a verb: Add, Fix, Change, or Remove.
- Say what changed, in one line: Fix post writer skipping the carpool time.
- Skip messages like update or stuff. You'll search these later.

## What never goes in a repo

Even a private repo can be shared later, and deleting a file doesn't remove it from the history.

- **Keys and passwords.** Your Lumen key lives in a setting on your laptop, not in your project files. Keep it that way.
- **Real names and details that identify someone.** Use made-up names or labels in sources and test inputs.
- **Recordings and raw interview notes.** Keep them in a private folder. The kit's .gitignore file keeps folders named private and recordings out of your repo.

If one of these gets committed, stop and tell me right away. If it's a key, revoke it on your Lumen Profile page first.

## Never do these

- **Never force push.** It erases history on GitHub. The safety settings block it.
- **Never commit to main directly** after your first commit. Use a branch.
- **Never make a repo public** for this class. Share it by adding collaborators.
- **Never delete a repo to start over.** Make a new branch instead.

## When something goes wrong

| What you see | What to do |
| --- | --- |
| The agent changed files and broke something | Run git restore . to throw away changes since your last commit. Ask OpenCode first if you're unsure |
| A check failed | Run /ship. It explains what failed and recommends a fix |
| git push says rejected or fetch first | Run git pull, then /save again |
| You're on main with changes you didn't commit | Run /save. It moves your changes to a new branch |
| gh says you're not logged in | Run gh auth login again. See Step 4 of the GitHub Setup Guide |
| Anything else | Email me at dohman@illinois.edu with a screenshot |

## Sharing your repo

- Your repo is private. Only you and the people you add can see it.
- I'm added as a collaborator when you set up the repo, so I can see your work.
- Later in the term, you'll add your critique group the same way.
- In Canvas, submit your repo's GitHub address, like github.com/yourname/your-project.
