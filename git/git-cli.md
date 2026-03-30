# 📘 Git & GitHub Commands

This document contains the essential Git and GitHub commands I use frequently as a DevOps developer.


## 🔧 Setup
```bash
git config --global user.name "Suraj Vishwakarma"
git config --global user.email "your@email.com"
git config --global core.editor "code --wait"
````


## 📁 Initialize & Clone

```bash
git init                   # Initialize a local repo
git clone <repo-url>       # Clone from GitHub
```


## 📄 Staging & Committing

```bash
git add <file>             # Add file to stage
git add .                  # Add all changes
git commit -m "message"    # Commit changes with message
git commit -am "msg"       # Add & commit tracked files
```



```bash
git branch                 # List branches
git branch <branch-name>  # Create new branch
git checkout <branch>     # Switch to branch
git checkout -b <branch>  # Create + switch to new branch
git merge <branch>        # Merge into current branch
```


## ⬆️ Push & Pull

```bash
git push origin <branch>  # Push to GitHub
git pull origin <branch>  # Pull latest changes
```


## 🚫 Undo & Reset

```bash
git reset --soft HEAD~1   # Undo last commit (keep changes)
git reset --hard HEAD~1   # Delete last commit completely
git checkout -- <file>    # Discard changes in file
```


## 🧠 Useful

```bash
git status                # Show current status
git log                   # Show commit logs
git diff                  # Show unstaged changes
git remote -v             # Show remote URLs
git stash                 # Save local changes temporarily
git stash pop             # Re-apply stashed changes
```


## 🛠 GitHub Workflows (Basic)

```bash
# Add remote
git remote add origin https://github.com/username/repo.git

# Push initial commit
git push -u origin main

# Forking flow
git remote add upstream https://github.com/original/repo.git
git fetch upstream
git merge upstream/main
```


## 🧪 .gitignore Example

```gitignore
node_modules
.env
.DS_Store
dist
```


## ✅ Tips

* Commit often with meaningful messages.
* Always pull before pushing.
* Use branches for new features/fixes.


## 📚 Resources

* [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
* [Oh My Git! (Game)](https://ohmygit.org/)

