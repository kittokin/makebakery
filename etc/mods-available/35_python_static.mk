targets := $(targets:.pystatic=)
$(DST)/%: $(DST)/%.pystatic
	python $< > $@
