# RWD-001_GOLD — Self-Review

Critical review of the implementation against `GOLD_DIRECTION.md`, written
immediately after building it. This is not a list of what went well —
it's what's still short of the target, what Roblox itself wouldn't let me
build, and what a second day would actually spend time on.

## What is still weaker than the Gold Direction

- **The single biggest gap: this has never run in Roblox Studio.** I have
  no Roblox client in this execution environment. Every claim below about
  timing, legibility, and feel is reasoned from the code and from Roblox's
  documented `UDim2`/`TweenService`/`GuiObject` behavior, not observed. This
  project's own history is the reason to take that seriously rather than
  as a boilerplate disclaimer: the Companion Panel's drag bug and the
  blue-screen bug were both things that looked correct under static review
  and were only actually wrong once a human opened Studio. There is no
  reason to assume this file is exempt from the same risk.
- **A real bug was caught and fixed during this same implementation pass,
  not before it.** The flash was originally built to tween
  `BackgroundTransparency` from `1` to `1` — its idle value and its target
  value were identical, so the flash would never have actually appeared.
  I found this by manually tracing the Approval Checklist's flash item
  against the code, not by watching it happen. That it took a deliberate
  line-by-line trace to catch, on a review I was already doing carefully,
  is itself evidence for the first point above, not against it.
- **The Primary Design Goal — "must still feel good on the five-hundredth
  repetition" — is the one property in this whole document I have the
  least ability to verify.** I built the mechanism I believe serves it
  (fixed, non-random timing and geometry, so every replay is literally
  identical rather than merely similar; a generation-guard so rapid
  replay can't corrupt the animation state), but "does it hold up" is a
  claim about lived repetition, and I can run this exactly zero times.
- **The audio requirement is currently unverifiable, not just unbuilt.**
  `AssetIds.Sounds.RewardSnap` is a new, precisely-named placeholder
  (`rbxassetid://0`) added specifically because the Gold Reference's "a
  click or snap, not a chime" language directly contradicted reusing the
  existing `RewardChime` entry. The `Sound` instance is fully wired up
  and will work the moment a real asset is uploaded, but right now it is
  silent. Every checklist item about the sound's character is untestable
  until that happens.
- **The reward icon is a flat, single-color circle with one static
  highlight.** It reads as "a coin-shaped thing," not as an actual coin —
  there's no engraving, symbol, or secondary shape that would give it real
  visual identity the way even a simple real game's currency icon usually
  has. This was a deliberate simplification (see Roblox limitations
  below), but it's a real gap between this and something someone would
  actually ship.
- **The docking counter is invented, not integrated.** There is no real
  inventory or currency UI in this Lab benchmark for the reward to
  meaningfully land in, so the small rounded chip in the corner is a
  stand-in I built specifically to give the docking motion somewhere to
  go. It's honest about being a stand-in (see the code comment), but it
  means the one idea explicitly borrowed from Variation C — "that's how
  this will actually need to integrate into a real HUD" — hasn't actually
  been tested against a real HUD at all, only against a plausible-looking
  fake one.

## What Roblox limitations forced compromises

- **No bloom, no HDR, no true photographic flash.** Roblox's 2D UI
  rendering has nothing equivalent to a bright light source with real
  falloff — the "flash" here is a plain circle fading its own
  transparency, which reads as "a shape appearing and disappearing," not
  as light hitting something. This is the same category of limitation
  flagged for Premium Simulator's missing blur; UI-layer effects in
  Roblox are fundamentally flat-shaded, not physically lit.
- **No specular/material response, at all.** The "glossy highlight" is a
  static semi-transparent circle offset toward one corner. It never
  changes, never responds to anything, and looks identical whether the
  icon is at rest or mid-overshoot. It's the cheapest possible
  approximation of "glossy," not a real one — there is no lighting model
  in Roblox's `GuiObject` rendering to approximate more faithfully without
  building actual custom textures.
- **Roblox's built-in overshoot easing still isn't controllable.** Same
  root issue as Premium Simulator: `Enum.EasingStyle.Back`/`Elastic`
  overshoot by an amount Roblox doesn't expose as a tunable parameter, so
  hitting a specific, deliberate peak scale (here, 108%) again required
  hand-authoring the motion as two chained tweens rather than using a
  single built-in curve. This is now the second variant in this codebase
  to need the exact same workaround, which is worth noting as a real,
  recurring gap — a small shared helper for "chained overshoot to a named
  peak" would remove this duplication, but per this project's own
  build-first philosophy, that's exactly the kind of abstraction that
  should wait until a third variant actually needs it, not be built
  speculatively now.
- **Particle shape is limited to what `UICorner` can cheaply produce.**
  Every particle here is a plain circle, because that's the shape a
  `UICorner` radius trick can guarantee without a custom image asset.
  Nothing in the Gold Direction mandates a specific particle shape, so
  this isn't a violation, but it's a limitation-driven default rather
  than a considered choice — a star, diamond, or shard shape (closer to
  what the original `VISUAL_CONCEPTS.md` prompt describes) would need an
  actual image asset this Lab doesn't have.

## If I had another day

1. **Get this in front of a real Studio session first, before anything
   else.** Specifically watch the flash (now that it's fixed), watch ten
   rapid replays in a row for the consistency the checklist asks about,
   and time the whole sequence by eye rather than trusting the 0.16s/0.28s
   figures I reasoned my way to.
2. **Give the icon real visual identity** — a subtle inner ring or a
   simple symbol — without reintroducing text, so it reads as "a coin"
   rather than "a colored dot."
3. **Flag the audio gap concretely**: this benchmark needs one short, dry,
   non-reverberant asset uploaded against `AssetIds.Sounds.RewardSnap`
   before any audio-related checklist item can actually be evaluated, not
   just implemented.
4. **Question the docking motion itself, not just its target.** It's the
   one piece of this sequence the Gold Direction explicitly marks
   optional. A second day would be well spent building a fade-only
   alternate ending and comparing the two inside the Lab directly, once
   real Compare tooling exists (`ROADMAP_V2.md` Milestone 1) — using the
   tool this benchmark is meant to validate interactions with, to validate
   one of its own design choices, rather than deciding it from a document.
5. **Run this through `TESTING.md`'s actual evaluation lenses as real
   sessions** — first impression, repeated use, high-frequency context —
   instead of the static reasoning this self-review is built from. Static
   review has already caught one real bug in this file; it is not a
   substitute for watching the thing run.
