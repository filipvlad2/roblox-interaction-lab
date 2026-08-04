# Comparison Modes

## Design intent

No single way of looking at two variants answers every question. A mode
that's great for spotting a timing difference is bad for judging real
player bias. The Lab offers several modes rather than picking one true
answer — but it still needs a strong, opinionated default, because forcing
a developer to choose a comparison mode before they've even seen the
variants is itself a tax on effortlessness.

## Modes

### Single Variant

Show exactly one variant at a time, full-size, exactly as a player would
encounter it. Comparison happens by switching between variants and relying
on memory of what came before.

- **Strengths:** the only mode that shows a variant the way a player will
  actually experience it — never next to a competitor, never at reduced
  size, never sharing attention. Lowest visual complexity. Best for a
  first, unbiased look at something brand new, before comparison framing
  colors the impression.
  - **Weaknesses:** entirely dependent on memory. Recency bias is severe —
  whatever was seen last tends to feel best. Cannot reveal small timing or
  motion differences that only show up next to a reference.

### Side by Side

Show two (occasionally three) variants at once, in separate panes, replayed
together or independently.

- **Strengths:** removes the memory problem entirely — the difference is
  visible in the same instant, not recalled. Excellent for pacing, scale,
  and color differences. Matches how most developers already think about
  comparison, so it requires no explanation.
- **Weaknesses:** not how a player will ever actually see it — a button is
  never experienced next to an alternate version of itself, so a
  side-by-side "win" doesn't automatically mean a better solo experience.
  Gets visually noisy past two or three variants; screen space runs out
  fast (see `LAYOUT.md`).

### Overlay

Superimpose two variants in the same space — one at full opacity, one as a
ghost/outline — so their motion, timing, or position can be read as a
single combined shape.

- **Strengths:** unmatched for micro-differences — easing curves, exact
  timing offsets, motion paths — that side-by-side panes are too far apart
  (physically, on screen) for the eye to catch. Turns "these feel
  different but I can't say why" into a visible, specific gap.
- **Weaknesses:** only works when variants are structurally similar
  (comparing two button-press animations works; comparing a toast to a
  banner does not). Unreadable for variants with heavy color, text, or
  content differences — the overlay becomes visual noise instead of
  signal. Requires the developer to already know they're chasing a subtle
  difference; it's a poor first mode for a fresh comparison.

### Blind Test

Hide variant names, randomize which slot ("A" / "B") each variant lands
in, and only reveal identity after a vote is cast.

- **Strengths:** the only mode that directly defends against the biases
  that matter most in practice — "I built this one," "this one is newer
  and must be better," "I already decided before I looked." Produces the
  most trustworthy record of genuine preference, which is exactly what an
  exported result needs to be worth trusting later.
- **Weaknesses:** adds ceremony (randomizing, hiding, revealing) that
  slows down quick exploratory sessions. Less useful early, when the goal
  is fast, rough iteration rather than a defensible final call. Requires
  at least two variants in a comparable state to be meaningful.

### Tournament

Run a bracket of pairwise comparisons across three or more variants,
narrowing to a single winner through successive votes.

- **Strengths:** scales cleanly to a station with many variants, where a
  single N-way vote would be overwhelming. Forces every judgment to be
  relative ("better than this one specific alternative") rather than an
  absolute score pulled out of the air, which people are generally bad at
  giving consistently. Produces a full, inspectable decision trail — every
  matchup and its outcome, not just a final ranking.
- **Weaknesses:** takes meaningfully longer than any other mode. Overkill
  for the common case of 2–3 variants (most stations today). Bracket
  seeding order can quietly influence outcomes if not randomized, and
  early "unlucky" matchups can eliminate a strong variant before it ever
  faces its real rival.

### Random

Play a randomly chosen variant, without revealing which one, primarily as
a warm-up or a periodic bias check rather than a full comparison ritual on
its own.

- **Strengths:** breaks anchoring patterns — "I always vote for whichever
  plays first" — by removing any predictable order. Good as a quick,
  low-stakes gut-check before committing to a more rigorous mode, or as an
  occasional sanity re-check on a decision made a while ago.
- **Weaknesses:** not a comparison mode by itself — it shows one thing at
  a time with no reference, so it inherits Single Variant's memory problem.
  Most valuable as a modifier layered onto another mode (e.g., randomized
  slot order inside Blind Test) rather than something chosen on its own.

## Recommended default

**Side by Side is the default comparison mode.**

It's the only mode that eliminates the memory problem (Single Variant's
core weakness) without adding the ceremony of Blind Test or the time cost
of Tournament. It requires no explanation — every developer already
understands "look at both at once" — which matters because the default
mode is the one used most, including by someone opening the Lab for the
first time. For the common case this milestone is built around (2–3
variants per station), it is simply the fastest path to a confident,
visible comparison.

This does not make the other modes secondary features:

- **Blind Test is the recommended mode at the Vote step** specifically
  (see `USER_FLOW.md`), even though Side by Side is the default for
  browsing and comparing. Exploration and decision have different needs —
  fast, unbiased-enough browsing to narrow things down, then a
  bias-resistant pass before the vote actually counts.
- **Overlay** should be one click away from Side by Side whenever the
  variants in view are structurally comparable, since it's often the very
  next thing a developer reaches for once Side by Side shows *that*
  something differs but not exactly *what*.
- **Tournament** becomes the practical default the moment a station holds
  four or more variants — the Lab should suggest it automatically at that
  threshold rather than leaving the developer to run an unwieldy four-pane
  Side by Side.
- **Random** stays a lightweight toggle available inside any other mode,
  not a mode a developer picks from the dropdown on its own.
