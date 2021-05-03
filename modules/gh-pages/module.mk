#
# gh-pages module: commit rendered targets to a gh-pages branch in this repo
#
# Copyright 2018 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

.PHONY: gh-pages

gh-pages: all
	# Ensuring there are no uncommitted changes in the current branch:
	git status -s
	[ -z "$$(git status -s)" ] || ( echo "Error: commit or stash local changes first." && false )
	# Ensuring local gh-pages branch exists here:
	git show-ref refs/heads/gh-pages
	# Ensuring local gh-pages branch is not currently checked out here:
	[ "$$(git symbolic-ref HEAD)" != "refs/heads/gh-pages" ]
	# Ensuring $(DST) is a clone of this repo and gh-pages branch is checked out there:
	[ "$$(git -C $(DST) symbolic-ref HEAD)" = "refs/heads/gh-pages" ]
	$(MAKE) all
	git -C $(DST) add .
	git -C $(DST) commit -a -m "Result of 'make gh-pages' against commit $$(git rev-parse --short HEAD)"
	git -C $(DST) push
