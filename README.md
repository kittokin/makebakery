# Makebakery: a Make-based static website generator

**Makebakery** is a static website generator, implemented as a set of configuration files for the build tool [GNU Make][].

The basic idea of using a Makefile to build static HTML files from various sources using various renderers is fairly well known.
Employing GNU Make in this way gets us several cool features "for free":

- Speed via multiprocessing. GNU Make has built-in parallelism. So if you have 8 cpu cores you can re-render your website about 8x as fast as you could with a single-process build tool.
- Speed via dependency tracking. When you change a source file, GNU Make is smart enough to know that it only needs to rebuild that portion of the rendered HTML, not the whole site.
- Language agnosticism. GNU Make doesn't care what languages you prefer to use with it; it works equally well with javascript stacks, c compilers, and scripting languages.
- Ubiquity. GNU Make has been around a long time and is fairly well-documented. Chances are good that it is available for your platform.

This particular implementation, however, employs some GNU Make features to implement a modular plug-in system. The goal of this project is to make it easy for you to extend it to work with your own renderers, template engines, and source file formats.

Here are some of the things you can do with it out-of-the-box:

- Render markdown to HTML with Pandoc, markdown, or your favorite renderer.
- Compile [CoffeeScript][] to JavaScript.
- Compile SASS to CSS.
- Run scripts in your sources directory that output HTML, implemented in JavaScript, Python, Ruby, Bash, or any other language.
- Run scripts in your sources directory that output markdown, and compile that into HTML the same as you would a markdown-format source file.
- Run scripts in your sources directory that output markdown, compile that into HTML, and wrap the result in a site template
- Run scripts in your sources directory that output site maps in multiple formats (JSON, RDF, XML, HTML, etc.)
- Wrap content in a template defined in GNU m4 with no changes to your source files (no tedious "include statements".)
- Retrieve resources from the Internet to be stored and served locally.

- A modular system for extensibility, allowing source file formats to be easily added to (or removed from) the system, without modifications to this project's Makefile.
- Included modules for source file formats:
- Included modules for templating: GNU m4, Pandoc, 

See the included [modules documentation](etc/mods-available) for examples and a list of included modules.

## Quick Start

Clone this repository.

Create a directory with source files, like this:

	src/
	|-- index.html.m4
	`-- style.css

Run `make`. It will output:

	install -m 644 -D src/style.css dst/style.css
	m4 -P macros.m4 src/index.html.m4 template.html.m4 > src/index.html
	install -m 644 -D src/index.html dst/index.html
	rm src/index.html

And produce the following structure:

	dst/
	|-- index.html
	`-- style.css

## Usage

Run `make`, specifying some parameters to control its execution, as follows.

You may employ Make's command-line options to speed up execution; I recommend using the following:

-  `--no-builtin-rules`: GNU Make includes [built-in rules](https://www.gnu.org/software/make/manual/html_node/Catalogue-of-Rules.html#Catalogue-of-Rules) for compiling C, C++, and Fortran programs. We don't need these when compiling HTML files.
-  `--no-builtin-variables`: GNU Make includes [built-in variables](https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html) for compiling programs. We don't need these when compiling HTML files. 
-  `--jobs` enables GNU Make's automatic parallelization. You can optionally provide it a maximum number of simultaneous jobs. See [5.4 Parallel Execution](https://www.gnu.org/software/make/manual/html_node/Parallel.html) in the GNU Make manual for more information.

You can use several Make parameters to configure the build:

- **SRC**: the path containing source files
- **DST**: the path where the output HTML should be rendered
- **MODS**: the path containing extension modules to be included

In addition, some demonstration source files and included modules rely upon some environment variables to be set. For consistency, I recommend that your source files and custom modules employ the same names:

- **BASEURL**: the url path to (or "mount point" for) our rendered HTML, when served by the webserver. 
- **SITEHOST**: the hostname of the site when served by the webserver.
- **DEFAULT_DOCUMENT**: set this to correspond with Apache's DefaultDocument setting; defaults to `index.html`.

I typically render my staging site by creating a shell script like so:

    #!/bin/sh

    export BASEURL='/~mike/datagrok.org'
    make -rRj4 \
        SRC=$src \
        DST=$HOME/public_html/datagrok.org \
        MODS=$src/.site/mods-enabled \
        DEFAULT_DOCUMENT=contents.html \
        M4_MACROS=$src/.site/macros.m4 \
        "$@"

## About the name

> Some websites, [the webmake documentation explains](http://webmake.taint.org/dist/doc/concepts.html), are fried up for the user every time. But others are baked once and served up again and again.
>
> —[Aaron Swartz: The Weblog, "Bake, don't Fry" (2002)](http://www.aaronsw.com/weblog/000404)

I used to call this project **m4-bakery**, which conflated the use of GNU Make for coordinating the rendering of files with the use of [GNU m4][] for templating. Now, all the `m4`-related logic is [moved into a module][m4-module], so you can easily avoid it in favor of more modern templating engines, if you prefer.

## Similar projects

It has been said that every programmer, at some point, writes a blog/website publishing engine. Here are some other such projects that are similar in some way.

- [staticsitegenerators.net](http://staticsitegenerators.net) contains a crowdsourced database of a myriad of different projects built for the same general purpose as this one.
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
