# a minimal example

This directory uses a short [Makefile](Makefile) to render a simple example site:

```makefile
SRC      = .
DST      = /tmp/build/example
MODULES  = ___ignore __source pandoc
IGNORE   = README.html Makefile
include /path/to/makebakery.mk
```

When you run `make` in this directory, this will copy source files from the sources directory (`SRC`) to the destination directory (`DST`), and use [Pandoc][] to convert Markdown to HTML in the process:

```
.                        /tmp/build/example
├── about.md      ->     ├── about.html
├── contact.md           ├── contact.html
├── index.md             ├── index.html
├── logo.png             ├── logo.png
├── projects.md          └── projects.html
├── Makefile
└── README.md
```

This example uses three modules:

- **\_\_source** finds all the files in `SRC` and designates them to be copied to `DST`. With no other modules at work, all files would be copied verbatim.
- **pandoc** specifies that any files ending in `.md` found by other modules (only **\_\_source** in this case) should be converted to `.html` at the destination.
- **\_\_\_ignore** uses the `IGNORE` variable to specify that some files that would otherwise be rendered should be ignored instead.
