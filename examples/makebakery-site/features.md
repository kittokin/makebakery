% Features
% Michael F. Lamb
% Thu, 28 Feb 2013 18:27:11 -0500

From my static site generator, I wanted:

- to use [Pandoc][] or sometimes [discount][] to author HTML pages on my website(s) using [Markdown][]
- to build pages in parallel, taking advantage of all my processor cores
- to have a multi-step pipeline, so that I might have a shell script output Markdown syntax, which would then be processed into HTML by Pandoc.
- to organize my pages into a hierarchy if I prefer, not just a flat collection or serialized "blog"
- a website navigation mechanism visible on every page that will automatically update itself whenever I make changes to pages
  - that will work both with and without javascript enabled
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

- Pages are compiled in a pipeline according to their filename extension. You may freely mix markdown, raw html, compile-time executables, and other files within your sources. Also, you may chain them together, so that for example a Python script might retrieve information from a database and render markdown, which is then rendered into html.

<!-- FIXME: index module is deprecated for now, but you can still accomplish the same with some lines in your makefile
- With the index module, a page may be designated for compilation in a second pass. This enables:
    - **Programmatic and HTML site maps.** Look at how `examples/makebakery-site/pages.json.m4.index` renders a .json [index of all the pages on the site](pages.json). This enables us to automatically build navigation bars like the one in the header on this page, or "recent changes" links, all on the client side. Take careful note of this: the site is static but the header bar will *automatically be updated whenever pages are added or removed*.
    - **Feeds**. Look at how `examples/makebakery-site/atom.xml.m4.index` renders [an atom-format .xml file](atom.xml) of changes made to the site. Even though the site is static you can still have it update feed readers whenever you make a change.
- Modular features: disable the ones you don't use for more speed, or build your own without merge conflicts.
-->
