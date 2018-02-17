% Makefile-Based Static Website Generator
% Michael F. Lamb
% Thu, 28 Feb 2013 18:27:11 -0500

![Credit: [Borya, "Bakery" (2006)](https://www.flickr.com/photos/barthelomaus/104318646/) ([CC-BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/)). Resized.][image]

**makebakery** is a *Makefile* that builds a static website from various sources, using the venerable old UNIX tool `GNU make`. It is carefully crafted to be modular and extensible, allowing it to be customized to your preferences.

A *static* website is one which requires no special logic on the server-side to work, as opposed to *dynamic* websites which trigger some server-side processing for most page requests. Static websites are useful because they're effortlessly fast, scalable, and cache-able. Compared to dynamic sites, static sites are much easier to secure, and can be served from the very cheapest of hosting services.

This technique of generating static websites [has been called *baking*][baking], as opposed to *frying* up a new page upon each request.

`GNU Make` is a tool that figures out which commands need to be run to transform some given set of source files into a desired set of output files. Originally created for compilation of source code into executable code, Makebakery uses GNU Make to transform files in various source formats like Markdown into an HTML website. Modern work-alikes include [Grunt][], [Rake][], or [Ant][]. Despite its age and the number of times it has been re-invented, `GNU Make` has some surprising features that I think makes it superior to the newcomers:

- When invoked multiple times, it is smart enough to only recompile target files whose source files have changed.
- When used on multi-core systems or with I/O heavy jobs, it is smart enough to figure out how to parallelize its work.
- Make can apply multiple compilation steps to each source file to render the desired output, and it cleans up the intermediate files automatically.

`Make` has a rather steep learning curve, but since it is so ubiquitous, it's likely to be already installed on your computer, and your web host's servers, and easy to obtain if not.

I show in the demonstration site source code how one might wire up their favorite plaintext-to-html compiler to Makebakery. I recommend [Pandoc][], which lets you can keep all your source files in markdown format. You might also add a templating engine like [Jinja][], or CSS compilers like [LESS][], image processing using [ImageMagick][], and any other custom scripts you please to the compilation pipeline.

This website is the result of running `make` in the `makebakery` source code, which compiles the included demo site source in `/demo-src` to HTML. Visit [the makebakery project page on GitHub][github/makebakery] to learn more.

More about Make and GNU Make: [Wikipedia: Make (software)][W:Make]

## Interesting features

Static page-compiling tools are fairly boring, but there are some clever pieces within makebakery:

- Unlike many other static-site-building projects, makebakery tries to remain language-agnostic.
- Pages are compiled in a pipeline according to their filename extension. You may freely mix markdown, raw html, compile-time executables, and other files within your sources. Also, you may chain them together, so that for example a python script might retrieve information from a database and render markdown, which is then rendered into html.
- `demo-src/pages.json.m4.index` renders a .json [index of all the pages on the site](pages.json). This enables us to automatically build navigation bars like the one in the header on this page, or "recent changes" links, all on the client side. Take careful note of this: the site is static but the header bar will *automatically be updated whenever pages are added or removed*.
- `demo-src/atom.xml.m4.index` renders [an atom-format .xml file](atom.xml) of changes made to the site. Even though the site is static you can still have it update feed readers whenever you make a change.
- `GNU make` has built-in support for multiprocessing. With one command-line option it will take full advantage of multi-core and multi-processor machines to compile pages in parallel.
- I have recently implemented most features as a system of `GNU Make`-based *plug-ins* around a small core Makefile. Easily toggle between the features you prefer, disable the ones you don't use to save speed, or build your own without having to modify the entire system.

## About static websites

Static websites are those that require no special software to serve. A static website provides huge advantages, because they:

- have fewer vectors for break-ins, 
- easily scale to handle massive amounts of traffic, and 
- may be hosted on commodity hardware or the cheapest of web hosting services.

Of course, with no processing occurring on the server end, it's not possible to host user-interactive features like comments sections, authentication, or e-commerce systems. These days however, many people use third-party tools like [Disqus](http://disqus.com) to implement these features anyway, or rely on third-party forums like to provide discussion areas for their content.

In short, if you're not using any of the dynamic features of your web hosting service, you might as well make the whole site static. If you _are_ using those features on some areas of your site, you're better off making the static parts simple static files.

## Coming soon

- Example of how to automatically build a blog from a collection of posts, with RSS and ATOM feeds.
- Example of how to automatically build a breadcrumbs bar.
- Example of how to automatically build a [sitemap][].
- Example of how to automatically compile Twitter Bootstrap CSS from its LESS or SASS sources.
- Example of a static AJAX-based application, its static backend, and the [HTML Snapshot needed][ajax-crawling] for non-JavaScript browsers and web-crawlers to index it].
- Example of using `phpcli` to make a typical PHP-format dynamic site static.

Created by [Michael F. Lamb][]. License: [GNU Affero GPL version 3 or later][], with additional permissions for unencumbered output. See the [COPYING][] in the source code for more information.

[image]: bakery.jpg {.pull-right}
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
[GNU Affero GPL version 3 or later]: https://www.gnu.org/licenses/agpl-3.0.html
[COPYING]: https://github.com/datagrok/makebakery/blob/master/COPYING.md
