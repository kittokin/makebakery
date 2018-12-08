#
# raw module: prevent some files from being processed
#
# Copyright 2018 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

# "raw" files will be saved as-is even if their next higher
# extension is .html.
targets := $(targets:.raw=)
$(DST)/%: $(DST)/%.raw
	cp -p $< $@
