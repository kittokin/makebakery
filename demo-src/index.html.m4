m4_dnl	Define a macro that will be expanded in the HTML template.
TITLE(`Make and M4 Website Bakery')
DATE(`Thu, 28 Feb 2013 18:27:11 -0500')

<p><img style="margin: 10px 5% 10px 5%; max-width: 40%;" class="pull-right" src="http://placekitten.com/400/400" /><b>m4-bakery</b> is a simple collection of configuration and scripts that build a static website, using the venerable UNIX tools <tt><a href="https://www.gnu.org/software/make/">GNU make</a></tt> and <tt><a href="https://www.gnu.org/software/m4/">GNU m4</a></tt>.</p>

<p>A <i>static website</i> is one which requires no logic on the server-side to work. They are useful because they're effortlessly fast, scalable, and can easily take advantage of caching. They are much easier to secure, and can be served from the very cheapest of hosting services.</p>

<p><tt>GNU Make</tt> is a tool that figures out from your collection of source files what commands need to be run to render those files as HTML. It is smart enough to only re-render those files whose sources have changed. Modern work-alikes include <a href="gruntjs.com">Grunt</a>, <a href="http://rake.rubyforge.org">Rake</a>, or <a href="http://ant.apache.org">Ant</a>.</p>

<p><tt>GNU M4</tt> is a <i>macro processor</i> which we employ as a minimalist templating engine.</p>

<p>Neither <tt>Make</tt> nor <tt>M4</tt> are the most intuitive of tools, but since they are so ubiquitious, it's likely that they're already installed on your computer, and your web host's servers.</p>

<p><b>m4-bakery</b> is fairly simplistic and open-ended; it is intended more as a demonstration of techniques than a framework or a cohesive bundle of software.</p>

<p>I demonstrate in the sources how one might wire up their favorite plain-text-to-html compiler (I love <a href="http://johnmacfarlane.net/pandoc/">Pandoc</a>), so that you can keep all your source files in markdown format. You could similarly replace <tt>m4</tt> with a modern templating engine like <a href="http://jinja.pocoo.org/">Jinja</a>, or add CSS compilers like <a href="http://lesscss.org/">LESS</a>, image processing using <a href="http://www.imagemagick.org">ImageMagick</a>, and whatever other custom scripts you like to the compilation pipeline.</p>

<p>This website is the result of running <code>make</code> in the <code>m4-bakery</code> repository, which compiles the included demo site source to HTML.</p>

<p>The source code for this demo site is included with m4-bakery in the <code>demo-src</code> directory. Visit <a href="https://github.com/datagrok/m4-bakery">the m4-bakery project page on GitHub</a> to learn more. Read the README, browse the source code, or fork the project for your own use.</p>

<h2>Interesting features</h2>

<p>Static page-compiling tools are fairly boring, but there are some clever pieces within:</p>

<ul>
<li>Unlike many other attempts, I try to avoid any boilerplate in source files. Page templates are not "included" from sources; instead all sources get a template wrapped around them.</li>
<li>The included demo is a responsive site that uses <a href="http://getbootstrap.com">Twitter Bootstrap</a>.</li>
<li>Pages are compiled according to their filename; you may freely mix markdown, raw html, and other files within your sources.</li>
<li><code>demo-src/pages.json.m4.index</code> renders <a href="pages.json">a .json index of all the pages on the site</a>. This enables us to automatically build navigation bars like the one in the header on this page, or "recent changes" links, all on the client side.
<li><code>demo-src/atom.xml.m4.index</code> renders <a href="atom.xml">an atom-format .xml file</a> of changes made to the site. Even though the site is static you can still have it update feed readers whenever you make a change.
</ul>

<h2>Coming soon</h2>

<ul>
<li>Example of how to use m4-bakery to compile a blog.</li>
<li>Example of how to automatically build a breadcrumbs bar.</li>
<li>Example of how to automatically build a <a href="http://www.sitemaps.org">sitemap</a>.</li>
<li>Example of how to automatically compile Twitter Bootstrap CSS from its LESS sources.</li>
</ul>

<p>Created by <a href="http://datagrok.org">Michael F. Lamb</a>. License: <a href="https://www.gnu.org/licenses/agpl-3.0.html">Affero GPL version 3 or later</a>.</p>
