# makebakery modules

- **coffeescript**: render coffeescript to javascript.
- **discount_theme**: render markdown to html using the `theme` program included with the [discount][] markdown renderer.
- **executable**: Execute programs or scripts and capture their output.
- **extensionless_html**: `/foo.md` becomes `/foo` not `/foo.html` simply by stripping off the .html extension and assuming the server will declare `content-type: text/html` appropriately. An alternative to \_\_paths\_are\_dirs to avoid extensions.
- **gh-pages**: (wip) publish to Github Pages. Commit completed site to a `gh-pages` branch of the current repository.
- **gh-pages**: (wip) publish to Github Pages. Commit completed site to a `gh-pages` branch of the current repository.
- **ignore**: omit any files listed in the `IGNORE` variable from the output
- **index**: Allow a class of source that should be processed after everything else. Useful for building indices, sitemaps, atom feeds, etc.
- **m4**: Use [GNU m4][] as a template system.
- **mk**: "makefile include"; allow sources to define their own makefile rules for building.
- **multisource**: Merge multiple sources for rendering. I use this to keep site design and content in separate git repositories.
- **pandoc**: Use [pandoc][], the best markdown processor in existence, to render html.
- **paths\_are\_dirs**: `/foo.md` becomes `/foo/` not `/foo.html`. Avoids extensions in URLs and makes relative navigation simpler. See also `extensionless_html`.
- **raw**: Pass source files through to output with no rendering nor wrapping.
- **rfc2822ish**: (wip) render files that look like e-mails to markdown, whereupon the `pandoc` module may render them into HTML.
- **sass**: Renders .sass and .scss to .css with `sassc`.
- **source**: Basic filesystem-based sources.
- **url**: Renders a file containing a URL by downloading the data at that URL. I use this to serve local copies of minified libraries like jQuery, bootstrap, and Google Fonts.

Some modules are prefixed with underscores; this is to ensure they are invoked before others when necessary.

[discount]: http://www.pell.portland.or.us/~orc/Code/discount/
[GNU m4]: http://www.gnu.org/software/m4/
[pandoc]: https://pandoc.org/
