% TODO

- Documentation
    - how to develop a new Makebakery module
    - automatic blog from a collection of posts
    - automatic RSS and ATOM feeds.
    - automatic breadcrumbs bar.
    - automatic [sitemap][].
    - automatic Bootstrap compile from SASS
    - Example of a static AJAX-based application, its static backend, and the [HTML Snapshot needed][ajax-crawling] for non-JavaScript browsers and web-crawlers to index it.
    - Example of using `phpcli` to make a typical PHP-format dynamic site static.
- Modules
    - allow site-local modules
    - templating and logic using PHP (processed at compile time)
    - templating using [Jinja](https://palletsprojects.com/p/jinja/)
    - photo resizing and thumbnails using [imagemagick](https://imagemagick.org)
    - image optimization using [pngquant](https://pngquant.org/), [scour](https://github.com/scour-project/scour), etc.
    - client-side / offline search using [lunr](https://lunrjs.com/)
    - pick source resources out of zip and tarball archives
    - deployment via rsync
    - deployment including push to remote via gh-pages
    - launch a docker container to run any tools that you might not have installed
    - make all modules check for the existence of executables they expect and tell you how to install
    - PHP
    - Improve .url source format for retrieval of upstream resources
        - Support files inside of zips and tarballs
        - Support files inside of git clones
        - Support for checking an MD5SUM of a downloaded resource
    - Grunt/Bower/Etc.
        - Even though I suspect GNU Make can obviate all need for Grunt and
          Bower, those tools have become part of the workflow for many
          developers. Show how we can play nice with them, incorporating them
          into the build pipeline.
    - M4: Employ frozen state files for speed
- Pattern for collation of pages
    - Feeds: Atom, RSS
    - Google Sitemap
- Makefile target for various means of deployment
    - trigger on git commit and/or git push
    - rsync
    - s3 bucket site
    - neocities
    - ✅ gh-pages
- Learn about Netlify, how to integrate into their system

[ajax-crawling]: https://developers.google.com/webmasters/ajax-crawling/docs/learn-more
[sitemap]: https://www.sitemaps.org
