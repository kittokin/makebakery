# Copies files from demo/ to build/. Any .html files are
# interpreted by GNU m4 and wrapped in a the GNU m4
# template. Common m4 macros may be stored in a macros
# file.

MACROS   := macros.m4
TEMPLATE := template.html.m4
SRC      := demo-src
DST      := build

# Build a list of all the files that should exist when the
# baking is done. We do this by getting a list of all the
# source files and rewriting pathnames and file suffixes as
# necessary.
#
# "pages" is the subset of these files which are pieces of
# content while "targets" include also files which collate
# or enumerate other pages (blog rollups, sitemaps, etc.)
files := $(shell find $(SRC) -type f)
files := $(files:$(SRC)/%=$(DST)/%)
files := $(files:.m4=)
files := $(filter-out %.inc %.swp %.index,$(files))
files := $(files:.md=.html)
targets := $(files)
targets := $(targets) $(DST)/pages.json

all: $(targets)

# First, all source files will be copied verbatim to the
# destination. I use the ubiquitous unix 'install' tool
# here because it creates any needed paths automatically.
# When Make is done compiling it will delete those copies.
$(DST)/%: $(SRC)/%
	install -m 644 -D $< $@

# Any files named '*.html.m4' will be interpreted by M4
# with the macros available, wrapped in the HTML template,
# and saved without the '.m4' extension. 
$(DST)/%.html: $(DST)/%.html.m4 $(MACROS) $(TEMPLATE)
	m4 -P $(MACROS) $< $(TEMPLATE) > $@

include etc/pandoc.mk

# Any files named '*.index' will depend on the rest of the
# pages having been processed before being processed
# themselves. In this way you can create automatic indices,
# sitemaps, etc. No processing occurs here, we just remove
# the extension.
$(DST)/%: $(DST)/%.index $(files)
	cp $< $@

# Any other files named '*.m4' will be interpreted by M4
# with the macros available, saved without the '.m4'
# extension, but will not be wrapped in the HTML template.
# This lets you use M4 within .css, .js, etc.
$(DST)/%: $(DST)/%.m4 $(MACROS)
	m4 -P $(MACROS) $< > $@

# By default, GNU Make will skip any source files that have
# not been modified since the last time they were rendered.
# Run 'make clean' to erase the destination directory for a
# complete rebuild. I do a 'mv' then 'rm' to reduce the
# chances of running an 'rm -rf /'.
clean:
	mv $(DST) .old_dst
	rm -rf .old_dst

# vim: tw=59 :
