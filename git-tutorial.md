# Git Workflow

This is the workflow our team will use for the senior project.

## Step 1: Configuring repos

Our whole team already has this setup, but I will highlight what we have done.
I have the main repo at: `https://github.com/ashermancinelli/APE/`, which every team member has forked.
Each team member has cloned their own repo, and added my repo as another remote with this command:

```bash
git remote add upstream https://github.com/ashermancinelli/APE.git
```

This means each member had two remotes, their own and my main repo. For example,
```bash
> git remote -v

origin	<my repo location> (fetch)
origin	<my repo location> (push)
upstream	git@github.com:ashermancinelli/APE.git (fetch)
upstream	git@github.com:ashermancinelli/APE.git (push)
```

We now have two remote repositories to track from: my main repo, and each person's individual repo.

## Step 2: Making a Change

Before working, each person must be on the most up-to-date developement branch of my main repo with this:
```bash
git checkout dev
git pull upstream dev
```
This pulls any changes to the developement branch of the main repo down to your computer.

Now you have a change to make, but first you have to create a new branch to add these changes to.
To do that, use the command:
```bash
git branch my_issue_fix
git checkout my_issue_fix
```
Or the shortcut,
```bash
git checkout -b my_issue_fix
```

Both of these commands do the same thing.
Now you edit your files and make your changes. You can use `git status` to see what changes you've made.

Let's say you changed the file `README.md`. You should see something like this:
```bash
> git status

On branch my_issue_fix
Your branch is up to date with 'origin/dev'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   README.md
```
Then run `git add README.md` to add the file, and any other file that you changed.
Then you commit your changes with a commit message like so:
```bash
git commit -m "added some functions and tests"
```
Now you have changes on your local branch, and you need to push those changes up to your fork of my repo in a new branch.
You can do that with this command:
```bash
git push --set-upstream origin my_issue_fix
```
Or with this shortcut, which does the same thing but with a shorter command:
```bash
git push -u origin my_issue_fix
```
Now you have all your changes, committed to a branch off of `dev`, and pushed to your repo.
Now you go to Github, to your fork of the repo, and you should see a nice button that asks you if you would like
to 'compare and pull' from your branch to my repo. Make sure you select the `dev` branch of my repo when you submit the pull request.

## Step 3: Pull Requests

Now you have submitted a pull request. From here, we can all look at the changes you made and make comments on individual lines.
From here we decide if we want to use the changes, and if so I will merge your branch onto my `dev` branch, and the next
time everyone works we will all see the changes.
