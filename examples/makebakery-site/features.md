% Features
% Michael F. Lamb
% Thu, 28 Feb 2013 18:27:11 -0500

# Page hierarchies

Makebakery can render a hierarchy of source files to a hierarchy of output files.
The following pages are contained within [the `features/` directory][source-features] in the source.

<nav id="interior"></nav>

## Automatic sub-page links

The links above are automatically generated, using [a Javascript function][] that reads a site map in JSON format.
The source for that JSON file is actually a [small shell script][] that outputs JSON.
With the `executable` module enabled, makebakery renders scripts by executing them and capturing their output.

This site map script and link generation Javascript is not considered a "core" feature of makebakery.
But they are included as Free Software, so if you like them and their license, feel free to begin your static site by modifying a copy of this site.

[source-features]: https://github.com/datagrok/makebakery/tree/main/examples/makebakery-site/examples
[a Javascript function]: https://github.com/datagrok/makebakery/blob/main/examples/makebakery-site/_/js/functions.js#L74
[small shell script]: https://github.com/datagrok/makebakery/blob/main/examples/makebakery-site/pages.json.run

# Design Goals

From my static site generator, I wanted:

- ✅ to use [Pandoc][] or sometimes [discount][] to author pages using Markdown syntax
- ✅ to build pages in parallel, taking advantage of all my processor cores
- ✅ to have a multi-step pipeline, so that I might have a shell or python script in my source files that retrieves data from a database and outputs Markdown syntax, which would then be processed into HTML by Pandoc, and wrapped in the common site template
- ✅ to be language-agnostic; to use any language or mix of languages in little scripts that could be used to generate pages
- ✅ to organize my pages into a hierarchy if I prefer, not just a flat collection or serialized "blog"
- ✅ a website navigation mechanism visible on every page that will automatically update itself whenever I make changes to pages
  - ✅ that will work both with and without javascript enabled
- ✅ for all of my pages to automatically share a common design, unless explicitly disabled
- ✅ to have the option of occasionally authoring pages _not_ in Markdown, but instead raw HTML or generated from a script
  - ✅ but still automatically share the common page design
- ✅ to author interactive features with [coffeescript][] and have it automatically convert to JavaScript
- ✅ to serve fonts and javascript libraries from my website, without manually "vendoring" a copy into my git repository
- ✅ an efficient build mechanism that would update only the pages whose source files have changed
- ✅ URLs which do not reveal filename extensions
- ✅ to deploy on Apache that I do not control, on an nginx that I do control, on an S3 bucket configured for website hosting, or to GitHub Pages.
- ✅ when I'm feeling masochistic, to use [GNU M4][] to do templating like I did back in '99
- ✅ to be able to add support for a new type of source format without a huge refactoring

<!-- FIXME: index module is deprecated for now, but you can still accomplish the same with some lines in your makefile
- With the index module, a page may be designated for compilation in a second pass. This enables:
    - **Programmatic and HTML site maps.** Look at how `examples/makebakery-site/pages.json.m4.index` renders a .json [index of all the pages on the site](pages.json). This enables us to automatically build navigation bars like the one in the header on this page, or "recent changes" links, all on the client side. Take careful note of this: the site is static but the header bar will *automatically be updated whenever pages are added or removed*.
    - **Feeds**. Look at how `examples/makebakery-site/atom.xml.m4.index` renders [an atom-format .xml file](atom.xml) of changes made to the site. Even though the site is static you can still have it update feed readers whenever you make a change.
- Modular features: disable the ones you don't use for more speed, or build your own without merge conflicts.
-->


[Pandoc]: https://pandoc.org
[discount]: https://www.pell.portland.or.us/~orc/Code/discount/
[markdown]: https://daringfireball.net/projects/markdown/
[coffeescript]: https://coffeescript.org/
[GNU m4]: https://www.gnu.org/software/m4/
