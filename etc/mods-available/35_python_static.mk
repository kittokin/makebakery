#
# Process files named .pystatic with python.
#
# This allows for the creation of python scripts to be executed at baking time
# (not request time). We use .pystatic rather than .py to avoid conflicting
# with .py files that are intended to be uploaded verbatim.
#
targets := $(targets:.pystatic=)
$(DST)/%: $(DST)/%.pystatic
	python $< > $@
