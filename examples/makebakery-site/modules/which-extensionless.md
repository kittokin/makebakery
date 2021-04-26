% Should I choose `extensionless_html` or `paths_are_dirs`?
% Michael F. Lamb
% Mon 26 Apr 2021 03:46:29 AM PDT

These two modules serve the same purpose:
they make it so you don't have filename extensions in your page URLs.
Apache's `multiviews` feature can also help with this.

I think using `paths_are_dirs` is better than any of `extensionless_html`, Apache multiviews, or no extension-removal at all, because it improves how you and your code can reason about relative URLs.
Its only downside is a more complex tree of output files, and I rarely need to think about that.

`extensionless_html` is naïve: it removes the filename extension on pages and expects the webserver to guess the MIME-type correctly.

`paths_are_dirs` converts all pages like page.html into `page/index.html`.

Consider this site structure:

```
parent
  page
  sibling_a
  sibling_b
    nibling
```

With any mechanism other than `paths_to_dirs`, link structure will vary on whether the target has any child pages.
So relative links within `page` look like this:


------------- ---------------------- --------------------------------------------------- 
               other                  `paths_are_dirs`
------------- ---------------------- --------------------------------------------------- 
to parent:     `./`                   `../`
to itself:     `./page`               `./`
to sibling a:  `./sibling_a`          `../sibling_a/`
to sibling b:  `./sibling_b/`         `../sibling_b/`
to nibling:    `./sibling_b/nibling`  `../sibling_b/nibling/`
------------- ---------------------- --------------------------------------------------- 

- to parent: `./`
- to itself: `./page`
- to sibling a: `./sibling_a`
- to sibling b: `./sibling_b/`
- to nibling: `./sibling_b/nibling`

With `paths_are_dirs`, they are uniform:

- to parent: `../`
- to itself: `./`
- to sibling a: `../sibling_a/`
- to sibling b: `../sibling_b/`
- to nibling: `../sibling_b/nibling/`

If a child is added to `page`, with `paths_are_dirs` all those links remain unchanged.

- to child: `./child/`

- to parent:
