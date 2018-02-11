m4_dnl
m4_dnl  CWD: 
m4_dnl
m4_define(`GETCWD', `m4_dnl
m4_dnl  Return the directory containing the calling file
m4_patsubst(m4___file__, `[^/]*$')')

m4_define(`MY_PATH', `m4_dnl
m4_dnl  Return the directory containing the calling file, relative to the
m4_dnl  build-root.
m4_patsubst(m4_patsubst(m4___file__, `[^/]*$'), `^[^/]*')')


