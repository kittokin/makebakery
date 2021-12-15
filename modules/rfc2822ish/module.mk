#
# rfc2822ish module: convert MIME-format messages to Markdown
#
# Copyright 2021 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

# My .msg files are basically RFC2822 MIME-format documents with the eventual
# goal of each possibly containing a hierarchy of multiple sub-documents.
#
# To accomplish that, need to add a rule to generate .mk files from RFC2822
# documents, and an include statement to include them all.
# https://www.gnu.org/software/make/manual/html_node/Automatic-Prerequisites.html
#
# For now, assume 1 .msg file -> pandoc -> 1 .html file.  Merely strip the
# header and use for metadata. (Convert my rfc2822 format to pandoc "title
# block" format
targets := $(targets:.msg=.md)
$(DST)/%.md: $(DST)/%.msg
	modules/rfc2822ish/rfc2822topandoc < $< > $@
