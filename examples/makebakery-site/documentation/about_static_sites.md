% About static sites

Static websites are those whose content is pre-rendered and require only simple software to serve to visitors.

Static websites are useful because they're effortlessly fast, scalable, and cache-able. Compared to dynamic sites, static sites are much easier to secure, and can be served from the very cheapest of hosting services.

This technique of pre-rendering static pages websites [has been called *baking*][baking] a website, as opposed to a short-order server *frying* up each page upon each request.

- have fewer vectors for break-ins, 
- easily scale to handle massive amounts of traffic, and 
- may be hosted on commodity hardware or the cheapest of web hosting services.

Of course, with no processing occurring on the server end, it's not possible to host user-interactive features like comments sections, authentication, or e-commerce systems. These days however, many people use third-party tools like [Disqus](http://disqus.com) to implement these features anyway, or rely on third-party forums like to provide discussion areas for their content.

In short, if you're not using any of the dynamic features of your web hosting service, you might as well make the whole site static. If you _are_ using those features on some areas of your site, you're better off making the static parts simple static files.

If _Makebakery_ doesn't meet your needs, it is only one of [literally hundreds of different static site generators][staticsitegenerators] that people have made. A friend of mine wrote [coleslaw][] and I've heard good things about [Pelican][] too.
