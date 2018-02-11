m4_divert(-1)m4_dnl  Keep this line at the beginning of this file.
m4_dnl  Configuration of the site
m4_dnl  ----------------------------------------------------------------------

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
m4_dnl      m4_define(`__GACODE', `UA-XXXXXX-XX')
m4_dnl
m4_dnl
