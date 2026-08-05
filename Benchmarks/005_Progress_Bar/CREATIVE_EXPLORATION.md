# Progress Bar — Creative Exploration

**Stage:** Creative Exploration. First stage of Benchmark 005, following
the same methodology that produced RWD-001_GOLD and NTF-001_GOLD: broad
exploration before narrowing, narrowing before visual concepts, visual
concepts before convergence, convergence before implementation. No stage
is skipped. This document does none of the later stages' work — no
visual concepts, no motion or visual language, no Roblox APIs, no
narrowing to finalists. It exists to answer one question honestly and
broadly:

**What should progress feel like?**

The honest first answer is that there isn't one — what a player wants
from watching progress happen changes completely depending on what's
progressing, why, and for whom. A bar filling for a five-second crafting
timer and a bar filling for a hundred-hour prestige grind aren't the
same feeling wearing different colors; they're answering different
questions entirely. This document maps that space before anything gets
designed inside it.

## Scope note: philosophy, not mechanism

The Progress Bars station already has three working prototypes —
LinearFill, Segmented, and Circular. Those are **mechanisms**: what
shape the progress takes on screen and how the fill reads. This document
deliberately operates one level below that, on **philosophy**: why
progress is being shown at all and what job it's doing for the player.
The two axes are independent. A LinearFill mechanism could carry a slow
Grind or a snappy Milestone depending on how it's paced; a Segmented bar
could represent discrete Milestones or a Collective effort just as
easily. Reward Reveal's five finalists and Notification's eight
philosophies were built the same way — this document does the same job
for progress, and treats the existing three mechanisms as neutral,
already-available delivery vehicles rather than as constraints on which
philosophies are worth exploring.

## Eight philosophies

### 1. Momentum — continuous forward motion

- **Purpose:** make the player feel like they are always moving forward,
  even in small amounts, so that the dominant sensation is motion itself
  rather than any single destination.
- **Emotional role:** flow and propulsion — the satisfaction of a wheel
  that keeps turning, not the satisfaction of arriving somewhere.
- **Player perception:** the player rarely thinks about where the bar
  ends; they think about whether it's currently moving. A bar that's
  visibly ticking up, even slowly, reads as healthy. A bar that's
  frozen — even at 80% — reads as broken or stalled, regardless of how
  close it actually is.
- **Strengths:** extremely good at sustaining engagement moment to
  moment, because it rewards continuing to act rather than waiting for a
  distant payoff. Works well with activities that are already
  intrinsically repetitive.
- **Weaknesses:** because the destination isn't the point, this
  philosophy struggles to deliver a genuinely memorable completion
  moment — the bar filling has already done its emotional work by the
  time it's full, so the finish can feel anticlimactic if anything is
  expected of it.
- **Repetition tolerance:** very high, as long as the motion itself
  stays visible and honest — the moment the increments become too small
  to perceive, or the bar stalls without explanation, this philosophy
  fails outright rather than merely weakening.
- **Where it works:** ongoing, low-stakes accumulation — resource
  gathering, passive experience gain, anything meant to make continuous
  play feel productive without a specific target in mind.
- **Where it fails:** anything that's supposed to build toward a
  specific, anticipated, high-stakes moment — Momentum actively
  undersells an ending it wasn't built to deliver.

### 2. Milestone — discrete, meaningful checkpoints

- **Purpose:** break a longer process into a series of individually
  significant steps, so the player experiences progress as a sequence of
  small completions rather than one long continuum.
- **Emotional role:** repeated small satisfaction — each checkpoint is a
  miniature "done," distinct from the anticipation of the final one.
- **Player perception:** the player tracks *which* checkpoint they're
  between, not a raw percentage — "I'm on step 3 of 5" is a fundamentally
  different mental model than "I'm at 63%," even when the underlying
  numbers are identical.
- **Strengths:** turns a single long task into several short ones
  psychologically, which makes large amounts of required effort feel
  more approachable and gives natural, honest points to stop and resume.
- **Weaknesses:** if the checkpoints are unevenly spaced or arbitrarily
  placed, the philosophy actively hurts more than a smooth continuum
  would — an uneven Milestone structure telegraphs its own artificiality
  in a way Momentum's smoothness never has to justify.
- **Repetition tolerance:** high for the structure itself, but each
  individual checkpoint's payoff is subject to the same fatigue rules as
  Reward Reveal's Confirmation-adjacent territory — a checkpoint reached
  constantly stops registering as a checkpoint at all.
- **Where it works:** structured content with natural stages —
  crafting recipes with real sub-steps, quest chains, skill trees with
  distinct tiers.
- **Where it fails:** genuinely continuous, undifferentiated processes —
  imposing artificial checkpoints on something like a simple loading
  wait invents structure that isn't really there.

### 3. Anticipation — counting down to a known moment

- **Purpose:** build toward a single, specific, already-understood
  event the player is waiting for, where the entire value of watching
  progress is knowing exactly what happens when it completes.
- **Emotional role:** rising tension and readiness — closer to watching
  a countdown than watching an accumulation. The bar's job is to make
  the wait itself feel purposeful rather than empty.
- **Player perception:** the player's attention is on the *event*, not
  the bar — the bar is a proxy for "how much longer," and its accuracy
  and honesty about that matter more than anything about its own
  presentation.
- **Strengths:** unmatched at making a wait feel earned rather than
  dead time, provided the thing being waited for is genuinely worth
  anticipating in the first place.
- **Weaknesses:** entirely dependent on the payoff at the end actually
  delivering — this philosophy borrows its entire emotional weight from
  a future moment it doesn't control, and a disappointing payoff damages
  the anticipation retroactively, not just the moment itself.
- **Repetition tolerance:** low to moderate, and for a structural
  reason: repeated anticipation for the same recurring event trains the
  player to stop finding it tense, which quietly converts this
  philosophy into Momentum without anyone deciding that on purpose.
- **Where it works:** boss encounter timers, matchmaking, crafting a
  specific known item the player chose and is waiting on.
- **Where it fails:** vague or open-ended processes with no single
  identifiable payoff moment — Anticipation needs a known "what happens
  when this fills," and starts to feel hollow without one.

### 4. Mastery — progress as the player's own growth

- **Purpose:** represent how much better the player has personally
  gotten at something, rather than how much of an external resource
  they've accumulated. The bar reflects the player's own capability, not
  a possession.
- **Emotional role:** quiet pride and self-recognition — closer to
  Reward Reveal's Prestige in dignity, but sustained and incremental
  rather than a single ceremonial moment.
- **Player perception:** the player reads this bar as a statement about
  *themselves* ("I am becoming more skilled") rather than about their
  inventory or their account ("I now have more of X"). That framing is
  the entire difference between this and every resource-based
  philosophy above.
- **Strengths:** builds a durable, personal sense of investment that
  survives long after any single reward would have faded — a skill
  someone believes they've earned doesn't get spent or lost the way a
  resource does.
- **Weaknesses:** requires the underlying system to genuinely reflect
  skill or effort, not random chance or pure time spent — a Mastery bar
  that's secretly just a disguised time-gate reads as dishonest the
  moment a player notices, in a way a plain Grind bar never has to worry
  about because it never claimed otherwise.
- **Repetition tolerance:** high over long timeframes precisely because
  it's not chasing a single payoff — but it's also the slowest
  philosophy here to reward a player meaningfully, so it tolerates
  patience better than it tolerates being checked on frequently.
- **Where it works:** skill trees, proficiency systems, anything where
  the player's own competence is genuinely the thing improving.
- **Where it fails:** short sessions or one-off tasks with no continuity
  — Mastery needs a persistent player identity to accumulate against,
  and means nothing in an isolated, single-use context.

### 5. Reassurance — making an invisible process legible

- **Purpose:** exist purely so the player knows something is happening
  at all, when the underlying process would otherwise be silent and
  unverifiable. The bar's entire job is proof of activity, not drama
  about an outcome.
- **Emotional role:** calm confidence that nothing is broken — the
  progress-bar equivalent of Notification's Whisper: low-stakes,
  low-attention, present specifically so its absence would be
  noticeable, not so its presence is.
- **Player perception:** the player isn't watching this bar for
  information about *how much* — they're watching it for confirmation
  that the system hasn't frozen. A bar that moves unevenly or stalls
  briefly reads as more suspicious here than almost anywhere else,
  because reassurance is this philosophy's only job.
- **Strengths:** cheap to deliver real trust for very little emotional
  investment — this is the lowest-effort, lowest-risk philosophy in the
  set, and it's good at exactly the one thing it tries to do.
- **Weaknesses:** carries essentially zero emotional payload of its own
  — if a designer tries to make a Reassurance bar exciting, they've
  misunderstood the philosophy, since drama here reads as a mismatch
  between the presentation and the stakes of "the file is loading."
  Reassurance done to too much effort is worse than Reassurance done
  plainly.
- **Repetition tolerance:** effectively unlimited, the same way
  Whisper's is — it demands nothing, so it costs nothing to see
  constantly, provided it never overstates its own importance.
- **Where it works:** loading screens, background saves, any process
  whose actual content the player has no reason to care about, only its
  status.
- **Where it fails:** anything the player is emotionally invested in the
  outcome of — Reassurance's flatness, correct for a loading screen,
  reads as indifferent or even insulting applied to something the player
  actually cares about finishing.

### 6. Grind — the weight of sustained effort

- **Purpose:** make a very long process feel appropriately large and
  effortful, so that the eventual completion carries weight specifically
  *because* of how much was put in, not despite it.
- **Emotional role:** dogged persistence and delayed gratification — the
  opposite temperament from Momentum's quick, light energy, even though
  both involve a bar that fills gradually.
- **Player perception:** the player is consciously aware of scale and
  investment — "this is going to take a long time" is not a bug the
  player is tolerating, it's the entire source of the eventual payoff's
  meaning. A Grind bar that turns out to be short-lived doesn't feel
  efficient; it feels like it lied about its own significance.
- **Strengths:** produces some of the most durable, meaningful
  completion moments possible, because the payoff is inseparable from
  the cost — nothing about this philosophy can be faked or rushed
  without undermining itself.
- **Weaknesses:** actively unpleasant if the player didn't choose to be
  in it, or doesn't understand why the scale is what it is. Grind
  applied to something the player expected to be quick reads as
  punishing rather than meaningful, with no way to tell the two apart
  from the bar alone.
- **Repetition tolerance:** paradoxically low on a per-session basis —
  nobody wants to watch the same Grind bar's presentation repeatedly in
  one sitting — but the philosophy itself is built entirely around
  tolerating one very long single repetition, which is a different axis
  than the other seven are measured on.
- **Where it works:** prestige systems, rebirths, long-term account
  progression the player has explicitly opted into for its own sake.
- **Where it fails:** anything the player expects to be quick or
  incidental — Grind is the only philosophy here whose correct use
  depends entirely on the player's prior expectations matching the
  actual scale, and mismatched expectations are what turn Grind from
  "meaningful" into "tedious."

### 7. Threshold — value concentrated at the finish line

- **Purpose:** communicate that nothing before completion matters at
  all — the bar exists solely to mark distance from a single gate that
  either opens or doesn't, with no partial value along the way.
- **Emotional role:** waiting and gating, not gradual satisfaction — the
  feeling this produces is closer to standing in line than to earning
  something incrementally.
- **Player perception:** the player mentally rounds this bar to two
  states, done or not done, regardless of how granular the actual fill
  looks. 40% and 90% both simply mean "not yet" in a way that a
  Milestone bar's 40% and 90% never would.
- **Strengths:** extremely clear and honest about what matters — there's
  no ambiguity about whether partial progress counts for anything,
  which some systems genuinely need to communicate truthfully.
- **Weaknesses:** the least emotionally rewarding philosophy to simply
  *watch* of the eight, because by its own design nothing about the
  waiting itself is meant to feel good — any attempt to make the middle
  of a Threshold bar exciting fights the philosophy's own honesty.
- **Repetition tolerance:** low — watching a gate you can't influence
  the speed of is tolerable occasionally and grating if it happens
  often, since there's no incremental payoff to offset the wait.
- **Where it works:** hard unlock conditions, cooldowns, anything where
  the honest truth is genuinely binary and pretending otherwise would
  mislead the player.
- **Where it fails:** anything where the player's own actions
  meaningfully affect the pace — Threshold implies the wait is out of
  the player's hands, and applying it to something the player is
  actively influencing undersells their own agency.

### 8. Collective — progress that belongs to a group

- **Purpose:** track contribution toward a shared goal that no single
  player owns or controls alone, so the bar represents a group's
  combined effort rather than one person's.
- **Emotional role:** solidarity and shared stake — the same
  foregrounding-of-relationship instinct behind Notification's Social,
  applied to accumulation instead of announcement.
- **Player perception:** the player's own contribution is only ever
  partial and is read against everyone else's — the meaningful question
  shifts from "how close am I" to "how close are we," and a player's
  personal sense of progress becomes inseparable from the group's.
- **Strengths:** unmatched at building a sense of belonging to something
  larger than an individual session, and at motivating participation
  through visible shared momentum rather than personal payoff alone.
- **Weaknesses:** entirely dependent on population and participation it
  can't guarantee on its own — a Collective bar in an empty or
  low-population context collapses into a discouraging, static number
  nobody is moving, which is worse than not having one at all.
- **Repetition tolerance:** high for the format itself across different
  events, but low for any single instance that drags on visibly without
  progress — an apparently stalled Collective bar reads as the group
  failing, which is a heavier, more public feeling than a stalled solo
  bar ever carries.
- **Where it works:** server-wide events, guild or party objectives,
  raid-style shared health or contribution bars.
- **Where it fails:** solo or low-population contexts, or anything the
  player expects to control personally — Collective's entire value
  depends on a "we" that has to genuinely exist for the philosophy to
  mean anything.

## What this exploration surfaces

A few patterns cut across all eight that are worth carrying into the
next stage rather than re-discovering there:

- **Whether the destination or the motion is the point splits the set
  cleanly, and almost everything else follows from which side a
  philosophy is on.** Momentum, Reassurance, and Grind are primarily
  about the experience of the fill itself; Anticipation, Threshold, and
  Milestone are primarily about what the fill is proxying for. Mastery
  and Collective sit apart from that split entirely, because their
  defining question isn't destination-versus-motion but *whose*
  progress this actually is.
- **Repetition tolerance doesn't track emotional intensity in any
  simple way.** Grind and Threshold are both low-key emotionally, yet
  one thrives on being watched constantly (its entire point requires
  scale) while the other actively degrades with frequent exposure. The
  question that actually predicts tolerance is whether the philosophy
  needs its own weight to feel earned each time, not how exciting it is.
- **Ownership — individual, personal-but-persistent, or shared — is an
  axis none of Reward Reveal's or Notification's philosophies had to
  reckon with in the same way**, because a reward or a notification is
  always addressed to one player. Progress is the first of the three
  interaction categories explored so far where "whose is this" is
  sometimes the central design question rather than a footnote.
- **Honesty about what the fill level actually means is a recurring
  failure point, not a presentation detail.** Milestone fails when its
  checkpoints are arbitrary; Threshold fails when it pretends partial
  progress matters; Grind fails when its scale doesn't match what the
  player was told to expect. In every case here, the philosophy breaks
  when the bar implies something about progress that isn't true, which
  is a sharper and more literal failure mode than anything in the
  Reward Reveal or Notification explorations, where the corresponding
  risk was usually fatigue rather than dishonesty.

## What this document does not do

It does not narrow these eight to a shortlist, does not assign any of
them a visual or motion treatment, and does not recommend one over the
others. That narrowing is real work belonging to the next stage, the
same way it was for Reward Reveal's five finalists and Notification's
eight philosophies before their own Concept Selection documents. All
eight are left intact here on purpose.
