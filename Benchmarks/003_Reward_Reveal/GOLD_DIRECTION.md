# Reward Reveal — Gold Direction

**Stage:** Design Convergence. This is the final design document before
implementation starts. It defines one production target, not a menu of
options. After this document, the next artifact for this benchmark
should be code.

## What was reviewed, and one gap worth stating plainly

This document was written after reviewing `Benchmarks/003_Reward_Reveal/`
Creative Exploration, `VISUAL_CONCEPTS.md` (five philosophies, each with
a full storyboard/motion/visual/audio spec), and that document's
Variation A/B/C image prompts for all five. It was also written after
looking for a `DesignSystem/` and a `DesignBible/`, as instructed —
neither exists anywhere in this repository. The closest thing this
project has to a design system is `src/Shared/Theme.lua` (the color,
font, and corner-radius constants every station already uses) and
`src/Shared/UIBuilder.lua` (the shared instance constructors). Those two
files are treated below as the real, binding design system, because
they're the one that actually exists and that implementation will
actually have to answer to.

## The convergence decision

**The gold direction is Satisfying.** `VISUAL_CONCEPTS.md`'s own ranking
already argued this, on a stated basis: broadest applicability, lowest
execution risk, and the cleanest fit for how the Lab tests things. Isn't
being re-litigated here — it's the reason this document exists instead
of a fifth exploration. Prestige, Luxury, Collector, and Social remain
exactly what `VISUAL_CONCEPTS.md` said they are: real, legitimate
directions for a different reward, on a different day. This document
picks one and finishes it.

Within Satisfying's own three image-prompt variations, the gold
direction is closest to **Variation A (Faithful)** — flat/semi-realistic
vector-style rendering is what's actually achievable in Roblox's UI
rendering, unlike Variation B's photoreal PBR materials, which nothing in
this engine can produce. It borrows exactly one idea from **Variation
C**: the reward docking into a rounded UI counter at the end, because
that's how this will actually need to integrate into a real HUD, and it
matches the rounded-frame convention (`UIBuilder.corner`) already used
everywhere else in this codebase. Variation B's cinematic ambitions are
explicitly not part of the target — not because they're bad, but because
"Satisfying" was chosen specifically for being cheap, fast, and endlessly
repeatable, and chasing photoreal fidelity fights that goal directly.

---

## 1. Core Emotion

A quick, clean jolt of *"that felt good"* — not excitement, not pride,
just a satisfying, almost physical acknowledgment that lands and is
already over.

## 2. Primary Design Goal

**If only one thing succeeds, it's this: the reveal must still feel good
on the five-hundredth repetition, not just the first.** Every other
property in this document — the flash, the particles, the sound — exists
in service of that one requirement. A reward the player starts dreading
by hour ten has failed completely, regardless of how good it looked in a
single screenshot. This is the one property that overrides every other
preference below if they ever conflict.

## 3. Visual Priorities

In order:

1. **Reward icon** — the actual content. Must read instantly and
   unambiguously; nothing else in this list is allowed to obscure it.
2. **Impact flash** — the light hit that sells "this landed." Not
   decoration; this is what makes the difference between a reward
   appearing and a reward *arriving*.
3. **Snap motion** — the overshoot-and-settle bounce. Reinforces the
   flash; must read as fast and decisive, never floaty.
4. **Particles** — a small confirming accent, secondary to the three
   above. They add emphasis, never new information.
5. **Background** — deliberately last, on purpose. The correct amount of
   attention the background receives is zero. If a playtester can
   describe what was behind the reward, the background did too much.

## 4. Motion Priorities

**What should feel fast:** the arrival. There is no wind-up and no
anticipation beat before the reveal — pausing here would misrepresent
what this philosophy is for. The instant the trigger fires, the icon is
already snapping into place.

**What should pause:** nothing, deliberately. A held beat is Prestige's
signature move, not this one's. If any part of this interaction starts
to feel like it's waiting for the player to notice it, that's a sign the
wrong philosophy leaked in.

**What should settle:** everything, almost immediately. The overshoot
resolves to rest in the same breath it started in — this is one
unbroken beat, not a sequence of beats. If a docking motion into a
counter/inventory icon is used, it's the only thing allowed to linger
even slightly, and "slightly" is the operative word — it should still
read as brief, not ceremonial.

**Rhythm, in one line:** in, hit, done. If you can describe watching it
in three separate sentences, it's already too slow.

## 5. Forbidden Mistakes

- A particle shower or confetti burst — the particle accent stays small
  and tight, always.
- Any anticipation beat or pause before the reveal begins.
- A sustained or ambient glow — this is a camera flash, not a lamp; if
  it's still glowing after the icon has settled, it's wrong.
- The reward icon becoming unreadable behind its own effects, even for a
  single frame.
- Any camera movement, or anything that pulls focus away from gameplay —
  this lives entirely in the HUD layer.
- A musical stinger or a sound with a reverb tail — the audio is dry and
  percussive, or it's the wrong sound.
- Any celebratory text or copy ("Nice!", "Congratulations!") — that
  instinct belongs to Prestige, not here.
- A total sequence long enough that a player could narrate it while it's
  happening.
- Inconsistency between the first play and the hundredth — if tuning
  drifts and the reveal starts feeling different on repetition, that's a
  direct failure of the Primary Design Goal.

## 6. Gold Reference

The player does something the game rewards — closes a match, opens a
common chest, picks up dropped currency. There is no delay between that
action and the reveal; the two feel like the same event, not
cause-and-effect. A small reward icon — a coin, a gem, whatever the
context calls for — appears already in motion: it snaps into existence
at a slightly reduced size and overshoots past its resting scale in a
single sharp, springy motion before settling, the way a mechanical switch
overshoots and re-centers when you flip it. The entire scale animation,
start to rest, is one continuous gesture with no visible segments.

At the exact instant the icon appears, a single hard flash of light
fires directly around it — bright, brief, and tightly contained to the
icon's own silhouette, closer to a camera flash than a magical glow. It
is present for a fraction of the reveal and is completely gone by the
time the icon settles; nothing about it lingers. A small, tight burst of
particles — perhaps half a dozen, no more — travels a short distance
outward from the icon at the same instant as the flash, reinforcing the
impact without adding a second event for the eye to track. The particles
are gone within the same brief window as the flash.

Everything around the icon stays completely inert. There is no
background dimming, no ambient light, no motion anywhere else on screen.
If the reward appears while the player is mid-action, nothing about their
control or view is interrupted even slightly. The reveal is small enough
in visual footprint and short enough in duration that it could happen
dozens of times a minute without ever becoming something the player has
to consciously wait through.

The accompanying sound is a single crisp, dry, percussive hit — a click
or snap, not a chime or a musical phrase — with no reverb tail, and it
sounds identical every time it plays, whether it's the first time in a
session or the thousandth.

Once settled, the icon either holds for a single brief beat and then
fades, or — where the surrounding UI supports it — travels quickly into
a currency counter or inventory slot with one small, fast "absorbed"
motion, docking into a rounded UI element that matches the rest of the
game's HUD chrome. Either ending is acceptable; neither should add
meaningfully to the total duration of the sequence. By the time a player
could form the thought "I just got something," the interaction is
already over — and that speed is the entire point, not a shortcut taken
against it.

## 7. Implementation Constraints

**Mandatory:**
- Conforms to the existing `Mount → Play → Reset → Destroy` variant
  contract validated by `Stations/StationBase.lua` — this ships as a
  variant, not a new system.
- Animation is driven by `TweenService` (or an equivalent time-based
  approach), never a fixed per-frame step — frame-rate independence is
  non-negotiable, per the precedent already set by the Window Opening
  station's Premium Simulator variant.
- The flash/accent color is built from `Theme.Colors.AccentAlt`, not a
  new arbitrary color — the existing Rewards station variants
  (`Simple`, `PopIn`, `Confetti`) already use this exact color for reward
  emphasis, and this reveal should read as visually related to them, not
  a stylistic outlier.
- UI is constructed with `UIBuilder`'s existing helpers
  (`frame`/`label`/`button`/`corner`), consistent with every other
  station in this codebase.
- The total sequence must read as a single beat with no internal pause —
  this is a hard constraint from Section 4, not a stylistic suggestion.

**Flexible:**
- The specific reward icon/content (coin, gem, or any other asset) — the
  interaction must generalize across reward types, not assume one.
- Whether a docking/collection motion plays at the end, and exactly what
  it docks into, since that depends on where this variant is actually
  used.
- The precise particle shapes and their exact travel distance, within
  "small and tight."

**Artistic freedom:**
- The exact easing curve used for the overshoot, as long as it reads as
  sharp and decisive rather than floaty (see the "no elastic bounce, one
  overshoot only" precedent already established for Premium Simulator).
- Minor variation in flash shape (radial vs. a tight burst silhouette).
- Small tuning differences in particle count and size to suit a specific
  icon's shape, provided the tight/small constraint holds.

## 8. Approval Checklist

For use during Studio review. Every item is a yes/no a reviewer can
answer by watching the interaction, not a judgment call requiring
interpretation.

- [ ] Does the reveal begin the instant the trigger fires, with no
      visible wind-up or anticipation beat?
- [ ] Is the entire sequence, start to rest, one continuous motion with
      no visible pause in the middle?
- [ ] Is the reward icon fully legible for the entire sequence, never
      obscured by the flash or particles even briefly?
- [ ] Does the light effect read as a single brief flash, rather than a
      glow that's still visible once the icon has settled?
- [ ] Is the particle count small enough to count at a glance (roughly
      half a dozen or fewer), rather than a burst or shower?
- [ ] Do all particles finish before or at the same moment the icon
      settles, rather than continuing to drift afterward?
- [ ] Does everything outside the reward icon's immediate area stay
      completely static — no background dimming, no ambient light change?
- [ ] Is there zero camera movement associated with the reveal?
- [ ] Does the accompanying sound play with no audible reverb tail?
- [ ] Is there no text or copy accompanying the reveal beyond the reward
      icon itself?
- [ ] Using the Lab's Replay control at least ten times in a row: does
      the reveal look and sound identical on the tenth play as it did on
      the first?
- [ ] Watching the full sequence once: could a viewer describe what
      happened in a single short phrase, without needing multiple
      sentences to narrate it?
- [ ] Does the animation play back identically when tested at different
      frame rates (confirming the `TweenService`/time-based requirement
      actually held)?
- [ ] Does the variant correctly implement `Mount`, `Play`, `Reset`, and
      `Destroy` per `StationBase.lua`'s contract, with no errors on
      repeated Replay/Reset from the Companion Panel?

A "no" on any item is a rejection, not a note for later — this checklist
exists so a Studio review ends in a clear pass or fail, not a discussion.
