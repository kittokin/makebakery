SRC					:= .
DST					:= ../build/makebakery
# BASEURL is the URL path from the root of the domain to
# the root of the site. If defined, should start with / and
# never end with /
BASEURL			:= /makebakery
SITEHOST		:= https://datagrok.github.io
SITENAME		:= makebakery
M4_TEMPLATE := .site/m4-template.html.m4

# This must appear before the statement to include makebakery.mk.
MODULES = $(sort \
	___raw \
	__multisource \
	__paths_are_dirs \
	_m4 \
	executable \
	pandoc \
	url \
	)

# Since this Makefile is in the directory containing source files, we need to
# exclude it from the destination files. This must appear before the statement
# to include makebakery.mk.
IGNORE := Makefile

include ../makebakery.mk

$(DST)/atom.xml: $(filter %.html,$(targets))
$(DST)/pages.json: $(filter %.html,$(targets))
