% About static sites

Static websites are those whose content is pre-rendered, requiring few software features to serve it to visitors.

Static websites are useful because they're fast, scaleable, and cache-able.
Compared to dynamic sites, static sites are much easier to secure, and can be served from the cheapest of hosting services.

This technique of pre-rendering static pages websites [has been called *baking*][baking] a website, as opposed to a short-order server *frying* up each page upon each request.

- have fewer vectors for break-ins, 
- easily scale to handle massive amounts of traffic, and 
- may be hosted on commodity hardware or the cheapest of web hosting services.

Of course, with no processing occurring on the server end, it's not possible to host user-interactive features like comments sections, authentication, or e-commerce systems. These days however, many people use third-party tools like [Disqus](http://disqus.com) to implement these features anyway, or rely on third-party forums like to provide discussion areas for their content.

In short, if you're not using any of the dynamic features of your web hosting service, you might as well make the whole site static.
If you _are_ using those features on some areas of your site, you're better off making the static parts static files.

# Similar projects

It has been said that every programmer, at some point, writes a blog/website publishing engine.
If Makebakery isn't for you, here are some other such projects you might prefer.
(Note: not all of these are static site generators.)

- <http://staticsitegenerators.net> contains a crowdsourced database of a myriad of different static site generators.
- [Phil "technomancy" Hagelberg](https://technomancy.us/colophon) uses a minimalist approach including a 12-line Makefile and GNU M4.
- [David Thompson](https://dthompson.us)'s Guile Scheme-based [Haunt](https://dthompson.us/projects/haunt.html)
- [Pelican](http://getpelican.com) is a popular Python-based static site generator that some friends enjoy.
- [ironfroggy](https://github.com/ironfroggy)'s [jules](https://github.com/ironfroggy/jules)
- [nathanielksmith](https://github.com/nathanielksmith)'s [Cadigan](https://github.com/nathanielksmith/cadigan)
- [redline6561](https://github.com/redline6561)'s Common Lisp-based [Coleslaw](https://github.com/redline6561/coleslaw)
- Brandon Invergo's [m4-bloggery](https://gitorious.org/bi-websites/m4-bloggery) is based on an early version of this project but takes some slightly different approaches.
- davatron5000's [crowdsourced recommendations gist](https://gist.github.com/davatron5000/2254924) (2012-03-30)
- <https://www.staticgen.com/> contains a database of static site generators compatible with something called "JAMstack"

[baking]: ../makebakery-meaning/
