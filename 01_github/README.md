# Github

Sign in to Github and create a new repository for your work.

Create a directory for your CV. Github repositories should always have readmes to say what they are. Create a file called ```README.md``` and give your application a little description. Now make the folder a Github repository by:

```
git init
git status
git add README.md
git commit -m "Wrote README"
```

Now let's send this up to Github where it's backed up.

```
git remote add origin git@github.com:USERNAME/REPOSITORY.git
git push -u origin master
```

In future, all you have to do is `git push` to push any commits to Github

## Topics Covered

* Source Control
* Github