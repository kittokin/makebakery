# GNU Make and M4 Website Bakery

One of the first hacks that I was really proud of was this website-baking system I built in late 1999 with some venerable old Unix tools, [GNU Make](http://www.gnu.org/software/make/) and [GNU m4](http://www.gnu.org/software/m4/). The article [Using M4 to write HTML](http://web.archive.org/web/19980529230944/http://www.linuxgazette.com/issue22/using_m4.html) by Bob Hepple was my original inspiration, but I think I was able to surpass the utility of the examples given therein.

**You're currently viewing the 'master' branch of this repository.** I've tried to include here many interesting features and ideas for how this technique might be used, including the use of [Pandoc](http://johnmacfarlane.net/pandoc/) for markdown-format source files. I've tried to include a generous amount of internal documentation and comments as well, but it may yet be a lot to absorb at once. To more easily understand what's going on here, be sure to take a look at the 'simple' branch of the repository: http://github.com/datagrok/m4-bakery/tree/simple

## Site Baking

"Website baking" is the pattern of building from templates a mostly- or completely-static website that requires no special software to serve. Baking a website provides huge advantages when it can be employed, because they:

- have fewer vectors for break-ins, 
- easily scale to handle massive amounts of traffic, and 
- may be hosted on commodity hardware or the cheapest of web hosting services.

Of course, with no processing occurring on the server end, it's not possible to host user-interactive features like comments sections, authentication, or e-commerce systems. These days however, many people use third-party tools like [Disqus](http://disqus.com) to implement these features anyway.

In short, if you're not using any of the dynamic features of your web hosting service, you might as well make the whole site static.

## GNU Make and GNU M4

That is of course only an argument for building static websites. Doing it in this _particular_ way may be... ill-advised.

Though m4 may be venerable and may come pre-installed on several modern Unix platforms, it brings along a notoriously cumbersome syntax for defining and calling macros, escaping, quoting, and other things. Sendmail's configuration system serves as a cautionary tale, as it was built upon m4 and is legendary for being obtuse. Employing m4 may be an exercise in masochism.

The difficulty in employing m4 may contribute to my pride in having built a useful tool with it a whole decade+ ago. I hope that this repository will yet serve as an instructive example of how to 'bake' a website using ubiquitous Unix tools, even if every single user ends up swapping out m4 for modern template software, e.g. [Jinja](http://jinja.pocoo.org/).

## Features

- The HTML template is wrapped around .html.m4 files automatically; no boilerplate is necessary in the source file.
- The HTML template is a single file, not a separate header and footer.
- Files named .m4 don't get the template, but still get interpreted by m4.
- Any files not named '.m4' don't get interpreted by m4; they are copied verbatim.
- Macros defined in source .html.m4 files will be expanded in the template. This lets you put complex logic in the template and trigger it from the source file. For example, you could set the page title, toggle a template style, define sidebars, etc.
- Macros defined in the macros file will be expanded in the source files and the template. You can define macros here that you want to be available everywhere.

## Execution

Beginning with source files like this:

	src/
	|-- index.html.m4
	`-- style.css

Along with the Makefile, macros file, and HTML template, running 'make' will
output:

	install -m 644 -D src/style.css dst/style.css
	m4 -P macros.m4 src/index.html.m4 template.html.m4 > src/index.html
	install -m 644 -D src/index.html dst/index.html
	rm src/index.html

And produce the following structure:

	dst/
	|-- index.html
	`-- style.css

# Directory layout

This repository contains the following:

    .
    |-- build/                      # The default locaiton for rendered HTML (not in version control)
    |-- demo-src/                   # Source files for an example website
    |-- etc/                        # Includeable or "plugin" files
    |-- macros.m4                   # M4 macros made available to every M4 file
    |-- Makefile                    # GNU Makefile, defines how to transform source files into HTML
    |-- README.md
    `-- template.html.m4            # An HTML template that will wrap all content

# Similar projects

It has been said that every programmer, at some point, writes a blog/website publishing engine. Here are some other such projects that are similar in some way.

## Forks

- Brandon Invergo's [m4-bloggery](https://gitorious.org/bi-websites/m4-bloggery) is based on m4-bakery and takes some slightly different approaches.

## Friends

- ironfroggy's [jules](https://github.com/ironfroggy/jules)
- Nate Smith's [Cadigan]()
- redline6561's [Coleslaw]()

## Others


blacksmith                                                http://blacksmith.jit.su/
blatter                                                   http://bitbucket.org/jek/blatter/
blogofile                                                 http://blogofile.com/
bonsai                                                    https://github.com/benschwarz/bonsai
cactus                                                    https://github.com/koenbok/Cactus
chisel                                                    https://github.com/dz/chisel
coleslaw                                                  http://www.cliki.net/coleslaw
django                                                    staticsomething
docpad                                                    https://github.com/bevry/docpad
drupan                                                    https://github.com/fallenhitokiri/drupan
emacs                                                     +                                        org-mode +    org-publish
fairytale                                                 https://github.com/46Bit/fairytale
fmpp                                                      http://fmpp.sourceforge.net/
fragments                                                 http://glyphobet.github.com/fragments/
frank
fugitive                                                  https://gitorious.org/fugitive
hakyll                                                    http://jaspervdj.be/hakyll/
hammer                                                    http://hammerformac.com/
hastie                                                    https://github.com/mkaz/hastie
nanoc                                                     http://nanoc.ws/about/#similar-projects
regenerate.lisp https://gist.github.com/TeMPOraL/4190622
https://www.dropbox.com/s/mk9w8r0zjkkwpqi/static_sites.md
hyde                                                      http://ringce.com/hyde
ikiwiki                                                   http://ikiwiki.info/
jekyll
kirby
liquidink                                                 and                                      rest2web
markbox                                                   https://github.com/myfreeweb/markbox
middleman
movable                                                   Type
mynt                                                      http://mynt.mirroredwhite.com
nanoc                                                     nanoc.ws
nestaCMS
nikola                                                    http://nikola.ralsina.com.ar
non-static                                                webserver                                +        list of          pages + wget
octopress
pelican
phrozn                                                    http://phrozn.info
piecrust                                                  http://bolt80.com/piecrust/
poole                                                     https://bitbucket.org/obensonne/poole
punch-blog                                                https://github.com/laktek/punch-blog
quill
romulus
ruhoh
second                                                    Crack
sphinx/docutils
stacey
stasis
staticMatic
staticjinja                                               https://github.com/Ceasar/staticjinja
syte                                                      https://github.com/rigoneri/syte
telegram                                                  https://telegr.am/
tinkerer                                                  http://tinkerer.me
toto                                                      https://github.com/cloudhead/toto
webby                                                     (http://webby.rubyforge.org/)
webgen
wintersmith                                               http://jnordberg.github.com/wintersmith/
wok                                                       https://github.com/mythmon/wok


https://gist.github.com/davatron5000/2254924


# License

The `demo-src` part of this repository includes unmodified copies of:

- [HTML5 reset](http://html5reset.org/), License: BSD
- [Modernizr](http://modernizr.com/), License: MIT
- [jQuery](http://jquery.org), License: MIT

These resources, of course, retain their original license.

The parts of this repository that I wrote are released under the terms of the [GNU Affero General Public License](http://www.gnu.org/licenses/agpl-3.0.html) verison 3 or later.

If these terms don't meet your needs, just contact me.
