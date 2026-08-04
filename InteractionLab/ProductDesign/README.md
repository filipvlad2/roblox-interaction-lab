# Interaction Lab — Product Philosophy

## The problem

Every Roblox game ships hundreds of small interaction decisions: what happens
when you press a button, how a window opens, how a reward announces itself,
how progress is shown, how a notification interrupts you. Individually, each
decision looks trivial. Collectively, they *are* the game's feel.

Today those decisions get made in one of two ways:

1. **By default.** Whatever the engine gives you, or whatever the first
   implementation happened to look like, ships. Nobody chose it — it just
   never got questioned.
2. **By vibes, inside a real game.** A developer tweaks a tween value in
   Studio, presses Play, watches it happen once in the middle of a live
   scene, and decides it "feels fine." The next variant, if it's ever tried,
   is judged against a memory of the first one, minutes or days later, in a
   different mental state.

Neither produces a decision anyone could defend, repeat, or hand to someone
else. Interaction quality ends up being the least deliberate part of
production, despite being the part players feel most directly and most
often.

## What Interaction Lab is

Interaction Lab is a dedicated space where an interaction is the *entire*
subject under test — not a detail inside a bigger scene. It exists to turn
"this feels better" from a passing impression into a comparison you actually
ran, on purpose, with alternatives sitting next to each other.

It is built on one belief: **you cannot judge quality without a
comparison.** A single button, replayed in isolation a hundred times, only
tells you whether you're bored of it. Two or three buttons, replayed back to
back, tell you which one is *better*. The Lab's entire job is to make that
second kind of judgment cheap enough that developers actually do it, every
time, instead of only when something feels obviously wrong.

## Why not just test inside Roblox Studio?

Studio is where a game gets built. It is not where an interaction gets
*evaluated*, for a few concrete reasons:

- **No isolation.** In a real scene, an interaction is surrounded by
  gameplay noise — camera movement, other UI, sound, whatever the player is
  doing. You can't tell if a button feels good or if the moment around it
  just happened to feel good.
- **No side-by-side.** Studio shows you one implementation at a time, in one
  place in the source. Comparing variant A to variant B means editing code,
  re-running, and trusting your memory of what A felt like a minute ago.
- **No replay ritual.** Re-triggering an interaction usually means resetting
  game state, walking back to a trigger, or re-firing a chain of events.
  Anything that adds friction to "do it again" quietly discourages doing it
  again — which is exactly the thing good evaluation requires.
- **No record.** Once you decide, nothing remembers what you compared, what
  you rejected, or why. The next person (including future you) starts from
  zero.
- **No neutrality.** A variant that was already labeled "the new one" or
  "my idea" carries a bias into the test that has nothing to do with how it
  actually feels.

Interaction Lab exists to remove all five frictions at once, in a place
that has no other job competing for attention.

## Design philosophy

- **The interaction is the product.** Nothing in the Lab should exist to
  serve gameplay. If a feature only makes sense "in a real game," it
  doesn't belong here (see the main repository README for the architectural
  version of this rule).
- **Reduce cognitive load, not just click count.** Every design decision in
  this milestone is judged by whether it frees up the developer's attention
  for the actual question — *does this feel better* — instead of spending
  it on navigating the tool, remembering what they just saw, or fighting
  bias.
- **Comparison is the default posture, not a special mode.** The Lab should
  never make "just look at one variant" the easy path and "compare
  variants" the effortful one. It's the opposite today, everywhere else.
- **Every session should end at a decision.** A session that ends in "I
  don't know, I'll think about it" has failed the developer. The Lab's flow
  is designed to always produce a recorded outcome — even a tentative one —
  rather than open-ended browsing.
- **Bias is a design constraint, not an afterthought.** Ordering effects,
  naming effects, and "I built this one so I like it" effects are treated
  as real product risks the UI actively works against (see
  `COMPARISON.md`).
- **Nothing here is precious.** Just as every variant in the architecture
  is disposable and replaceable, every workflow described in this milestone
  is a hypothesis about what makes evaluation effortless. If a later
  version finds a better flow, this one gets replaced without ceremony.

## Who this is for

One user: a game developer trying to decide which version of an
interaction to ship. Not a QA team, not a player, not a stakeholder
demo. Every document in this milestone optimizes for that one person,
sitting alone, trying to make a call they can stand behind.
