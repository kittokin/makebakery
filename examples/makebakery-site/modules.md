% Modules
% Michael F. Lamb
% Mon 26 Apr 2021 06:49:31 PM PDT

# Using modules

To enable a module, add its name to the `MODULES` variable in your Makefile and define any configuration variables it needs.

# Modules included with Makebakery

Some modules are prefixed with underscores; this is to ensure they are invoked before others when necessary.

## Source Locations

- **\_\_source**: Basic filesystem-based sources. Most sites will use this.

- **\_\_multisource**: Merge multiple sources. I use this to keep site design and content in separate git repositories.

## Source Formats

- **coffeescript**: Render [CoffeeScript][] to JavaScript.

- **discount_theme**: Render Markdown to HTML using the `theme` program included with the [discount][] markdown renderer.

- **executable**: Execute programs or scripts and capture their output.
  This is a very useful module enabling lots of other features like this site's site map, automatic navigation generation, templating for the header and footer, and more.

- **pandoc**: Render Markdown to HTML using [pandoc][], the best markdown processor in the universe.

- **\_\_\_raw**: Pass source files through to output with no rendering nor wrapping.

- **sass**: Renders .sass and .scss to .css with `sassc`.

- **url**: Downloads a file at a given URL. I use this to serve local copies of resources like jQuery, bootstrap, and Google Fonts.

## Site structure

- **\_\_\_ignore**: Omit any files listed in the `IGNORE` variable from the output
  Useful if your Makefile lives in the same directory as your source files.

- **\_index**: Indicate an source file should be processed after everything else. 
  Useful for building indices, sitemaps, atom feeds, etc.

- **\_m4**: Use [GNU m4][] as a template system.

- **mk**: "Makefile fragment include"; allow sources to define their own makefile rules for building.

- **\_\_paths\_are\_dirs**: Avoids filename extensions in page URLs by transforming all pages into directories.
  `/foo.md` becomes `/foo/` not `/foo.html`. 

- **gh-pages**: (Unfinished) Publish to Github Pages.
  Commits built site to a `gh-pages` branch of the current repository.
  I use this to publish this site but I haven't made it robust enough for general-purpose use, yet.
  TODO
  <!-- This is a "build" step until we can have it push to upstream -->

<!--
## Deployment

-->

## Not Recommended

These modules are either deprecated or experimental and not quite ready for use.

- **rfc2822ish**:
  (Unfinished)
  Render files formatted like e-mails to Markdown.
  Then, another module like `pandoc` may render that to HTML.
  I haven't figured out a good way to handle MIME text/multipart messages.
  Also, I haven't used this in a while.

- **extensionless_html**:
  (Deprecated)
  Avoid filename extensions in URLs by naively removing them from the output filenames.
  Several caveats.

## To do

These would be useful, but I haven't built them yet.

- templating and logic using PHP (processed at compile time)
- templating using [Jinja](https://palletsprojects.com/p/jinja/)
- photo resizing and thumbnails using [imagemagick](https://imagemagick.org)
- image optimization using [pngquant](https://pngquant.org/), [scour](https://github.com/scour-project/scour), etc.
- client-side / offline search using [lunr](https://lunrjs.com/)
- source specific resources from inside zip and tarball archives
- deployment via rsync
- deployment including push to remote via gh-pages
- launch a docker container to run any tools that you might not have installed

# Module implementation

You might like to create your own module to customize the pipeline, or add a code compiler or rendering tool.

TODO

[discount]: http://www.pell.portland.or.us/~orc/Code/discount/
[GNU m4]: http://www.gnu.org/software/m4/
[pandoc]: https://pandoc.org/
[CoffeeScript]: https://coffeescript.org/
