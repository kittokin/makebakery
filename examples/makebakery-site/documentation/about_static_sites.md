% About static sites

Static websites are those whose server-side resources are pre-computed (or _"pre-rendered"_ or _"pre-generated"_), so that web servers do not need to perform this activity for each request.

Static websites are useful because they can be hosted without complex server architecture, which reduces the cost and effort to make them secure, fast, scalable, resilient, and portable.

- **Secure**: Static resources may be hosted read-only, defeating many vectors for attack.

- **Fast**:
  Static resources are cache-friendly, making them easy to serve from memory both at the server and in the browser, or serve from distributed caches like Content Delivery Networks.
  In addition, static resources do not incur computation time for database queries or template rendering so even uncached requests are fast.

- **Scalable**: "Fast" means you can serve the same pages to more people, but it also means you can serve the same people using fewer resources. (Simpler software, cheaper hardware, and less power.)

  You can "build out" to geographically distributed content delivery networks, or you can "build in" to lower-cost hosting services, or self-hosting on recycled or low-power computers.

  [LOW←TECH MAGAZINE's solar-powered website](https://solar.lowtechmagazine.com/about.html) is a great example of what a static site can enable.

- **Resilient**:
  When sites are fast, they are less likely to become unavailable due to heavy traffic.
  When sites do not rely on complex infrastructure, they are less likely to "crash" due to software bugs.

- **Portable**: Static site hosting is the simplest of hosting mechanisms, so there are a wide variety of options and service providers to choose from or move between.

However, with no processing occurring on the server end, it's not possible to host user-interactive features like comments sections, authentication, or e-commerce systems.
Instead, many sites rely on browser JavaScript and third-party services to add dynamic features.
[Netlify](https://netlify.com) calls that approach [Jamstack](https://jamstack.org).

Most of [the benefits heralded by Jamstack](https://jamstack.org/why-jamstack) come from its reliance on static hosting ("_pre-generated files_").

This technique of pre-rendering static pages for websites has also be called [*baking* a website][baking], as opposed to a short-order server *frying* up each page upon each request.

[baking]: ../makebakery-meaning/
