include $(filter %.mk,$(targets))
targets := $(filter-out %.mk,$(targets))
