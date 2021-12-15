% Why should I use `paths_are_dirs`?
% Michael F. Lamb
% Mon 26 Apr 2021 03:46:29 AM PDT

`paths_are_dirs` makes it so you don't have filename extensions in your page URLs.

Why should you do this?

- [Cool URIs Don't Change](https://www.w3.org/Provider/Style/URI) (1998)[^1] says you should never change your URLs but the contents might cease to be HTML.
  (Yeah, I'm not much swayed by that one either, but...)
- It's easier to manage relative links
- It's easier to rename pages

[^1]: Tim Berners-Lee. _Style Guide for online hypertext_: [Cool URIs Don't Change][] (1998).

[Cool URIs Don't Change]: https://www.w3.org/Provider/Style/URI

There's other ways to strip the extension from website resources, but not all of them provide all of the advantages listed above:

- Apache's `mod_rewrite`
- Apache's `mod_negotiation` `MultiViews`
- deprecated makebakery module `extensionless_html`

I think using `paths_are_dirs` is better than any of those (or not doing it at all).
Its only downside is a more complex filesystem structure of output files.
It depends on functionality like Apache `mod_dir`'s `DirectoryIndex` but pretty much all webservers support that.

`paths_are_dirs` converts all pages like `.../page.html` into `.../page/index.html`.

Consider this site structure:

- root
  - parent
    - page
    - sibling
      - nibling

------------------------------------------------------------------------------------------------------------- 
                            No extension removal      `extensionless_html`  Apache `multiviews`  `paths_are_dirs`
--------------------------- ------------------------- --------------------- -------------------- -------------------------- 
Root filename:              `/index.html`             `/index`              `/index.html`        `/index.html`

Page filename:              `/parent/page.html`       `/parent/page`        `/parent/page.html`  `/parent/page/index.html`

Absolute URL to page:       `/parent/page.html`       `/parent/page`        `/parent/page`       `/parent/page/`

Relative URL to parent:     `../parent.html`          `../parent`           `../parent`          `../`

Relative URL to itself:     `./page.html`             `./page`              `./page`             `./`

Relative URL to child:      `./page/child.html`       conflict              `./page/child`       `./child/`

Relative URL to sibling:    `../sibling.html`         `./sibling`           `./sibling`          `../sibling/`

Relative URL to nibling:    `./sibling/nibling.html`  conflict              `./sibling/nibling`  `../sibling/nibling/`

------------------------------------------------------------------------------------------------------------- 

