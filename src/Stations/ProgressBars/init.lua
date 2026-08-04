local Variants = script.Variants

return {
	Id = "ProgressBars",
	Name = "Progress Bars",
	Description = "Compare how progress toward completion is communicated.",
	Variants = {
		require(Variants.LinearFill),
		require(Variants.Segmented),
		require(Variants.Circular),
	},
}
