local Variants = script.Variants

return {
	Id = "Buttons",
	Name = "Buttons",
	Description = "Compare press feedback for buttons: scale, bounce, ripple.",
	Variants = {
		require(Variants.Standard),
		require(Variants.Bouncy),
		require(Variants.Ripple),
	},
}
