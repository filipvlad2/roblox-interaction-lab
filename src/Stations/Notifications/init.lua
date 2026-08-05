local Variants = script.Variants

return {
	Id = "Notifications",
	Name = "Notifications",
	Description = "Compare how transient notifications enter and exit the screen.",
	Variants = {
		require(Variants.Confirmation),
		require(Variants.Toast),
		require(Variants.Banner),
		require(Variants.CornerPopup),
	},
}
