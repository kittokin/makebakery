targets := $(filter-out %.index,$(targets)) $(addprefix I/,$(filter %.index,$(targets)))
targets := $(targets:.index=)
