# NTF-001_GOLD — Self-Review

Critical review of the implementation against `GOLD_DIRECTION.md`, written
immediately after building it. This is not a list of what went well —
it's what's still short of the target, what Roblox itself might not let
me verify, and what a second day would actually spend time on.

## What is still weaker than the Gold Direction

- **The single biggest gap, again: this has never run in Roblox Studio.**
  I have no Roblox client in this execution environment. Every claim
  below about timing, legibility, and feel is reasoned from the code and
  from documented `TweenService`/`GuiObject` behavior, not observed. This
  project's own history — the Companion Panel's drag bug, the
  blue-screen bug, and `RWD-001_GOLD`'s transparency-tweened-to-itself
  bug — is the reason to take that seriously rather than as a boilerplate
  disclaimer each time. There is no reason this file is exempt.
- **The checkmark glyph is an unverified risk, not a settled choice.**
  The badge's checkmark is a single Unicode character
  (`"\u{2713}"`, U+2713 CHECK MARK) rendered through a `TextLabel` in
  `Theme.FontBold` (`Enum.Font.GothamBold`). Whether Roblox's Gotham font
  actually includes that glyph is something I cannot verify without
  seeing it rendered — if it doesn't, the badge would show an empty box
  or a fallback "tofu" glyph instead of a checkmark, which would be a
  real, visible failure of the one shape this whole variant is built
  around. A geometric checkmark built from two short rotated `Frame`
  "strokes," independent of font coverage, would remove this risk
  entirely and is the first thing worth trying if Studio shows a problem
  here.
- **The audio requirement is unverifiable, not just unbuilt.**
  `AssetIds.Sounds.Notification` is still the pre-existing placeholder
  (`rbxassetid://0`) — I didn't add a new entry the way `RWD-001_GOLD`
  needed to for `RewardSnap`, because "Notification" was already
  reserved for exactly this purpose and nothing about its name conflicts
  with "a single short, dry, low-key tick." But it's currently silent,
  so every checklist item about the sound's character is untestable
  until a real asset is uploaded against that id.
- **The hold duration is a reasoned guess, not a tuned number.** Show
  (0.12s) + hold (0.45s) + hide (0.15s) totals roughly 0.72s. I chose
  0.45s for the hold specifically to stay well under Toast's 1.6s
  (Confirmation should read as faster and quieter than something meant
  to be read), but "legible at a glance, gone before a second glance
  would be needed" is a judgment about lived perception that I have zero
  ability to verify by reasoning alone. This is the single number most
  likely to need adjustment after someone actually watches it.
- **I omitted the optional highlight ring entirely, which is a stricter
  reading than the Gold Direction technically required.** Visual
  Priorities Section 3 allowed "at most a faint, contained highlight"
  as its lowest-priority, nearly-optional item, and explicitly
  distinguished that from a forbidden sustained glow. This implementation
  session's own instructions banned "glow" outright with no
  qualification, so I chose to skip the highlight entirely rather than
  interpret how thin a stroke would have to be to not count. That's a
  defensible, restraint-maximizing choice, but it's a choice, not a
  requirement — if the flat badge reads as visually cheap in Studio
  rather than restrained, the contained-highlight option is still
  available within the Gold Direction's own rules and hasn't been ruled
  out by anything except this session's stricter framing.
- **The trigger button is a demo stand-in, not a real settings control.**
  There's no actual save/toggle system in this Lab benchmark for the
  confirmation to meaningfully attach to, so "Show Notification" plays
  the same role a real save button or toggle would. This mirrors
  `RWD-001_GOLD`'s invented docking counter — an honest stand-in, not a
  claim that this has been tested against a real interaction.

## What Roblox limitations forced compromises

- **No lighting-based highlight, same root cause as every prior
  benchmark** — Roblox's 2D UI rendering has no physically-based light
  model, so any "highlight" here could only ever have been a flat
  offset shape, never a real specular response. Unlike Premium Simulator
  or `RWD-001_GOLD`, where this limitation directly fought against the
  goal (both wanted to sell weight or material quality they couldn't
  fully render), it barely matters here — Confirmation wants restraint,
  and a fake highlight would have been pure decoration either way. This
  is the first benchmark where a Roblox rendering limitation and the
  actual design goal happen to point the same direction.
- **Icon rendering is at the mercy of font glyph coverage, not a real
  vector asset.** Every other benchmark's icons in this codebase are
  drawn from plain shapes (`UICorner`-rounded `Frame`s); this is the
  first one that leans on a specific Unicode character actually being
  present in a specific Roblox font, which is a genuinely different and
  more fragile kind of risk than anything flagged in prior self-reviews.
- **No way to cheaply prototype the Gold Direction's other allowed
  ending** — "resolves directly back into the interacted element's
  normal state" as an alternative to a fade-out badge would need the
  trigger button itself to have a distinct, reversible "confirmed" visual
  state, which this variant doesn't build. This isn't a Roblox
  limitation so much as a scope choice for a first pass, but it means
  only one of the two Gold-Direction-sanctioned endings has actually been
  tried.

## If I had another day

1. **Get this in front of a real Studio session first, before anything
   else** — specifically to see whether the checkmark glyph actually
   renders, and to time the full show/hold/hide sequence by eye rather
   than trusting the numbers reasoned above.
2. **Have a geometric-checkmark fallback ready** and swap to it
   immediately if the glyph doesn't render — this shouldn't be treated
   as an edge case to patch later, given how central the shape is to the
   whole variant.
3. **Upload a real asset against `AssetIds.Sounds.Notification`** — one
   short, dry, non-reverberant tick — before any audio-related checklist
   item can be evaluated rather than just implemented.
4. **Tune `BADGE_HOLD_DURATION` empirically** once it can actually be
   watched, instead of the reasoned-but-unverified 0.45s used here.
5. **Build the button-state-tint ending as a second pass and compare it
   directly inside the Lab against the badge**, once real Compare
   tooling exists (`ROADMAP_V2.md` Milestone 1) — the same instinct
   `RWD-001_GOLD`'s self-review flagged for its own optional docking
   motion, applied here to Confirmation's two sanctioned endings instead
   of one assumed-correct choice.
