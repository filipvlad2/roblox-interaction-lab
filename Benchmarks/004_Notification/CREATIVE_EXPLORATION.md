# Notification — Creative Exploration

**Stage:** Creative Exploration. First stage of Benchmark 004, following
the same methodology that produced RWD-001 Gold: broad exploration
before narrowing, narrowing before visual concepts, visual concepts
before convergence, convergence before implementation. No stage is
skipped. This document does none of the later stages' work — no visual
concepts, no motion or visual language, no Roblox APIs, no narrowing to
finalists. It exists to answer one question honestly and broadly:

**What should a great notification feel like?**

The honest first answer is that there isn't one — a notification's job
changes completely depending on what it's for, and "great" means
something different for each job. This document maps that space before
anything gets designed inside it.

## Scope note: philosophy, not mechanism

The Notifications station already has three working prototypes — Toast,
Banner, and CornerPopup. Those are **mechanisms**: where a notification
appears and how it moves. This document deliberately operates one level
below that, on **philosophy**: why a notification exists at all and what
job it's doing for the player. The two axes are independent. A Toast
mechanism could deliver an urgent Alert or a quiet Whisper depending on
how it's tuned; a CornerPopup could carry a Confirmation or a piece of
pure Delight. Reward Reveal's five finalists (Satisfying, Prestige,
Luxury, Collector, Social) were philosophies in exactly this sense, not
visual treatments — this document is doing the same job for
notifications, and treats the existing three mechanisms as neutral,
already-available delivery vehicles rather than as constraints on which
philosophies are worth exploring.

## Eight philosophies

### 1. Whisper — ambient awareness

- **Purpose:** keep the player passively aware that something in the
  background changed, without asking them to do anything about it. This
  is information for the player's peripheral sense of the game-state, not
  for their foreground attention.
- **Emotional role:** reassurance and ambient presence — the feeling of
  a game that's alive and tracking things on your behalf, not the feeling
  of being told something.
- **Interruption level:** effectively zero. It should be possible to
  never consciously register a Whisper notification and lose nothing.
- **Attention management:** lives at the true edge of vision, appears
  and resolves quickly, competes with nothing, and is the first thing
  sacrificed if anything else needs the player's attention at the same
  moment.
- **Repetition tolerance:** the highest of any philosophy here, close to
  unlimited — precisely because it demands nothing, it can happen
  constantly without becoming a cost. The moment it starts costing
  attention, it has stopped being a Whisper.

### 2. Alert — urgent interrupt

- **Purpose:** guarantee the player becomes aware of something dangerous
  or time-critical, right now, regardless of what else they're focused
  on. This is the opposite pole from Whisper on every axis at once.
- **Emotional role:** alarm — a deliberate, honest spike of urgency. Not
  meant to feel pleasant; meant to feel impossible to miss.
- **Interruption level:** the highest of any philosophy here, by design.
  Breaking the player's current focus is the entire point, not a side
  effect to minimize.
- **Attention management:** must win against everything else on screen
  in the same instant — this is the one philosophy where competing for
  attention against gameplay itself is correct, not a failure.
- **Repetition tolerance:** the lowest of any philosophy here. An Alert
  that fires often stops being alarming (the player adapts) or, worse,
  keeps being alarming and becomes exhausting. Either failure mode
  destroys the thing that makes it useful — it only works while it stays
  rare.

### 3. Confirmation — acknowledgment

- **Purpose:** close the loop on something the player just deliberately
  did. It answers a question the player just implicitly asked ("did that
  work?") rather than introducing new information.
- **Emotional role:** quiet certainty. The feeling of a system that
  responds, not a system that announces.
- **Interruption level:** low, but not zero — unlike a Whisper, it has to
  be noticed, because an action the player took needs a visible answer.
  It just doesn't need to be noticed by anyone who wasn't already looking.
- **Attention management:** anchored to where the triggering action
  happened, not to a fixed screen location — it answers something
  specific, so it appears somewhere specific.
- **Repetition tolerance:** high, because it's yoked to deliberate player
  actions rather than ambient system noise — but only as long as the
  actions themselves aren't trivially frequent. The same Confirmation for
  an action taken constantly will fatigue fast, not because the
  philosophy is wrong but because the action driving it was too frequent
  to deserve one.

### 4. Status — informational update

- **Purpose:** report a system-level change the player should eventually
  know about, without implying it needs to be dealt with immediately.
- **Emotional role:** neutral, administrative — closer to a headline than
  a feeling. The successful version of this philosophy doesn't try to
  make the player feel anything at all.
- **Interruption level:** low to moderate; noticeable, never alarming.
- **Attention management:** typically lives in a consistent, dedicated
  location the player learns over time (an inbox, a ticker, a log) —
  the predictability of *where* substitutes for urgency about *when*.
- **Repetition tolerance:** moderate, and it degrades in a specific,
  well-known way: past a certain volume, the dedicated location itself
  becomes something the player learns to stop checking. This is the
  philosophy most vulnerable to becoming invisible through its own
  routineness, not through any single instance being wrong.

### 5. Social — relational presence

- **Purpose:** signal something involving another person — a message, a
  reaction, a friend's presence — rather than a system event.
- **Emotional role:** warmth and connection, sometimes anticipation
  ("who, and what did they say?"). This is the one philosophy whose
  emotional charge comes from *who* it's from more than *what* it says.
- **Interruption level:** variable by design, and that variability is a
  feature — most players want to know when a close friend does something,
  and don't want to know every time a stranger does. The philosophy is
  the same; the correct interruption level is not.
- **Attention management:** identity-forward — a name or avatar carries
  as much weight as the content, because the source is most of the point.
- **Repetition tolerance:** the least uniform of any philosophy here. It
  scales with relationship and community size in a way none of the
  others do — welcome at low volume from someone the player cares about,
  fatiguing almost immediately at high volume from a large or impersonal
  group. Getting this philosophy right is really about getting its
  *volume control* right, more than any single instance of it.

### 6. Anticipation — countdown and priming

- **Purpose:** prepare the player emotionally or tactically for something
  that hasn't happened yet, rather than report something that already
  has. This is the only forward-looking philosophy in the set.
- **Emotional role:** rising tension or readiness — a deliberate build,
  not a single spike.
- **Interruption level:** moderate, and often intentionally increasing as
  the anticipated moment gets closer, rather than constant.
- **Attention management:** the only philosophy here that's naturally
  persistent rather than transient — it needs to hold a presence across a
  duration, not flash once and resolve, because its job spans time by
  definition.
- **Repetition tolerance:** low to moderate. It only means something for
  events genuinely worth anticipating; used for minor or frequent things,
  it either loses its build-up entirely or starts to feel like background
  noise wearing a tension costume.

### 7. Delight — playful charm

- **Purpose:** exist for its own sake, as a small moment of personality
  or humor, rather than to convey information anyone strictly needs.
- **Emotional role:** amusement — the notification itself is the reward,
  distinct from Reward Reveal's job of announcing a reward that already
  exists elsewhere.
- **Interruption level:** low, and always safely skippable — nothing is
  lost if it's missed, which is part of what keeps it low-stakes enough
  to be charming rather than demanding.
- **Attention management:** typically opt-in or trivially dismissible;
  never gates anything and never should.
- **Repetition tolerance:** surprisingly low for something so
  low-stakes — charm fatigues faster than almost any other philosophy
  here. A joke told the five-hundredth time is not still a joke, even
  though nothing about the delivery changed; this is the sharpest
  contrast with Whisper, which tolerates infinite repetition specifically
  because it never tried to be charming in the first place.

### 8. Correction — error and failure feedback

- **Purpose:** explain why something the player tried to do didn't
  happen, so confusion doesn't linger past the moment of failure.
- **Emotional role:** mildly negative by necessity, but the philosophy's
  actual job is to *defuse* that feeling by being clear, not to amplify
  it by being dramatic.
- **Interruption level:** must be immediate — it has to land at the exact
  moment of the failed action — but should be brief; dwelling on an error
  compounds the negative feeling it exists to resolve.
- **Attention management:** tightly bound, spatially and temporally, to
  the specific action that failed — like Confirmation, but answering "no"
  instead of "yes."
- **Repetition tolerance:** low, but for a different reason than Alert or
  Delight — repeated instances of the same error aren't just fatiguing,
  they're a symptom that something upstream (the interface, the player's
  understanding, or the systems design) is unclear. A Correction that
  needs to repeat often has usually already failed at its actual job.

## What this exploration surfaces

A few patterns cut across all eight that are worth carrying into the
next stage rather than re-discovering there:

- **Interruption level and repetition tolerance are usually inverse, but
  not always for the same reason.** Alert is high-interruption,
  low-tolerance because urgency that repeats stops being urgent. Delight
  is low-interruption, low-tolerance for an entirely different reason —
  charm that repeats stops being charming. Two philosophies can land in
  the same place on this axis while getting there for opposite reasons,
  which matters for how each should actually be tuned.
- **Social breaks the pattern on purpose.** Its tolerance isn't a fixed
  property of the philosophy at all — it depends on who the notification
  is from and how many sources are competing for the same channel. Every
  other philosophy here has a roughly stable tolerance; Social's has to
  be actively managed.
- **Attention management is always downstream of emotional role, never
  chosen independently of it.** Alert wins the whole screen because
  alarm demands it. Confirmation and Correction anchor to the triggering
  action because they're answering something specific. Social foregrounds
  identity because the relationship is the content. Nothing here picked
  its placement strategy first and worked backward to a feeling — the
  feeling always came first.
- **Purpose is the root every other dimension actually derives from.**
  In every one of the eight, emotional role, interruption level,
  attention management, and repetition tolerance all read as consequences
  of purpose, not independent design choices. That's the practical
  takeaway for whatever comes next: pick the job a notification is doing
  before touching anything about how it looks or moves, because the rest
  of this document shows that almost everything else follows from that
  one decision.

## What this document does not do

It does not narrow these eight to a shortlist, does not assign any of
them a visual or motion treatment, and does not recommend one over the
others. That narrowing is real work belonging to the next stage, the
same way Reward Reveal's narrowing to five finalists was its own step
before `VISUAL_CONCEPTS.md` gave each of them a concrete treatment. All
eight are left intact here on purpose.
