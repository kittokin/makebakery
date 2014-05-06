# Allow the user to denotate a class of source documents that should be
# processed only after all others, with a .index extension.
targets := $(filter-out %.index,$(targets)) $(addprefix I/,$(filter %.index,$(targets)))
targets := $(targets:.index=)
