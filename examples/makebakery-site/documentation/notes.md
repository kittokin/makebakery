% (draft) Notes

I'm working on cleaning up the documentation for Makebakery. This page serves as a scratch buffer while I move things around. Pardon the mess!

## Theory of operation

The user creates a Makefile which defines variables appropriate for their configuration, and then `include makebakery.mk`.

(This keeps site-specific configuration with the site itself, so the makebakery repo may exist unmodified, treated as a library.)

Of particular importance is the `MODULES` variable, which is a whitespace-separated list of *makebakery modules* that should be enabled.

A *makebakery module* is a file or subdirectory containing Make-syntax code stored within the `modules` directory.

A source file may be processed multiple times, according to its filename extension.
At each step, one layer of filename extension is removed.
For example, with the `executable`, `pandoc`, and `__paths_are_dirs` modules enabled, a file named  
`foo.html.md.run` would be executed and have its output captured to obtain  
`foo.html.md`, then processed by pandoc to obtain  
`foo.html`, then renamed to obtain  
`foo/index.html`.

Modules are responsible for defining or modifying the variable `targets`, which names all the files that should be rendered to generate the static site.
Modules also define rules for rendering those target files from (perhaps intermediate) source files.

Modules have an "in" and an "out" section. Modules' "in" sections are processed in alphanumeric order, then their "out" sections are processed in reverse alphanumeric order.
You can think of it like an onion: each module is a "layer" that wraps the next.

A typical set of MODULES might include:

- either __source or __multisource to get source files from the filesystem
- possibly __paths_are_dirs or extensionless_html to keep .html filename extensions out of URLs,
- one or more rendering engines for HTML pages, like pandoc or _m4, and
- possibly a processing engine like sass to make authoring css easier.

[m4-module]: modules/m4/
[built-in variables]: https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
