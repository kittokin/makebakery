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

For a slightly more advanced example, examine the source code for this site (that you are reading).

This website is the result of running `make` from the `/examples/makebakery-site` directory of the Makebakery repository.
Visit [the Makebakery project page on GitHub][github/makebakery] to see the source code.

## Features

From my static site generator, I wanted:

- to use [Pandoc][] or sometimes [discount][] to author HTML pages on my website(s) using [Markdown][]
- to build pages in parallel, taking advantage of all my processor cores
- to have a multi-step pipeline, so that I might have a shell script output Markdown syntax, which would then be processed into HTML by Pandoc.
- to organize my pages into a hierarchy if I prefer, not just a flat collection or serialized "blog"
- a website navigation mechanism visible on every page that will automatically update itself whenever I make changes to pages
- all my pages to automatically share a common design
- to have the option of occasionally authoring pages _not_ in Markdown, but instead raw HTML or generated from a script
  - but still automatically share the common page design
- to author interactive features with [coffeescript][] and have it automatically convert to JavaScript
- to serve fonts and javascript libraries from my website, without manually "vendoring" a copy into my git repository
- an efficient build mechanism that would update only the pages whose source files have changed
- URLs which do not reveal filename extensions
- to deploy on Apache that I do not control, on an nginx that I do control, on an S3 bucket configured for website hosting, or to GitHub Pages.
- when I'm feeling masochistic, to use [GNU M4][] to do templating like I did back in '99
- to be language-agnostic; to use any language or mix of languages in little scripts that could be used to generate pages


- Unlike many other static site generators, Makebakery tries to remain programming-language-agnostic. Use any language, or a mix of languages, to implement modules or scripts that run at compile time to generate page content.
- Pages are compiled in a pipeline according to their filename extension. You may freely mix markdown, raw html, compile-time executables, and other files within your sources. Also, you may chain them together, so that for example a Python script might retrieve information from a database and render markdown, which is then rendered into html.
- With the index module, a page may be designated for compilation in a second pass. This enables:
    - **Programmatic and HTML site maps.** Look at how `examples/makebakery-site/pages.json.m4.index` renders a .json [index of all the pages on the site](pages.json). This enables us to automatically build navigation bars like the one in the header on this page, or "recent changes" links, all on the client side. Take careful note of this: the site is static but the header bar will *automatically be updated whenever pages are added or removed*.
    - **Feeds**. Look at how `examples/makebakery-site/atom.xml.m4.index` renders [an atom-format .xml file](atom.xml) of changes made to the site. Even though the site is static you can still have it update feed readers whenever you make a change.
- Modular features: disable the ones you don't use for more speed, or build your own without merge conflicts.

## About static sites

Static websites are those whose content is pre-rendered and require only simple software to serve to visitors.

Static websites are useful because they're effortlessly fast, scalable, and cache-able. Compared to dynamic sites, static sites are much easier to secure, and can be served from the very cheapest of hosting services.

This technique of pre-rendering static pages websites [has been called *baking*][baking] a website, as opposed to a short-order server *frying* up each page upon each request.

- have fewer vectors for break-ins, 
- easily scale to handle massive amounts of traffic, and 
- may be hosted on commodity hardware or the cheapest of web hosting services.

Of course, with no processing occurring on the server end, it's not possible to host user-interactive features like comments sections, authentication, or e-commerce systems. These days however, many people use third-party tools like [Disqus](http://disqus.com) to implement these features anyway, or rely on third-party forums like to provide discussion areas for their content.

In short, if you're not using any of the dynamic features of your web hosting service, you might as well make the whole site static. If you _are_ using those features on some areas of your site, you're better off making the static parts simple static files.

If _Makebakery_ doesn't meet your needs, it is only one of [literally hundreds of different static site generators][staticsitegenerators] that people have made. A friend of mine wrote [coleslaw][] and I've heard good things about [Pelican][] too.

## About _Make_

_Make_ is a build tool that figures out which commands need to be run to transform some given set of source files into a desired set of output files.
Modern work-alikes include [Grunt][], [Rake][], or [Ant][].
Despite its age and the number of times it has been re-invented, _Make_ has some surprising features that I think makes it superior to the newcomers:

- When invoked multiple times, it is smart enough to only recompile target files whose source files have changed.
- When used on multi-core systems or with I/O heavy jobs, it is smart enough to figure out how to parallelize its work.
- _Make_ can apply multiple compilation steps to each source file to render the desired output, and it cleans up the intermediate files automatically.

_Make_ has a rather steep learning curve, but since it is so ubiquitous, it's likely to be already installed on your computer, and your web host's servers, and easy to obtain if not.

_Make_ is a POSIX standard, but Makebakery relies on a specific implementation with non-standard features: [GNU Make][]. Why?

Mostly because that's what is installed on all my computers, all of which run Debian GNU/Linux.
It's Free Software so it's not difficult to get running on other platforms.
Making a similar system based on POSIX _Make_ or [Plan 9's Mk][Mk] might be possible, but it's not a high priority for me.

> ... the POSIX standard version of Make is extraordinarily feature-poor; it lacks many basic functions that people need in practice. As a result, most people create makefiles (the input files to make) that require specific implementations instead of just following the POSIX standard. Typically that specific implementation is GNU make; since GNU make runs on nearly every Unix-like system, and is FLOSS, this is an easy requirement to meet.
>
> --David Wheeler, [Improving Make (2014)][]

More about _Make_ and GNU Make: [Wikipedia: Make (software)][W:Make]

## Coming soon

- Example of how to automatically build a blog from a collection of posts, with RSS and ATOM feeds.
- Example of how to automatically build a breadcrumbs bar.
- Example of how to automatically build a [sitemap][].
- Example of how to automatically compile Twitter Bootstrap CSS from its LESS or SASS sources.
- Example of a static AJAX-based application, its static backend, and the [HTML Snapshot needed][ajax-crawling] for non-JavaScript browsers and web-crawlers to index it.
- Example of using `phpcli` to make a typical PHP-format dynamic site static.

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
