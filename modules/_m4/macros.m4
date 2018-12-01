m4_divert(-1)m4_dnl  Keep this line at the beginning of this file.

m4_dnl  Macros defined here will be available to all files interpreted by m4.
m4_dnl  ----------------------------------------------------------------------

m4_include(__M4LIB{m4{/metadata_macros.m4}m4})
m4_include(__M4LIB{m4{/color_math_macros.m4}m4})




m4_dnl  You shouldn't need to modify anything below.
m4_dnl  ----------------------------------------------------------------------

m4_dnl  If you don't define a __BASEURL above, we configure it to expand to
m4_dnl  '' (site root).
m4_ifdef({m4{__BASEURL}m4},, {m4{m4_define({m4{__BASEURL}m4}, {m4{}m4})}m4})
m4_ifdef({m4{__PUBLISHED}m4},, {m4{m4_define({m4{__PUBLISHED}m4}, {m4{False}m4})}m4})

m4_divert(2)m4_dnl  Keep this line near the end of the file.
m4_dnl vim: et: commentstring=m4_dnl\ \ %s:comments=\:#,\:m4_dnl
