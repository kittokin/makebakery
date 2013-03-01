m4_divert(-1)m4_dnl  Keep this line at the beginning of this file.

m4_dnl  Macros defined here will be available to all files interpreted by m4.
m4_dnl  ----------------------------------------------------------------------

m4_dnl
m4_dnl  TITLE(`text'): Set the title of this page.
m4_dnl
m4_define(`TITLE', `m4_dnl  
m4_define(`__TITLE', `$1')')

m4_dnl
m4_dnl  DATE(`date string'): Set the original creation date of this page. Date
m4_dnl  format is whatever is parseable by your system's /bin/date.
m4_dnl
m4_define(`DATE', `m4_dnl
m4_dnl  Store verbatim in this variable
m4_define(`__DATE', `$1')m4_dnl
m4_dnl  Miliseconds since the epoch (for feeding to javascript Date() object)
m4_define(`__DATE_MSEC', m4_esyscmd(`date -u --date="$1" "+%s000" | tr -d "\n"'))m4_dnl
m4_dnl  ISO8601 format recommended by Dublin Core http://www.w3.org/TR/NOTE-datetime
m4_define(`__DATE_ISO', m4_esyscmd(`date -u --date="$1" "+%Y-%m-%dT%H:%M:%S%:z" | tr -d "\n"'))m4_dnl
')

m4_include(`etc/color_math_macros.m4')

m4_dnl
m4_dnl  CWD: 
m4_dnl
m4_define(`CWD', `m4_dnl
m4_dnl  Return the directory containing the calling file
m4_patsubst(m4___file__, `[^/]*$')')

m4_define(`MY_PATH', `m4_dnl
m4_dnl  Return the directory containing the calling file, relative to the
m4_dnl  build-root.
m4_patsubst(m4_patsubst(m4___file__, `[^/]*$'), `^[^/]*')')



m4_dnl  Configuration of the site
m4_dnl  ----------------------------------------------------------------------

m4_dnl  FIXME: This stuff is specific to each site; if the user is building
m4_dnl  many different sites with a single main m4-bakery, should we put this
m4_dnl  somewhere else?

m4_dnl  If your site is rooted somewhere other than /, specify it with no
m4_dnl  leading nor trailing slash. If the site is at the root of your webhost,
m4_dnl  leave this commented out.
m4_dnl
m4_dnl  Example: If I am using m4-bakery to build a site served at the url
m4_dnl  http://datagrok.org/foo/bar/mysite then I would set:
m4_dnl      __SITEHOST  http://datagrok.org
m4_dnl      __ROOT      foo/bar/mysite 
m4_dnl
m4_define(`__SITEHOST', `http://datagrok.github.com')
m4_define(`__SITENAME', `m4-bakery demo site')
m4_define(`__ROOT', `m4_bakery')
m4_dnl
m4_dnl  Your Google analytics code:
m4_dnl      m4_define(`__GACODE', `UA-XXXXXX-XX')
m4_dnl





m4_dnl  You shouldn't need to modify anything below.
m4_dnl  ----------------------------------------------------------------------

m4_dnl  If you don't define a __ROOT above, we configure it to expand to
m4_dnl  nothing.
m4_ifdef(`__ROOT',, `m4_define(`__ROOT', `')')

m4_divert(2)m4_dnl  Keep this line near the end of the file.
m4_dnl vim: et: commentstring=m4_dnl\ \ %s:comments=\:#,\:m4_dnl
