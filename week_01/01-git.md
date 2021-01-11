# Intro to Git

### What is and why should care?
- Version Control System

## Terminology
- `repository` | `repo` : storage location for a software package ("a folder with git monitoring")
- `untracked` : a file or directory not monitored by git, does not belong to the repo
- `tracked` : a file that was added to the git repository

## Commands

`git init`
- Turns a folder into an empty repository

`git add <file>`
- Adds a file to a repo stanging area

`git restore --staged <file>`
- Removes a file from staging area

`git commit -m "<message>"`
- Writes all changes on staging area to repo

`-a`: Commits all changes to files belonging to repo (all files that were previously added)

`-am` == `-a -m`

`git log`
- Shows all commits on a repo

`git remote add <name> <url>`
- Connects the current local repo to a remote on <url> by the name of <origin>