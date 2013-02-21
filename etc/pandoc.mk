# How about markdown? This idea can be extended to support
# many different pre- and post-processing tools. I think
# pandoc is the best markdown tool out there, so here's one
# way to wire it in to run *before* m4. GNU Make is even
# smart enough to clean up the intermediate file created by
# this step.
$(SRC)/%.html.m4: $(SRC)/%.md.m4 $(MACROS) $(TEMPLATE)
	# Rendering $< to $@ with pandoc
	pandoc -f markdown -t html -o $@ $<
