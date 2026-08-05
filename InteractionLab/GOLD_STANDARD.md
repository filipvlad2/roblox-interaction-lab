# Interaction Library — Gold Standard

This document defines what "Gold" means inside the Interaction Library.
It is not a process document — `ROADMAP_V2.md` and the benchmark
methodology (Creative Exploration → Concept Selection → Visual Concepts
→ Visual Concept Review → Gold Direction → Implementation → Self-Review)
already own that, and nothing here changes or adds a stage to it. This
document formalizes something narrower: the quality bar an interaction
has to clear before it's allowed to carry the word "Gold" at all,
written down now because that bar has been operating implicitly for two
benchmarks and is worth making explicit before a third one runs into a
disagreement about it.

## The status ladder

Six statuses, in order. An interaction only ever moves forward along
this ladder, except for the one designed escape hatch at the end
(Gold → Deprecated).

**Draft** — a philosophy or a visual concept exists, but nothing has
been identified as a serious contender for production. Most ideas live
and die here. *Current example:* Notification's **Alert** and **Social**
philosophies — each has a complete `VISUAL_CONCEPTS.md` entry, but
neither was carried into `VISUAL_CONCEPT_REVIEW.md`'s expanded prompts,
and neither has been called out as a near-term production target.

**Candidate** — a specific direction has been identified as strong
enough to warrant real development effort (expanded image prompts, a
named "strongest direction" call), but no single production target has
been locked yet. *Current example:* Notification's **Whisper** and
**Correction** — both went through the same three-variation
`VISUAL_CONCEPT_REVIEW.md` expansion Confirmation did, both were named
as expected foundations of the eventual toolkit, and neither has a
`GOLD_DIRECTION.md` yet. This is exactly the state Confirmation itself
was in for one turn, between "Confirmation has clearly emerged as the
strongest direction" and `GOLD_DIRECTION.md` actually existing.

**Design Locked** — a `GOLD_DIRECTION.md` exists, defining one
production target with no remaining alternatives. The term comes
directly from how this project already uses it — "Notification is now
officially DESIGN LOCKED" was the literal instruction that started
`NTF-001_GOLD`'s implementation, once its Gold Direction was written and
nothing else. No code has to exist yet for this status.

**Implemented** — the code exists, conforms to the `Mount → Play →
Reset → Destroy` contract, has been syntax-checked, and has a genuinely
critical self-review attached. It has *not* been confirmed against real
Roblox behavior. *Current example:* **NTF-001_GOLD**, right now — built,
self-reviewed, committed, and syntax-checked, but never opened in
Studio. Its own self-review names two real open risks (whether the
checkmark's Unicode glyph actually renders in `GothamBold`, and an
untuned hold duration) that only a real session can resolve.

**Gold** — Implemented, plus real evidence that it holds up. Defined
fully in the questions below, because this is the status this whole
document exists to protect.

**Deprecated** — was Gold, or was in active use as a benchmark's
reference implementation, and has since been superseded or found to
violate its own design goal under real use. Nothing in this Lab has
reached this status yet; it exists so that when something does, the
answer is "mark it, keep it, stop pointing new work at it" — the same
non-destructive instinct already used when `ProductDesign/LAYOUT.md`
and `ProductDesign/ROADMAP.md` were marked superseded rather than
deleted during the Companion Panel redesign, not a new idea invented for
this document.

## 1. When is an interaction allowed to become Gold?

Only when Implemented status is followed by **real evidence gathered by
watching it run**, not by further reasoning about the code. Concretely,
that evidence is: a real Roblox Studio session, an explicit pass on
every item in that interaction's own Approval Checklist (from its
`GOLD_DIRECTION.md`), direct confirmation that its Forbidden Mistakes
are absent, and — if that session surfaced problems — a polish pass
scoped only to what was found, followed by confirmation that the fix
actually worked.

Neither of this Lab's two benchmark implementations has crossed that
line yet, and that's the clearest illustration of the bar being real
rather than a formality. **RWD-001_GOLD** is the furthest along: it
received a real Studio session, was explicitly reported at "🟡 Gold
Candidate," got a polish pass scoped to exactly two named targets (snap
impact, counter absorption), and that polish was itself committed with
its own review of what changed and why. But no second look has
confirmed the polish actually landed the way the self-review reasoned
it would — so under this standard it remains **Implemented**, one
confirmation short of Gold, not because anything is known to be wrong,
but because the evidence loop hasn't closed. **NTF-001_GOLD** is
earlier still: Implemented, with zero Studio evidence of any kind, and
its own self-review already names two specific things a session would
need to check (glyph rendering, hold-duration feel) before Candidate
evidence could even start being gathered.

## 2. What evidence is required?

- A real Roblox Studio session — not reasoning from the code, the same
  distinction every self-review in this Lab has already drawn between
  what's *reasoned* and what's *observed*.
- An explicit pass on every item in that interaction's own Approval
  Checklist. These checklists are written to be objectively answerable
  by watching, not judged — that's their entire design, in both
  `GOLD_DIRECTION.md`s written so far.
- Direct confirmation that the Forbidden Mistakes list is actually
  absent, not merely that nothing was seen to obviously violate it.
- A genuinely critical self-review — this Lab has never produced a Gold
  candidate without one, and a Gold declaration arriving without one
  should be treated as suspicious on its own, not just incomplete.
- Explicit sign-off from whoever is driving the benchmark, based on that
  evidence. Gold is not self-certified by whoever wrote the
  implementation.

## 3. What is NOT required?

- **Pixel-faithful matches to the AI-generated concept art.** The image
  prompts set direction, not a target to hit exactly — `RWD-001_GOLD`'s
  own self-review is explicit that its reward icon is "a flat,
  single-color circle," a real gap from the concept art, and that alone
  never blocked its Gold Candidate status.
- **Every placeholder asset being real before evidence-gathering can
  start.** `RWD-001_GOLD` reached Gold Candidate with `RewardSnap` still
  a silent placeholder. What *is* required: an untestable checklist item
  can't be marked "pass" — so a real asset is required before the final
  Gold line is crossed, but its absence doesn't block getting close, and
  doesn't send the interaction back to redesign.
- **A second, independent designer's review.** This Lab's standard is a
  critical self-review plus one real Studio session and a sign-off, not
  a committee process — nothing here asks for one.
- **Zero deviation from the Visual Concept Review's exact renders.** The
  Gold Direction is explicitly allowed to pick and simplify — see
  `RWD-001_GOLD_DIRECTION.md` choosing Variation A over B and C outright,
  and `NTF-001`'s own Gold Direction doing the same.
- **New documentation for every subsequent tweak.** See Question 4 — a
  properly scoped polish pass doesn't need its own Gold Direction
  rewrite.

## 4. What can still change after Gold?

**Allowed, without revisiting Design Convergence:**
- Small, targeted tuning within what the Gold Direction already locked
  down — `RWD-001_GOLD`'s polish pass changed `FLASH_PEAK_TRANSPARENCY`,
  swapped two easing curves from Quad to Cubic, and added a color tween
  to the counter, all while adding zero new duration and touching
  nothing on the Forbidden Mistakes list. That's the shape a legitimate
  post-Gold change takes.
- Swapping a real, uploaded asset in for a placeholder (a real
  `RewardSnap` sound, a real `Notification` tick) — expected, not a
  redesign, and often exactly what closes the last gap toward Gold in
  the first place.
- Fixing a genuine bug that contradicts the Gold Direction's own intent
  — the kind of thing `RWD-001_GOLD`'s flash-transparency bug was, found
  during implementation rather than after Gold, but the same category of
  fix would be equally legitimate discovered later.

**Not allowed without going back through Design Convergence:**
- Any change to the Core Emotion or Primary Design Goal — those aren't
  tuning knobs, they're the definition of what the interaction is for.
- Anything that reintroduces or loosens an item on the Forbidden
  Mistakes list, even slightly, even for a good reason. A "small"
  particle effect added back in isn't a small change; it's a different
  design.
- A change large enough that the existing Approval Checklist would need
  new items to still mean anything — if the checklist can't tell whether
  the change is correct, it isn't polish anymore.

## 5. When should Gold be revoked?

- **The Primary Design Goal turns out not to hold under real, sustained
  use.** `RWD-001_GOLD`'s Primary Design Goal is that the reveal "must
  still feel good on the five-hundredth repetition" — that's
  specifically not verifiable in one Studio session. If extended play
  later shows it doesn't hold, that's not a polish gap, it's Gold having
  been granted on incomplete evidence, and it should be revoked back to
  at best Candidate, not patched quietly in place.
- **A Forbidden Mistake is discovered to be present after all** — one
  that a short session didn't surface but longer or different use does
  (a glow that lingers slightly longer than it seemed to, a sound that
  turns out to have a faint tail on certain devices).
- **A later benchmark supersedes it as the canonical answer to the same
  job it was doing** — moves it to Deprecated, not deletion, the same
  way superseded design docs in this repo were marked rather than
  removed.
- **The design system underneath it changes in a way nobody reconciled
  it against** — if `Theme.Colors.Success` or `AccentAlt` were ever
  redefined, every Gold interaction built against the old meaning would
  need to be re-checked before it could keep the label, not assumed to
  still be fine.

## Gold Checklist

For use during every future benchmark review — this is a check on
whether Gold status itself should be granted, distinct from and applied
after an interaction's own interaction-specific Approval Checklist.

- [ ] Does a `GOLD_DIRECTION.md` exist, naming exactly one production
      target?
- [ ] Does the implementation satisfy every constraint listed as
      Mandatory in that document?
- [ ] Has that interaction's own Approval Checklist been run against a
      real Roblox Studio session — not reasoned about?
- [ ] Does every item on that Approval Checklist currently read "yes,"
      including anything about repeated use?
- [ ] Are all of that interaction's Forbidden Mistakes confirmed absent
      by direct observation, not assumed absent from the code?
- [ ] Does a genuinely critical self-review exist for this
      implementation, naming real weaknesses rather than declaring
      victory?
- [ ] If the Studio session surfaced any problems, was a polish pass
      completed, scoped only to what was found, and reconfirmed
      afterward?
- [ ] Is every placeholder asset the Approval Checklist actually depends
      on either real now, or explicitly and knowingly excluded from what
      is being certified?
- [ ] Has whoever is driving the benchmark explicitly signed off on Gold
      status, based on the evidence above — not the implementer alone?

A "no" on any item means the interaction stays at Implemented (or drops
back to it, if it had informally been called Gold already) — the same
"no means rejection, not a note for later" rule both Approval Checklists
already use.
