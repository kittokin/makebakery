# datagrok.github.io/makebakery

This directory contains the source files that become the static website <https://datagrok.github.io/makebakery> when compiled with the **makebakery**-based _Makefile_.

To build it yourself, run `make`.

To update the live site:

1. Create a local `gh-pages` branch. You don't have to check it out.
  
    ```
    git branch gh-pages origin/gh-pages
    ```

2. Clone the repo to the destination directory with the `gh-pages` branch checked out.

    ```
    git clone -b gh-pages . ../build/makebakery

    ```
    
3. Run `make gh-pages`. This will update the local `gh-pages` branch.

4. Run `git push`.
