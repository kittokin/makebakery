# Causes all source .html files to end up as name/(default doc). This
# effectively makes every page into a "directory." This makes reasoning (in
# javascript) about page resources and parent/child/sibling relationships more
# elegant.
#
# Without this mod, a page's parent might be "./" or "../" depending on whether
# the page itself has children. With this mod, a page's parent is always "../"
#
# Without this mod, a page's sibling might be "sibling" or "sibling/" or
# "../sibling" or "../sibling/" depending on whether or not the page and its
# sibling have children. With this mode, a page's sibling is always
# "../sibling/"
#
# Without this mod, a page at /path will change to /path/ if a child is added.
# Apache does a redirect automatically, but now its interior relative links to
# other things must be changed.
targets := $(targets:.html=/$(default_document))
targets := $(targets:/$(basename $(default_document))/$(default_document)=/$(default_document))
$(DST)/%/$(default_document): $(DST)/%.html
	install -m 644 -D $< $@
