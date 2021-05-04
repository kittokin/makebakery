#
# watch module: use inotify to watch for changes and re-build the site.
#
# Copyright 2021 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

.PHONY: watch

watch: $(SRC)
	inotifywait \
        --exclude '\.sw..\?$$' \
        --exclude '\.git/' \
        --exclude '\.svn/' \
        -rme close_write \
		$< \
        | while read dir event filename; \
		do \
			[ -e "$$dir$$filename" ] || continue; \
			make -R -j -C $<; \
		done
