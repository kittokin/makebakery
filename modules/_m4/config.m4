m4_divert(-1)m4_dnl  Keep this line at the beginning of this file.
m4_dnl  Configuration of the site
m4_dnl  ----------------------------------------------------------------------
m4_dnl
m4_dnl Since m4 may expand a word anywhere, and since you need to be able to
m4_dnl quote such a word to avoid expansion, quote interpolation is active everywhere.
m4_dnl Since some of the content might not have been written with the expectation that
m4_dnl it would be processed by m4, we need to change the quote character to some
m4_dnl symbol (string) that is unlikely to ever appear for a different purpose, yet
m4_dnl isn't too ugly or distracting in my text editor.
m4_changequote(`{m4{', `}m4}')m4_dnl
m4_dnl

m4_dnl  If your site is rooted somewhere other than /, specify its path as
m4_dnl  __BASEURL with a leading, but no trailing slash. If the site is at the
m4_dnl  root of your webhost, leave __BASEURL undefined.
m4_dnl
m4_dnl  Example: If I am using makebakery to build a site served at the url
m4_dnl  http://datagrok.org/foo/bar/mysite then I would set:
m4_dnl      __SITEHOST  http://datagrok.org
m4_dnl      __BASEURL   /foo/bar/mysite
m4_dnl
m4_dnl
m4_dnl  Your Google analytics code:
m4_dnl      m4_define({m4{__GACODE}m4}, {m4{UA-XXXXXX-XX}m4})
m4_dnl
