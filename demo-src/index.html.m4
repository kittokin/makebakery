m4_dnl	Define a macro that will be expanded in the HTML template.
TITLE(`GNU Make and M4 Website Bakery')
DATE(`Thu, 28 Feb 2013 18:27:11 -0500')

<p><img style="margin: 10px 5% 10px 5%; max-width: 40%;" class="pull-right" src="http://placekitten.com/400/400" /><b>m4-bakery</b> is a simple collection of configuration and scripts that build a static website, using the GNU tools <tt><a href="https://www.gnu.org/software/make/">make</a></tt> and <tt><a href="https://www.gnu.org/software/m4/">m4</a></tt>. Those tools are so ubiquitous, you probably already have them installed on your computer.</p>

<p>m4-bakery is fairly simplistic and open-ended; I demonstrate in the source how one might wire up their favorite markdown compiler (I love <a href="http://johnmacfarlane.net/pandoc/">Pandoc</a>), so that your source files may be in markdown format. You could similarly replace m4 with a modern templating engine like Jinja, or add CSS compilers like LESS, image processing, and whatever other custom scripts you wish to the compilation pipeline.</p>

<p>This website is the result of running <tt>make</tt> in the <tt>m4-bakery</tt> repository, which compiles the included demo site source to HTML.</p>

<p>The source code for this demo site is included with m4-bakery in the <tt>demo-src</tt> directory. Visit <a href="https://github.com/datagrok/m4-bakery">the m4-bakery project page on GitHub</a> to learn more. Read the README, browse the source code, or fork the project for your own use.</p>

<p>Here are some interior pages:</p>
<ul>
    <li><a href="example_page.html">Bare-bones example with no code</a></li>
    <li><a href="html_color_macros_demo.html">Using M4 macros to do HTML color math</a></li>
    <li><a href="atom.xml">An Atom-format feed created with M4</a></li>
</ul>

<p>Created by <a href="http://datagrok.org">Michael F. Lamb</a>. License: <a href="https://www.gnu.org/licenses/agpl-3.0.html">Affero GPL version 3 or later</a>.</p>
