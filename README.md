# Makebakery: a Make-based static website generator

**Makebakery** is a static website generator, implemented as a set of configuration files for the build tool [GNU Make][].

The basic idea of using a Makefile to orchestrate building static HTML files from source files is fairly well known.

I found myself re-implementing similar-but-different Makefiles over and over again for each static site I wanted to build.

Since each site might differ in its configuration and infrastructure, no single Makefile could fit them all.

So, Makebakery is a collection of Make modules containing common functionality and hacks, that one may select among and enable through configuration.

## Goals

- Source-language-agnostic. Supports a heterogenous mix of markdown, scripts, coffeescript, etc.
- Tinker-able: easily add support for a new type of source format
- Useful for multiple styles of site: shell account on the webserver, git repository, s3, etc.
- DRY: I can use it for all my static sites

## Quick Start

Clone this repository somewhere.

Create a file named `Makefile` with this content:

``` makefile
SRC = src
DST = dst
MODULES = __source pandoc
include /path/to/makebakery.mk
```

Where `/path/to/makebakery.mk` is the full path to the file `makebakery.mk` in your clone of this repo.

Create a directory with source files, like this:

	src/
	|-- index.md
	`-- style.css

Run `make -Rj`. The `-Rj` is optional, but will likely speed up the compilation.

    ...

And produce the following structure:

	dst/
	|-- index.html
	`-- style.css

## Usage

Several Make parameters to configure the core behavior:

- **SRC**: the path containing source files
- **DST**: the path where the output HTML should be rendered
- **MODULES**: a space-separated list of modules to enable

Each module may respond to its own additional parameters.

- **BASEURL**: the url path to (or "mount point" for) our rendered HTML, when served by the webserver. 
- **SITEHOST**: the hostname of the site when served by the webserver.
- **DEFAULT_DOCUMENT**: set this to correspond with Apache's DefaultDocument setting; defaults to `index.html`.

And you might need some site-specific configuration (but I'm trying to think of ways to eliminate elaborate Makefile hacks for most purposes.)

## About the name

> Some websites, [the webmake documentation explains](http://webmake.taint.org/dist/doc/concepts.html), are fried up for the user every time. But others are baked once and served up again and again.
>
> —[Aaron Swartz: The Weblog, "Bake, don't Fry" (2002)](http://www.aaronsw.com/weblog/000404)

I used to call this project **m4-bakery**, which conflated the use of GNU Make for coordinating the rendering of files with the use of [GNU m4][] for templating. Now, all the `m4`-related logic is [moved into a module][m4-module], so you can easily avoid it in favor of more modern templating engines, if you prefer.

## Similar projects

It has been said that every programmer, at some point, writes a blog/website publishing engine. Here are some other such projects that are similar in some way.

- [staticsitegenerators.net](http://staticsitegenerators.net) contains a crowdsourced database of a myriad of different static site generators.
- [Phil "technomancy" Hagelberg](https://technomancy.us/colophon) uses a minimalist approach including a 12-line Makefile and GNU M4.
- I'm excited by David Thompson's [Haunt](https://dthompson.us/projects/haunt.html) because it is implemented in GNU Guile Scheme.
- [Pelican](http://getpelican.com) is a popular Python-based static generator that some friends enjoy.
- [ironfroggy](https://github.com/ironfroggy)'s [jules](https://github.com/ironfroggy/jules)
- [nathanielksmith](https://github.com/nathanielksmith)'s [Cadigan](https://github.com/nathanielksmith/cadigan)
- [redline6561](https://github.com/redline6561)'s [Coleslaw](https://github.com/redline6561/coleslaw)
- Brandon Invergo's [m4-bloggery](https://gitorious.org/bi-websites/m4-bloggery) is based on this project but takes some slightly different approaches.
- davatron5000's [crowdsourced recommendations gist](https://gist.github.com/davatron5000/2254924)

# License: AGPL-3.0+ with additional permissions

This software is copyright 2016 [Michael F. Lamb][] and released under the terms of the [GNU Affero General Public License, Version 3][AGPL-3.0+] (or, at your option, any later version,) with a grant of additional permission that allows you to apply any terms you wish to the output HTML and Javascript. For details, see [COPYING.md](COPYING.md).

[AGPL-3.0+]: http://www.gnu.org/licenses/agpl.html
[Michael F. Lamb]: http://datagrok.org
[GNU Make]: http://www.gnu.org/software/make/
[GNU m4]: https://www.gnu.org/software/m4/
[m4-module]: modules/m4/
[CoffeeScript]: http://coffeescript.org/
[built-in variables]: https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
