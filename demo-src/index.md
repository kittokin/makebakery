% Makefile-Based Static Website Generator
% Michael F. Lamb
% Thu, 28 Feb 2013 18:27:11 -0500

![Photo: [Boris Bartels, "Bakery" (2006)][bakery attribution] ([CC-BY-SA 2.0][]). Resized.][image]

**makebakery** is a system of *Makefiles* that builds a static website from various sources, using the venerable old UNIX tool _Make_. Unlike typical Make-based approaches, its features are organized into modules which may be toggled according to your preferences.

A *static* website is one which requires no special logic on the server-side to work, as opposed to *dynamic* websites which trigger some server-side processing for most page requests. 

_Make_ is a tool that figures out which commands need to be run to transform some given set of source files into a desired set of output files. Originally created for compilation of source code into executable code, Makebakery uses *Make* to transform files in various source formats like *Markdown* into an HTML website.

I show in the demonstration site source code (which builds the site you are reading) how one might wire up their favorite HTML-generating tools to Makebakery. I recommend [Pandoc][], which lets you keep source files in Markdown format. You might also add to the compilation pipeline a template engine like [Jinja][], CSS compilers like [LESS][], image processing using [ImageMagick][], and any other custom scripts you please.

This website is the result of running `make` in the root of the makebakery source code directory, which compiles the included demo site source in `/demo-src` to HTML in `/build/makebakery`. Visit [the makebakery project page on GitHub][github/makebakery] to learn more.

## Interesting features

Static site generators are fairly boring, but there are some clever pieces within makebakery:

- Thanks to built-in support for multiprocessing in *Make*, makebakery takes advantage of multi-core machines to compile pages in parallel.
- Unlike many other static site generators, makebakery tries to remain programming-language-agnostic. Use any language, or a mix of languages, to implement modules or scripts that run at compile time to generate page content.
- Pages are compiled in a pipeline according to their filename extension. You may freely mix markdown, raw html, compile-time executables, and other files within your sources. Also, you may chain them together, so that for example a Python script might retrieve information from a database and render markdown, which is then rendered into html.
- With the index module, a page may be designated for compilation in a second pass. This enables:
    - **Programmatic and HTML site maps.** Look at how `demo-src/pages.json.m4.index` renders a .json [index of all the pages on the site](pages.json). This enables us to automatically build navigation bars like the one in the header on this page, or "recent changes" links, all on the client side. Take careful note of this: the site is static but the header bar will *automatically be updated whenever pages are added or removed*.
    - **Feeds**. Look at how `demo-src/atom.xml.m4.index` renders [an atom-format .xml file](atom.xml) of changes made to the site. Even though the site is static you can still have it update feed readers whenever you make a change.
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

If _makebakery_ doesn't meet your needs, it is only one of [literally hundreds of different static site generators][staticsitegenerators] that people have made. A friend of mine wrote [coleslaw][] and I've heard good things about [Pelican][] too.

## About *Make*

Modern *Make* work-alikes include [Grunt][], [Rake][], or [Ant][]. Despite its age and the number of times it has been re-invented, Make has some surprising features that I think makes it superior to the newcomers:

- When invoked multiple times, it is smart enough to only recompile target files whose source files have changed.
- When used on multi-core systems or with I/O heavy jobs, it is smart enough to figure out how to parallelize its work.
- Make can apply multiple compilation steps to each source file to render the desired output, and it cleans up the intermediate files automatically.

`Make` has a rather steep learning curve, but since it is so ubiquitous, it's likely to be already installed on your computer, and your web host's servers, and easy to obtain if not.

Make is a POSIX standard, but makebakery relies on a specific implementation with non-standard features: [GNU Make][]. Why?

> ... the POSIX standard version of Make is extraordinarily feature-poor; it lacks many basic functions that people need in practice. As a result, most people create makefiles (the input files to make) that require specific implementations instead of just following the POSIX standard. Typically that specific implementation is GNU make; since GNU make runs on nearly every Unix-like system, and is FLOSS, this is an easy requirement to meet.
>
> --David Wheeler, [Improving Make (2014)][]

More about Make and GNU Make: [Wikipedia: Make (software)][W:Make]

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
[bakery attribution]: https://www.flickr.com/photos/barthelomaus/104318646/ 
[baking]: examples/whats-in-a-name/
[Grunt]: gruntjs.com
[Rake]: http://rake.rubyforge.org
[Ant]: http://ant.apache.org
[Pandoc]: http://johnmacfarlane.net/pandoc/
[Jinja]: http://jinja.pocoo.org/
[LESS]: http://lesscss.org/
[ImageMagick]: http://www.imagemagick.org
[github/makebakery]: https://github.com/datagrok/makebakery
[W:Make]: https://en.wikipedia.org/wiki/Make_%28software%29
[sitemap]: http://www.sitemaps.org
[ajax-crawling]: https://developers.google.com/webmasters/ajax-crawling/docs/learn-more
[Michael F. Lamb]: https://datagrok.org
[AGPL3]: https://www.gnu.org/licenses/agpl-3.0.html
[COPYING]: https://github.com/datagrok/makebakery/blob/master/COPYING.md
[staticsitegenerators]: https://staticsitegenerators.net/
[pelican]: https://blog.getpelican.com/
[coleslaw]: https://github.com/kingcons/coleslaw
[CC-BY-SA 2.0]: https://creativecommons.org/licenses/by-sa/2.0/
[GNU Make]: https://www.gnu.org/software/make/
[Improving Make (2014)]: https://www.dwheeler.com/essays/make.html
