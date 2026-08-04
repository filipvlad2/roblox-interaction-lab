# Reward Reveal — Visual Concept Exploration

**Stage:** Visual Concept Exploration. Design only — no implementation, no
Luau, no Roblox APIs, no changes to Interaction Lab itself. The purpose of
this document is to give a human enough to choose a direction before any
of it gets built.

Five reward philosophies survived the previous round: **Satisfying,
Prestige, Luxury, Collector, Social**. Each one below is developed into a
complete, concrete visual concept — not a mood board, a design brief
someone could hand to an artist or an implementer and get a consistent
result from. Where "Player perception" is discussed, it deliberately
follows the first-impression / repeated-use split from
`InteractionLab/ProductDesign/TESTING.md`, since that's the lens these
will eventually be judged through in the Lab.

These five are not five answers to the same question. They're five
different emotional jobs a reward can do. A game will likely need more
than one.

---

## 1. Satisfying

### Philosophy
The reward should feel like a good, clean hit — the digital equivalent of
a bubble-wrap pop or a well-weighted mechanical switch. No ceremony, no
waiting. The player should feel a small, immediate jolt of pleasure and
want to trigger it again. This is about the *act* of receiving, not the
content received.

### Storyboard
- **Beginning:** The triggering action completes — a match ends, a chest
  opens, currency drops. No wind-up. The reveal starts the instant it's
  earned.
- **Middle:** The reward icon snaps into existence with a tight, springy
  pop — a small overshoot, then an immediate settle. A short burst of
  particles or a quick screen-space ripple accompanies the pop, contained
  close to the reward itself.
- **End:** The reward locks into its resting state almost as fast as it
  appeared, then either docks into an inventory/currency counter with a
  quick "absorbed" motion, or sits for a single beat before fading.
  Nothing lingers.

### Motion language
Sharp, decisive scale overshoot — small, past 100%, snap back — no
float-in. Opacity appears almost instantly rather than fading. Movement
is compact: everything happens within a small radius, nothing travels far
across the screen. Timing is fast throughout. Rhythm is a single,
un-echoed beat — one clean impact, not a swell.

### Visual language
A single sharp flash of light at the moment of impact, not a sustained
glow — a camera flash, not a lamp. No layered or ambient lighting.
Minimal particles: a tight burst, not a shower. Color is bright and
saturated for one instant, then settles back into the game's normal
palette. Hierarchy: the reward is the only thing that moves, so the pop
reads instantly. No camera involvement — this lives entirely in the
HUD/UI layer and never pulls focus from gameplay.

### Audio direction
Crisp and percussive — closer to a mechanical toggle switch or a
knuckle-crack than a musical sting. Short, dry, no reverb tail. It should
sound identical the first time and the thousandth, like the tactile click
of a good keyboard.

### Player perception
**First time:** "Oh, that's a nice touch" — barely registers as a moment,
more a texture than an event. **After a hundred times:** this is where it
succeeds or fails. Tuned well, it becomes an invisible, welcome rhythm
players don't consciously notice but would miss instantly if removed.
Overtuned — too long, too flashy — it becomes the single most irritating
thing in the game by hour ten.

### Strengths
Scales to extremely high frequency without fatigue, if tuned correctly.
Mentally cheap — never interrupts flow. Reinforces a satisfying core loop
without demanding attention.

### Weaknesses
Because it never asks for attention, it never generates excitement or
memory either — nobody screenshots a Satisfying reveal. Feels cheap or
throwaway if used for something the player actually cares about.

### Best use cases
Currency pickups, common drops, XP ticks — any reward that happens many
times per session and must never become tiring.

### Never use for
A once-a-season achievement, a rare item, anything meant to be remembered
or shared. This philosophy applied to a big moment makes it feel like
nothing happened.

### AI Image Prompt
> A minimalist mobile game UI close-up, a small golden coin icon popping
> into existence with a sharp elastic scale-bounce, a tight burst of 6-8
> small bright particles radiating a short distance from it, a single
> bright white flash concentrated tightly around the coin, dark neutral
> UI background staying completely static and unlit, no ambient glow, no
> lens flare, crisp clean vector icon style, high contrast between the
> flash and the dark background, frozen mid-bounce at the peak of the
> overshoot, sense of a fast snappy mechanical impact, product-shot
> lighting, 4k UI mockup

---

## 2. Prestige

### Philosophy
The reward should feel earned and witnessed — even in solitude, the
player should feel like a small ceremony is happening in their honor.
This is about the achievement, not the object. The emotional target is
pride: "I did something that mattered."

### Storyboard
- **Beginning:** A held beat of anticipation — ambient gameplay UI dims
  slightly, and there's a distinct pause before anything happens, like a
  held breath before an announcement.
- **Middle:** The reward emblem rises or unfurls with weight and
  deliberation — a procession, not a snap. Light sweeps across it in a
  single deliberate pass, like a spotlight finding its subject. A title
  or rank name reveals itself in a separate, later beat, not
  simultaneously with the emblem.
- **End:** A settle into a composed, symmetrical resting pose, held
  noticeably longer than a typical UI element — long enough that the
  player consciously dismisses it rather than it disappearing on its own.
  The exit is a deliberate fade or dignified retreat, never abrupt.

### Motion language
Scale grows from slightly-under to rest with heavy, weighted easing —
slow deceleration, no springy overshoot (overshoot reads as playful, not
prestigious). Opacity builds in layers — background dim, then emblem,
then text, staggered rather than simultaneous. Movement is vertical and
centered, rising with a gravity-defying slowness. Timing is unhurried
throughout; the whole sequence should feel long relative to every other
reward type. Rhythm has a clear three-beat structure — hold, reveal,
settle — nothing feels rushed or skippable.

### Visual language
A single strong directional light sweep is the signature move — light as
ceremony, not sparkle. Glow is broad and soft, never sharp. Minimal or no
particles; if used, they drift slowly and rise, like embers or dust in a
light beam, never a burst. Color favors rich, saturated jewel tones or
metallics — deep gold, royal blue, bronze — over bright primaries. High
contrast between the lit subject and a darkened surround; everything else
recedes. Strong hierarchy: exactly one focal point at a time, revealed in
sequence. If a camera is available, a slow push-in reinforces importance.

### Audio direction
Orchestral or brass-adjacent — a rising swell with a resolved, consonant
landing, like a fanfare distilled to its essential three notes. Should
feel ceremonial and slightly formal, with real reverb and space around
it, unlike Satisfying's dry snap.

### Player perception
**First time:** "Whoa, that felt important" — genuine pride and a small
surge of motivation toward the next one. **After a hundred times:** the
ceremony must still feel earned, or it curdles into hollow pageantry. If
the underlying achievement is trivial, repeated grand ceremony reads as
insincere fast. This philosophy has the steepest fall from grace when
overused.

### Strengths
Creates genuine emotional peaks. Strongly reinforces long-term goals and
progression systems. Highly memorable.

### Weaknesses
Cannot be used frequently without devaluing itself — the ceremony *is*
the content, and ceremonies performed constantly stop being ceremonies.
Interrupts flow by design, which is a liability if timing is misjudged.

### Best use cases
Rank-ups, major milestones, boss first-clears, season completions —
anything rare that should feel rare.

### Never use for
Anything happening more than a handful of times per session. A Prestige
reveal for a common drop reads as absurd overstatement almost
immediately.

### AI Image Prompt
> A ceremonial video game achievement reveal UI, a golden ornate emblem
> slowly rising into frame at the vertical center of a darkened screen, a
> single dramatic beam of warm golden light sweeping diagonally across
> the emblem from upper left, soft wide glow radiating outward with
> visible light rays, fine drifting dust particles caught in the beam
> rising slowly, deep navy and black vignette surround fading to full
> darkness at the edges, rich gold and bronze metallic color palette,
> elegant serif-adjacent rank title text below the emblem still forming,
> symmetrical and centered composition, cinematic and reverent mood,
> subtle lens flare from the light sweep, high production value AAA game
> UI concept art, wide aspect ratio

---

## 3. Luxury

### Philosophy
The reward should feel expensive without saying so. Confidence through
restraint — the design trusts that quality doesn't need to shout. The
emotional target is quiet elevation: "this was made for someone with
taste," not "look how much just happened."

### Storyboard
- **Beginning:** Near-silence, visually. A single element — a fine line,
  a material surface, a closed case or seal — appears with almost no
  fanfare, more felt than announced.
- **Middle:** A slow, controlled reveal mechanic — an unwrap, an unfold,
  a case opening, a surface catching light as it turns. Every motion is
  smooth and continuous, never segmented or bouncy. If there's a "reveal
  moment," it's a single soft bloom of light across a material surface —
  light catching brushed metal or glass — rather than a burst.
- **End:** The object comes to rest in a considered, balanced composition,
  held in soft, even light. No further motion. The stillness itself is
  the final beat — the absence of continued animation communicates
  confidence.

### Motion language
Scale, if used at all, is minimal and continuous — closer to a slow zoom
than a bounce; overshoot is never used. Opacity fades are long and even,
never staggered for drama. Movement favors rotation and parallax — an
object slowly turning to catch light — over position changes. Timing is
slow and even throughout, but unlike Prestige it never swells; it's a
flat, confident pace. Rhythm is singular and continuous — one unbroken
gesture, not a sequence of beats.

### Visual language
Lighting *is* the visual vocabulary here — soft, directional,
material-aware light that reveals texture (metal, glass, fabric grain)
rather than generic UI glow. No particles, ever — particles read as cheap
next to this restraint. Color is desaturated and tightly controlled,
often near-monochrome with one precise accent (a single gold line, one
jewel tone), closer to a fashion or product ad than a game HUD. Contrast
is used sparingly and precisely, just enough to separate the object from
a deep, softly gradiented background. Hierarchy is achieved through
negative space, not motion — the object is often small in frame,
surrounded by generous empty space, which itself signals value. A camera,
if used, moves in an extremely slow, subtle dolly or orbit to sell
material quality.

### Audio direction
Understated and tactile — a soft mechanical or material sound (a case
latch, fabric, a single low resonant tone) rather than a musical sting.
Closer to an ASMR unboxing video than a game jingle. If music is present
at all, it's a single sustained low note or a soft pad, never a melody.

### Player perception
**First time:** "This feels different from everything else in the
game" — a distinct sense of tier without needing a label to say so.
**After a hundred times:** holds up better than almost any other
philosophy, specifically because it never asks for excitement, so there's
little energy to run out of. The opposite failure mode is real, though —
enough repetition and the restraint can start to feel like a missed
opportunity to celebrate, rather than confident taste.

### Strengths
Communicates rarity and value more convincingly than any louder
philosophy, because the restraint itself is the signal. Ages well —
doesn't fatigue the way high-energy reveals do. Clearly differentiates
premium content from everything else in the game.

### Weaknesses
Easy to get wrong in the other direction — if the underlying item isn't
actually special, restraint just reads as a bug or an unfinished feature,
since there's no celebratory energy to fall back on. Requires real art
direction and lighting fidelity to land; a cheap-looking "quiet" reveal
has nowhere to hide.

### Best use cases
Premium currency, high-tier cosmetics, battle-pass exclusives — anything
explicitly monetized or meant to signal status through scarcity rather
than spectacle.

### Never use for
Free, common, or frequent rewards. The restraint reads as anticlimactic,
not sophisticated, if the player doesn't already believe the item is
valuable.

### AI Image Prompt
> A luxury product-style video game item reveal UI, a single dark
> rectangular case slowly opening at its hinge on a deep charcoal
> gradient background, soft directional studio lighting catching the
> brushed metal interior surface, one small cosmetic item resting inside
> on dark velvet-like material, a single thin gold accent line along the
> case edge as the only saturated color, extremely minimal composition
> with large areas of negative space, no particles, no glow burst, no
> motion blur, soft even shadows, shallow depth of field with the item in
> sharp focus, styled like a high-end watch or jewelry advertisement,
> muted near-monochrome palette with one precise gold highlight,
> restrained and confident mood, professional product photography
> lighting, 4k concept render

---

## 4. Collector

### Philosophy
The reward should feel like a discovery, not a delivery. The emotional
target is curiosity resolving into satisfaction — the player should be
actively wondering "what did I get?" right up until the moment they know,
and the reveal's job is to draw that question out just long enough to
matter. This is about the *slot*, not the object — where does this fit in
what I'm building?

### Storyboard
- **Beginning:** The container — pack, chest, capsule — presents itself
  opaque and sealed. The player can see something is coming but nothing
  about what. A tactile "opening" gesture begins: a seam splits, a lid
  lifts, a wrapper tears.
- **Middle:** A staged reveal that separates *how good* from *what*.
  First, a rarity-tier signal — a color, a border, a tier-specific effect
  intensity — appears before the item is visible, so the player reacts to
  the tier a half-beat before they see the content. Then the item itself
  resolves, often with a flip, spin, or unwrap gesture that treats it
  like a physical card or object.
- **End:** The item settles into a card-like resting frame, clearly
  bordered and labeled — name, rarity, maybe a collection index number.
  It doesn't just disappear; it's held long enough to be read and
  compared, then explicitly filed with a motion toward a
  collection/inventory icon, rather than fading.

### Motion language
Scale often includes a flip or turn — rotating on an axis to reveal a
"front" — rather than a pure grow; it evokes a physical card flip.
Opacity is used deliberately to *stage* the reveal (tier glow before item
silhouette, silhouette before full detail) rather than a single fade.
Movement favors a spin or flip axis, settling into a fixed card
orientation. Timing has a distinct suspense gap — a brief, deliberate
pause between "container opens" and "content confirmed," longer for
higher rarities. Rhythm is tiered by design: common items move fast and
simply, rare items get a slower, more elaborate version of the *same*
beats — the structure stays constant while intensity scales with rarity,
which is this philosophy's signature move.

### Visual language
Color is the primary rarity language — a strict, legible tier palette
(grey / green / blue / purple / gold, or similar) the player learns to
read instantly over time. Glow and particle intensity scale directly with
rarity, so common items get almost none and top-tier items get a
genuinely bigger show — the visual effort itself communicates value
before the player reads anything. Lighting is graphic and stylized rather
than naturalistic — trading-card foil sheen, not cinematic spotlighting.
Hierarchy: the rarity signal always resolves before the item, never
simultaneously. Camera relationship is typically static and frontal, like
a card held up to you — this is about presentation-to-camera, not
environmental spectacle.

### Audio direction
A distinct sonic identity per rarity tier — common items get a light,
quick chime; rare items get a fuller, richer tone, often with a shimmer
or sparkle layered on top for the top tier. The sound should function
like the color coding: recognizable and tier-legible even with eyes
closed.

### Player perception
**First time:** genuine suspense — "let's see what I got" — and curiosity
about the system itself, what tiers exist. **After a hundred times:** the
most fatigue-resistant of the five, precisely because the *content*
varies even when the *format* doesn't; players don't tire of the ritual
because the outcome stays uncertain each time. The low-rarity fast path
has to stay genuinely quick, though, or the sheer volume of "nothing
much" pulls turns into a chore.

### Strengths
Sustains engagement over very long play periods better than almost any
other philosophy, because it's built on variable, not fixed, reward.
Naturally teaches its own rarity system through repetition. Extremely
well suited to systems with many distinct items.

### Weaknesses
Requires a genuine rarity/tier system to work — bolted onto a single flat
reward type, it has nothing to stage. Can drift toward gambling-adjacent
psychological patterns if tuned aggressively, which is a real design
responsibility, not just an aesthetic choice.

### Best use cases
Card packs, loot boxes, gacha pulls, cosmetic collections, trading
systems — anything with meaningful rarity tiers and a real collection to
build toward.

### Never use for
A single guaranteed reward with no variance. Staging suspense around a
certain outcome reads as a lie the moment the player notices there was
never any doubt.

### AI Image Prompt
> A trading card pack opening UI concept for a video game, a glossy foil
> card mid-flip rotating on its vertical axis against a dark gradient
> background, a bright purple-to-gold rarity glow emanating from behind
> the card silhouette before its artwork is fully visible, sharp graphic
> light rays radiating outward in a starburst pattern, holographic foil
> shimmer texture across the card surface, a small rarity gem icon in the
> corner already visible and glowing, other unopened cards blurred in the
> background suggesting more to come, vivid saturated purple and gold
> color scheme with sharp graphic contrast, dynamic diagonal composition
> suggesting motion and suspense, mobile gacha game aesthetic, crisp
> vector-illustrated style with foil highlights, energetic and
> anticipatory mood

---

## 5. Social

### Philosophy
The reward should feel incomplete until someone else has seen it. The
emotional target is validated visibility — pride that specifically
depends on an audience, real or implied. This is about the announcement,
not the object; the item is almost secondary to the fact that other
people now know about it.

### Storyboard
- **Beginning:** The moment breaks the player's private HUD boundary —
  rather than appearing in a personal reward panel, it announces itself
  in a shared space: a killfeed-style banner, a world-space effect
  visible to nearby players, a broadcast to the server or party.
- **Middle:** The reveal is built to be legible from a distance and to
  strangers — bold, high-contrast, name-forward, with the player's
  identity often as prominent as the reward itself. Where the game world
  allows it, a visual effect plays in 3D space around the player's
  character, not just their personal UI, so nearby players physically see
  it happen.
- **End:** The announcement persists in a shared, semi-permanent space
  longer than a personal HUD element would — a feed, a banner, a
  scoreboard highlight. Its job isn't done when the earning player has
  seen it; it's done when others plausibly have.

### Motion language
Scale and movement are built for legibility at a glance from other
viewpoints — bold, unambiguous shapes, often a horizontal banner rather
than a centered icon, because it has to read even in someone else's
peripheral vision. Opacity transitions are quick and confident, not
subtle — this needs to interrupt other players' attention briefly, which
is the point. Timing includes a "broadcast hold" — longer on-screen or
in-feed duration than a personal reward, because the audience arrives on
its own schedule, not the player's. Rhythm often includes a secondary
echo — a smaller, delayed confirmation in a feed or log after the primary
flashy moment, so latecomers still catch it.

### Visual language
High contrast and saturated "broadcast" colors, designed to cut through a
busy multiplayer screen — closer to sports-broadcast graphics than
personal UI. Player identity — name, avatar, team color — is a
first-class visual element, often as large as the reward itself. Particle
or effect work, if present, is often anchored in world-space around the
character rather than personal screen-space UI, so it's visible to others
from any angle. Hierarchy: the *who* matters as much as the *what* — most
other philosophies bury identity, this one foregrounds it. Camera
relationship is the most flexible of the five; it may briefly pull to a
killcam- or spectator-style framing specifically to serve other players'
viewpoints, not just the earning player's.

### Audio direction
Bold and public — a stinger or announcer-style sound designed to be heard
by everyone nearby, not a private cue. Often has a "broadcast" quality,
like a stadium PA system or sports commentary sting, distinct from the
more intimate audio treatment of any of the other four philosophies.

### Player perception
**First time:** a jolt of exposure — part pride, part self-consciousness,
"everyone just saw that." **After a hundred times:** the most dependent
of the five on genuine social context to keep working. In an empty server
or single-player context it collapses into Prestige without an audience,
which reads as hollow; in a genuinely populated, socially engaged
environment it can stay compelling indefinitely, because the audience is
different every time even if the format isn't.

### Strengths
Unmatched at reinforcing multiplayer status and competitive identity.
Drives organic word-of-mouth and screenshot/clip sharing better than any
private reveal could. Strengthens community awareness of what's rare or
impressive.

### Weaknesses
Fundamentally depends on infrastructure and population it can't provide
for itself — a shared feed, other present players, a reason for them to
care. Can be actively unwelcome if overused (constant broadcast
interruptions fatigue the *audience*, not just the recipient) or
embarrassing rather than flattering if applied to something trivial.

### Best use cases
Competitive achievements, rare drops in a populated shared server,
guild/party milestones, leaderboard events — anything whose value is
partly defined by scarcity among peers.

### Never use for
Single-player content, anything personal or private in nature, or any
reward common enough that broadcasting it constantly would fatigue
everyone else on the server.

### AI Image Prompt
> A multiplayer video game broadcast-style achievement banner UI, a bold
> wide horizontal banner sliding in from the top of a busy in-game HUD,
> large bright player name and avatar icon on the left in team-colored
> high-contrast lettering, a glowing trophy or medal icon on the right
> side of the banner, sharp diagonal light streaks behind the banner
> suggesting motion and energy, saturated red gold and white
> sports-broadcast color palette, small blurred killfeed-style entries
> stacking below the main banner, other players' HUD elements faintly
> visible in the background suggesting a live multiplayer match, bold
> condensed sans-serif typography, energetic esports broadcast graphic
> style, high contrast and legible at a glance, dynamic motion-blur trail
> on the banner's entry animation, competitive and public mood

---

## Ranking and Recommendation

These five aren't competing for the same job, so "best" only means
something against a stated question. The question that actually matters
right now — the first production interaction to build and validate under
`ROADMAP_V2.md`'s Milestone 2 — is: **which of these is the most valuable
to build and prove out first?** Ranked against that question, not against
"which is the best concept":

1. **Satisfying** — the most broadly applicable of the five by a wide
   margin. Almost every game has *something* that rewards the player
   dozens or hundreds of times a session, and getting that feeling right
   pays off constantly. It's also the lowest-risk build: contained,
   self-testable in isolation, and its success criteria (does it stay
   pleasant at high repetition) map directly onto what the Lab is already
   built to measure.
2. **Prestige** — nearly as universal; almost every game has *some*
   milestone moment worth a ceremony. Ranked second only because it's
   inherently occasional, so there's less raw frequency to validate
   against, and getting the "still feels earned" judgment right needs a
   real milestone to test it on, which is harder to fake convincingly in
   an isolated benchmark than Satisfying's constant, low-stakes loop.
3. **Collector** — very strong, but narrower: it only pays off in a game
   that actually has a rarity/collection system to stage against. Where
   it applies, it's arguably the most powerful of the five for long-term
   engagement, but it's not a fit for every project the way the first two
   are.
4. **Luxury** — powerful and distinctive, but the riskiest to build first
   precisely because its success depends entirely on execution quality —
   there's no motion or particle work to hide behind if the lighting and
   material work aren't excellent. Better attempted once the Lab (and
   whoever's building it) has a couple of validated wins behind them.
5. **Social** — the hardest to validate *in the Lab specifically*, not
   the weakest concept. Its entire premise is an audience, and an
   isolated benchmark session is definitionally an audience of one. This
   is a real, useful philosophy for the right game, but proving it out
   convincingly will need something closer to a live, populated test than
   a single-developer comparison session — worth flagging as a
   methodology question for whoever picks this one, not just a build
   question.

**Recommendation:** if the goal is to ship the first validated,
production-quality Reward Reveal and learn something reusable from doing
it, **Satisfying** is the strongest starting point — highest
applicability, lowest execution risk, and the cleanest fit for how the
Lab already tests things. That's a recommendation, not a decision. If the
actual motivating reward for this benchmark is a milestone, a premium
item, a collection pull, or a competitive moment, the right starting
concept is whichever one of the other four actually matches that reward —
building the "wrong" philosophy well is still the wrong choice.

**Why each one exists, restated plainly:** Satisfying keeps the common
case pleasant. Prestige makes the rare case matter. Luxury makes the
premium case feel worth paying for. Collector makes the long game worth
returning to. Social makes the shared case worth having other people
around for. A game that only ever had one of these would be missing
something a real reward system needs — that's the actual argument for
building this as a toolkit of five, not settling on one universal reward
reveal.
