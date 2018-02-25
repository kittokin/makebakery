[
m4_dnl  We cheat a bit here and just use M4's esyscmd to run a bunch of shell
m4_dnl  script.
m4_dnl
m4_esyscmd({m4{
cd $DST
find -name "index.html" | while read filename; do
    title="$( sed -n 's/^\s*<title>\([^<]*\)<\/title>/\1/p' "$filename" )"
    short_title="$( sed -n 's/^\s*<meta name=\"short title\" content=\"\([^\"]*\)\">/"\1"/p' "$filename" )"
    ctime="$( sed -n 's/^\s*var created = new Date(\([^)]*\));/\1/p' "$filename" )"
    mtime="$( date -u -r "$filename" "+%s000" )"
    cat <<- EOF
    {
        "path": "${filename#.}",
        "created": ${ctime:-null},
        "modified": $mtime,
        "short_title": ${short_title:-null},
        "title": "$title"
        
    },
EOF
done
}m4})m4_dnl
    m4_dnl trailing empty object to avoid having to deal with no trailing comma
    m4_dnl in last element of an array in javascript
    {}
]
m4_dnl vim: ft=m4 et: commentstring=m4_dnl\ \ %s:comments=\:#,\:m4_dnl
