#
# coffeescript module: transform coffeescript source code into javascript
#
# Copyright 2018 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

#
# Process .coffee scripts into .js
#
targets := $(targets:.coffee=.js)

$(DST)/%.js: $(DST)/%.coffee
	coffee -c $^
