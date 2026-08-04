local Variants = script.Variants

return {
	Id = "WindowOpening",
	Name = "Window Opening",
	Description = "Compare how a modal window enters and exits the screen.",
	Variants = {
		require(Variants.PremiumSimulator),
		require(Variants.Instant),
		require(Variants.FadeScale),
		require(Variants.SlideIn),
	},
}
