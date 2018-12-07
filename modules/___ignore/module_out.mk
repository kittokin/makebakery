
targets := $(filter-out $(addprefix $(DST)/,$(IGNORE)),$(targets))
