% 🍞 Makebakery
% Michael F. Lamb
% Thu, 28 Feb 2013 18:27:11 -0500

**Makebakery** is a static website generator implemented using [GNU Make][].

![Photo: [Boris Bartels, "Bakery" (2006)][bakery attribution] ([CC-BY-SA 2.0][]).][image]

**_Static_ websites** are those which require no special logic on the server-side to work, as opposed to **_dynamic_ websites** which trigger some server-side processing for most page requests. 
[More about static sites...](documentation/about_static_sites/)

**_Make_** is a venerable old UNIX build tool intended for the compilation of software source code into executable code, but Makebakery puts it to use compiling websites.
**GNU Make** is one popular variant of _Make_ with several enhancements, included with most Linux distributions.
[More about _Make_...](documentation/about_make/)

More accurately, Makebakery is a _collection of rules and recipes_ for GNU Make that are useful for orchestrating various tools to build various styles of static website.

Makebakery distinguishes itself from [other Make-based approaches](documentation/alternatives) by organizing these rules and recipes into _modules_ which may be toggled to suit your preference.

## Motivation

The basic idea of using _Make_ to orchestrate building static HTML files from source files is fairly well-known.
I encountered it in 1998 from [Using M4 to write HTML][] and I've been building sites this way ever since.

Unfortunately, I found myself re-implementing similar-but-different Makefiles over and over again for each different static site I wanted to build.
Makebakery is the result of refactoring my various Makefiles into modular parts, and finding a mechanism to toggle those parts on or off for any site that uses the collection.

## Example

A short Makefile is enough to get started:

```makefile
SRC      = .
DST      = /tmp/build/example
MODULES  = ___ignore __source pandoc
IGNORE   = README.html Makefile
include /path/to/makebakery.mk
```

When you run `make`, this will copy source files from the current directory to the destination directory, and use [Pandoc][] to convert Markdown to HTML in the process:

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

This is included as [the "minimal" example](https://github.com/datagrok/makebakery/tree/master/examples/minimal) in makebakery's source code repository.

You might then add to the compilation pipeline a template engine like [Jinja][], a CSS compiler like [Sass][], image processing using [ImageMagick][], and any other custom scripts you please.

To enable a module, add its name to the `MODULES` variable and define any configuration variables it needs.

For a slightly more advanced example, examine the [Makefile](https://github.com/datagrok/makebakery/blob/master/examples/makebakery-site/Makefile) and associated [source files used to build this site](https://github.com/datagrok/makebakery/tree/master/examples/makebakery-site) (that you are reading).

---

Created by [Michael F. Lamb][].
License: [GNU Affero GPL version 3 or later][AGPL3], with additional permissions for output.
See [COPYING][] for more information.

[image]: bakery.jpg {.rounded}
[AGPL3]: https://www.gnu.org/licenses/agpl-3.0.html
[CC-BY-SA 2.0]: https://creativecommons.org/licenses/by-sa/2.0/
[COPYING]: https://github.com/datagrok/makebakery/blob/master/COPYING.md
[GNU Make]: https://www.gnu.org/software/make/
[ImageMagick]: https://imagemagick.org
[Jinja]: https://jinja.jinja.palletsprojects.com
[Sass]: https://sass-lang.com/
[Michael F. Lamb]: https://datagrok.org
[Pandoc]: https://pandoc.org
[bakery attribution]: https://www.flickr.com/photos/barthelomaus/104318646/ 
[github/makebakery]: https://github.com/datagrok/makebakery
[Using M4 to write HTML]: https://web.archive.org/web/19980529230944/https://www.linuxgazette.com/issue22/using_m4.html
