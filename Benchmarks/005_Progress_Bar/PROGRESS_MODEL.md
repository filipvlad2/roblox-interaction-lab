# Progress Bar — Progress Model

**Stage:** an additional analysis inserted between Creative Exploration
and Concept Selection, for this benchmark specifically, at your
direction. It is not a new stage in the general methodology and doesn't
claim to be — Reward Reveal and Notification both went straight from
Creative Exploration to Concept Selection, and nothing here changes that
default. This document exists because progress turned out to have a
structural layer worth separating from the philosophy layer:
`CREATIVE_EXPLORATION.md` asked *why* progress is shown and what job it
does emotionally; this document asks what progress *is*, independent of
any particular philosophy's answer to that first question.

This is not a ninth philosophy, and it doesn't rank or narrow the eight
already on the table. It's a coordinate system the eight can be located
on, and that whatever comes after them can be checked against.

## The dimensions

Every instance of progress — regardless of which of the eight
philosophies it's serving — can be described along five independent
dimensions. These are the fundamental properties `CREATIVE_EXPLORATION.md`
asked to have surfaced: not what progress should *feel* like, but what
it structurally *is*, before feeling enters into it at all.

### 1. Boundedness — does it have a ceiling?

**Bounded** progress has a real endpoint; **unbounded** progress has
none, only "more." A bounded bar answers "how much is left"; an
unbounded counter can only ever answer "how much so far." This is the
single most consequential dimension here, because most of what follows
depends on it: honesty, trust, and pacing all mean something different
depending on whether an endpoint genuinely exists.

### 2. Endpoint visibility — does the player know the total?

Independent of whether a ceiling exists, the player may or may not know
where it is. **Disclosed** endpoints are visible or reliably inferable
by the player. **Concealed** endpoints exist and are tracked by the
system, but the player experiences only relative movement — closer or
farther — without ever being told the actual total. Unbounded progress
is concealed by definition, since there's no total to disclose, but
bounded progress can be either: a bounded total can still be deliberately
hidden.

### 3. Directionality — can it go backward?

**Monotonic** progress only ever advances. **Reversible** progress can
legitimately retreat as a normal, expected part of what it represents —
not as an error state, but as part of its actual meaning. Most of what
gets called "progress" is monotonic by default; reversibility has to be
a deliberate design property, not something that happens to a
monotonic bar by accident.

### 4. Basis — does it represent something real, or something abstracted?

**Process-backed** progress corresponds to an actual, literal operation
with a true rate — time elapsing, data transferring, a real countdown.
**Abstracted** progress represents accumulated meaning with no literal
duration underneath it to be honest or dishonest about — reputation,
mastery, currency. This distinction matters more than it looks: a
process-backed bar is making a factual claim ("this much of the real
thing has actually happened"), while an abstracted bar is making an
interpretive one ("this much of something that only exists as a concept
has accumulated"). The two carry different obligations, covered below.

### 5. Ownership — whose progress is it?

**Individual** progress belongs to one player in one moment.
**Persistent-personal** progress belongs to one player but accumulates
across sessions, carrying identity forward the way Mastery or a Grind
does. **Collective** progress belongs to a group and no single
contributor controls it alone. This dimension didn't exist in the same
way for Reward Reveal or Notification, both of which are always
addressed to one player at one moment — progress is the first
interaction category in this Lab where "whose is this" has to be asked
explicitly rather than assumed.

**Locating the eight, without ranking them:** these dimensions aren't a
sixth way to compare the philosophies against each other — they're what
each philosophy is *made of*. Reassurance is typically bounded,
disclosed or easily inferable, monotonic, process-backed, and
individual. Grind is typically bounded, disclosed, monotonic,
abstracted, and either individual or persistent-personal depending on
whether it resets. Collective is typically bounded, often disclosed,
monotonic, usually abstracted, and — definitionally — collective. None
of these placements say anything about which philosophy is stronger;
they say what each one is actually built from, which is what makes it
possible to check a new philosophy against this model later without
re-deriving all of this from scratch.

## Honesty and trust

### What makes progress feel honest

- **The visible rate corresponds to the real rate, for anything
  process-backed.** If a bar represents a real operation, its motion has
  to track that operation's actual pace — not a pace chosen because it
  feels better. Abstracted progress doesn't carry this obligation in the
  same way, because there's no underlying fact to misrepresent; its
  pacing is a legitimate design choice rather than a claim.
- **Reaching the disclosed endpoint delivers exactly what the disclosure
  implied.** A bounded, disclosed bar that reaches its own end and then
  reveals more is required has broken the one promise a disclosed
  endpoint makes.
- **Comparable causes produce comparable visible effects.** If two
  actions are presented as similarly significant, they shouldn't move a
  shared bar by wildly different amounts without the player having a way
  to understand why — otherwise the bar stops being a reliable signal of
  anything.
- **The precision on display matches the precision the system actually
  has.** A bar or number implying exact knowledge the underlying system
  doesn't actually track is a quieter version of the same dishonesty as
  a fake rate — false precision, not just false pace.

### What destroys trust

- **Silent reversal.** A monotonic-looking bar moving backward with no
  signal that reversibility was ever part of its design reads as a bug
  or a punishment, regardless of the actual reason — because the player's
  model, built from every other monotonic bar they've ever seen, didn't
  allow for this outcome.
- **Unexplained stalling.** A bar that stops moving with no indication
  of whether that's expected is read as broken by default — silence is
  never neutral here, it's interpreted as failure.
- **Manufactured pacing on process-backed progress.** Artificially
  slowing something that represents a real operation, in order to
  produce a feeling the real operation doesn't actually justify, is a
  factual misrepresentation, not a pacing choice — this is the specific
  failure that separates a legitimately deliberate Anticipation build
  (which is honestly representing a real wait) from a fabricated one
  (which is inventing wait that isn't there).
- **A moved goalpost.** Any disclosed endpoint that turns out not to be
  the real one damages every future bar the player encounters, not just
  the one that lied — trust in progress interactions is shared across
  instances, so a single violation is a systemic cost, not a local one.
- **Ambiguous ownership.** Presenting collective progress as though it
  were the player's individual progress, or vice versa, without making
  the distinction legible, is its own category of dishonesty — the
  player is being told something true about the wrong subject.

## Tempo

Not animation timing — this is about what pace an interaction should
honestly represent, independent of anything about how that pace gets
rendered.

### When progress should feel fast

- When the thing it represents genuinely is fast, and the honest
  obligation on process-backed progress (above) forbids presenting it as
  slower than it is.
- When the same interaction is expected to recur often — anything
  designed for high repetition needs its per-instance tempo kept low, or
  the cost compounds across every repetition into something the
  philosophy behind it can't survive.
- When the player's own immediately preceding action is the entire
  cause of the movement, and the value of the bar is confirming that
  cause-and-effect worked — the longer the gap between the action and
  its visible effect, the weaker that confirmation reads.

### When it should deliberately feel slow

- When the underlying thing being represented is genuinely large or
  significant, and the slowness itself is part of what communicates
  that — here, slowness is not a cost being tolerated, it's the message.
- When a real wait exists and the honest thing to do is let the player
  feel its actual duration rather than compress it away — legitimate
  only when the wait being represented is real, per the honesty
  obligation above.
- When speeding up the presentation would itself communicate something
  false — that a threshold or milestone is routine, when its entire
  purpose is to mark that it isn't.

The deciding question is never "what pace feels best" in the abstract —
it's "what does this progress's Basis (process-backed or abstracted)
and purpose actually justify." Fast and slow are both honest choices
under the right conditions and both dishonest under the wrong ones.

## What should never share one interaction

Some combinations of the dimensions above aren't a matter of taste —
forcing them into the same interaction produces a structural
contradiction, not just a weaker design.

- **Bounded and unbounded progress should never be shown through the
  same interaction.** A bar implies a ceiling by its own shape; applying
  that shape to something that has no real ceiling either invents a
  false endpoint or forces an arbitrary one onto something that was
  never meant to have one. This is a category error, not a style choice.
- **Individual and collective progress should never be merged into one
  undifferentiated display.** Even when a group total and a personal
  contribution are both worth showing, presenting them as a single
  number erases the ownership distinction the honesty section above
  depends on — the player can no longer tell whose progress they're
  looking at, which is itself a trust violation, not a simplification.
- **Reversible and monotonic progress should never use an identical,
  unmarked presentation.** Because monotonic is the default assumption
  every other bar has already trained the player to expect, a reversible
  bar that looks indistinguishable from a monotonic one will always be
  misread the first time it moves backward, however clearly its own
  internal logic justifies that motion.
- **Process-backed and abstracted progress should never be presented so
  that they're indistinguishable from each other.** They carry different
  honesty obligations — one is a factual claim, the other an
  interpretive one — and a player who can't tell which kind of claim
  they're looking at has no way to know what standard to hold it to.
  Discovering that a bar they assumed was abstracted was actually
  process-backed (or the reverse) retroactively changes what its past
  behavior meant.

## How this model gets used

Nothing above chooses a direction for `NTF-001_GOLD`'s sibling — this
document doesn't touch Concept Selection's job. What it provides instead
is a check: any philosophy under consideration next can now be located
on these five dimensions, evaluated against the honesty and trust
principles for the Basis it actually has, and tested against the
incompatibility rules if more than one philosophy is ever asked to share
a single interaction. Where `CREATIVE_EXPLORATION.md` answered "why
would you want this feeling," this document answers "what would have to
be true for that feeling to be honestly earned" — and that second
question doesn't go away once a philosophy is chosen. It's the standard
the eventual Gold Direction's Forbidden Mistakes and Approval Checklist
will need to satisfy, the same way `GOLD_STANDARD.md`'s evidence bar sits
above any single benchmark's own checklist.
