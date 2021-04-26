% 🍞 Makebakery
% Michael F. Lamb
% Thu, 28 Feb 2013 18:27:11 -0500

**Makebakery** is a static website generator implemented using [GNU Make][].

![Photo: [Boris Bartels, "Bakery" (2006)][bakery attribution] ([CC-BY-SA 2.0][]). Resized.][image]

**_Static_ websites** are those which require no special logic on the server-side to work, as opposed to **_dynamic_ websites** which trigger some server-side processing for most page requests. 
\[[more...](documentation/about_static_sites/)\]

**_Make_** is a venerable old UNIX build tool intended for the compilation of software source code into executable code, but Makebakery puts it to use compiling websites.
**GNU Make** is one popular variant of _Make_ with several enhancements, included with most GNU/Linux distributions.
\[[more...](documentation/about_make/)\]

More accurately, Makebakery is a _collection of rules and recipes_ for GNU Make that are useful for the orchestration of various tools to the generation of various styles of static website.
Unlike minimalist _Make_-based approaches for generating static websites, Makebakery's features are organized into _modules_ which may be toggled according to the requirements of the site it is building.

## Motivation

The basic idea of using _Make_ to orchestrate building static HTML files from source files is fairly well-known.
I've been doing it since I learned of the idea in 1998, after reading [Using M4 to write HTML].

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

For a more detailed description, see [the "minimal" example](https://github.com/datagrok/makebakery/tree/master/examples/minimal) in the source code repository.

You might also add to the compilation pipeline a template engine like [Jinja][], a CSS compiler like [Sass][], image processing using [ImageMagick][], and any other custom scripts you please.
To enable a module, add its name to the `MODULES` variable and define any configuration variables it needs.

For a slightly more advanced example, examine the [Makefile](https://github.com/datagrok/makebakery/blob/master/examples/makebakery-site/Makefile) and associated [source files used to build this site](https://github.com/datagrok/makebakery/tree/master/examples/makebakery-site) (that you are reading).

---

Created by [Michael F. Lamb][]. License: [GNU Affero GPL version 3 or later][AGPL3], with additional permissions for output. See the [COPYING][] in the source code for more information.

[image]: bakery.jpg {.pull-right}
[AGPL3]: https://www.gnu.org/licenses/agpl-3.0.html
[CC-BY-SA 2.0]: https://creativecommons.org/licenses/by-sa/2.0/
[COPYING]: https://github.com/datagrok/makebakery/blob/master/COPYING.md
[GNU Make]: https://www.gnu.org/software/make/
[ImageMagick]: http://www.imagemagick.org
[Jinja]: http://jinja.pocoo.org/
[Sass]: https://sass-lang.com/
[Michael F. Lamb]: https://datagrok.org
[Pandoc]: http://johnmacfarlane.net/pandoc/
[Using M4 to write HTML]: http://web.archive.org/web/19980529230944/http://www.linuxgazette.com/issue22/using_m4.html
[bakery attribution]: https://www.flickr.com/photos/barthelomaus/104318646/ 
[github/makebakery]: https://github.com/datagrok/makebakery
