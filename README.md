# Makebakery

**Makebakery** is a static website generator implemented using [GNU Make][].

More accurately, it is a collection of GNU Make _rules_ and _recipes_, organized into modules in a way that makes it easy to select and enable the functionality appropriate for your static website.

Check out <https://datagrok.github.io/makebakery> for more.
(That site itself is rendered using Makebakery, from sources in `examples/makebakery-site`.)

## Goals

- Source-language-agnostic. Supports a heterogeneous mix of markdown, scripts, coffeescript, etc.
- Tinker-able: easily add support for a new type of source format
- Useful for multiple styles of site: shell account on the webserver, git repository, s3, etc.
- DRY: I can use it for all my static sites

## Theory of operation

The user creates a Makefile which defines variables appropriate for their configuration, and then `include makebakery.mk`.

(This keeps site-specific configuration with the site itself, so the makebakery repo may exist unmodified, treated as a library.)

Of particular importance is the `MODULES` variable, which is a whitespace-separated list of *makebakery modules* that should be enabled.

A *makebakery module* is a file or subdirectory containing Make-syntax code stored within the `modules` directory.

A source file may be processed multiple times, according to its filename extension.
At each step, one layer of filename extension is removed.
For example, with the `executable`, `pandoc`, and `__paths_are_dirs` modules enabled, a file named  
`foo.html.md.run` would be executed and have its output captured to obtain  
`foo.html.md`, then processed by pandoc to obtain  
`foo.html`, then renamed to obtain  
`foo/index.html`.

Modules are responsible for defining or modifying the variable `targets`, which names all the files that should be rendered to generate the static site.
Modules also define rules for rendering those target files from (perhaps intermediate) source files.

Modules have an "in" and an "out" section. Modules' "in" sections are processed in alphanumeric order, then their "out" sections are processed in reverse alphanumeric order.
You can think of it like an onion: each module is a "layer" that wraps the next.

A typical set of MODULES might include:

- either __source or __multisource to get source files from the filesystem
- possibly __paths_are_dirs or extensionless_html to keep .html filename extensions out of URLs,
- one or more rendering engines for HTML pages, like pandoc or _m4, and
- possibly a processing engine like sass to make authoring css easier.

## About the name

> Some websites, [the webmake documentation explains](http://webmake.taint.org/dist/doc/concepts.html), are fried up for the user every time. But others are baked once and served up again and again.
>
> —[Aaron Swartz: The Weblog, "Bake, don't Fry" (2002)](http://www.aaronsw.com/weblog/000404)

I used to call this project **m4-bakery**, which conflated the use of GNU Make for coordinating the rendering of files with the use of [GNU m4][] for templating. Now, all the `m4`-related logic is [relegated to a module][m4-module], so you can easily avoid it in favor of more modern templating engines, if you prefer.

## Similar projects

It has been said that every programmer, at some point, writes a blog/website publishing engine. Here are some other such projects.

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
