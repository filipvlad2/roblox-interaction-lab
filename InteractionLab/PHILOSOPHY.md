# Philosophy

Interaction Lab exists because interaction quality was never actually
being decided. It was defaulted to, or guessed at, or judged once, alone,
inside a real game, and remembered as a vague impression by the time
anything else was worth comparing it to. This document explains why the
Lab exists, what it's for, what it deliberately leaves alone, and what
should still be true about it after every future change.

## Why does Interaction Lab exist?

Because you cannot judge quality without a comparison, and almost nothing
in Roblox development makes comparison cheap. A button press, a window
opening, a reward popping up — each one is small enough to never get a
deliberate decision, so it gets whatever the first implementation
happened to be. Multiply that by every interaction in every game, and the
feel of a game ends up being the least deliberate part of building it,
despite being the part players notice constantly.

The Lab exists to make comparison the *easy* path instead of the
effortful one. Not to add rigor for its own sake, but because "which one
feels better" is a question that can only be answered by actually placing
alternatives next to each other, replaying them, and choosing — and that
should take seconds, not a rebuild of a scene in Studio.

## What problems does it solve?

- It removes the friction that keeps developers from comparing at all:
  no isolation from gameplay noise, no side-by-side, no cheap replay, no
  record of what was tried, no protection from "I built this one so I
  like it" bias.
- It turns a passing impression into a decision someone can defend,
  revisit, or hand to a teammate.
- It gives an interaction a place to be judged on its own merits, before
  it's welded into a specific game's code and hard to change.
- It builds, over time, a library of interactions that have actually been
  chosen — not just written — so the next game doesn't start from zero.

## What problems does it intentionally NOT solve?

The Lab stays small on purpose. It does not:

- Design gameplay, economies, levels, or monetization. It only evaluates
  the moments where a player touches the interface.
- Replace player testing. Votes cast inside the Lab are a developer's
  informed opinion, not a substitute for what actual players do with the
  finished game.
- Track players, ship telemetry, or profile a live game. Its performance
  and accessibility checks (see `ProductDesign/TESTING.md`) are cheap,
  local signals meant to inform a choice, not a monitoring system.
- Manage a design system, a component library, or Studio tooling in
  general. It is not trying to become an IDE, a plugin platform, or a
  general-purpose UI framework.
- Resolve disagreement automatically. Voting and notes make disagreement
  visible; the conversation that follows is still a human one.

Anything on this list that starts to feel necessary is a sign to build it
somewhere else, not to grow the Lab into it.

## Why are interactions tested inside the real Roblox world instead of a fake preview?

Because a boxed preview is a simulation of context, and the question the
Lab exists to answer — does this feel better — is only true or false
*in* context. CoreGui, the actual screen edges, whatever else is on
screen, real frame timing under a real scene: none of that exists inside
an isolated stage. An interaction that wins in a clean box can still lose
once it has to share the screen with the things it will actually share
the screen with.

This is also why the Lab is being rebuilt around a companion panel that
triggers interactions in the game's own layer instead of inside its own
preview pane (see `ProductDesign/LAYOUT_V2.md`). A preview that looks
identical to production is still not production. Testing in the real
world is the only version of "which one feels better" that answers the
question that actually matters.

## Why is it a developer companion instead of an application?

Because the moment using the tool means giving up the game you're testing
against, the tool has defeated its own purpose. An application asks the
world to wait while it's open. A companion sits alongside — present when
it's needed, out of the way the instant it isn't.

This also matches how the Lab actually gets used: not as one long sitting
in a dedicated program, but as dozens of short touches scattered through
an ordinary working session — replay, glance, vote, back to what you were
doing. A tool built as an application optimizes for the session it
expects. A companion optimizes for the session that's actually happening.

## Why is fast iteration more valuable than feature completeness?

Because interaction feel can't be reasoned about in the abstract — it can
only be discovered by building something and watching what happens to it
under real replay, real voting, real use. A fully-featured comparison
suite built on untested assumptions is worth less than a small one built
on things that were actually tried, because every assumption the Lab
makes about *how developers compare things* is exactly the kind of claim
the Lab itself is designed to test.

This is the Lab practicing its own premise on itself. Comparison beats
speculation for a button; it beats speculation for the tool that
evaluates the button, too. A roadmap is a set of hypotheses about what's
worth building next, not a commitment to be defended once reality
disagrees with it.

## What principles should guide every future change?

**Build first. Learn from reality. Refine only when evidence demands it.**
Concretely, that means:

- Don't add a system whose only justification is "a real game might need
  this eventually." Add it when a real interaction, actually being built
  or validated, needs it.
- Every new capability earns its place by solving a problem that already
  happened, not one that might.
- When unsure how much to build, build the smaller version and see who
  hits its ceiling. The ceiling is data; guessing where it is isn't.
- Keep everything replaceable. A variant, a station, a comparison mode —
  each should be safe to delete without threatening anything else. That's
  what makes fast iteration safe instead of reckless.
- The Lab's own decisions aren't exempt from the standard it applies to
  everything else. If a default turns out wrong once real interactions
  are built and voted on, change the default — the documents describing
  it are records of current thinking, not commitments to defend.
- When it's a choice between polishing the Lab further and building or
  validating one more real interaction, build the interaction — unless
  the Lab itself is what's currently in the way.
