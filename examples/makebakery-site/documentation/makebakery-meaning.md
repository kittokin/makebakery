% What makebakery means
% Michael F. Lamb
% Sun, 11 Feb 2018 13:25:15 -0800

_makebakery_ used to be "m4-bakery," because it grew out of a simpler first iteration that also used [GNU Make][] but whose focus was on a single templating mechanism using another ubiquitous old unix tool: [GNU m4][].

However, the learning curve for `m4` is very steep and the resulting code can be quite ugly, especially for nontrivial tasks.
`m4` has now been relegated to a mere plug-in that I still include simply because I once enjoyed the challenge of using it.

The article [Using M4 to write HTML][] (1997)[^4] was my original inspiration to build it that way.

At that time I think I was able to surpass the utility of the examples given therein, and since then I've attempted to whittle this old hack down into a bunch of modular parts that one might use to build their own static site generator, or simply to learn about GNU Make.

The "bakery" in _makebakery_ references:

- [Bake, Don't Fry][], a 2002 blog post by the late Aaron Swartz[^1], which references
- [the documentation for WebMake][concepts][^2], an old perl-based static website generator, which references
- [Baking Versus Frying][], a slide in a presentation by Ian Kallen at OSCon 2000[^3], which seems to have originated this use of the term.

[^1]: Aaron Swartz. _Raw Thought_: [Bake, Don't Fry][] (2002.07.09).
[^2]: _WebMake Documentation_: [Concepts][concepts].
[^3]: Ian Kallen. _Industrial Strength Web Publishing_: [Baking Versus Frying] (2000.06.20).
[^4]: [Bob Hepple][]. _Linux Gazette_ Issue 22: [Using M4 to write HTML][] (1997.10).

[Bake, Don't Fry]: http://www.aaronsw.com/weblog/000404
[concepts]: http://webmake.taint.org/dist/doc/concepts.html
[Baking Versus Frying]: http://www.arachna.com/edu/talks/iswp/slides/baking_versus_frying.html
[GNU Make]: http://www.gnu.org/software/make/
[GNU m4]: http://www.gnu.org/software/m4/
[Using M4 to write HTML]: http://web.archive.org/web/19980529230944/http://www.linuxgazette.com/issue22/using_m4.html
[Bob Hepple]: http://bhepple.freeshell.org/
