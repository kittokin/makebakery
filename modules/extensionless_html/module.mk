#
# extensionless_html module: remove extension from html file targets for nice URLs
#
# Copyright 2018 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

# causes all .html files to be saved with no extension. For this to work right
# you should configure your webserver to set the Content-type header for these
# files to text/html. You might do this by setting the default mime-type to
# text/html, or by building a module that constructs an appropriate .htaccess
# file, etc.
#
# This helps to keep HTML URIs free of filename extensions. (URIs never need
# filename extensions, if your webserver can figure out a resource's file type
# through other means.) Apache "multiviews" or the "paths_are_dirs.mk" plugins
# are other ways to do the same.
targets := $(targets:.html=)
$(DST)/%: $(DST)/%.html
	cp -p $< $@
