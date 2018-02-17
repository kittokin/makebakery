# makebakery modules

- **\_\_multisource**: Merge multiple sources for rendering. Good for keeping site design and content in separate repos.
- **\_\_paths\_are\_dirs**: `/foo.md` creates `/foo/` not `/foo.html`. Avoids extensions in URLs and makes relative navigation simpler. 
- **\_\_source**: Basic filesystem-based sources.
- **\_environment**: Defines environment settings that should be active during rendering.
- **\_index**: Allow a class of source that should be processed after everything else. Useful for building indices, sitemaps, atom feeds, etc.
- **\_m4**: Use GNU m4 as a template system.
- **bootstrap-less**
- **coffeescript**: render coffeescript to javascript.
- **coffeescript_sources***: copy coffeescript source files to output to comply with copyleft licenses.
- **discount_theme**
- **executable**: Execute files and render their output.
- **extensionless_html**: `/foo.md` creates `/foo` not `/foo.html`; an alternative to \_\_paths\_are\_dirs to avoid extensions.
- **mk**: allow sources to define their own rules for building.
- **pandoc**: use pandoc as a markdown renderer.
- **raw**: pass files through without rendering at all.
- **rfc2822ish**
- **sass**
- **url**: render by retrieving a url.

## GNU m4 template processor

One of the first hacks that I was really proud of was a static website generator that I built in late 1999 with some venerable old Unix tools, [GNU Make](http://www.gnu.org/software/make/) and [GNU m4](http://www.gnu.org/software/m4/). The article [Using M4 to write HTML](http://web.archive.org/web/19980529230944/http://www.linuxgazette.com/issue22/using_m4.html) by [Bob Hepple](http://bhepple.freeshell.org/) was my original inspiration to build it that way. At that time I think I was able to surpass the utility of the examples given therein, and since then I've attempted to whittle this old hack down into a bunch of modular parts that one might use to build their own, or simply to learn about GNU Make.

**You're currently viewing the 'master' branch of this repository.** I've tried to include here many interesting features and ideas for how this technique might be used, including the use of [Pandoc](http://johnmacfarlane.net/pandoc/) for markdown-format source files. I've tried to include a generous amount of internal documentation and comments as well, but it may yet be a lot to absorb at once. To more easily understand what's going on here, be sure to take a look at the 'simple' branch of the repository: http://github.com/datagrok/makebakery/tree/simple

## Using GNU M4 as a templating language

Using `m4` as a templating engine brought along some interesting challenges of its own:

- Unlike many other templating schemes, I try to avoid any boilerplate in source files. Page templates are not "included" from sources; instead all sources get a template wrapped around them. This was somewhat tricky to accomplish with `m4`.

I wouldn't recommend using GNU m4 as a templating engine these days; there are far better tools available. I still do, for nostalgia. But if you really want to, it is available as a module!

## GNU Make and GNU M4

That is of course only an argument for building static websites. Doing it in this _particular_ way may be... ill-advised.

Though m4 may be venerable and may come pre-installed on several modern Unix platforms, it brings along a notoriously cumbersome syntax for defining and calling macros, escaping, quoting, and other things. Sendmail's configuration system serves as a cautionary tale, as it was built upon m4 and is legendary for being obtuse. Employing m4 may be an exercise in masochism.

The difficulty in employing m4 may contribute to my pride in having built a useful tool with it a whole decade+ ago. I hope that this repository will yet serve as an instructive example of how to 'bake' a website using ubiquitous Unix tools, even if every single user ends up swapping out m4 for modern template software, e.g. [Jinja](http://jinja.pocoo.org/).

# The modular GNU Makefile

makebakery employs a technique that lets you enable and disable various pieces of its functionality in a package-management- and version-control-system-friendly way.

The Makefile is structured like this:

First, we define some variables and export some useful ones into the environment.

Then, we gather up a list of all of the files we can find in the configured sources directory. We manipulate that list to build the list of files that should be rendered.

    include $(MODS)/*.mk

Which causes all of the `.mk` files in the modules directory to be processed, in alphanumeric order.

Combined with some conventions, this gives us a modular system of plug-ins

# features

- Makefile: Any files not named '.m4' don't get interpreted by m4; they are copied verbatim.
- Makefile: Files named .m4 don't get the template, but still get interpreted by m4.
- m4: Macros defined in source .html.m4 files will be expanded in the template. This lets you put complex logic in the template and trigger it from the source file. For example, you could set the page title, toggle a template style, define sidebars, etc.
- m4: Macros defined in the macros file will be expanded in the source files and the template. You can define macros here that you want to be available everywhere.
- m4: The HTML template is wrapped around .html.m4 files automatically; no boilerplate or "include" statements are necessary in the source files.
- m4: The HTML template is a single file, not a separate header and footer.

