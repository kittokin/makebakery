include $(filter %.mk,$(targets))
targets := $(filter-out %.mk,$(targets))

# We can't remove .mk files from the destination because make restarts itself
# after updating them, causing an infinite loop. Have to just exclude them from
# the upload, or provide a post-render step.
# .INTERMEDIATE: $(mks)
