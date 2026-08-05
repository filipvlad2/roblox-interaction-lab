# Progress Bar — Visual Concept Review

**Stage:** Visual Concept Review. Design only — no implementation, no
image generation, no narrowing to a single winner. This document exists
to critically stress-test the five concepts in `VISUAL_CONCEPTS.md`
before any concept art gets generated from them — not to expand their
prompts (that pattern, established for Notification's core three, isn't
what this pass is for) and not to choose a Gold direction (that's a
later, separate stage). Every concept below remains fully alive after
this document; nothing is rejected here.

Four review axes, applied to all five:

1. **Honesty** — does the visual representation truthfully communicate
   the underlying progress, per `PROGRESS_MODEL.md`'s own rules?
2. **Motivation** — does it encourage continued engagement without
   manipulating the player?
3. **Readability** — can the player understand progress instantly, at a
   glance, without study?
4. **Long-term fatigue** — will this still feel appropriate after
   hundreds of repetitions?

The most useful finding this review surfaces isn't that any concept
fails one of these axes outright — none do — it's that Honesty and
Readability pull against each other more often than `VISUAL_CONCEPTS.md`
alone made visible, and that this tension, not any single flaw, is what
concept art needs to be generated with full awareness of.

---

## 1. Momentum

### Strengths
Structurally the most honest concept in the set — an unbounded
philosophy paired with a shape that has no implied edge means there's
almost nothing left for it to lie about. Extremely low fatigue risk;
asks nothing of the player, so there's nothing to wear out.

### Weaknesses
The deliberately edge-less shape that makes Momentum honest is the same
shape that makes it unfamiliar. Most players' default mental model of
"progress" is a bar with a visible start and end — a continuously
scrolling strip with no boundary risks reading as a rendering glitch or
a cut-off UI element rather than an intentional design choice, at least
on first encounter.

### Review
- **Honesty:** strong — no false ceiling, motion tied to real
  increments, stalls visibly when nothing is happening.
- **Motivation:** intentionally low — by design, this asks the player to
  find satisfaction in the motion itself rather than a destination,
  which is honest but is also a real limit on how hard this concept can
  work as a motivator on its own.
- **Readability:** the weakest of the four axes for this concept. The
  same honesty that makes the shape correct also makes it unfamiliar,
  and unfamiliar isn't the same as instantly legible — this is a real
  cost, not a free choice.
- **Long-term fatigue:** excellent — the concept's low ambition is
  exactly what lets it survive unlimited repetition.

### Recommended improvements before concept art
Explore a consistent framing device — a subtle repeating boundary
marker, a fixed reference point the strip visibly passes — that signals
"this is intentionally continuous" rather than "this is cut off,"
without reintroducing a false start/end edge. Concept art should test
this specifically, since it's the one open question standing between
this concept's honesty and its readability.

---

## 2. Reassurance

### Strengths
The strictest, simplest honesty case in the set — an indeterminate
pattern that honestly admits "duration unknown" is a genuinely
disciplined design choice, not a compromise. Effectively unlimited
fatigue tolerance, since it demands almost nothing from the player.

### Weaknesses
Deliberate modesty and outright invisibility are not the same thing,
and `VISUAL_CONCEPTS.md` doesn't clearly separate them. If this concept
is tuned too far toward "unremarkable," it risks failing at the one
moment it actually matters — when a player is genuinely wondering
whether something has stalled, which is precisely when they'll look for
it and need to actually find it.

### Review
- **Honesty:** excellent — the strongest process-backed honesty case of
  the five, and the only one where an indeterminate pattern is
  explicitly preferred over a fabricated smooth fill.
- **Motivation:** not applicable in the way it is for the other four,
  correctly — this concept isn't trying to motivate anything, and that's
  the right answer, not a gap.
- **Readability:** good in the common case, but there's a real
  under-tested edge case: can a player who's actually worried actually
  find and read this quickly? Modesty and findability are different
  properties, and only one of them was designed for explicitly.
- **Long-term fatigue:** excellent, unconditionally.
- **Skip note:** a static image also can't distinguish a slow pulse
  from a slow fill very well — that's not a fatal flaw in the concept,
  but it's a real risk for whoever generates the concept art next.

### Recommended improvements before concept art
Define a minimum legibility threshold distinct from "restrained" — this
concept should be quiet, never invisible. Concept art should also
establish an unambiguous visual grammar that separates the indeterminate
pulse pattern from a genuine determinate fill, since the two can look
nearly identical in a single static frame if that distinction isn't
made deliberate.

---

## 3. Milestone

### Strengths
The clearest demonstration in the set of turning honesty into structure
— a shape that visibly previews its own real divisions before any fill
happens is a genuinely strong, teachable design idea. Concrete,
achievable sub-goals are a proven, low-manipulation motivator.

### Weaknesses
The same honesty rule that makes this concept trustworthy — segment
sizes must vary when the underlying steps genuinely differ — directly
works against instant readability. A track with a few large segments and
several tiny ones is harder to scan at a glance than one with uniform
divisions, and a player's first read of "how far along am I" may
actually be slower here than on a plain percentage fill.

### Review
- **Honesty:** strong, and the most structurally interesting honesty
  case in the set, since the honesty obligation is expressed through
  shape rather than through motion or color.
- **Motivation:** strong — concrete sub-goals motivate reliably, and
  because the checkpoints are required to be real, this motivation isn't
  manufactured.
- **Readability:** the real open question for this concept.
  Variable-sized segments are the honest choice and the harder-to-scan
  one, and `VISUAL_CONCEPTS.md` doesn't yet resolve that tension.
- **Long-term fatigue:** good for the structure generally; a specific
  task's exact segment pattern will look identical on the tenth replay
  as the first, which is correct and expected, not a flaw, but worth a
  Studio check once this exists in code.

### Recommended improvements before concept art
Explore whether a supplementary, honest counter ("step 3 of 7") paired
with the segmented shape preserves readability better than segments
alone, particularly for tasks with many steps or drastically uneven
step sizes. Concept art should test both with and without that
supplement rather than assume the segmented shape alone is sufficient.

---

## 4. Grind

### Strengths
The clearest positive case in the set for `PROGRESS_MODEL.md`'s tempo
principle — deliberate slowness as an honest, legitimate design choice
rather than a cost being tolerated. Scale is communicated structurally,
through the track's own length, rather than through text or claims.

### Weaknesses
This is the concept with the sharpest, least-examined risk in the whole
set: a very long track with only a small fraction filled can read as
discouraging on first impression, before a player has bought into the
philosophy behind it. `VISUAL_CONCEPTS.md` treats Grind's honesty as
settled, but doesn't address that a fully honest depiction of "you have
a very long way to go" and a demotivating one can look identical.

### Review
- **Honesty:** strong — no manufactured deceleration, no false "almost
  there" acceleration, real proportional accuracy required throughout.
- **Motivation:** the real weak point. Grind's whole bet is that size
  becomes meaningful once a player buys in — but the visual concept as
  written does nothing to help a player buy in before they've already
  decided to. First impression and long-term payoff are pulling in
  different directions here more than for any other concept in the set.
- **Readability:** genuinely good — magnitude is communicated instantly
  through form, which is a real strength distinct from the motivation
  concern above.
- **Long-term fatigue:** flagged already in `VISUAL_CONCEPTS.md` as a
  real risk (watching one presentation for a genuinely long haul), and
  this review doesn't have a stronger answer than restraint — worth
  carrying forward as an open problem, not a resolved one.

### Recommended improvements before concept art
Explore framing or contextual cues that signal "this length is
intentional and worthwhile" rather than "this is punishing," without
resorting to any dishonest acceleration trick — this is a real,
unresolved tension, and concept art is the right place to test candidate
solutions rather than guess at one here. Also explore subtle,
non-deceptive texture or detail variation along the track's length as a
possible answer to the long-haul fatigue risk, distinct from anything
that would touch the fill's actual honesty.

---

## 5. Threshold

### Strengths
The strongest honesty case in the entire set, without qualification —
it never claims partial value it doesn't have, and the plain, bounded
shape is the one place in this benchmark where the classic 0%–100%
container is actually the correct, honest choice.

### Weaknesses
The same restraint that makes this concept honest can be visually
indistinguishable from an unfinished or low-effort UI element if it's
executed without enough deliberate craft — a plain, undramatic gauge
risks reading as "the designer didn't get to this one" rather than "this
is a deliberate, disciplined choice."

### Review
- **Honesty:** excellent, the clear standout of the five.
- **Motivation:** correctly flat — this concept isn't supposed to
  motivate through anticipation, only to represent a real gate honestly.
  The risk isn't that it's unmotivating; it's that "deliberately
  unmotivating" and "accidentally unfinished" can look the same without
  care.
- **Readability:** strong — binary states are inherently easy to read,
  and the fixed ceiling line gives an unambiguous target.
- **Long-term fatigue:** the one real structural weakness, already
  named in `CONCEPT_SELECTION.md` — low repetition tolerance is
  intrinsic to this philosophy, not something concept art or visual
  polish can fix. This isn't a defect in the concept; it's a constraint
  on where the concept should be used at all.

### Recommended improvements before concept art
Concept art should aim for a small amount of deliberate, non-dramatic
craft — crisp linework, precise materials — that signals intentional
restraint rather than an unfinished placeholder, without adding any
false emotional weight that would contradict the concept's own honesty.
It should also avoid depicting this concept in a way that implies
frequent, casual use, since that would visually misrepresent the low
repetition tolerance this philosophy already carries as a known
constraint.

---

## Core concepts

**Momentum, Reassurance, Milestone.**

These three score well across all four axes with no dependency on a
specific context to land correctly — each is close to a safe default
choice for almost any interaction that needs it, with open questions
that are refinements (framing devices, legibility thresholds,
supplementary counters) rather than conditions on when the concept is
even appropriate to reach for. Together they also cover the most common
practical needs a real game has: ambient ongoing feedback (Momentum),
confirmation a background process hasn't stalled (Reassurance), and
honest structure for a task with real sub-steps (Milestone).

## Extended concepts

**Grind, Threshold.**

Both are fully legitimate and both move forward to concept art — the
distinction from Core isn't quality, it's that each has one axis whose
correct use depends on deliberate context rather than being safe by
default. Grind's Motivation risk means it needs framing that helps a
player buy in before the payoff arrives, and only makes sense where the
player has genuinely opted into a long-horizon system. Threshold's
Long-term fatigue ceiling means it needs to be reserved for genuinely
infrequent gates, not reached for as a general-purpose choice. Both
belong in the toolkit `CONCEPT_SELECTION.md` already argued for — they
just require more deliberate judgment about where they're used than the
three Core concepts do.
