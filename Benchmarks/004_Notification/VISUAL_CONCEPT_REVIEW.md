# Notification — Visual Concept Review

**Stage:** Visual Concept Review. Design only — no implementation, no
Luau, no Roblox APIs, no image generation, no further narrowing beyond
what's specified below. This document exists purely to prepare prompts
for image generation, the same role Reward Reveal's expanded prompts
played during its own Design Convergence review.

**Scope:** only **Confirmation, Whisper, and Correction** are expanded
here — the three philosophies expected to become the foundation of the
notification system. **Alert** and **Social** remain at their single
`VISUAL_CONCEPTS.md` prompt and are intentionally not touched in this
document; they are not rejected, just not part of this review pass.

For each of the three, the single AI image prompt from `VISUAL_CONCEPTS.md`
is expanded into three variations, following the exact structure Reward
Reveal's Design Convergence review established: **Variation A —
Faithful** is the most literal reading of that concept's Motion and
Visual language sections; **Variation B — Premium / AAA** pushes the
same concept toward AAA cinematic production value; **Variation C —
Roblox-native** reinterprets the same philosophy through Roblox's actual
visual idiom (rounded UI, flat-shaded materials, Builder Sans-style
type). Each variation is broken into the same fourteen labeled fields
used for Reward Reveal — composition, camera angle, framing, hierarchy,
lighting, materials, typography, glow, particles, implied motion,
atmosphere, color palette, realism level, and focal point — concatenate
them, comma-separated, into a single prompt string when sending to an
image model. One negative prompt follows each concept's three
variations, specific to that philosophy rather than generic
image-quality boilerplate. Nine prompts total, three negative prompts.

Confirmation and Correction are deliberately built to mirror each
other's structure field-for-field wherever the philosophy allows it —
same panel material, same realism level, same absence of glow — so that
the only differences a viewer sees are the ones that are supposed to
carry meaning: color, and the firmness of the motion.

---

## 1. Confirmation

### Variation A — Faithful
- **Composition:** a single UI toggle switch and small icon slot side by
  side on a clean neutral panel, generous empty space around them so the
  small affirmative signal reads instantly
- **Camera angle:** flat, straight-on orthographic UI view, no
  perspective depth
- **Framing:** tight close-up crop on the toggle and slot only, no
  surrounding chrome visible
- **Hierarchy:** the checkmark badge is subordinate in size to the
  toggle itself — it never outsizes the thing it's confirming
- **Lighting:** even, soft, shadowless UI lighting with no directional
  drama
- **Materials:** simple flat-shaded UI material, one soft highlight band
  on the toggle's raised edge
- **Typography:** none — no text in frame
- **Glow:** a faint, contained highlight ring exactly at the checkmark
  badge's edge, not a soft bloom
- **Particles:** none
- **Implied motion:** the checkmark badge frozen mid scale-in, toggle
  just settled into its "on" position, no lingering motion elsewhere
- **Atmosphere:** quiet precision, a system responding rather than
  announcing
- **Color palette:** muted neutral panel background, one cool settled
  green as the only saturated color
- **Realism level:** clean flat-shaded vector-UI render, not photoreal
- **Focal point:** the checkmark badge at the instant it locks into
  place beside the toggle

### Variation B — Premium / AAA
- **Composition:** the same toggle-and-slot idea rendered with subtle
  cinematic depth — a soft out-of-focus interface plane behind it
  suggesting a fuller settings screen
- **Camera angle:** a slight macro push toward the toggle, like a
  product close-up
- **Framing:** extreme close-up, toggle fills a third of frame, shallow
  depth-of-field falloff at the edges
- **Hierarchy:** the checkmark badge remains visually secondary even at
  this scale — the toggle's own material detail is the dominant read
- **Lighting:** physically-based soft key light with realistic falloff,
  a faint bounce catching the toggle's underside
- **Materials:** high-fidelity brushed-metal or glass toggle surface,
  real specular highlights, fine micro-detail
- **Typography:** none
- **Glow:** a crisp, tightly controlled HDR highlight exactly at the
  checkmark's rim, not washing out material detail
- **Particles:** none
- **Implied motion:** a faint, realistic motion blur trailing the
  toggle's just-completed slide, checkmark caught at the exact peak of
  its scale-in
- **Atmosphere:** quiet competence rendered with real material
  craftsmanship — still subtle, but expensive-feeling subtle
- **Color palette:** muted neutral background, one rich cool green with
  true HDR highlight value
- **Realism level:** near-photoreal cinematic render, product-shot
  material fidelity
- **Focal point:** the specular highlight where the key light catches
  the checkmark's rim

### Variation C — Roblox-native
- **Composition:** a chunky rounded toggle switch and inventory-style
  slot icon inside a simple rounded UI card
- **Camera angle:** flat HUD-facing view, matching how Roblox UI
  actually renders
- **Framing:** the toggle and slot sized as they'd appear inside a real
  Roblox settings menu, a rounded card edge visible at one side
- **Hierarchy:** the checkmark badge is small and clearly secondary to
  the bold, chunky toggle shape, consistent with Roblox's UI proportions
- **Lighting:** bright, even, cheerful flat toon-shaded lighting typical
  of Roblox's default rendering
- **Materials:** smooth, glossy, slightly plasticky flat-shaded
  material, the characteristic look of a Roblox UI element
- **Typography:** none, or a tiny "Saved" label in a chunky rounded
  sans-serif, Builder-Sans-style
- **Glow:** a simple bright rim-light outline around the checkmark
  badge, Roblox ParticleEmitter-style radial glow, not photographic
  bloom
- **Particles:** none — Confirmation stays quiet even in the stylized
  register
- **Implied motion:** a light squash-and-settle pop, exaggerated
  slightly beyond real-world physics the way Roblox UI typically
  animates
- **Atmosphere:** friendly, immediate, unmistakably a Roblox settings
  interaction
- **Color palette:** bright saturated Roblox-typical green against a
  clean flat card background
- **Realism level:** flat-shaded stylized UI, unmistakably a Roblox
  interface element rather than a photoreal render
- **Focal point:** the toggle and its checkmark badge read together as
  one friendly unit

### Negative Prompt
No gold or festive coloring; no particle bursts or sparkle; no sustained
glow or bloom; no large empty dramatic backgrounds; no celebratory
motion (no bounce past a subtle settle, no overshoot); no text-heavy UI
chrome; no clutter competing with the toggle; no full-screen tint; no
dramatic lighting; nothing implying this moment is meant to be noticed
rather than simply trusted.

---

## 2. Whisper

### Variation A — Faithful
- **Composition:** the extreme corner of a mostly dark, softly lit game
  screen, empty gameplay space filling almost the entire frame
- **Camera angle:** standard gameplay point of view, unremarkable and
  static
- **Framing:** the one detail sits fully inside the frame's smallest
  corner, the remaining majority of frame deliberately empty
- **Hierarchy:** nothing else in frame competes with — or even
  acknowledges — the corner detail; it is the only added element, and
  the smallest thing in the composition
- **Lighting:** soft, even, low-key ambient lighting with no directional
  drama anywhere in frame
- **Materials:** a simple, soft-edged circular material with no defined
  surface detail
- **Typography:** none
- **Glow:** a tiny, barely-perceptible soft glow, no hard edge anywhere
  on it
- **Particles:** none
- **Implied motion:** caught mid-fade, arriving or departing so
  gradually the exact moment is ambiguous
- **Atmosphere:** stillness and quiet background presence, something
  felt rather than seen
- **Color palette:** muted, cool, low-saturation tones throughout,
  nothing bright anywhere in frame
- **Realism level:** clean, softly rendered illustration style, minimal
  detail
- **Focal point:** deliberately absent — the composition resists having
  one, which is the point

### Variation B — Premium / AAA
- **Composition:** the same corner-of-frame idea within a fuller,
  atmospheric environment — a hint of depth and haze filling the dark
  majority of the screen
- **Camera angle:** a very slow, almost imperceptible ambient camera
  drift, barely registering as movement
- **Framing:** wide environmental shot, the whisper detail occupying a
  tiny fraction of a richly detailed, atmospheric scene
- **Hierarchy:** environmental detail (haze, depth, ambient particulate)
  is allowed more richness than the whisper element itself, which stays
  the smallest, quietest thing on screen
- **Lighting:** realistic volumetric ambient light with soft atmospheric
  haze, no hard key light anywhere
- **Materials:** a softly diffused, physically-plausible glow with
  realistic falloff, no defined solid surface
- **Typography:** none
- **Glow:** a true soft-focus bloom, extremely low intensity, barely
  separable from the ambient haze around it
- **Particles:** a few faint, slow-drifting dust motes elsewhere in the
  environment, unrelated to and not competing with the whisper element
- **Implied motion:** an almost imperceptible drift, sold through the
  faintest motion blur rather than any deliberate gesture
- **Atmosphere:** a living, breathing world that happens to be quietly
  tracking something — full cinematic environmental richness used
  specifically to make the one added detail feel even smaller by
  comparison
- **Color palette:** deep, desaturated environmental tones, the whisper
  element barely distinguishable in saturation from its surroundings
- **Realism level:** photoreal cinematic environmental render
- **Focal point:** intentionally diffuse — the eye is meant to rest on
  the environment, not be pulled toward the corner

### Variation C — Roblox-native
- **Composition:** the corner of a standard Roblox gameplay HUD,
  ordinary flat-shaded game world filling the rest of frame
- **Camera angle:** flat, typical third-person Roblox gameplay camera
- **Framing:** the whisper indicator sits in the smallest,
  least-trafficked corner of the HUD, well clear of any other UI element
- **Hierarchy:** it sits visibly beneath and smaller than every other
  HUD element in frame, unmistakably the lowest-priority thing on screen
- **Lighting:** bright, even, cheerful flat lighting typical of Roblox's
  default rendering, unrelated to the whisper element's own dimness
- **Materials:** a simple flat-shaded circular icon with no gloss or
  highlight
- **Typography:** none
- **Glow:** the faintest possible flat-colored rim glow, barely brighter
  than the HUD background behind it
- **Particles:** none
- **Implied motion:** a slow, gentle fade, no bounce or pop, deliberately
  un-Roblox-like restraint against the platform's typically energetic UI
  motion
- **Atmosphere:** quiet and easy to miss even inside an otherwise
  bright, busy Roblox HUD — a deliberate exception to the platform's
  usual visual energy
- **Color palette:** a single low-saturation, low-contrast color,
  standing apart from the HUD's typically bright, saturated Roblox
  palette specifically by refusing to match its usual energy
- **Realism level:** flat-shaded stylized 3D consistent with Roblox
  rendering, but rendered with unusual restraint
- **Focal point:** deliberately weak — if the eye lands elsewhere in the
  HUD first, the composition has succeeded

### Negative Prompt
No bright flashes or bursts of any kind; no saturated or festive color;
no particle showers; no bold typography or readable text; no hard edges
anywhere on the glow; no fast or snappy implied motion; no central or
attention-claiming composition; no dramatic lighting or directional key
light; no large scale relative to the frame; nothing that could
plausibly interrupt a player's focus — if it would draw the eye on a
first pass, it has failed the brief.

---

## 3. Correction

### Variation A — Faithful
- **Composition:** a clean neutral UI panel showing a locked inventory
  slot, cursor frozen mid-attempt at dragging an item into it
- **Camera angle:** flat, straight-on orthographic UI view, matching
  Confirmation's for direct visual comparison
- **Framing:** tight close-up crop on the slot and its immediate border
  only, no surrounding chrome
- **Hierarchy:** the X glyph and text strip are secondary to the slot
  border's color-pulse, which is the primary signal
- **Lighting:** even, soft, shadowless UI lighting, no dramatic shadow
- **Materials:** simple flat-shaded UI material, matching Confirmation's
  panel material for consistency across the pair
- **Typography:** a short, empty text strip beneath the slot, left open
  for a specific explanation, in a clean simple sans-serif
- **Glow:** none — Correction communicates through color and shake, not
  glow
- **Particles:** none
- **Implied motion:** a faint horizontal motion-blur ghost on the slot's
  left and right edges, implying a brief contained shake just completed
- **Atmosphere:** calm and legible rather than alarming — firm, not
  punitive
- **Color palette:** muted neutral panel background, one warm dampened
  amber-red as the only saturated color
- **Realism level:** clean flat-shaded vector-UI render, matching
  Confirmation's realism level exactly
- **Focal point:** the slot's amber-red border at the peak of its
  color-pulse

### Variation B — Premium / AAA
- **Composition:** the same locked-slot idea rendered with subtle
  cinematic depth — a soft out-of-focus interface plane behind it,
  mirroring Confirmation's Variation B treatment
- **Camera angle:** a slight macro push toward the slot, like a product
  close-up
- **Framing:** extreme close-up, slot fills a third of frame, shallow
  depth-of-field falloff at the edges
- **Hierarchy:** the color-pulse remains the dominant signal even at
  this scale, with the X glyph and text strip staying visually secondary
- **Lighting:** physically-based soft key light with realistic falloff,
  a faint warm bounce catching the slot's inner edge during the pulse
- **Materials:** high-fidelity brushed-metal or glass slot surface, real
  specular highlights, fine micro-detail, matching Confirmation's
  material language
- **Typography:** a short, precisely kerned text strip beneath the slot,
  legible but understated, no dramatic display type
- **Glow:** none, consistent with Variation A — this concept stays
  glow-free across all three variations
- **Particles:** none
- **Implied motion:** a realistic, contained motion blur on the slot's
  shaking edges, sharp everywhere else
- **Atmosphere:** firm competence rendered with real material
  craftsmanship — clear and confident, not harsh
- **Color palette:** muted neutral background, one rich warm amber-red
  with true HDR highlight value
- **Realism level:** near-photoreal cinematic render, product-shot
  material fidelity, matching Confirmation's Variation B exactly
- **Focal point:** the specular highlight along the slot's border at the
  peak of the color-pulse

### Variation C — Roblox-native
- **Composition:** a chunky rounded inventory slot inside a simple
  rounded UI card, matching Confirmation's Roblox-native card language
- **Camera angle:** flat HUD-facing view, matching how Roblox UI
  actually renders
- **Framing:** the slot sized as it would appear inside a real Roblox
  inventory grid, a rounded card edge visible at one side
- **Hierarchy:** the X glyph is small and clearly secondary to the bold,
  chunky border-pulse, consistent with Roblox's UI proportions
- **Lighting:** bright, even, cheerful flat toon-shaded lighting typical
  of Roblox's default rendering
- **Materials:** smooth, glossy, slightly plasticky flat-shaded
  material, the characteristic look of a Roblox UI element
- **Typography:** a short, chunky rounded sans-serif label beneath the
  slot, Builder-Sans-style, high legibility
- **Glow:** none — the pair's shared no-glow rule holds even in the
  stylized register
- **Particles:** none
- **Implied motion:** a light, contained shake, exaggerated slightly
  beyond real-world physics the way Roblox UI typically animates, but
  noticeably firmer than Confirmation's gentle settle
- **Atmosphere:** friendly but clear — a firm "no" that still feels like
  part of a cheerful interface, not a punishment
- **Color palette:** bright saturated Roblox-typical amber-red against a
  clean flat card background
- **Realism level:** flat-shaded stylized UI, unmistakably a Roblox
  interface element rather than a photoreal render
- **Focal point:** the slot's pulsing border, read together with the
  small X glyph as one unit

### Negative Prompt
No saturated alarm-red or klaxon-style color; no full-screen tint or
flash; no harsh strobing; no glow or bloom of any kind; no dramatic
shadow or punitive lighting; no large scale relative to the interface;
no text implying blame or failure tone; no particle effects; no motion
that lingers past a brief, contained shake; nothing that would make a
minor, understandable mistake feel like a punishment.

---

## Why these three, rendered this way

Confirmation and Correction were built field-for-field parallel on
purpose across all three variations — same camera angle, same framing
logic, same materials, same realism level, both permanently glow-free —
because they're the matched yes/no pair `CONCEPT_SELECTION.md` and
`VISUAL_CONCEPTS.md` both established. Every difference that remains
between them (color, motion firmness, the presence of an explanation
strip) is a difference that's supposed to carry meaning, not an
accident of two people designing separately. Whisper, by contrast, was
deliberately built to resist a strong focal point in all three
variations — even its Premium/AAA pass spends its cinematic budget on
the *environment*, not on making the notification itself more visible,
because a Whisper that reads clearly in a concept-art image has already
failed the brief it's meant to prove out.

No image generation has happened. These nine prompts, plus the three
philosophy-specific negative prompts, are what's ready to hand to an
image model next.
