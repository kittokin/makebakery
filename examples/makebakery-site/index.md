% 🍞 Makebakery
% Michael F. Lamb
% Thu, 28 Feb 2013 18:27:11 -0500

**Makebakery** is a static website generator implemented using [GNU Make][].

![Photo: [Boris Bartels, "Bakery" (2006)][bakery attribution] ([CC-BY-SA 2.0][]). Resized.][image]

A **_static_ website** is one which requires no special logic on the server-side to work, as opposed to _dynamic_ websites which trigger some server-side processing for most page requests. 

**_Make_** is a venerable old UNIX build tool intended for the compilation of software source code into executable code, but Makebakery puts it to use compiling websites.
**GNU Make** is one popular variant of _Make_ with several enhancements, included with most GNU/Linux distributions.

More accurately, Makebakery is a _collection of rules and recipes_ for GNU Make that are useful for orchestrating various tools in the generation of static websites of varying architecture. 
Unlike minimalist _Make_-based approaches for generating static websites, Makebakery's features are organized into _modules_ which may be toggled according to the requirements of the site it is building.

## Motivation

The basic idea of using _Make_ to orchestrate building static HTML files from source files is fairly well-known.
I've been doing it since I learned of the idea in 1998, after reading [Using M4 to write HTML].

Unfortunately, I found myself re-implementing similar-but-different Makefiles over and over again for each different static site I wanted to build.
Makebakery is the result of refactoring my various Makefiles into modular parts, and finding a simple mechanism to toggle those parts on or off for any site that uses the collection.

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

You might also add to the compilation pipeline a template engine like [Jinja][], CSS compilers like [LESS][], image processing using [ImageMagick][], and any other custom scripts you please.
Adding a new conversion tool to this example is as simple as adding its module's name to the `MODULES` variable, and defining any configuration variables it needs.

For a slightly more advanced example, examine [Makefile](https://github.com/datagrok/makebakery/blob/master/examples/makebakery-site/Makefile) and the associated [source files used to build this site](https://github.com/datagrok/makebakery/tree/master/examples/makebakery-site) (that you are reading).

---

Created by [Michael F. Lamb][]. License: [GNU Affero GPL version 3 or later][AGPL3], with additional permissions for output. See the [COPYING][] in the source code for more information.

[image]: bakery.jpg {.pull-right}
[AGPL3]: https://www.gnu.org/licenses/agpl-3.0.html
[Ant]: http://ant.apache.org
[CC-BY-SA 2.0]: https://creativecommons.org/licenses/by-sa/2.0/
[COPYING]: https://github.com/datagrok/makebakery/blob/master/COPYING.md
[GNU Make]: https://www.gnu.org/software/make/
[Grunt]: gruntjs.com
[ImageMagick]: http://www.imagemagick.org
[Improving Make (2014)]: https://www.dwheeler.com/essays/make.html
[Jinja]: http://jinja.pocoo.org/
[LESS]: http://lesscss.org/
[Michael F. Lamb]: https://datagrok.org
[Mk]: http://doc.cat-v.org/plan_9/4th_edition/papers/mk
[Pandoc]: http://johnmacfarlane.net/pandoc/
[Rake]: http://rake.rubyforge.org
[Using M4 to write HTML]: http://web.archive.org/web/19980529230944/http://www.linuxgazette.com/issue22/using_m4.html
[W:Make]: https://en.wikipedia.org/wiki/Make_%28software%29
[ajax-crawling]: https://developers.google.com/webmasters/ajax-crawling/docs/learn-more
[bakery attribution]: https://www.flickr.com/photos/barthelomaus/104318646/ 
[baking]: examples/whats-in-a-name/
[coleslaw]: https://github.com/kingcons/coleslaw
[github/makebakery]: https://github.com/datagrok/makebakery
[pelican]: https://blog.getpelican.com/
[sitemap]: http://www.sitemaps.org
[staticsitegenerators]: https://staticsitegenerators.net/
