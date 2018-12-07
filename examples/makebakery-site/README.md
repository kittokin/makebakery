# datagrok.github.io/makebakery

This directory contains the source files that become the static website <https://datagrok.github.io/makebakery> when compiled with the **makebakery**-based _Makefile_.

To render it yourself, run `make` in this directory.

To update the live site there is a `gh-pages` Makefile target that can help. To use it:

1. Create a local `gh-pages` branch if you don't have one already.
  
    ```
    git branch gh-pages origin/gh-pages
    ```

    Note: don't use `git checkout` to create it; you don't want it to be the currently checked-out branch.

2. Create a local clone of this repo at the destination directory, with the `gh-pages` branch checked out.

    ```
    git clone -b gh-pages . ../build/makebakery
    ```
    
    If you have already run `make` you might need to delete the existing destination directory first.

3. (Optional) Run `make` to render the site to the destination directory while you make changes to the source files.

4. Run `make gh-pages`.

   This will render the site to the destination directory, commit the changes there, and then push that commit back into this repo, updating the local `gh-pages` branch.

4. Run `git push origin gh-pages` to push the updated `gh-pages` branch to GitHub. You'll need write access to the repo.
