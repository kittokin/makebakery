<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <title><![CDATA[__SITENAME]]></title>
  <link href="__BASEURL/atom.xml" rel="self"/>
  <link href="__BASEURL/"/>
  <updated>m4_esyscmd(`date -u --date="$1" "+%Y-%m-%dT%H:%M:%S%:z" | tr -d "\n"')</updated>
  <id>__SITEHOST{{m4{{}}m4}}__BASEURL/</id>
  <author>
    <name><![CDATA[__AUTHOR]]></name>
    <email><![CDATA[__EMAIL]]></email>
  </author>
  <generator uri="https://github.com/datagrok/makebakery">makebakery</generator>
m4_esyscmd({m4{
cd $DST
find -name "index.html" | while read filename; do
    title="$( sed -n 's/^\s*<title>\([^<]*\)<\/title>/\1/p' "$filename" )"
    ctime="$( sed -n 's/^\s*var created = new Date(\([^)]*\));/\1/p' "$filename" )"
    mtime="$( date -u -r "$filename" "+%s000" )"
    cat <<- EOF
    <entry>
        <title type="html"><![CDATA[$title]]></title>
        <link href="__SITEHOST{m{m4{}m4}4{}m{m4{}m4}4}__BASEURL/$filename"/>
        <updated>$mtime</updated>
        <id>__SITEHOST{m{m4{}m4}4{}m{m4{}m4}4}__BASEURL/$filename</id>
        m4_ifdef({m{m4{}m4}4{__BODY}m{m4{}m4}4}, {m{m4{}m4}4{
        <content type="html"><![CDATA[<p>__BODY</p>]]></content>
        }m{m4{}m4}4})
    </entry>
EOF
done
}m4})m4_dnl
</feed>
