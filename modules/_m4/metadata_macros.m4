m4_dnl
m4_dnl  TITLE(`text'): Set the title of this page.
m4_dnl
m4_define(`TITLE', `m4_dnl  
m4_define(`__TITLE', `$1')')

m4_dnl
m4_dnl  SHORT_TITLE(`text'): Set the "short title" of this page, preferred in navbars etc. to the normal TITLE.
m4_dnl
m4_define(`SHORT_TITLE', `m4_dnl  
m4_define(`__SHORT_TITLE', `$1')')

m4_dnl
m4_dnl  AUTHOR(`text'): Set the author of this page.
m4_dnl
m4_define(`AUTHOR', `m4_dnl  
m4_define(`__AUTHOR', `$1')')

m4_dnl
m4_dnl  STATUS(`text'): Set the status of this page (published or draft.)
m4_dnl
m4_define(`STATUS', `m4_dnl  
m4_define(`__STATUS', `$1')')


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

m4_dnl
m4_dnl  AUTHOR(`text'): Set the author of this page.
m4_dnl
m4_define(`STATUS', `m4_dnl  
m4_define(`__STATUS', `$1')')

