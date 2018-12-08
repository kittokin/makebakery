# a minimal example

The Makefile in this directory renders a simple example site:

- **__source** generates targets from a hierarchy of files on the filesystem.
- **___ignore** allows us to specify that this README (for GitHub) should not be processed.
- **pandoc** converts files named `*.md` to `*.html`.

So, running `make` will do this:

```
source           ->     rendered
├── index.md            ├── index.html
├── Makefile            └── Makefile
└── README.md
```
