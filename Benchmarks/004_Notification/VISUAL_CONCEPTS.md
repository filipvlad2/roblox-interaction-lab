# Notification — Visual Concepts

**Stage:** Visual Concepts. Design only — no implementation, no Luau, no
Roblox APIs, no changes to Interaction Lab itself. The five finalists
from `CONCEPT_SELECTION.md` — **Confirmation, Correction, Whisper,
Alert, Social** — are each developed here into a complete, concrete
visual concept: not a mood board, but a design brief someone could hand
to an artist or an implementer and get a consistent result from. Where
"Player perception" is discussed, it follows the first-impression /
repeated-use split from `InteractionLab/ProductDesign/TESTING.md`, the
same lens Reward Reveal's `VISUAL_CONCEPTS.md` used, since that's the
lens these will eventually be judged through in the Lab.

This document does not narrow further. All five finalists survive
intact, each given equal treatment. Narrowing already happened in
`CONCEPT_SELECTION.md`; picking one of these five to build is
`GOLD_DIRECTION.md`'s job, later. Note also, per `CREATIVE_EXPLORATION.md`'s
scope note: philosophy and mechanism are independent axes. Nothing
below is written as a Toast, a Banner, or a CornerPopup specifically —
each concept describes where on screen and how it behaves in general
terms, and remains compatible with more than one of the Notifications
station's existing mechanisms. Choosing a specific mechanism is
implementation work, not visual-concept work.

**On the image prompt:** each concept carries one AI image prompt — a
single, concrete visual target for this pass, rather than the
multi-variation treatment Reward Reveal used during its later Design
Convergence stage. It exists to make the philosophy's visual identity
checkable at a glance, not to pre-select a final render style.

---

## 1. Confirmation

### Philosophy
The reward for succeeding at something the player just did is knowing
it worked — nothing more. Confirmation exists to answer a question the
player just implicitly asked, as quietly and specifically as possible.
It is infrastructure, not a moment; the best Confirmation is one the
player never has to consciously notice was there.

### Storyboard
- **Beginning:** the triggering action itself completes — a purchase
  clears, a slot locks, a toggle flips. Confirmation isn't a separate
  event; it's the visible tail-end of the action the player already
  performed.
- **Middle:** a small, precise affirmative signal appears exactly where
  the player was already looking — at the button, the slot, the toggle
  itself — not in a general notification area elsewhere on screen. It
  rises and settles in one clean motion, no bounce, no chase across the
  screen.
- **End:** it resolves into a brief resting state or fades cleanly,
  leaving nothing behind. The same action can be confirmed again a
  second later with zero visual buildup or residue from the last one.

### Motion language
A quick, controlled rise-and-settle — a small scale-in with little or no
overshoot, closer to a checkmark locking into place than anything
bouncy or celebratory. Movement is strictly local: it never travels more
than a few pixels from the point of interaction. Timing is fast and
single-beat, with no secondary echo or repeat pulse.

### Visual language
One simple affirmative shape — a checkmark, a filled dot, a brief tint
shift on the interacted element itself — rather than an elaborate
graphic. Color is a calm, settled positive hue (a cool green or blue),
never gold or festive; this is not a celebration. No particles, no
sustained glow — at most a soft, momentary highlight. Hierarchy is
strictly subordinate: Confirmation is never bigger, brighter, or louder
than the action it's confirming.

### Audio direction
A soft, short, affirmative tick or a single clean low chime — closer to
a good keyboard's click than a bell or jingle. Dry, no reverb tail,
identical on the first press and the thousandth.

### Player perception
**First time:** barely registers as a discrete event — more felt than
seen, a quiet "yep, that worked." **After a hundred times:** this
philosophy is staked entirely on remaining invisible. Success looks like
a player who couldn't describe what the confirmation animation looks
like even though they've seen it hundreds of times, because it never
asked to be looked at.

### Strengths
Unobtrusive, universally legible, scales to very high frequency without
fatigue when tuned correctly. Directly serves usability rather than
competing with it.

### Weaknesses
The tuning window is narrow — too subtle and players start
double-checking whether the action registered at all; too prominent and
it stops being infrastructure and starts being a distraction. There's
no dramatic flourish to fall back on if the timing is slightly wrong.

### Best use cases
Saves, purchases, crafting completions, settings toggles, inventory
moves — any deliberate action with a binary "did that work" answer.

### Never use for
Anything the player needs to actively read, weigh, or decide something
about. Confirmation is a period at the end of a sentence, not the start
of a new one.

### AI image prompt
A single UI toggle switch and a small icon slot sit side by side on a
clean, softly lit neutral panel; the toggle has just clicked into its
"on" position and a small circular checkmark badge is caught mid
scale-in directly beside it, cool settled green, no glow beyond a
faint, contained highlight ring exactly at the badge's edge; flat,
straight-on orthographic UI framing, no perspective depth; muted
neutral panel background so the small green accent is the only
saturated color in frame; no particles, no motion trails, no text; the
overall impression is quiet precision — a system responding, not
announcing — captured at the exact instant of settling rather than
mid-motion; clean flat-shaded UI illustration style, sharp focus
throughout, nothing else competing for attention in the frame.

---

## 2. Correction

### Philosophy
Correction is Confirmation's necessary counterpart — the honest "no" to
match the other's "yes." Its job is to explain, at the exact moment of
failure, why something the player tried to do didn't happen, so
confusion doesn't get a chance to linger. The job is to defuse the
negative feeling, not amplify it.

### Storyboard
- **Beginning:** fires at the instant of failure, with no delay — the
  same immediacy Confirmation has, for the same reason.
- **Middle:** appears at or immediately beside the point of the failed
  action, with a slightly firmer visual presence than Confirmation — a
  small, contained shake or a brief color flush communicates "no"
  clearly, without escalating into alarm. It never blocks the screen or
  demands a dismissal click.
- **End:** resolves quickly and doesn't linger — the player is free to
  read it, understand it, and immediately retry, with nothing left
  hanging over the interaction.

### Motion language
A small, contained horizontal shake, or a brief firm pulse of color on
the affected element — motion that reads as negation directly, the
visual equivalent of shaking your head, rather than a shape growing or
shrinking. Timing is brief with no lingering hold; dwelling on the
failure compounds the very feeling this philosophy exists to resolve.

### Visual language
A warm red or amber rather than an alarming saturated red — firm, not
punitive. A simple glyph (a small X, a brief dash) paired with room for
a short, specific explanation, rather than a generic error icon that
tells the player nothing about what actually went wrong. No harsh
flashing, no full-screen tint — like Confirmation, it stays anchored
precisely to where the failed action happened.

### Audio direction
A short, low, slightly dampened tone — a clear "no," not a klaxon.
Distinct in timbre from Confirmation's tick specifically so the two are
never confusable by ear alone, even with eyes elsewhere.

### Player perception
**First time:** immediate, unambiguous understanding of "that didn't
work" — ideally with enough specificity to know why. **After a hundred
times:** repeated instances of the *same* Correction shouldn't just
fatigue the player — they should read as a signal that something
upstream (an unclear interface, a resource the player doesn't
understand they're short on) needs fixing. A Correction that fires
often has usually already failed at its actual job.

### Strengths
Prevents confusion from compounding into frustration; low emotional
cost when the tone is tuned correctly; directly diagnostic of interface
problems when it repeats.

### Weaknesses
Easy to overtune toward feeling punishing — a color, sound, or motion
choice that's a shade too harsh reads as the game scolding the player
for a minor, understandable mistake.

### Best use cases
Invalid actions, insufficient resources, failed crafting attempts,
blocked movement, rejected inputs.

### Never use for
Catastrophic or genuinely dangerous failures that need real urgency —
that is Alert's job. Correction explains a mistake; it does not warn
of a threat.

### AI image prompt
The same clean neutral UI panel as a locked inventory slot, cursor
frozen mid-attempt at dragging an item into it; the slot's border is
caught mid firm color-pulse in a warm dampened amber-red, a small
rounded X glyph sitting just outside the slot's edge rather than
inside it, a short empty text strip beneath left open for an
explanation; flat, straight-on orthographic UI framing matching
Confirmation's for direct visual comparison; muted neutral background,
the amber-red the only saturated color in frame; a very faint
horizontal motion-blur ghost on the slot's left and right edges
implying a brief contained shake just completed, nothing else moving;
no harsh flashing, no full-screen red wash, no dramatic shadow; clean
flat-shaded UI illustration style, calm and legible rather than
alarming, sharp focus throughout.

---

## 3. Whisper

### Philosophy
Whisper keeps the player passively aware that something in the
background changed, without ever asking them to do anything about it.
It's ambient presence, not information delivery — the feeling of a game
that's quietly alive and tracking things on the player's behalf. It
should be possible to never consciously register one and lose nothing.

### Storyboard
- **Beginning:** appears at the true edge of vision, without any
  announcing motion or sound calling attention to its arrival.
- **Middle:** a faint shift at the periphery — a soft glow, a tiny icon,
  a subtle brightness change — the kind of thing a focused player could
  miss entirely at zero cost.
- **End:** resolves on its own, unacknowledged, and fades before it
  could accumulate into visual clutter if several occur close together.

### Motion language
Slow, soft fades in and out — no snap, no bounce, nothing that moves
fast enough to pull the eye by speed alone. If it moves at all, it
drifts rather than pops into place.

### Visual language
Low contrast against the surrounding background; small in scale;
desaturated or close to the game's ambient palette rather than standing
out from it. No hard edges, no particles, at most the faintest glow —
never a flash. Lives at a screen edge or corner, spatially separate
from wherever the player's actual focus and gameplay are happening.

### Audio direction
Near-silent, or absent entirely. If present at all: a very soft,
low-volume texture easily masked by ordinary game ambience — never a
discrete, attention-grabbing sting the way every other philosophy here
uses sound.

### Player perception
**First time:** most likely doesn't consciously register at all — that
absence of registration is success, not failure. **After a hundred
times:** the entire point. A player should be able to have dozens occur
in a single session and feel nothing but, occasionally, a retroactive
sense that something has been quietly accumulating in the background —
noticed only when they choose to look.

### Strengths
Effectively unlimited repetition tolerance; mentally free; reinforces
the feeling of a living, responsive game world without ever interrupting
it.

### Weaknesses
Can become genuinely invisible and communicate nothing if undertuned —
there is a real failure mode where a Whisper is simply never seen by
anyone, ever. Cannot serve as the sole channel for anything the player
actually needs to know.

### Best use cases
Background resource ticks, ambient friend-presence indicators, minor
passive system updates the player can check on their own schedule.

### Never use for
Anything the player must act on or is expected to definitely see —
Whisper's entire design goal is that missing it costs nothing, which
makes it structurally wrong for anything that isn't true.

### AI image prompt
The extreme corner of a mostly dark, softly lit game screen, empty
gameplay space filling almost the entire frame; in the very corner, a
tiny, barely-perceptible soft circular glow, low-contrast and
desaturated, blending closely into the ambient background tone rather
than standing apart from it; no icon detail resolved, no particles, no
hard edge anywhere on the glow; the vast majority of the frame is
calm, uneventful, and empty, deliberately underscoring how small and
peripheral the one detail is; muted, cool ambient color palette
throughout, nothing bright or saturated anywhere in frame; soft,
even, low-key lighting with no directional drama; the emotional
impression is stillness and quiet background presence, something felt
rather than seen; clean, softly rendered illustration style, nothing
in the frame competing for attention.

---

## 4. Alert

### Philosophy
Alert exists to guarantee the player becomes aware of something
dangerous or time-critical, right now, regardless of what else they're
focused on. It's the opposite pole from Whisper on every axis at once —
not meant to feel pleasant, meant to feel impossible to miss.

### Storyboard
- **Beginning:** fires immediately and without warning, deliberately
  breaking whatever the player was focused on the instant before.
- **Middle:** dominates a large portion of the screen — bold scale, high
  contrast, potentially a full-frame edge treatment — built to be seen
  even in someone's peripheral vision during fast-moving gameplay.
- **End:** holds until the urgency has genuinely passed or the player
  has clearly acknowledged it. Alert is the one philosophy here allowed
  to persist rather than resolve quickly.

### Motion language
Fast, hard-edged motion — a sharp scale-pop, a rapid pulse, a hard
screen-edge flash — with none of the softened easing every other
concept in this set uses. Repeated pulsing is acceptable and often
correct here specifically because the moment calls for it; nowhere else
in this toolkit is that true.

### Visual language
High-contrast, saturated warning colors — red, amber — in bold,
unambiguous shapes, often spanning a large portion or the full width of
the screen rather than staying contained to a small element. Nothing
about it should be visually confusable with anything else that might be
on screen at the same time.

### Audio direction
Sharp, loud, genuinely unmissable — a siren, klaxon, or hard percussive
stinger with real presence, built to cut through busy ambient game
audio rather than blend into it.

### Player perception
**First time:** a real spike of alarm — exactly the intended reaction.
**After a hundred times:** this philosophy has essentially zero room for
repetition. Firing often either trains players to tune it out entirely
(the alarm stops working) or keeps working and becomes genuinely
exhausting — both outcomes destroy the thing that makes Alert useful in
the first place.

### Strengths
Unmatched at guaranteeing awareness in the single moment it actually
matters most; nothing else in the toolkit can substitute for genuine
urgency.

### Weaknesses
The highest-risk philosophy in the set — miscalibration doesn't just
waste attention, it actively erodes trust or causes real stress.
Overuse has a lasting cost the other four don't carry in the same way.

### Best use cases
Imminent danger, critical time-limited failure states, server- or
match-ending events.

### Never use for
Anything routine, frequent, or non-critical. An Alert spent carelessly
trains players to ignore the real ones when they matter.

### AI image prompt
A first-person gameplay view mid-action, screen edges gripped by a
hard, saturated red vignette flash at full intensity, a bold graphic
warning glyph pulsing large and centered near the top of frame; sharp,
high-contrast lighting with no soft falloff anywhere; the warning
element is rendered with hard, clean edges and zero blur, unmistakably
foregrounded against the blurred, secondary gameplay behind it; strong
color contrast between the saturated red/amber warning and a
desaturated, darker gameplay backdrop; a faint radiating pulse ring
implying the flash is actively repeating rather than a single static
event; no soft glow, no gentle gradient, no decorative particles — the
warning reads as mechanical and urgent rather than pretty; the overall
impression is a deliberate, honest spike of alarm, impossible to miss
even at a glance; clean, high-contrast graphic illustration style, bold
and legible at a glance.

---

## 5. Social

### Philosophy
Social signals something involving another person — a message, a
reaction, a friend's presence — rather than a system event. Its
emotional charge comes from *who* it's from more than *what* it says,
making it the only finalist that foregrounds identity over content.

### Storyboard
- **Beginning:** triggered by another player's action, not the viewing
  player's own — the notification originates from someone, not from the
  system.
- **Middle:** the other person's identity — name, avatar, a personal
  color — is as visually prominent as the content itself, sometimes more
  so. It may surface in a more shared or semi-public space than a purely
  private notification would.
- **End:** holds slightly longer than a private, system-driven
  notification would, since the intended audience may not all be
  looking at the same instant, then resolves.

### Motion language
A confident, quick entrance, identity-forward in sequencing — the
name or avatar leads, with the content following a half-beat later
rather than arriving simultaneously. Movement should feel like it came
from a person, not a system: warmer and less mechanically precise than
Alert's hardness, with none of Confirmation's clinical restraint either.

### Visual language
Warm, high-legibility color; a prominent avatar or name treatment paired
with a smaller secondary content element. Rounded, friendly shapes
rather than the clinical calm of Confirmation or the hard edges of
Alert — this should read as personal even when the actual content is
mundane, because the identity carrying it is doing most of the
emotional work.

### Audio direction
A warm, distinct sting specifically tied to "a person did something" —
different in character from every system tone in this set, closer to a
friendly notification chime than a mechanical tick, a diagnostic tone,
or a klaxon.

### Player perception
**First time:** genuine warmth or curiosity — "who, and what did they
say?" **After a hundred times:** entirely dependent on who it's from and
how often. From someone the player genuinely cares about, tolerance is
close to unlimited; from an impersonal or large group, fatigue sets in
fast. The visual design's real job is making the source legible enough,
at a glance, that a player could reasonably self-manage how much of this
they want.

### Strengths
Unmatched for reinforcing connection and community; the only philosophy
here that can make a notification feel like it came from a person
rather than a system.

### Weaknesses
Correct tuning is relationship-dependent rather than fixed, which makes
this the hardest of the five to get universally right — the same visual
treatment can feel warm from a friend and intrusive from a stranger.

### Best use cases
Friend activity, party or guild events, direct messages, co-op moments.

### Never use for
Solo or purely systemic information with no actual person behind it —
forcing an identity-forward, personal treatment onto a system event
reads as manipulative or simply confusing.

### AI image prompt
A rounded notification card entering from a screen edge, a circular
player avatar thumbnail and bold friendly-colored name leading on the
left, a smaller secondary line of content trailing just behind it to
the right, still slightly less resolved than the name; warm, soft,
even lighting with no hard directional shadow, friendly rounded card
geometry with generous corner radius; a gentle, warm accent color
(coral or warm gold) distinct from Confirmation's cool green,
Correction's amber-red, and Alert's saturated hard red; a soft,
contained glow around the avatar only, not the whole card; a subtle
motion-blur trail on the card's leading edge implying a quick, confident
slide-in just completed; clean, approachable flat-shaded illustration
style, more rounded and human than any of the other four concepts in
this set; the overall impression is warmth and personal connection, an
arrival from someone rather than something.

---

## Where these five sit against each other

Not a ranking — that already happened in `CONCEPT_SELECTION.md`, and
this document deliberately narrows nothing further. Worth stating
plainly anyway, now that each has a visual identity: the five read as
visually distinct from one another by design, not by accident.
Confirmation and Correction share the same anchored, small-scale,
system-toned visual grammar precisely because they're a matched
yes/no pair — the differentiator is entirely in color and motion
firmness, not composition. Whisper and Alert sit at opposite visual
extremes on every dimension — scale, contrast, motion speed, audio
presence — because they anchor opposite ends of the interruption
spectrum. Social is the visual outlier of the set: the only one built
around a person's identity rather than a system state, and the only one
that borrows warmth and roundness rather than either Confirmation's
clinical calm or Alert's mechanical hardness. A single player should be
able to tell which of the five just fired without reading a word of
text, purely from color, shape, and motion — that's the practical test
this stage is setting up for whichever concept(s) `GOLD_DIRECTION.md`
ultimately commits to.
