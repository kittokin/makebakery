#
# url module: Retrieve resources named in .url files
#
# Copyright 2018 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

# Format of a .url file should be a single line containing a URL to hand to
# 'curl'

targets := $(targets:.url=)

$(DST)/%: $(DST)/%.url
	@echo "$(subst $(DST),,$@)" ← internet
	grep -v '^#|$$' $^ | head -1 | xargs curl -so $@
