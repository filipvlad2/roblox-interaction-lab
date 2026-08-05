# Notification — Concept Selection

**Stage:** Concept Selection. Reviews all eight philosophies from
`CREATIVE_EXPLORATION.md`, evaluates each against strengths, weaknesses,
versatility, repetition tolerance, emotional clarity, applicability
across Roblox genres, and overlap with the other seven, then narrows
eight to five. Still philosophy only — no animation, motion, visual
design, or Roblox APIs anywhere below. That work belongs to
`VISUAL_CONCEPTS.md`, which this document exists to feed.

## 1. Ranking

All eight, ordered by overall strength as a candidate to carry forward.
The line falls between 5 and 6 — everything below it is rejected, with
reasoning in Section 2.

1. **Confirmation** — the most universal and lowest-risk philosophy of
   the eight; almost no interactive system exists without a version of
   this job.
2. **Correction** — Confirmation's necessary counterpart; equally
   universal, equally foundational, on the "no" side of the same
   question.
3. **Whisper** — the only philosophy with genuinely zero downside risk;
   its niche (ambient, zero-attention) is structurally unique among all
   eight.
4. **Alert** — irreplaceable when it's needed and needed by nothing else
   when it isn't; narrower and higher-risk than the top three, but no
   substitute exists for its specific job.
5. **Social** — the highest strategic ceiling of the five finalists, and
   the most operationally demanding; included because its niche
   (identity-forward attention) is real and distinct, not because it's
   easy to get right.
6. **Status** — a genuine, defensible niche, but the philosophy whose own
   design goal is to produce no feeling at all, in a benchmark whose
   entire question is what a notification should *feel* like.
7. **Anticipation** — a real, unique orientation (the only forward-looking
   philosophy) undercut by narrow genre applicability and a structural
   mismatch with what "notification" means for the other seven.
8. **Delight** — genuine unique value, but the philosophy most dependent
   on content and writing quality rather than interaction design, and the
   one whose lowest-in-the-set repetition tolerance is most likely to be
   violated because each individual instance feels safe to add.

## 2. Rejected philosophies

### Status

- **Strengths:** genuinely useful for systemic, asynchronous information
  (quest resets, shop rotations, season changes); respects player agency
  by never demanding real-time attention.
- **Weaknesses:** its own success condition is emotional neutrality — the
  Creative Exploration's own description states the successful version
  "doesn't try to make the player feel anything at all." That is a
  reasonable design goal for a real game, but it puts Status in direct
  tension with this benchmark's actual question.
- **Versatility:** high in principle — any game with persistent systems
  can use it — but that breadth comes from being closer to a UI
  convention (an inbox, a log) than to an interaction with a feeling.
- **Repetition tolerance:** moderate, and it fails in a specific, already
  well-understood way (the location itself becomes something players
  learn to stop checking) rather than a way this benchmark would surface
  anything new about.
- **Emotional clarity:** clear about its *register* (this is
  informational, not urgent) but not about any *feeling*, which is a
  different kind of clarity than the other seven offer.
- **Applicability across Roblox genres:** strong in RPGs, tycoons, and
  live-service-style experiences with dailies or events; weak in
  short-session genres (obstacle courses, minigames) with no persistent
  state to report on.
- **Overlap:** meaningfully overlaps with Whisper on the low-urgency end
  of the spectrum; the real differentiator (Status expects to eventually
  be read, Whisper never expects to be consciously processed at all) is
  a distinction that matters less than it might, since neither is trying
  to produce a feeling worth benchmarking.
- **Verdict:** rejected. Not because it's bad practice for real games —
  it plainly isn't — but because a benchmark built to answer "what
  should a great notification feel like" gets the least out of the one
  philosophy explicitly optimized to feel like nothing.

### Anticipation

- **Strengths:** the only forward-looking philosophy in the set; nothing
  else in the eight builds tension for something that hasn't happened
  yet.
- **Weaknesses:** it's the only one of the eight that must persist across
  a duration rather than resolve quickly — a structural property the
  other seven don't share, and one that changes what kind of thing it
  even is more than any tuning choice would.
- **Versatility:** narrow. It only means something for games with real
  scheduled or countdown structure — an event start, a boss timer, a
  matchmaking wait — and does nothing for experiences without one.
- **Repetition tolerance:** low to moderate, and specifically dependent
  on the anticipated event actually being significant, which is an
  external condition this philosophy can't guarantee on its own.
- **Emotional clarity:** high — rising tension is unambiguous — but that
  clarity is only available to genres that have something to build
  toward in the first place.
- **Applicability across Roblox genres:** strong in event-driven or
  competitive genres (round-based PvP, raid timers, scheduled events);
  close to irrelevant in exploratory or creative sandbox genres with no
  scheduled structure at all.
- **Overlap:** partially overlaps both Status (low-key, not-yet-resolved
  information) and Alert (something the player needs to prepare for),
  without fully owning either — it borrows a little urgency from one and
  a little patience from the other rather than occupying fully
  independent territory.
- **Verdict:** rejected. The underlying idea is real and worth
  revisiting, but its narrow genre fit, its structural mismatch with what
  "notification" means for the rest of this set, and its partial overlap
  with two philosophies that already made the cut make it a weaker use
  of one of five finalist slots than the alternative.

### Delight

- **Strengths:** the only philosophy whose entire purpose is a positive
  feeling for its own sake; nothing else in the eight can substitute for
  genuine charm.
- **Weaknesses:** the most content-dependent philosophy by far. An Alert
  is alarming regardless of the specific danger; a Confirmation is
  reassuring regardless of the specific action. A Delight notification's
  success depends almost entirely on whether *this particular* joke or
  flourish lands — which is a writing and content question more than an
  interaction one.
- **Versatility:** narrow — it only fits experiences with an established
  personality or voice; a purely systemic or competitive game has no
  natural home for it.
- **Repetition tolerance:** surprisingly low, already flagged in Creative
  Exploration, and dangerous specifically because each individual
  instance feels safe to add (low interruption, easily skipped) — the
  philosophy most likely to be overused precisely because nothing about
  a single instance warns against it.
- **Emotional clarity:** high when it lands, but this is the only
  philosophy in the set with real downside risk built in — a mediocre
  Whisper or Status is merely unremarkable, while a mediocre Delight can
  read as actively awkward.
- **Applicability across Roblox genres:** works in playful,
  personality-driven simulators and comedic experiences; a poor fit for
  serious, competitive, or systemic genres where charm can feel tonally
  wrong.
- **Overlap:** low overlap in mechanism, but real risk of overlap in
  execution — an unsuccessful Delight notification is easily mistaken for
  a misfired Status or Confirmation.
- **Verdict:** rejected — for this benchmark specifically. Interaction
  Lab exists to compare interaction feel (timing, hierarchy, motion,
  restraint), not to judge whether a specific joke is funny. Delight's
  success is dominated by a variable this Lab has no way to test, which
  makes it a poor use of a finalist slot here even though the underlying
  idea has real value elsewhere.

## 3. Finalists

### Whisper

- **Strengths:** the only philosophy with genuinely zero downside risk —
  it asks for nothing, so it can't cost anything if done well.
- **Weaknesses:** conveys almost nothing memorable by design; can never
  be a game's only notification system, since some things genuinely do
  need to break through.
- **Versatility:** high as ambient texture underneath almost any genre,
  though narrow in the single job it does.
- **Repetition tolerance:** the highest of all eight — unlimited in
  practice, because the moment it costs attention it has stopped being a
  Whisper at all.
- **Emotional clarity:** very high; nothing about it could be mistaken
  for anything else, precisely because it asks for so little.
- **Applicability across Roblox genres:** broad — simulators, tycoons,
  and social hangouts all benefit from background presence; least
  necessary in fast, twitch-action genres where peripheral signals would
  be lost in the noise anyway, which is a low-cost weakness rather than a
  disqualifying one.
- **Overlap:** structurally distinct from all seven others — it's the
  only philosophy that explicitly wants zero registered attention, which
  gives it a clean niche nothing else here competes for.
- **Why it moves forward:** it anchors one true end of the interruption
  spectrum. No other finalist can do this job, and the toolkit is
  incomplete without a zero-cost option in it.

### Alert

- **Strengths:** unmatched at its one job — guaranteeing awareness of
  something dangerous or time-critical regardless of what else has the
  player's attention.
- **Weaknesses:** the only philosophy that can actively harm the
  experience if miscalibrated — overuse doesn't just waste attention the
  way over-Whispering does, it erodes trust or causes real stress.
- **Versatility:** low — it's a specialist tool that breaks if stretched
  to cover routine communication.
- **Repetition tolerance:** the lowest of all eight; it only works while
  it stays rare.
- **Emotional clarity:** very high — alarm is unambiguous.
- **Applicability across Roblox genres:** essential in combat, survival,
  and horror genres with real failure states; close to unnecessary in
  social or creative sandbox genres with nothing to warn about — the most
  genre-dependent relevance of any finalist.
- **Overlap:** minimal — its profile doesn't resemble any other
  philosophy closely. It shares subject matter with Correction (both can
  involve something going wrong) but not register: Correction explains
  calmly, Alert warns urgently, about different classes of problem.
- **Why it moves forward:** it anchors the opposite end of the
  interruption spectrum from Whisper. Nothing else in the set can
  substitute for genuine urgency without failing at the one job that
  matters when it's needed.

### Confirmation

- **Strengths:** universally useful, minimal emotional risk, and directly
  serves usability in any interactive system with player-initiated
  actions.
- **Weaknesses:** easy to overuse into mechanical invisibility if applied
  to trivially frequent actions; not memorable on its own — it's
  infrastructure, not a moment.
- **Versatility:** the highest of all eight — nearly every genre has
  actions that need a "did that work" answer.
- **Repetition tolerance:** high, as long as it stays yoked to genuinely
  deliberate actions rather than trivial, constant ones.
- **Emotional clarity:** high in clarity, deliberately low in intensity —
  a distinct and useful combination none of the other finalists share.
- **Applicability across Roblox genres:** close to universal — crafting,
  purchasing, saving, and joining all exist across simulators, tycoons,
  RPGs, and social experiences alike.
- **Overlap:** its one meaningful overlap is with Correction, and
  deliberately so — see Section 4.
- **Why it moves forward:** the single most broadly load-bearing
  philosophy in the set. Almost any Roblox experience needs this job done
  well before it needs any of the others.

### Correction

- **Strengths:** an essential usability safety net; prevents confusion at
  the exact moment it would otherwise take root.
- **Weaknesses:** unlike the other finalists, its own failure mode is
  diagnostic of something else being wrong (an unclear interface, a
  confusing system) rather than being self-contained the way Alert
  fatigue or Whisper-overload are.
- **Versatility:** high — any system with actions that can fail needs
  this, which is nearly every system.
- **Repetition tolerance:** low, but for a distinct reason from Alert or
  Delight — repetition here is a symptom, not just a cost.
- **Emotional clarity:** clear in intent (defuse, don't amplify) but
  genuinely easy to miscalibrate toward feeling harsher or more punishing
  than intended, which is a real and specific risk worth carrying into
  the next stage.
- **Applicability across Roblox genres:** universal — crafting, combat,
  economy, and building systems all have failure states that need
  explaining.
- **Overlap:** the strongest, most deliberate overlap in the set — with
  Confirmation, as its direct counterpart.
- **Why it moves forward:** Confirmation only tells half the story of
  "what happens when a player acts." Without Correction, the toolkit
  would have an answer for yes and no answer at all for no.

### Social

- **Strengths:** uniquely powerful for connection and retention in
  multiplayer contexts; nothing else in the set can make a notification
  feel personal rather than systemic.
- **Weaknesses:** the correct interruption level and repetition tolerance
  aren't fixed properties of the philosophy the way they are for the
  other four finalists — they depend on relationship and community size,
  which makes this the hardest finalist to get right and keep right.
- **Versatility:** sharply bimodal — essential in social or co-op
  genres, close to irrelevant in solo experiences. No other finalist has
  this all-or-nothing genre relationship.
- **Repetition tolerance:** the least uniform of all eight; welcome at
  low volume from someone the player cares about, fatiguing almost
  immediately at high volume from a large or impersonal group.
- **Emotional clarity:** high in kind (warmth, connection) but variable
  in intensity depending on context in a way the other finalists aren't.
- **Applicability across Roblox genres:** essential in social hangouts,
  roleplay, and co-op experiences; largely unused in solo puzzle or
  obstacle-course genres.
- **Overlap:** low overlap in mechanism with the other finalists, but a
  real tendency to layer its identity-forward framing on top of them —
  a friend's Alert and a system's Alert are both Alerts, but Social
  changes how each one lands. This is a property worth carrying forward
  explicitly rather than resolving here.
- **Why it moves forward:** its niche — foregrounding *who* over *what*
  — is real and none of the other four finalists can do it. It's included
  with its complexity named up front, not because it's the easiest of
  the five, but because the toolkit has no interpersonal dimension
  without it.

## 4. Toolkit rationale

These five aren't five attempts at the same answer — each owns a piece
of the space the other four structurally cannot cover:

- **Whisper and Alert** are the two ends of the interruption spectrum
  itself. Between them, they define the full range every other
  finalist's interruption level gets measured against.
- **Confirmation and Correction** are a matched pair answering the same
  underlying question — "what happened when I acted?" — from its two
  possible outcomes. Neither is complete without the other; keeping both
  is not redundancy, it's the toolkit having a full answer instead of
  half of one.
- **Social** is the only finalist whose defining move is foregrounding
  *who* over *what*. None of the other four can do this without
  becoming a different philosophy in the process — an identity-forward
  Alert is arguably already halfway to being Social.

A game built using only one of these five would be missing something
real: all-Whisper and nothing ever breaks through; all-Alert and
everything is exhausting; Confirmation without Correction and failures
go unexplained; nothing-Social and a multiplayer game feels like a
single-player one with company. The five together cover the interruption
spectrum, both outcomes of direct action, and the one dimension — other
people — that the rest of the set can't reach. That completeness, not
any individual philosophy's strength, is the actual argument for this
set of five over any other combination of eight choose five.
