# Roadmap

## Design intent

Each version below has exactly one job. A version is done when its job is
done, not when every nice-to-have idea from later versions has crept in
early. Non-goals are listed deliberately, for the same reason the
architecture avoids systems that only make sense in a real game: scope
discipline is what keeps the Lab lightweight enough to actually use.

---

## Version 0.1 — Architecture *(shipped)*

**Purpose:** prove the Lab can exist at all — a working station/variant
contract, five stations with three variants each, and a UI shell that can
switch, replay, and reset any of them.

- Delivered: `LabController`, the variant contract, five stations, generic
  sidebar/toolbar/control-bar UI.
- Explicitly not addressed: what the *experience* of using it should be.
  That gap is what v0.2 exists to close.

## Version 0.2 — Product Design *(this milestone)*

**Purpose:** design the developer experience before building any more of
it. Decide what a session looks like, how comparison works, how layout
should be organized, and how evaluation should be approached — on paper,
so v0.3 is building toward a specific, considered target instead of
guessing feature by feature.

- Deliverables: `README.md`, `USER_FLOW.md`, `LAYOUT.md`, `COMPARISON.md`,
  `TESTING.md`, `ROADMAP.md` (this document).
- Explicit non-goals: no code, no changes to the v0.1 architecture, no
  new stations. This version produces decisions, not features.

## Version 0.3 — Comparison & Voting core

**Purpose:** build the smallest version of the flow in `USER_FLOW.md` that
a developer can actually run end to end: preview a station's variants,
compare them in the default mode, replay, vote, and see a winner. This is
the version where the Lab stops being a variant browser and starts being a
decision tool.

- Build: Side by Side as the default comparison mode (per
  `COMPARISON.md`), a vote action attached to a comparison, a minimal
  Result panel showing the current tally and leading variant, and a Notes
  field attached to each vote.
- Layout: implement the regions from `LAYOUT.md` that this version
  actually needs — Sidebar, Stage, Toolbar, Variant selector, a basic
  Result panel. Inspector and full responsive behavior wait.
- Explicit non-goals: no Blind Test, Overlay, or Tournament yet — only
  the default mode. No export. No accessibility/performance
  instrumentation. No mobile layout. No session persistence beyond a
  single sitting.

## Version 0.4 — Rigor & memory

**Purpose:** support the "rigorous path" described in `USER_FLOW.md` and
close the loop on `TESTING.md` — give developers the tools to make a
comparison trustworthy and to keep a record worth trusting later, not just
to make one quickly.

- Build: Blind Test and Overlay comparison modes; Tournament mode
  triggered automatically once a station holds four or more variants (per
  `COMPARISON.md`); the Inspector panel surfacing variant metadata and
  notes history; session history so votes and notes persist across
  launches instead of resetting each time; Export producing a shareable
  result artifact per station (winner, tally, notes trail).
- Explicit non-goals: no accessibility/performance auto-instrumentation
  yet — the Inspector can display what a developer records manually, but
  automatic measurement is deferred to v1.0. No mobile layout yet.

## Version 1.0 — Complete evaluation surface

**Purpose:** deliver every lens described in `TESTING.md`, not just the
subjective ones, and make the Lab's output something the rest of the team
can consume without opening the tool — the point where "we validated this
in the Lab" is a claim backed by real evidence, automatically gathered.

- Build: objective measurement surfaced automatically per variant (timing,
  tween/instance cost, basic accessibility checks — motion, contrast,
  flash rate — and consistency checks against shared `Theme` values, all
  from `TESTING.md`), shown alongside votes rather than replacing them;
  Random as a lightweight modifier available inside any mode; the mobile
  review-and-vote companion layout scoped in `LAYOUT.md`; a stable,
  documented contract for the exported result artifact so it can be
  consumed by other tools or pasted directly into design docs and PRs.
- Explicit non-goals: the Lab still does not simulate real gameplay
  context, does not track players, and does not become a general
  analytics tool. v1.0 is "the easiest place to answer which interaction
  feels better," fully realized — not the start of a broader product.
