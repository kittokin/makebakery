% What "Makebakery" means
% Michael F. Lamb
% Sun, 11 Feb 2018 13:25:15 -0800

_Makebakery_ used to be "m4-bakery," because it grew out of a simpler first iteration that also used [GNU Make][] but focused on [GNU m4][], another ubiquitous old UNIX tool used for templating and macro expansion. 

The article [Using M4 to write HTML][] (1997)[^4] was my original inspiration to build it that way.

However, the learning curve for `m4` is very steep and the resulting code can be quite ugly, especially for nontrivial tasks.

Now, all the `m4`-related logic is [relegated to a module][m4-module] and not enabled by default, so you can easily avoid it in favor of more modern template mechanisms, or none at all.

The "bakery" in _Makebakery_ references a 2002 blog post by the late Aaron Swartz[^1]:

> Some websites, [the webmake documentation explains][concepts], are fried up for the user every time. But others are baked once and served up again and again.

This references [the documentation for WebMake][concepts][^2], an old perl-based static website generator, and that references [Baking Versus Frying][], a slide in a presentation by Ian Kallen at OSCon 2000[^3], which seems to have originated this use of the term.

[^1]: [Aaron Swartz][]. _Raw Thought_: [Bake, Don't Fry][] (2002.07.09).
[^2]: _[WebMake][] Documentation_: [Concepts][concepts].
[^3]: [Ian Kallen][]. _Industrial Strength Web Publishing_: [Baking Versus Frying] (2000.06.20).
[^4]: [Bob Hepple][]. _Linux Gazette_ Issue 22: [Using M4 to write HTML][] (1997.10).

[Bake, Don't Fry]: http://www.aaronsw.com/weblog/000404
[concepts]: http://webmake.taint.org/dist/doc/concepts.html
[Baking Versus Frying]: http://www.arachna.com/edu/talks/iswp/slides/baking_versus_frying.html
[GNU Make]: https://www.gnu.org/software/make/
[GNU m4]: https://www.gnu.org/software/m4/
[Using M4 to write HTML]: https://web.archive.org/web/19980529230944/https://www.linuxgazette.com/issue22/using_m4.html
[Bob Hepple]: http://bhepple.freeshell.org/
[m4-module]: https://github.com/datagrok/makebakery/tree/main/modules/_m4
[Aaron Swartz]: https://en.wikipedia.org/wiki/Aaron_Swartz
[Ian Kallen]: https://twitter.com/spidaman
[webmake]: http://webmake.taint.org/
