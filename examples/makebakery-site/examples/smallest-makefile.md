% makebakery without a Makefile
% Michael F. Lamb
% Wed, 21 Apr 2021 19:59:58 -0700

For most uses, you're expected to create a `Makefile` that sets some variables and then `include makebakery.mk`.
Recall the minimal example's Makefile:

```makefile
SRC      = .
DST      = /tmp/build/example
MODULES  = ___ignore __source pandoc
IGNORE   = README.html Makefile
include /path/to/makebakery.mk
```

But, it might be instructive to learn that you don't technically need your own Makefile at all.
You can specify variables as options on the command line when invoking `make`.
So by specifying `makebakery.mk` itself as the makefile, as long as you also specify all the options it needs, it will work the same.

# Minimal makebakery

If we start with

```
.
└── input
    └── index.html
```
and run
```
make -f /path/to/makebakery/makebakery.mk SRC=input DST=output MODULES=__source
```
this is the result:
```
.
├── input
│   └── index.html
└── output
    └── index.html
```

`__source` is the only module we've enabled here.
It describes how to use a hierarchy of files on the filesystem as sources.

# Plus one module

Of course, the previous example hasn't done much.
There's easier ways to make a verbatim copy of a tree of files!
So, let's do the same but enable the `pandoc` module for markdown processing.

Starting with

```
.
└── input
    └── index.md
```
and run
```
make -f /path/to/makebakery/makebakery.mk SRC=input DST=output MODULES="__source pandoc"
```
this is the result:
```
.
├── input
│   └── index.md
└── output
    └── index.html
```

