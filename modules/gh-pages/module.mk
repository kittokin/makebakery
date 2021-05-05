#
# gh-pages module: commit rendered targets to a gh-pages branch in this repo
#
# Copyright 2018 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

.PHONY: gh-pages upload

# NOTE: The GNU Make manual says,
#
# "Recursive make commands should always use the variable MAKE, not the
# explicit command name ‘make’" (5.7.1)
#
# Unfortunately, there seems to be a feature where the toplevel Makefile will
# not clean up its intermediate files until sub-makes have completed execution.
# That's undesired behavior in this case.

gh-pages:
	# Ensuring there are no uncommitted changes in the current branch:
	git status -s
	[ -z "$$(git status -s)" ] || ( echo "Error: commit or stash local changes first." && false )
	# Ensuring local gh-pages branch exists here:
	git show-ref refs/heads/gh-pages
	# Ensuring local gh-pages branch is not currently checked out here:
	[ "$$(git symbolic-ref HEAD)" != "refs/heads/gh-pages" ]
	# Ensuring $(DST) is a clone of this repo and gh-pages branch is checked out there:
	[ "$$(git -C $(DST) symbolic-ref HEAD)" = "refs/heads/gh-pages" ]
	make # Why not $(MAKE)? See NOTE above.
	# This pushes the gh-pages branch that we updated in DST back into our own
	# local repo, not our upstream. It's still up to us to push to GitHub after
	# this.
	git -C $(DST) add . \
		&& git -C $(DST) commit -a -m "Result of 'make gh-pages' against commit $$(git rev-parse --short HEAD)" \
		&& git -C $(DST) push \
		|| echo "Not updating gh-pages branch."

upload:
	git push origin gh-pages
	git push github gh-pages
