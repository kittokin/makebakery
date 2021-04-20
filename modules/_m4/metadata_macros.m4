m4_dnl
m4_dnl  TITLE({m4{text}m4}): Set the title of this page.
m4_dnl
m4_define({m4{TITLE}m4}, {m4{m4_dnl
m4_define({m4{__TITLE}m4}, {m4{$1}m4})}m4})

m4_dnl
m4_dnl  SHORT_TITLE({m4{text}m4}): Set the "short title" of this page, preferred in navbars etc. to the normal TITLE.
m4_dnl
m4_define({m4{SHORT_TITLE}m4}, {m4{m4_dnl
m4_define({m4{__SHORT_TITLE}m4}, {m4{$1}m4})}m4})

m4_dnl
m4_dnl  AUTHOR({m4{text}m4}): Set the author of this page.
m4_dnl
m4_define({m4{AUTHOR}m4}, {m4{m4_dnl
m4_define({m4{__AUTHOR}m4}, {m4{$1}m4})}m4})

m4_dnl
m4_dnl  STATUS({m4{text}m4}): Set the status of this page (published or draft.)
m4_dnl
m4_define({m4{STATUS}m4}, {m4{m4_dnl
m4_define({m4{__STATUS}m4}, {m4{$1}m4})}m4})


m4_dnl
m4_dnl  DATE({m4{date string}m4}): Set the original creation date of this page. Date
m4_dnl  format is whatever is parseable by your system's /bin/date.
m4_dnl
m4_define({m4{DATE}m4}, {m4{m4_dnl
m4_dnl  Store verbatim in this variable
m4_define({m4{__DATE}m4}, {m4{$1}m4})m4_dnl
m4_dnl  Miliseconds since the epoch (for feeding to javascript Date() object)
m4_define({m4{__DATE_MSEC}m4}, m4_esyscmd({m4{date -u --date="$1" "+%s000" | tr -d "\n"}m4}))m4_dnl
m4_dnl  ISO8601 format recommended by Dublin Core http://www.w3.org/TR/NOTE-datetime
m4_define({m4{__DATE_ISO}m4}, m4_esyscmd({m4{date -u --date="$1" "+%Y-%m-%dT%H:%M:%S%:z" | tr -d "\n"}m4}))m4_dnl
}m4})

m4_dnl
m4_dnl  AUTHOR({m4{text}m4}): Set the author of this page.
m4_dnl
m4_define({m4{STATUS}m4}, {m4{m4_dnl
m4_define({m4{__STATUS}m4}, {m4{$1}m4})}m4})

m4_define({m4{MTIME_MSEC}m4}, {m4{m4_dnl
m4_define({m4{__MTIME_MSEC}m4}, {m4{$1}m4})}m4})
