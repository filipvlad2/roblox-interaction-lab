# Progress Bar — Visual Concepts

**Stage:** Visual Concepts. Design only — no implementation, no Luau, no
Roblox APIs, no changes to Interaction Lab itself. The five finalists
from `CONCEPT_SELECTION.md` — **Momentum, Reassurance, Milestone,
Grind, Threshold** — are each developed here into a complete, concrete
visual concept: not a mood board, but a design brief someone could hand
to an artist or an implementer and get a consistent result from. Where
"Player perception" is discussed, it follows the first-impression /
repeated-use split from `InteractionLab/ProductDesign/TESTING.md`, the
same lens Reward Reveal's and Notification's `VISUAL_CONCEPTS.md` used.

This document does not narrow further. All five finalists survive
intact. Per `CREATIVE_EXPLORATION.md`'s scope note, philosophy and
mechanism stay independent axes — nothing below is written as a
LinearFill, a Segmented, or a Circular bar specifically, and each
concept remains compatible with more than one of the Progress Bars
station's existing mechanisms. Choosing a mechanism is implementation
work, not visual-concept work.

**The one rule every concept below is held to before anything else:**
`PROGRESS_MODEL.md` isn't background reading here — it's a constraint
every visual and motion choice has to survive. A shape, a color ramp, or
a pacing choice that would make an interaction claim something untrue
about the progress it represents is disqualified regardless of how good
it looks, per the model's own honesty and incompatibility rules. Several
of the choices below exist specifically *because* of that constraint,
not despite it — most visibly, Momentum's visual language deliberately
avoids the classic 0%–100% bar shape, because that shape itself implies
a ceiling this philosophy structurally doesn't have.

**On the image prompt:** each concept carries one AI image prompt, the
same single-prompt-per-concept approach Notification's `VISUAL_CONCEPTS.md`
used for its own first pass, rather than the later three-variation
expansion Reward Reveal's Design Convergence review introduced.

---

## 1. Momentum

### Philosophy
The point is that something is always moving, not that it's moving
toward anything in particular. Momentum has no meaningful endpoint —
per `PROGRESS_MODEL.md`, it's Unbounded by nature — so its entire job is
to make ongoing, repeated action feel like it's accumulating, without
ever implying a finish line that isn't real.

### Storyboard
- **Beginning:** responds the instant a qualifying action occurs — no
  wind-up, no delay between cause and visible effect.
- **Middle:** advances in small, frequent increments, each one tied
  directly to something real actually happening. It never idles when
  action is occurring and, just as importantly, never appears to move
  when nothing is — a stalled Momentum display has to visibly stall, not
  fake continued motion to stay reassuring.
- **End:** there isn't one, by design. When a container's current view
  fills, it cycles, wraps, or resets to keep receiving new motion, rather
  than presenting a full container as "done" — because Momentum has
  nothing that a full container could honestly be done with.

### Motion language
Continuous and incremental — many small, steady ticks rather than
occasional large jumps, since large infrequent jumps would misrepresent
a genuinely continuous process as a segmented one. No overshoot, no
bounce, no impact — this is steady motion, not a hit. The moment the
underlying activity actually stops, the motion has to stop too, visibly
and immediately.

### Visual language
Deliberately avoids the closed 0%–100% bar shape a bounded philosophy
would use, because that shape itself asserts a ceiling. Favors a form
with no implied edge — a continuously cycling strip, a wrapping ring, or
an odometer-style scroll that visibly continues past both sides of its
own frame. Muted, unremarkable color; nothing that spikes or shifts as
if approaching something significant, because nothing is being
approached.

### Audio direction
Minimal or absent. If present at all, a soft, even tick mapped one-to-one
to real increments — like a real odometer, never a musical swell, since
a swell would imply a build toward a moment that doesn't exist here.

### Player perception
**First time:** barely registers as a discrete thing — reads simply as
"this is moving because I'm doing something." **After a hundred times:**
becomes ambient, trusted background information; the only way it fails
is by going silent or static while the player is still acting, which
reads immediately as broken rather than as merely quiet.

### Strengths
Extremely versatile, honest by construction (nothing to promise falsely
with no disclosed endpoint), and the safest philosophy in the set to
apply broadly.

### Weaknesses
Structurally incapable of a memorable completion moment, since
completion was never the point.

### Best use cases
Ongoing resource accumulation, passive experience gain, anything meant
to make continuous play feel productive without a specific target.

### Never use for
Anything meant to build toward a specific, anticipated, high-stakes
moment — Momentum actively undersells an ending it was never built to
deliver.

### AI image prompt
A horizontal strip of small evenly spaced tick marks scrolling steadily
past a fixed reference point, styled like an odometer belt or a
treadmill readout rather than a bar with a start and end; the strip
visibly continues past both left and right edges of the frame, implying
motion before and after what's shown, with no beginning or ending edge
anywhere in view; muted neutral grey-blue tones, no bright accent color,
no gradient implying approach to anything; flat, even, shadowless
lighting; no glow, no particles, no dramatic highlight; a faint motion
blur on the tick marks nearest the reference point selling continuous
travel rather than a static snapshot; clean, plain flat-shaded UI
illustration style; orthographic, straight-on framing; the focal point
is the blurred sense of ongoing motion itself, not any single tick mark
or position on the strip.

---

## 2. Reassurance

### Philosophy
This exists to prove a real background process hasn't stalled — nothing
more. Its entire value is visibility of "still happening," not
information about how much. Per `PROGRESS_MODEL.md`, Reassurance is
Process-backed in its purest form, which means its honesty obligation is
the strictest and simplest in the set: it may only ever represent a
real rate, never a comfortable one.

### Storyboard
- **Beginning:** appears at the exact instant a real background
  operation starts — never earlier, and never lingering once the real
  operation has actually finished.
- **Middle:** if the underlying process can report real completion
  percentage, the fill tracks that percentage honestly. If it can't —
  if no real percentage is knowable — the display uses a visibly
  indeterminate pattern instead of faking a smooth fill toward 100%.
  Pretending precision that doesn't exist is exactly the false-precision
  failure `PROGRESS_MODEL.md` warns about, and Reassurance is the
  philosophy with the least excuse to commit it.
- **End:** resolves the instant the real operation completes and
  disappears without ceremony. No artificial hold for effect — holding
  it a beat longer than the operation actually took would misrepresent
  its duration, however minor that seems.

### Motion language
Even, low-amplitude, unhurried. When genuinely indeterminate, motion is
non-directional — a soft pulse or breathing pattern, not a fake sweep
toward a completion it can't actually measure.

### Visual language
Small, low-contrast, deliberately modest. Must never visually compete
with or overstate the significance of whatever it's representing — a
loading indicator rendered with drama is a category error, not a design
choice.

### Audio direction
Essentially none. Silence is the correct, honest choice for something
whose entire job is not asking to be noticed.

### Player perception
**First time:** barely registers — which is success, not failure.
**After a hundred times:** builds calm, durable trust specifically
because it's never once been wrong or dramatic about something that
didn't deserve either.

### Strengths
Cheap, universally applicable, and the strictest honesty case in the
set to get right precisely because it's the simplest.

### Weaknesses
Carries essentially no emotional payload — any attempt to make it
exciting is a misreading of what it's for.

### Best use cases
Loading screens, background saves, any process whose content the player
has no reason to care about, only its status.

### Never use for
Anything the player is emotionally invested in the outcome of —
Reassurance's flatness, correct here, reads as indifferent applied to
something the player actually cares about finishing.

### AI image prompt
A small, low-contrast horizontal band sitting quietly in an otherwise
plain neutral interface, using a soft, slow pulsing or breathing pattern
rather than a bar sweeping toward a filled state, deliberately signaling
"ongoing, duration unknown" instead of a false percentage; muted
grey-blue tones with no bright accent color anywhere in frame; the band
occupies a small fraction of the overall composition, surrounded by
generous plain empty space that underscores how little visual weight it
claims; flat, even, shadowless lighting with no directional drama; no
glow, no particles, no highlight; a small empty label space left beside
it, unfilled; the overall impression is calm and almost forgettable, on
purpose; clean, plain flat-shaded UI illustration style; orthographic
framing; the focal point is deliberately weak, the same way it would be
in a good loading indicator nobody consciously remembers watching.

---

## 3. Milestone

### Philosophy
A long process becomes a sequence of individually real, individually
meaningful steps rather than one continuum. Per `PROGRESS_MODEL.md`, its
honesty depends entirely on those steps genuinely being what they claim
to be — comparable actions producing comparable visible segments, with
no arbitrary or decorative divisions.

### Storyboard
- **Beginning:** the overall structure — how many steps exist — is
  disclosed upfront wherever the underlying task actually has a fixed
  number of stages, so the container's own shape honestly previews what
  it represents before any fill happens at all.
- **Middle:** each checkpoint's completion is a distinct, separately
  legible event — sized and spaced to reflect the real relative effort
  of that step, never forced into uniform spacing when the underlying
  steps aren't actually uniform.
- **End:** the final checkpoint reads as more significant only if it
  actually is — its visual weight is never artificially inflated beyond
  what that specific step's real significance justifies, which is also
  what keeps this philosophy from drifting into Reward Reveal's
  territory.

### Motion language
Discrete, segment by segment. A completed segment locks into place with
a clear but restrained settle — no bounce, no overshoot, closer to
Notification's Confirmation in temperament than to anything celebratory
— and is visually distinct from Momentum's continuous, un-punctuated
motion, so the two are never confusable at a glance.

### Visual language
A track whose segmentation is visible even before any fill happens, so
the shape itself honestly telegraphs "this is made of real discrete
parts." Segment sizes are allowed — expected — to vary when the
underlying steps genuinely differ in scale; forcing visual uniformity
onto unequal steps would itself be the dishonesty this philosophy exists
to avoid.

### Audio direction
A light, distinct tick per completed checkpoint — different in
character from Reassurance's near-silence and from Momentum's continuous
ticking, since each Milestone checkpoint is specifically meant to be
individually noticed.

### Player perception
**First time:** the segmented shape immediately communicates how many
steps remain, before any fill happens at all. **After a hundred times:**
trust increasingly rests on whether the segment sizes have stayed
honest — an uneven task rendered as evenly-spaced segments is the
failure mode that erodes this fastest.

### Strengths
Turns a long task into several approachable ones and gives honest,
natural points to stop and resume.

### Weaknesses
Unevenly spaced or arbitrarily placed checkpoints hurt more than a
smooth continuum would have.

### Best use cases
Crafting recipes with real sub-steps, quest chains, skill trees with
genuinely distinct tiers.

### Never use for
Genuinely continuous, undifferentiated processes — imposing artificial
checkpoints on something like a simple wait invents structure that
isn't really there.

### AI image prompt
A horizontal track visibly divided into several distinct, unequal
segments — some noticeably longer, some shorter, reflecting genuinely
different real sizes rather than uniform divisions; the first two
segments solidly filled and each locked with a small, restrained tick
mark, a third segment partially filled mid-transition, the remaining
segments outlined but empty; clean neutral panel background; calm, even
lighting with no dramatic highlight; one modest, non-celebratory fill
color, distinctly calmer than a reward-style gold; no particles, no
glow, no bounce implied anywhere in the frame; the segment boundaries
themselves are the dominant visual feature, clearly legible even where
no fill exists yet; flat-shaded UI illustration style; orthographic,
straight-on framing; the focal point is the boundary between the most
recently completed segment and the one now filling.

---

## 4. Grind

### Philosophy
A very long process should feel appropriately large because of how much
it actually costs, not despite it. Per `PROGRESS_MODEL.md`, Grind is
Abstracted, which grants real, legitimate designer latitude over pacing
— but that latitude is about feel, not about misrepresenting how much
real proportional distance remains.

### Storyboard
- **Beginning:** presented plainly, at true scale — the container's own
  size or density should honestly communicate magnitude on its own,
  without needing supporting text, and without manufacturing false
  urgency or false slowness beyond what the real scale justifies.
- **Middle:** advances slowly and steadily. No artificial deceleration
  curve inserted purely to manufacture extra difficulty near the end,
  unless the real underlying task genuinely does get harder there — the
  Abstracted latitude this philosophy has covers how the pace *feels*,
  never whether the fill's position honestly reflects real proportional
  completion.
- **End:** completion feels earned and significant, but the visual
  weight of that moment stays proportionate to what was actually
  invested — never inflated into Reward Reveal's register, since Grind's
  payoff is "this mattered because of its size," not "this is exciting."

### Motion language
Slow, steady, and heavy-feeling — but always accurate. Pacing choices
here are about presentation temperament, never about lying regarding how
much proportionally remains.

### Visual language
Communicates scale and weight directly through form — an unusually long
track, a dense or layered fill suggesting real accumulated substance —
rather than through color drama. No "almost there" acceleration trick
near the end that doesn't correspond to genuinely less real effort
remaining.

### Audio direction
Minimal, low, textural. An occasional low tone reinforcing weight and
patience, not urgency or excitement.

### Player perception
**First time:** correctly registers "this is going to take a while" —
which is the intended, honest reaction, not a flaw to soften. **Across
the single long haul it's built for:** has to avoid visual fatigue,
since this exact presentation will be watched for a genuinely long time
— restraint serves this philosophy better than spectacle would.

### Strengths
Produces some of the most durable, meaningful completion moments
possible, because the payoff is inseparable from the real cost behind
it.

### Weaknesses
Actively unpleasant applied to something the player expected to be
quick, or didn't choose to be in — Grind's correct use depends entirely
on the player's expectations matching its actual scale.

### Best use cases
Prestige systems, rebirths, long-term progression the player has
explicitly opted into for its own sake.

### Never use for
Anything the player expects to be quick or incidental — mismatched
expectations are what turn Grind from meaningful into merely tedious.

### AI image prompt
An unusually long, dense horizontal track spanning far beyond the
proportions of an ordinary short progress bar, immediately implying
real scale through sheer length alone; a slow, thick, textured fill
advancing only a small fraction across the track's total length, the
fill itself suggesting layered, accumulated substance rather than a
flat single-tone color; muted, heavy, desaturated tones throughout, no
celebratory brightness anywhere; subdued, even lighting with no
dramatic highlight or gradient hinting at an approaching climax; no
particles, no glow, no acceleration cues near either end; the
composition deliberately emphasizes the vast unfilled remainder over the
small filled portion; plain, utilitarian flat-shaded illustration style;
orthographic, straight-on framing; the focal point is the sheer length
of what's left, not the part already completed.

---

## 5. Threshold

### Philosophy
Nothing before completion carries partial value — the interaction's
only honest job is representing distance from a single fixed gate. Per
`PROGRESS_MODEL.md`, this is the philosophy most exposed to the
process-backed honesty rule when it represents something real (a
cooldown), and the clearest positive proof that strict, low-ambition
honesty can be the correct design choice rather than a missing feature.

### Storyboard
- **Beginning:** appears the instant the gate or timer starts, with the
  full real duration honestly represented from the first frame — no
  fake head start, no fake compression to make it feel shorter than it
  is.
- **Middle:** when representing something real, advances at a literally
  accurate rate with no acceleration or deceleration tricks at all —
  this is the one concept in the set where the process-backed honesty
  rule applies with zero latitude. When representing a concealed,
  abstracted gate, the fill can be more schematic, but must never imply
  the gate is closer than it actually is.
- **End:** the gate visibly and unambiguously opens at the exact
  completion instant, as a clear, binary state change. Before that
  instant, nothing about the presentation should imply partial value —
  no glow ramping up, no anticipatory decoration building, since that
  would falsely suggest partial progress counts for something it
  structurally doesn't.

### Motion language
Linear, mechanical, uninflected. Deliberately withholds any dramatic
build, because a dramatic build would misrepresent a state that has no
partial value as though it did.

### Visual language
Plain and utilitarian, using a genuinely bounded, closed shape — the one
concept in this set where the classic 0%–100% container is the honest,
correct choice, since a real fixed ceiling actually exists here. Reads
as inert or closed until the exact completion instant, then changes
state clearly and immediately.

### Audio direction
Silence throughout, then one clear, unambiguous sound exactly at
completion — no anticipatory audio building beforehand, which would
repeat the same manufactured-pacing failure `PROGRESS_MODEL.md` flags
for Anticipation.

### Player perception
**First time:** immediately understands this is binary, not gradual —
the flat, undramatic presentation communicates that on its own.
**After a hundred times:** low tolerance for frequent exposure, but
sustained trust precisely because it has never once implied partial
progress mattered when it didn't.

### Strengths
Extremely clear and honest about what matters — no ambiguity about
whether partial progress counts for anything.

### Weaknesses
The least emotionally rewarding philosophy to simply watch, by design —
any attempt to make the wait itself exciting fights its own honesty.

### Best use cases
Hard unlock conditions, cooldowns, anything where the honest truth is
genuinely binary.

### Never use for
Anything where the player's own actions meaningfully affect the pace —
Threshold implies the wait is out of the player's hands.

### AI image prompt
A plain rectangular gauge with a clearly visible fixed ceiling line near
its top, the container reading as closed or inert, a thin fill creeping
upward from the bottom at a steady, mechanical rate with no acceleration
anywhere along its length; muted neutral tones throughout with zero
anticipatory brightness or glow building as the fill nears the ceiling
line; flat, even, shadowless lighting; no particles, no gradient, no
dramatic highlight of any kind; the gauge's outer frame is crisp and
utilitarian, almost valve-like in character; the fill itself is flat and
undramatic, carrying no implied excitement; clean, plain flat-shaded
illustration style; orthographic, straight-on framing; the focal point
is the fixed ceiling line itself, not the fill beneath it, reinforcing
that nothing below that line has been reached yet.

---

## Where these five sit against each other

Not a ranking — narrowing already happened in `CONCEPT_SELECTION.md`,
and this document narrows nothing further. Worth stating plainly now
that each has a visual identity: the choices above trace directly back
to `PROGRESS_MODEL.md`'s dimensions, not to taste. Momentum's shape
avoids implying a ceiling because it genuinely has none. Threshold's
shape embraces a hard ceiling because it genuinely has one — the two
concepts use opposite container logic on purpose, for the same honesty
reason. Reassurance and Grind sit at opposite ends of visual ambition
(minimal versus scale-communicating) despite both being allowed real
designer latitude over pacing, because their Basis and stakes differ.
Milestone is the one shape whose segmentation has to be visibly earned
rather than assumed, since its entire honesty case depends on the
divisions being real. A single viewer should be able to tell, from
shape and pacing alone, whether a given concept is making a factual
claim about a real process or an interpretive one about accumulated
meaning — that distinction, not any individual concept's polish, is
what this pass was actually testing for.
