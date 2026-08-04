# Roadmap v2 — Implementation Only

This roadmap replaces `ProductDesign/ROADMAP.md`. That version sequenced
which *documents and Lab features* to build next. This one only tracks
what gets built, validated, reused, and shipped — no documentation
milestones. Notes captured during validation live inside the Lab's own
Notes/vote feature as session data, not as written reports.

Governing rule, from `PHILOSOPHY.md`: **build first, learn from reality,
refine only when evidence demands it.** Nothing below is a commitment to
defend once real development disagrees with it — the milestones are
sequenced by priority, but a milestone only grows beyond its stated scope
when something built in an earlier one actually requires it.

---

## Milestone 1 — Lab Polish

**Priority: make the Lab itself good enough to stop noticing.**

- Replace the current full-viewport ScreenGui with the Companion Panel
  from `ProductDesign/LAYOUT_V2.md`: a resting chip, an on-demand
  floating panel snapped to an edge by default, and one hotkey that hides
  everything instantly from any state.
- Implement Side by Side as the default comparison mode
  (`ProductDesign/COMPARISON.md`), replacing single-variant-only viewing.
- Implement the smallest working version of Vote, Notes, and Winner
  (`ProductDesign/USER_FLOW.md`) — enough to cast a vote, attach an
  optional note, and see which variant is currently ahead.
- Prove the "render in real context" idea from `LAYOUT_V2.md` on exactly
  one station (Notifications is the simplest candidate — least tied to a
  fixed on-screen position) before deciding whether it's worth doing
  everywhere.

**Explicitly not in this milestone:** Blind Test, Overlay, Tournament,
Random modes; the Inspector panel; export; a mobile layout; automatic
accessibility/performance instrumentation; Studio Companion Mode. All of
these stay deferred until building or validating a real interaction
actually demands one of them.

**Done when:** a developer can open a station, compare two or three
variants side by side without losing the game view underneath, cast a
vote, and hide the whole tool with one keypress.

---

## Milestone 2 — Building Production Interactions

**Priority: give every existing station at least one interaction that's
actually ready to ship, not just a prototype variant.**

- For each of the five stations (Buttons, Window Opening, Rewards,
  Progress Bars, Notifications), take at least one variant from
  "prototype" to production quality, following the process already
  proven on Window Opening's Premium Simulator: a concrete design
  reference, an explicit motion/visual spec, an implementation that
  hits it, and a critical self-review of where it falls short.
- New production variants use the existing Mount/Play/Reset/Destroy
  contract unchanged. If a production interaction genuinely can't be
  expressed through that contract, that's the first real signal to
  reconsider it — not a reason to add speculative flexibility now.
- Quality over quantity: one interaction per station that could actually
  ship in a real game beats three more rough drafts.

**Done when:** every station has at least one variant nobody would
hesitate to reuse as-is.

---

## Milestone 3 — Validating Them

**Priority: confirm each production interaction actually won a real
comparison, not just that it was built.**

- Run every production interaction through an actual session in the Lab
  — real replays, a real vote, using the evaluation lenses in
  `ProductDesign/TESTING.md` (first impression, repeated use, frequency
  context, accessibility, performance, consistency).
- An interaction only counts as validated once it has been compared
  against at least one alternative and won — implementing it is not the
  same as validating it.
- Where a production interaction loses its own comparison, that's a
  useful outcome: fix it, or replace it, before it's eligible for reuse.

**Done when:** every interaction that moves on to Milestone 4 has a
recorded vote behind it, not just an implementation.

---

## Milestone 4 — Reusing Them

**Priority: prove a validated interaction can actually leave the Lab.**

- Pick one validated interaction and pull it out for use somewhere
  outside the Lab, in a separate context, before assuming any packaging
  approach for the rest.
- Decide how validated interactions get packaged for reuse (a standalone
  module per interaction, decoupled from its station/variant wrapper, is
  the likely shape) only once this first real reuse attempt shows what's
  actually needed — not before.
- No export tooling, no interaction "marketplace," no versioning scheme
  gets built speculatively. If reuse turns out to need one, that need
  will be obvious from having actually tried it once.

**Done when:** at least one validated interaction is running, unmodified
in spirit, outside the Lab that validated it.

---

## Milestone 5 — Building a Small Game Using the Validated Library

**Priority: the real test of everything above.**

- Scope a small, genuinely playable Roblox experience — small on
  purpose — that leans on the validated interaction library rather than
  requiring a pile of new gameplay systems.
- Build it primarily by assembling interactions that already won their
  comparisons in the Lab. If the game needs an interaction that doesn't
  exist yet, that's a signal to go validate it in the Lab first, not to
  improvise it inside the game.
- Anything the game needs that the Lab and its library can't yet provide
  is the clearest possible signal for what Milestone 1's "Lab polish"
  should have actually included — feed it back rather than working
  around it silently.

**Done when:** the small game ships, feels good, and its interactions
trace back to specific, validated decisions made in the Lab rather than
to guesses made while building the game.
