#
# sass module: convert .sass and .scss to .css with sassc
#
# Copyright 2021 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#
targets := $(targets:.sass=.css)
targets := $(targets:.scss=.css)

$(DST)/%.css: $(DST)/%.sass
	sassc $^ $@

$(DST)/%.css: $(DST)/%.scss
	sassc $^ $@
