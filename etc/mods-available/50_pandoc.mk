# How about markdown? This idea can be extended to support
# many different pre- and post-processing tools. I think
# pandoc is the best markdown tool out there, so here's one
# way to wire it in to run *before* m4. GNU Make is even
# smart enough to clean up the intermediate file created by
# this step.
targets := $(targets:.md=.html)
$(DST)/%.html.m4: $(DST)/%.md.m4 $(MACROS)
	# Rendering $< to $@ with pandoc
	pandoc -S -f markdown -t html --base-header-level 2 --template=etc/pandoc_template.html -o $@ $<

$(DST)/%.html: $(DST)/%.md
	# Rendering $< to $@ with pandoc
	pandoc -S -f markdown -t html --base-header-level 2 --template=etc/pandoc_template.html -o $@ $<
