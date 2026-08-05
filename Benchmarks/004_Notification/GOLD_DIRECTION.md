# Notification — Gold Direction

**Stage:** Design Convergence. This is the final design document before
implementation starts. It defines one production target, not a menu of
options. After this document, the next artifact for this benchmark
should be code — `NTF-001_GOLD`.

## What was reviewed

This document was written after reviewing, in full, `CREATIVE_EXPLORATION.md`
(eight notification philosophies), `CONCEPT_SELECTION.md` (the narrowing
to five finalists — Whisper, Alert, Confirmation, Correction, Social),
`VISUAL_CONCEPTS.md` (a complete visual concept for each of those five),
and `VISUAL_CONCEPT_REVIEW.md` (three expanded variation sets for the
three core candidates — Confirmation, Whisper, Correction). Per
instruction, where anything might read as in tension between documents,
`VISUAL_CONCEPT_REVIEW.md` is treated as the latest and binding visual
decision. As with `RWD-001_GOLD_SELF_REVIEW.md`'s prior finding, there is
still no `DesignSystem/` or `DesignBible/` anywhere in this repository —
`src/Shared/Theme.lua` and `src/Shared/UIBuilder.lua` remain the actual,
binding design system, and this document's Implementation Constraints
answer to them directly, the same way `RWD-001_GOLD`'s did.

## The convergence decision

**The gold direction is Confirmation.** This was stated directly, not
re-derived: Confirmation is where you said the first visual review has
landed, and `CONCEPT_SELECTION.md`'s own ranking already argued the same
thing independently — the most universal, lowest-risk philosophy of the
eight, the one almost no interactive system exists without. That
argument isn't being re-litigated here; it's the reason this document
exists instead of a fourth exploration. Whisper and Correction remain
exactly what `VISUAL_CONCEPT_REVIEW.md` said they are: real, load-bearing
parts of the eventual notification toolkit, each deserving their own
Gold Direction on a different day. Alert and Social remain further out
still, at a single visual concept each, untouched since
`VISUAL_CONCEPTS.md`. This document picks one and finishes it.

Within Confirmation's three variations, the gold direction is closest to
**Variation A (Faithful)** — a plain, minimal, orthographic UI treatment
with no card chrome, no label text, no bounce beyond a controlled settle.
This is the correct base for two independent reasons, not one:
restraint is Confirmation's entire design goal, and Variation A is also
the only one of the three that's actually achievable end to end in
Roblox's flat UI rendering without compromise — Variation B's real PBR
specular materials are as impossible here as they were for
`RWD-001_GOLD`, and Variation C's bolder Builder-Sans "Saved" label and
exaggerated squash-and-stretch bounce, while genuinely more
Roblox-flavored, actively work against the restraint this specific
philosophy is staked on. Nothing is borrowed from Variation C here —
unlike `RWD-001_GOLD`, which pulled one integration idea from its own
Variation C, Confirmation's Variation A is already fully compatible with
this codebase's real conventions once one detail is added back in:
rounded corners via the existing `UIBuilder.corner()` helper, because
every other UI element in this Lab already uses that convention and
there's no reason for this one variant to be the exception.

---

## 1. Core Emotion

The quiet certainty that what I just did worked — confidence, not
celebration.

## 2. Primary Design Goal

**If only one thing succeeds, it's this: a player who glances away the
instant after acting must still come away certain the action registered,
without needing to look twice.** Every other property in this document —
placement, color, motion, sound — exists in service of that one
requirement. A confirmation that's beautiful but arrives in the wrong
place, or a beat too late, or a beat too showy, has failed at the one
job this philosophy exists to do. This is the property that overrides
every other preference below if they ever conflict, and it is the direct
expression of this benchmark's North Star: confidence, not excitement,
not spectacle.

## 3. Visual Priorities

In order:

1. **Anchor position** — the confirmation must appear exactly at or
   immediately beside the element the player just interacted with, never
   in a generic, disconnected notification area elsewhere on screen. Get
   this wrong and nothing else on this list can compensate — the player
   has to look at the right place before anything else about the design
   can register at all.
2. **Color / tint response** — the single calm, settled hue that carries
   most of the "yes, this worked" meaning. This is the primary signal,
   not decoration.
3. **Icon / checkmark shape** — a secondary confirmation of the color
   read, for anyone who processes shape before color or glances a half
   second late. Small, simple, and never the first thing that has to be
   noticed for the interaction to succeed.
4. **Motion** — the rise-and-settle that sells immediacy. It reinforces
   timing; it is not the headline.
5. **Text** — deliberately near the bottom. Confirmation must work with
   zero text at all. If a label is present, it is quiet infrastructure,
   never a celebratory phrase.
6. **Card / background chrome** — minimal to none. Confirmation doesn't
   need its own dedicated panel, because it's anchored to an element that
   already has one.
7. **Shadow / glow** — lowest priority, and nearly forbidden as
   decoration. At most a faint, contained highlight; never a light
   source of its own.

## 4. Motion Priorities

**How it should appear:** instantly, and exactly where the player was
already looking. No travel across the screen, no entrance from an edge —
it doesn't arrive from somewhere else, it simply becomes present at the
point of interaction. The rise into view is quick and controlled, with
at most the faintest settle past its resting state — never a real
bounce.

**How it should leave:** cleanly and completely, with no residue. It
either holds for the briefest possible instant and fades, or resolves
directly back into the interacted element's normal state. Nothing about
its exit should be noticeable enough to become its own event.

**Where attention should concentrate:** entirely at the single point of
interaction, for the entire sequence. Nothing about this motion is
allowed to pull the eye somewhere else on screen, even briefly — that
would work directly against the anchor-position priority above.

**Rhythm, in one line:** there, confirmed, gone — one quiet beat, never
three.

## 5. Forbidden Mistakes

- Appearing anywhere other than exactly at or beside the triggering
  element — a fixed, disconnected notification area breaks the "what is
  this about" clarity this philosophy depends on entirely.
- Any overshoot or bounce beyond a single subtle settle — genuine
  celebratory motion belongs to Reward Reveal, not here.
- Gold, festive, or otherwise celebratory coloring — that reads as a
  reward being given, not an action being acknowledged.
- Any celebratory text or copy ("Nice!", "Success!", exclamation points)
  — if text is present at all, it is a quiet, factual label.
- A sustained glow, bloom, or light source of its own — a highlight, not
  a lamp.
- Particle effects of any kind, at any intensity.
- A sound with a reverb tail, a musical phrase, or anything that reads
  as a jingle rather than a tick.
- A total duration long enough to require a second, deliberate glance to
  fully register — it should already be legible in the same instant the
  player's eye would naturally land there.
- Any inconsistency in placement or timing across repeated uses of the
  same control — undermines the trust this philosophy exists to build
  more directly than any single weak instance would.
- Requiring the player to manually dismiss it — Confirmation never
  demands an action of its own; asking for one would contradict the
  entire premise of quiet, low-cost acknowledgment.

## 6. Gold Reference

The player performs a small, deliberate, discrete action — flips a
setting, presses a save control, locks an item into a slot. The instant
that action completes, without any delay the player could perceive as a
separate step, a small affirmative signal becomes present exactly at
that element's own location. It doesn't travel there from anywhere else
on screen; it simply appears where the player's attention already is,
because that's where the action just happened.

The signal itself is small and simple — a compact checkmark shape, or a
brief, controlled shift in the interacted element's own color toward a
calm, settled hue already established elsewhere in this Lab as the color
of a successful outcome. It rises into place with a quick, controlled
motion — the faintest hint of settling past its final size, nothing that
could be described as a bounce. The whole rise takes a fraction of a
second and reads as one clean gesture, not a sequence of visible steps.

Nothing else on screen moves, dims, or reacts. There is no accompanying
text unless the underlying element already needed one — Confirmation
adds no language of its own. A single soft, contained highlight may
outline the signal at its edge, but nothing about it glows outward or
lingers past the moment the signal has settled.

The accompanying sound, if the moment calls for one, is a single short,
dry, low-key tick — closer to a keyboard's click than any kind of chime
or melodic phrase. It has no tail and sounds exactly the same on the
first press of a session and the thousandth.

Once settled, the signal holds for the briefest recognizable instant and
then either fades cleanly or resolves directly back into the interacted
element's ordinary resting state, whichever reads as less like an
additional event. By the time a player could form the thought "did that
work?", the answer is already sitting there, quietly, right where they
were already looking — and it required nothing further from them to get
it.

## 7. Implementation Constraints

**Mandatory:**
- Ships as a new variant within the existing `Notifications` station,
  alongside `Toast`, `Banner`, and `CornerPopup` — not a replacement for
  any of them, the same posture `RWD-001_GOLD` took toward the existing
  Rewards variants.
- Conforms to the existing `Mount → Play → Reset → Destroy` variant
  contract validated by `Stations/StationBase.lua`.
- Animation is driven by `TweenService` (or an equivalent time-based
  approach), never a fixed per-frame step — frame-rate independence is
  non-negotiable, per the precedent already set by Premium Simulator and
  `RWD-001_GOLD`.
- The affirmative color signal is built from `Theme.Colors.Success` —
  the one color this codebase already reserves for exactly this meaning
  — not a new arbitrary green.
- UI is constructed with `UIBuilder`'s existing helpers
  (`frame`/`label`/`button`/`corner`), consistent with every other
  station in this codebase, including the rounded-corner convention.
- The signal is positioned at or directly adjacent to the triggering
  element's own location — never in a fixed, disconnected screen
  position independent of what triggered it.
- No text is required for the interaction to succeed; if a label is
  used, the interaction must remain fully legible with it removed.

**Flexible:**
- The exact form of the affirmative signal — a small checkmark glyph, a
  filled dot, or a direct tint-shift on the interacted element itself —
  provided it stays a single, simple shape or color response, not a
  combination that competes with itself.
- Whether the signal lives directly on the interacted element or as a
  small adjacent badge beside it — both satisfy the anchor-position
  requirement.
- The exact hold duration before it resolves, within "legible at a
  glance, fully resolved before a second glance would be needed."

**Artistic freedom:**
- The specific easing curve for the rise-and-settle, as long as it reads
  as controlled rather than bouncy — no elastic or back-style overshoot
  beyond a single subtle settle, consistent with the "no uncontrolled
  overshoot" precedent already established for Premium Simulator and
  `RWD-001_GOLD`.
- Minor variation in the contained highlight's thickness or softness.
- The exact pitch and timbre of the tick sound, within "dry, short,
  percussive, no reverb tail."

## 8. Approval Checklist

For use during Studio review. Every item is a yes/no a reviewer can
answer by watching the interaction, not a judgment call requiring
interpretation.

- [ ] Does the confirmation signal appear exactly at or immediately
      beside the point of interaction, never in a disconnected, fixed
      screen location?
- [ ] Is the established Success color (or a clearly equivalent calm,
      settled hue) the only saturated color present in the signal?
- [ ] Does the interaction remain fully understandable with all text
      removed?
- [ ] Does the motion settle with no bounce or overshoot beyond a single
      subtle ease?
- [ ] Is there zero glow, bloom, or light source beyond a faint,
      contained highlight at the signal's own edge?
- [ ] Is there zero particle effect anywhere in the sequence?
- [ ] Does the signal fully resolve — fade or return to rest — within a
      glance, with nothing left lingering afterward?
- [ ] Does the accompanying sound (if used) play dry, with no audible
      reverb tail, and sound identical every time it plays?
- [ ] Does nothing else on screen move, dim, or react while the
      confirmation plays?
- [ ] Using the Lab's Replay control at least ten times in a row: does
      the confirmation look and sound identical on the tenth play as it
      did on the first?
- [ ] Does the animation play back identically when tested at different
      frame rates, confirming the time-based tweening requirement
      actually held?
- [ ] Does the variant correctly implement `Mount`, `Play`, `Reset`, and
      `Destroy` per `StationBase.lua`'s contract, with no errors on
      repeated Replay/Reset from the Companion Panel?
- [ ] Watching the sequence once, without prior explanation: would a
      viewer describe the result as "I can tell that worked," rather
      than "something happened, but I'm not sure what"?

A "no" on any item is a rejection, not a note for later — this checklist
exists so a Studio review ends in a clear pass or fail, not a
discussion.
