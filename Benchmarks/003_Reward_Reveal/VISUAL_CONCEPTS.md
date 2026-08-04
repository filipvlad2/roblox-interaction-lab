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

**On the image prompts:** each concept below carries three, not one —
**Variation A** is the most literal reading of that concept's Motion and
Visual language sections above; **Variation B** pushes the same concept
toward AAA cinematic production value; **Variation C** reinterprets the
same philosophy through Roblox's actual visual idiom (rounded UI,
flat-shaded materials, Builder Sans-style type) — the version closest to
what could plausibly ship. Each variation is broken into labeled fields;
concatenate them, comma-separated, into a single prompt string when
sending to an image model. A negative prompt follows each concept's three
variations and applies to all three, since it encodes what would violate
that philosophy specifically, not just generic image-quality boilerplate.
Fifteen prompts total, five negative prompts — enough to generate a full
first pass of concept art before any implementation begins.

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

### Visual Exploration — Three Image Prompts

#### Variation A — Faithful
- **Composition:** small centered reward icon (coin/gem) alone against a dark neutral field, generous empty space around it so the pop reads instantly
- **Camera angle:** flat, straight-on orthographic HUD view, no perspective depth
- **Framing:** tight close-up crop on the icon and its immediate particle burst only, no surrounding UI chrome visible
- **UI layout:** none beyond the icon itself — a HUD micro-moment, not a screen
- **Lighting:** one sharp, instantaneous white flash sourced directly behind/around the icon, no ambient fill
- **Materials:** simple flat-shaded vector icon material, glossy highlight on one edge only
- **Typography:** none — no text in frame
- **Glow:** a tight, hard-edged glow ring exactly at the icon's silhouette, not a soft bloom
- **Particles:** 6-8 small bright triangular/circular shards, short travel distance, uniform size
- **Implied motion:** icon frozen at the peak of a scale overshoot, particles mid-flight outward, a snap just completed
- **Emotional atmosphere:** quick, clean, almost mechanical satisfaction — a single decisive click made visible
- **Color palette:** dark neutral charcoal background, one saturated warm color (gold or cyan) for the icon and flash
- **Realism level:** clean flat/semi-realistic vector-render hybrid, not photoreal
- **Focal pull:** the flash-lit icon at dead center is the only thing the eye can land on

#### Variation B — Premium / AAA
- **Composition:** centered-icon idea rendered with cinematic depth — subtle parallax dust and a soft depth-of-field falloff behind the icon
- **Camera angle:** slight low-angle push toward the icon, like a macro product shot
- **Framing:** extreme close-up, icon fills a third of the frame, shallow focus falloff at the edges
- **UI layout:** a barely-visible, out-of-focus HUD edge in the far background to suggest context without competing for attention
- **Lighting:** a physically-based hard key flash with realistic falloff and a faint bounce light catching the icon's underside
- **Materials:** high-fidelity metallic PBR surface — real specular highlights, subtle micro-scratches, believable metal or crystal
- **Typography:** none
- **Glow:** crisp HDR bloom exactly at the flash point, tightly controlled so it doesn't wash out material detail
- **Particles:** physically-simulated metallic shards catching individual specular highlights as they fly
- **Implied motion:** motion-frozen mid-bounce with faint motion blur trailing the fastest particles, speed sold without smearing the icon
- **Emotional atmosphere:** a satisfying impact rendered with real weight and craftsmanship — still instant, but expensive-feeling instant
- **Color palette:** dark neutral background, one rich saturated accent color with true HDR highlight values
- **Realism level:** near-photoreal cinematic render, Unreal Engine-quality material and lighting fidelity
- **Focal pull:** the specular hot-spot on the icon's material, reinforced by the tightest point of the bloom

#### Variation C — Stylized / Roblox-native
- **Composition:** centered chunky icon with rounded, friendly proportions against a simple flat-colored backdrop
- **Camera angle:** flat orthographic HUD view, matching how Roblox mobile/PC UI actually renders
- **Framing:** icon sized as it would appear inside a real Roblox currency counter or inventory slot, a rounded UI frame edge just entering the shot
- **UI layout:** a simple rounded rectangle counter/slot element (UICorner-style rounded frame) partially visible at one edge, coin mid-flight toward it
- **Lighting:** bright, even, cheerful — no dramatic shadow, flat toon-shaded lighting typical of Roblox's default rendering
- **Materials:** smooth, glossy, slightly plasticky flat-shaded material, the characteristic look of a Roblox MeshPart or simple icon asset
- **Typography:** a small, chunky, rounded sans-serif "+1" or "+10" popping up beside the icon, Gotham/Builder-Sans-style
- **Glow:** a simple bright rim-light outline around the icon, Roblox ParticleEmitter-style radial glow, not a photographic bloom
- **Particles:** small bright rounded sparkle shapes, uniform and toy-like, scattering in a simple radial burst
- **Implied motion:** a bouncy squash-and-stretch pop, exaggerated slightly beyond real-world physics the way Roblox UI typically animates
- **Emotional atmosphere:** cheerful, energetic, instantly readable — built for a young, broad audience
- **Color palette:** bright saturated primary colors (Roblox-typical blues, golds, greens) against a clean flat background
- **Realism level:** flat-shaded stylized 3D, low-poly-adjacent, unmistakably a Roblox UI asset rather than a photoreal render
- **Focal pull:** the bouncing icon plus its floating "+" text, read together as one unit

#### Negative Prompt
No slow or ceremonial mood; no sustained ambient glow or lingering light;
no particle showers or confetti; no large empty dramatic backgrounds; no
somber or moody color grading; no text-heavy UI chrome; no clutter
competing with the icon; no lens flare streaks; no photorealistic human
hands or faces; no blurry or illegible micro-text; no dark/desaturated
palette; nothing implying the moment lasts longer than an instant.

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

### Visual Exploration — Three Image Prompts

#### Variation A — Faithful
- **Composition:** symmetrical, centered vertical composition — emblem on the vertical axis, generous dark space above and below
- **Camera angle:** straight-on, slightly low, as if looking up at something presented on a pedestal
- **Framing:** medium shot — emblem plus enough surrounding darkness to feel like a stage, title text area visible below but still forming
- **UI layout:** a clean vertical stack — emblem, then a horizontal divider line, then title text space — nothing beside it
- **Lighting:** one dramatic diagonal spotlight beam sweeping across the emblem from upper-left, rest of frame in deep shadow
- **Materials:** cast metal or embossed emblem material — matte gold with polished raised edges
- **Typography:** elegant serif-adjacent engraved-style lettering, evenly kerned, still resolving below the emblem
- **Glow:** broad, soft ambient glow radiating from the emblem outward, no hard edges
- **Particles:** fine dust motes drifting slowly upward through the light beam, sparse and unhurried
- **Implied motion:** emblem caught mid-rise, faint upward motion trail beneath it, the spotlight sweep still visibly in transit
- **Emotional atmosphere:** reverent, ceremonial, hushed — a coronation moment
- **Color palette:** deep navy-black surround, rich gold and bronze metallics, no other hues
- **Realism level:** cinematic semi-realistic render, believable materials without full photoreal skin/fabric detail
- **Focal pull:** the point where the spotlight beam crosses the emblem's highest raised surface

#### Variation B — Premium / AAA
- **Composition:** the same symmetrical stage expanded into fuller environmental context — a suggestion of an arena, hall, or altar space receding into darkness behind the emblem
- **Camera angle:** slow cinematic low-angle push-in, a faint sense of camera movement implied through motion blur at the frame edges
- **Framing:** wider shot including environmental context (columns, floor reflection, architectural silhouettes) without ever competing with the emblem
- **UI layout:** emblem and text integrated into a believable in-world ceremonial set piece rather than flat HUD chrome
- **Lighting:** volumetric god-rays through the spotlight beam, visible atmospheric haze, realistic light falloff and bounce onto a reflective floor
- **Materials:** physically-based gold and bronze with real anisotropic metal highlights, fine engraved micro-detail visible up close, a faint reflection on a polished floor below
- **Typography:** precisely engraved metallic lettering with real dimensional depth and a subtle specular catch-light along each letter's edge
- **Glow:** full volumetric bloom with visible light shafts, HDR highlight blowout exactly at the beam's core
- **Particles:** denser, more visible drifting dust and faint floating embers, each catching individual light glints
- **Implied motion:** a powerful sense of a just-completed rise, floor-reflection still rippling, dust still settling
- **Emotional atmosphere:** full AAA cinematic grandeur — the scale and craft of a boss-defeat cutscene or Olympic medal ceremony
- **Color palette:** deep black-navy surround, saturated gold/bronze/royal-blue, one crisp white highlight point
- **Realism level:** photoreal cinematic render, film-quality volumetric lighting and material fidelity
- **Focal pull:** the volumetric light shaft's brightest core striking the emblem's highest point, reflected faintly on the floor below

#### Variation C — Stylized / Roblox-native
- **Composition:** centered chunky emblem/badge icon, simplified into bold flat shapes rather than fine engraving
- **Camera angle:** flat HUD-facing view with a simple radial light burst behind it, no environmental depth
- **Framing:** medium-tight shot of the badge and a rounded UI card frame beginning to form beneath it
- **UI layout:** a rounded rectangular "rank card" (UICorner-style panel) rising into frame, badge icon on top, bold text label below inside the card
- **Lighting:** simplified radial light burst (Roblox beam/ParticleEmitter-style) rather than volumetric haze — bright rays drawn as flat graphic shapes
- **Materials:** smooth flat-shaded gold material with a single bright highlight band, toy-like rather than finely engraved
- **Typography:** bold, chunky, rounded sans-serif rank title, high legibility, Roblox default UI font weight
- **Glow:** a bright flat-colored radial glow behind the badge, graphic rather than photographic
- **Particles:** simple bright star or sparkle shapes arranged in a clean radial pattern, not naturalistic dust
- **Implied motion:** a confident upward pop-and-settle, slight bounce at the top of the rise
- **Emotional atmosphere:** proud and celebratory but friendly and readable rather than solemn — achievement-unlocked energy
- **Color palette:** bright gold and royal blue against a simple dark or gradient backdrop, high saturation throughout
- **Realism level:** flat-shaded stylized 3D/2D hybrid, clean vector-adjacent rendering typical of Roblox badge and rank UI
- **Focal pull:** the badge icon at the card's top edge, reinforced by the radial burst directly behind it

#### Negative Prompt
No fast or snappy motion energy; no bright primary-color confetti
bursts; no busy or cluttered background detail; no comedic or cartoonish
exaggeration; no more than one light source; no crowded typography or
multiple competing text blocks; no low-contrast washed-out lighting; no
handheld-camera shake; no random unrelated particles; no visual noise
around the emblem; nothing that reads as casual or throwaway.

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

### Visual Exploration — Three Image Prompts

#### Variation A — Faithful
- **Composition:** a single small object off-center within a large, mostly empty frame — negative space is the dominant compositional element
- **Camera angle:** eye-level, perfectly still, no dramatic tilt
- **Framing:** wide enough that the object occupies a small fraction of the frame, deliberately underscored by empty space
- **UI layout:** no UI chrome at all — reads as a product photograph, not a HUD element
- **Lighting:** single soft directional studio light source, long soft shadow, gentle falloff across a gradiented backdrop
- **Materials:** brushed metal case or velvet-lined interior, fine fabric grain and metal texture both clearly readable
- **Typography:** none, or a single small discreet label in a thin, minimal sans-serif, easily missed
- **Glow:** none — light is entirely functional/material-revealing, never decorative
- **Particles:** none
- **Implied motion:** a case caught at the exact midpoint of opening, hinge still visibly in motion, nothing else moving
- **Emotional atmosphere:** quiet, controlled, confident — the visual equivalent of a held breath
- **Color palette:** near-monochrome charcoal and warm grey, one small precise gold or jewel-tone accent
- **Realism level:** clean product-photography realism, sharp focus on the object, soft falloff elsewhere
- **Focal pull:** the single accent color point against an otherwise desaturated frame

#### Variation B — Premium / AAA
- **Composition:** the same restrained single-object framing, with a more elaborate, believable environment implied at the very edges of focus — a hint of a display room or vault
- **Camera angle:** an extremely slow implied orbit, captured mid-turn, object at a three-quarter angle showing both its form and a catching highlight
- **Framing:** tight, controlled close-up with genuine shallow depth of field, background fully dissolved into soft bokeh
- **UI layout:** no UI chrome — full cinematic product-shot realism, as if for a real luxury brand campaign
- **Lighting:** multi-source studio lighting rig implied — a soft key, a subtle rim light separating the object from the background, realistic global illumination
- **Materials:** fully physically-based rendering — real anisotropic brushed metal, glass with accurate refraction, fabric with visible weave under raking light
- **Typography:** a minimal engraved or embossed logotype-style mark, barely visible, catching light rather than being lit directly
- **Glow:** none — strictly no decorative glow, only physically accurate specular highlights
- **Particles:** none
- **Implied motion:** a faint, almost imperceptible motion blur on the one moving hinge or surface, everything else tack-sharp
- **Emotional atmosphere:** full luxury-advertising production value — the confidence of a brand with nothing to prove
- **Color palette:** near-monochrome deep charcoal and warm neutral tones, one precise saturated accent rendered in true HDR
- **Realism level:** full photorealistic render, indistinguishable from a real luxury product photograph
- **Focal pull:** the specular highlight where the key light catches the object's primary material surface

#### Variation C — Stylized / Roblox-native
- **Composition:** a single simplified item icon inside a clean rounded card frame, still built around generous negative space even in a flatter style
- **Camera angle:** flat HUD-facing view with a very slight, slow implied rotation of the item within its frame
- **Framing:** the item sits small and centered within a noticeably larger, mostly empty rounded panel, honoring the same restraint in Roblox's flatter visual language
- **UI layout:** a single dark rounded rectangular card (UICorner, subtle drop shadow) with one item icon centered inside and a thin single-color accent border
- **Lighting:** a soft, simple gradient across the card background suggesting depth without literal material lighting simulation
- **Materials:** smooth, slightly glossy flat-shaded material with one clean highlight band, simplified but still legibly "premium" relative to standard Roblox item icons
- **Typography:** a single small, refined (not bold/chunky) sans-serif label, deliberately quieter than typical Roblox UI text
- **Glow:** a very faint, thin outline glow in the single accent color, restrained rather than radiant
- **Particles:** none — the absence of particles is itself the signal, same as the other two variations
- **Implied motion:** a slow, minimal rotation caught mid-turn, otherwise still
- **Emotional atmosphere:** elevated and calm relative to the rest of a typically bright, energetic Roblox UI — meant to visibly stand apart from common-rarity items
- **Color palette:** muted dark background with a single restrained metallic or jewel-tone accent, deliberately less saturated than typical Roblox UI
- **Realism level:** flat-shaded stylized 3D consistent with Roblox rendering, but with unusually disciplined restraint compared to typical Roblox UI energy
- **Focal pull:** the single accent-colored border line framing the otherwise quiet card

#### Negative Prompt
No particles of any kind; no bright bursts or flashes; no confetti or
sparkle showers; no busy or saturated multi-color palette; no crowded
composition; no more than one accent color; no fast or bouncy implied
motion; no cartoonish proportions; no cluttered typography; no
overexposed or blown-out highlights; no generic mobile-game UI framing;
no visual noise filling the negative space — the empty space must stay
empty.

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

### Visual Exploration — Three Image Prompts

#### Variation A — Faithful
- **Composition:** a glossy card centered mid-flip, rotating on its vertical axis, dark gradient background behind it
- **Camera angle:** straight-on frontal, as if the card were being held up directly to the viewer
- **Framing:** medium-close, card fills roughly half the frame with room for its rarity glow to radiate outward
- **UI layout:** card silhouette plus a small rarity-tier gem/icon already visible in one corner, other unopened cards softly blurred in the background
- **Lighting:** sharp graphic light rays radiating outward in a starburst pattern from behind the card
- **Materials:** holographic foil surface with a visible shimmer/rainbow sheen catching the light at the current rotation angle
- **Typography:** none yet resolved on the card face — reveal still in progress
- **Glow:** a bright tier-colored glow (purple-to-gold gradient) emanating from directly behind the card silhouette
- **Particles:** none beyond the graphic light rays — the light itself carries the energy, not floating particles
- **Implied motion:** card caught mid-rotation, motion blur on its leading edge, clearly still turning
- **Emotional atmosphere:** anticipatory, energetic, suspenseful — the exact instant before knowing
- **Color palette:** dark background, vivid saturated purple-to-gold rarity gradient, sharp graphic contrast
- **Realism level:** crisp vector-illustrated style with foil highlight rendering, not photoreal
- **Focal pull:** the rarity-gem icon already glowing in the corner, drawing the eye before the card face is even readable

#### Variation B — Premium / AAA
- **Composition:** the same mid-flip card within a fuller cinematic environment — a dark reflective table or pedestal surface beneath it, other cards softly visible around it
- **Camera angle:** a slight dynamic low angle with a subtle dolly move implied, adding weight to the flip
- **Framing:** tighter, more dramatic close-up on the card's leading edge as it catches the light mid-turn
- **UI layout:** a physical card object in a believable lit environment rather than flat graphic space, other packs/cards realistically scattered nearby
- **Lighting:** realistic studio-quality rim lighting plus a true holographic diffraction effect across the foil, catching multiple colors as it turns
- **Materials:** physically accurate foil card stock — visible card thickness, slightly worn edges, real light diffraction across the holographic layer
- **Typography:** a partially legible embossed rarity label beginning to catch light, foil-stamped rather than flat-printed
- **Glow:** full volumetric colored glow with real light scatter through implied atmospheric haze
- **Particles:** a few fine light-catching dust motes in the beam, barely visible, purely atmospheric
- **Implied motion:** strong motion blur on the fastest-moving edge of the card, a realistic sense of weight and inertia in the flip
- **Emotional atmosphere:** high-stakes, cinematic suspense — the scale of a AAA loot-reveal cutscene
- **Color palette:** rich saturated purple-to-gold with true HDR highlights, deep neutral shadow tones
- **Realism level:** photoreal cinematic render with accurate material physics
- **Focal pull:** the point of sharpest holographic diffraction on the card's surface, mid-turn

#### Variation C — Stylized / Roblox-native
- **Composition:** a chunky, simplified card or capsule icon opening, bold flat shapes, centered in frame
- **Camera angle:** flat HUD-facing view, matching a mobile/PC gacha-pull screen
- **Framing:** card or capsule fills a large central UI panel, rounded corners, clean edges
- **UI layout:** a rounded rectangular reveal panel (UICorner) with a bold tier-colored border already visible, capsule halves splitting open beside it
- **Lighting:** bright, flat, graphic light burst behind the panel — simple radial gradient rather than physical light simulation
- **Materials:** smooth glossy flat-shaded plastic-like capsule material, simplified foil suggested through a simple diagonal shine band rather than true holography
- **Typography:** bold, chunky, high-contrast rounded sans-serif rarity label ("RARE" / "EPIC"-style), unmistakably legible at a glance
- **Glow:** a bold, saturated flat-colored glow ring matching the rarity tier, graphic rather than atmospheric
- **Particles:** bright simple star/sparkle shapes bursting outward in a clean, toy-like radial pattern
- **Implied motion:** a bouncy pop-open motion, capsule halves still visibly separating
- **Emotional atmosphere:** bright, exciting, immediately legible — built for a broad, young audience used to reading rarity tiers instantly
- **Color palette:** bold saturated tier colors (bright purple/gold) against a clean dark or gradient backdrop
- **Realism level:** flat-shaded stylized 3D, unmistakably a Roblox gacha/capsule UI rather than a trading-card render
- **Focal pull:** the bold rarity-colored border and burst, readable before any other detail

#### Negative Prompt
No fully resolved item artwork visible (the suspense must remain
intact); no muted or desaturated color grading; no slow or ceremonial
pacing; no single flat lighting with no directional rays; no cluttered
background unrelated to the pack/card motif; no generic treasure-chest
clichés; no unreadable or illegible rarity labeling; no random unrelated
particles unconnected to the light-ray motif; no low-contrast tier colors
that could be confused with each other; no photograph-real physical
trading cards outside of Variation B, where physical card realism is the
explicit point.

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

### Visual Exploration — Three Image Prompts

#### Variation A — Faithful
- **Composition:** a wide horizontal banner sliding in from the top edge of a busy in-game HUD
- **Camera angle:** standard first/third-person gameplay HUD view, banner overlaid across the top
- **Framing:** full HUD width, banner is a thin horizontal strip rather than a centered card
- **UI layout:** player name and avatar icon on the left in bold team-colored lettering, a glowing trophy/medal icon on the right, small blurred killfeed-style entries stacking below
- **Lighting:** flat, bright, high-contrast broadcast-style lighting, no soft ambient falloff
- **Materials:** flat graphic banner material, sharp clean edges, no texture detail
- **Typography:** bold condensed sans-serif, high legibility at a glance, team-colored
- **Glow:** a moderate glow around the trophy/medal icon only, not the whole banner
- **Particles:** none beyond sharp diagonal graphic light streaks behind the banner suggesting motion and energy
- **Implied motion:** the banner caught mid-slide-in, a motion-blur trail on its leading edge
- **Emotional atmosphere:** public, energetic, slightly urgent — an announcement meant to be noticed
- **Color palette:** saturated red, gold, and white sports-broadcast palette, high contrast
- **Realism level:** crisp graphic UI illustration, esports-broadcast style, not photoreal
- **Focal pull:** the player's name in bold team-color lettering, immediately followed by the trophy icon

#### Variation B — Premium / AAA
- **Composition:** the banner integrated into a fuller cinematic scene — other players' silhouettes faintly visible in a populated environment behind the HUD
- **Camera angle:** a brief cinematic cut implied — as if the camera pulled from first-person to a spectator angle to catch the moment for other viewers
- **Framing:** wider shot showing the banner in context of a live, populated multiplayer match, environmental lighting and depth visible behind the HUD layer
- **UI layout:** the same name-forward banner structure, rendered with broadcast-quality graphic polish — a real esports tournament overlay
- **Lighting:** realistic environmental lighting behind the HUD layer, combined with a crisp, high-production broadcast graphic lighting treatment on the banner itself
- **Materials:** glossy, high-gloss broadcast graphic material with subtle chromatic/metallic accents on the trophy icon, realistic light reflection on the icon's surface
- **Typography:** precisely kerned condensed display typography with a subtle metallic or embossed treatment, broadcast-network quality
- **Glow:** a brighter, more controlled HDR glow on the medal/trophy icon, with believable light bloom against the darker environmental background
- **Particles:** fine light streak trails and a subtle lens-flare-adjacent light burst at the trophy icon, used sparingly and precisely
- **Implied motion:** strong directional motion blur across the whole banner and background, selling real broadcast camera-cut energy
- **Emotional atmosphere:** full esports-broadcast spectacle — the scale and polish of a real televised tournament moment
- **Color palette:** saturated red/gold/white with true HDR highlight values, deep environmental background tones behind
- **Realism level:** photoreal environmental background with cinematic graphic-overlay UI, broadcast-production quality
- **Focal pull:** the trophy icon's HDR glow, immediately followed by the bold player name

#### Variation C — Stylized / Roblox-native
- **Composition:** a bold, chunky rounded banner sliding in, matching Roblox's typical rounded-rectangle UI panel style
- **Camera angle:** standard flat Roblox gameplay HUD view, banner overlaid at the top of the screen
- **Framing:** full-width rounded banner, simplified and friendly rather than sharp-edged broadcast graphics
- **UI layout:** rounded avatar headshot icon on the left (Roblox-style player thumbnail), bold name text beside it, a simple trophy/star icon on the right inside a rounded pill-shaped banner
- **Lighting:** bright, flat, cheerful lighting typical of Roblox UI, no dramatic shadow or environmental depth
- **Materials:** smooth glossy flat-shaded plastic-like banner material, simple and toy-like
- **Typography:** bold, rounded, friendly sans-serif (Builder Sans-style), very high legibility, slightly playful rather than aggressive
- **Glow:** a simple bright rim-glow around the trophy/star icon, graphic rather than photographic
- **Particles:** a few simple bright star or spark shapes bursting near the trophy icon, small and quick
- **Implied motion:** a bouncy slide-and-settle motion, banner caught just past its landing bounce
- **Emotional atmosphere:** fun, communal, celebratory — built for a broad, young, social audience rather than competitive intensity
- **Color palette:** bright saturated Roblox-typical colors (blue, gold, white), high contrast but friendly rather than aggressive
- **Realism level:** flat-shaded stylized UI, unmistakably a Roblox social/achievement banner
- **Focal pull:** the rounded avatar thumbnail and name together, read as one friendly unit before the trophy icon

#### Negative Prompt
No private or intimate single-player framing; no muted or desaturated
color grading; no slow or ceremonial pacing; no small or hard-to-read
text at a glance; no cluttered or illegible banner layout; no absence of
player identity (name/avatar must always be present and prominent); no
soft diffused lighting (this philosophy is bold and graphic, not
atmospheric); no random unrelated particles unconnected to the
trophy/medal motif; no generic mobile-game UI framing; no empty,
unpopulated background — a sense of other players or a live audience
must be implied, even faintly.

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
