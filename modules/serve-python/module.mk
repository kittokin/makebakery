#
# serve-python module: use python3 to stand up a little http server for local preview
#
# Copyright 2021 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

ifndef SERVER_PORT
	SERVER_PORT := 8080
endif
.PHONY: serve
serve: $(patsubst %$(BASEURL),%,$(DST))
	cd $< && python -m http.server $(SERVER_PORT)
