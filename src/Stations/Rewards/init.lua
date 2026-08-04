local Variants = script.Variants

return {
	Id = "Rewards",
	Name = "Rewards",
	Description = "Compare how earning a reward is presented to the player.",
	Variants = {
		require(Variants.Satisfying),
		require(Variants.Simple),
		require(Variants.PopIn),
		require(Variants.Confetti),
	},
}
