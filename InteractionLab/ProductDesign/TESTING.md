# Testing & Evaluation Methodology

## Design intent

"Which one feels better?" is a subjective question, and the Lab should
never pretend otherwise by hiding behind numbers. But subjective judgment
gets sharper, not weaker, when it's paired with a few objective facts the
developer doesn't have to hold in their head — how long something actually
takes, what it costs to run, whether it excludes anyone. This document
keeps those two kinds of evaluation clearly separate so neither one quietly
poses as the other.

## Subjective evaluation

These are judgment calls. They belong to the developer, they can
legitimately differ between developers, and the Lab's job is only to give
them good conditions to be made in — not to resolve them automatically.

| Lens | The question being asked | Why it needs its own pass |
|---|---|---|
| **First impression** | What's the gut reaction in the first second, before analysis kicks in? | This is what most players will actually get — most interactions are seen, not studied. A variant that only wins after ten replays is not a first-impression winner. |
| **Repeated use** | Does it hold up, or become annoying, after the twentieth, fiftieth replay? | Some interactions are charming once and grating on repetition (long animations, loud sounds). This is the opposite failure mode from first impression and needs a separate, deliberate pass — the Replay button exists largely to make this pass possible. |
| **High-frequency context** | If this will be triggered constantly (a button pressed dozens of times a session), does it stay out of the way? | For frequent interactions, subtlety and speed usually beat spectacle — a flashy variant that wins on first impression can actively hurt the game once it's judged for how it holds up at high frequency. |
| **Low-frequency context** | If this happens rarely (a big reward, once), does it earn the moment? | The opposite bias applies here — a low-frequency interaction can and should afford to be slower and more dramatic than a high-frequency one; judging it by "does it stay out of the way" would undersell it. |
| **Player perception** | Does it *communicate* the right thing — does a reward read as rewarding, an error read as an error — independent of whether the developer personally likes it? | A developer can like a variant's craft while it fails to actually send the intended signal to a player who has no context. This lens exists to catch that gap. |
| **Consistency (subjective slice)** | Does it feel like it belongs to the same game as the Lab's other winning variants? | Interactions aren't judged in a vacuum forever — once other stations have winners, a new candidate should be felt against that emerging "house style," not just against its own siblings. |

## Objective observations

These are facts, not opinions. They don't decide anything by themselves,
but a developer should not have to guess at them — the Lab should surface
what it can measure directly, so subjective judgment is informed rather
than uncertain about basics like "how long does this even take."

| Lens | What's being observed | Why it matters |
|---|---|---|
| **Timing** | Exact duration of the interaction, in milliseconds, from trigger to rest. | Two variants that "feel" similar often differ by a specific, nameable number once measured — and that number is what actually gets tuned later. |
| **Performance cost** | Tween count, instance count, and any other cheap-to-measure cost the variant incurs while playing. | The Lab's whole premise is that interactions get reused across future games; a variant that wins on feel but is disproportionately expensive is a liability the developer deserves to see before it ships everywhere. |
| **Accessibility** | Motion intensity (anything that could trigger vestibular discomfort), reliance on color alone to convey meaning, flash rate/duration (photosensitivity), text contrast and readability. | These are pass/fail facts about who can use the interaction at all, not preferences — they should never be discovered only after a variant has already been picked for "feel." |
| **Consistency (objective slice)** | Does the variant reuse the shared `Theme` values, a duration in the same general range as its siblings, an easing family already established elsewhere? | This is the measurable half of the "house style" question above — concrete enough to flag automatically, distinct from the felt-sense version of the same idea. |

## How the two connect

A session should never let an objective red flag get silently overruled by
subjective enthusiasm. If a variant fails an accessibility check, that
result should sit next to the vote, not be buried in an inspector panel
nobody opened. But the reverse should never happen either — objective
measurements should never be allowed to auto-pick a winner. A variant can
be faster and still feel worse. The Lab's job is to put both kinds of
information in front of the developer at the same time and let the human
call it.

## A suggested evaluation ritual

For a comparison that matters enough to warrant real rigor (see the
"rigorous path" in `USER_FLOW.md`), work through the lenses in roughly
this order:

1. **First impression** — the very first replay of each variant, before
   anything else colors the reaction.
2. **Frequency context** — decide up front whether this interaction is
   high- or low-frequency in real use, and judge accordingly rather than
   applying a universal standard.
3. **Repeated use** — deliberately replay past the point of novelty.
4. **Accessibility and performance** — check the objective facts before
   getting attached to a favorite; it's easier to stay neutral about a
   problem in something you haven't already picked.
5. **Player perception** — sanity-check that the leading variant actually
   communicates what it's supposed to, not just that it looks the most
   polished.
6. **Consistency** — hold the leading variant up against the Lab's other
   winners, both by feel and by the shared `Theme` constants it draws
   from.
7. **Vote**, ideally blind (see `COMPARISON.md`), only after the above.

Short, low-stakes sessions don't need all seven steps — first impression
plus a vote is a complete, legitimate session. This ritual exists for the
comparisons worth slowing down for, not as a gate in front of every single
one.
