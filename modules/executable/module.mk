#
# Execute files named *.run; their output becomes the content of the rendered file.
#
# This allows for the creation of language-agnostic scripts to be executed at
# baking time (not request time). Scripts need not be marked executable (the
# various copy steps do not preserve mode.) They receive no arguments.
#
targets := $(targets:.run=)
$(DST)/%: $(DST)/%.run
	chmod +x $<
	$< > $@
	chmod -x $<
