# Progress Bar — Image Generation

This document contains only production-ready prompts, packaged from
`VISUAL_PROMPTS.md` for direct use with an image model. No design
rationale, no review, no implementation. This is the canonical source
for future image generation on this benchmark.

---

## Momentum

### Variation A — Faithful

**Prompt:**
Composition: a horizontal strip of small, evenly spaced tick marks passing behind a fixed, thin reference marker fixed near the center of the frame, the strip itself continuing past both left and right edges with no visible start or end. Camera angle: flat, straight-on orthographic UI view, no perspective depth. Framing: tight crop on the strip and its reference marker only, no surrounding chrome. Visual hierarchy: the reference marker is the one fixed, stable element in the frame; the tick marks are subordinate and interchangeable — no single tick is more important than any other. Lighting: even, soft, shadowless UI lighting, no directional drama. Materials: simple flat-shaded UI material, uniform across every tick mark. Typography: none — no numbers, no percentage, nothing implying a measurable total. Color palette: muted neutral grey-blue throughout, no accent color spikes anywhere along the strip's visible length. Implied motion: a faint motion blur on the tick marks nearest the reference marker, strip caught mid-travel, clearly still moving. Atmosphere: calm, ambient, ongoing — nothing about the frame suggests urgency or an approaching climax. Focal point: the reference marker itself, specifically because it's fixed while everything else moves past it. Realism level: clean flat-shaded vector-UI render, not photoreal.

**Negative prompt:**
No closed 0%–100% bar shape; no visible start or end edge on the strip itself; no percentage number or numeric readout; no deceleration or acceleration implying an approaching destination; no glow, no bloom, no particles; no bright or celebratory color; no static, frozen appearance — the strip must always read as caught mid-motion; no gold or warm accent tones anywhere in frame.

### Variation B — Premium / AAA

**Prompt:**
Composition: the same strip-and-marker idea rendered with subtle mechanical depth — a rotating drum or reel visible just behind the marker, suggesting a real physical counter mechanism. Camera angle: a slight macro push toward the reference marker, like a close-up on a real odometer. Framing: extreme close-up, marker and drum fill a third of frame, shallow depth-of-field falloff at the edges. Visual hierarchy: the marker's precise, static edge against the drum's blurred motion is the dominant read — everything else recedes. Lighting: physically-based soft key light with realistic falloff, a faint highlight along the drum's curved surface. Materials: brushed metal drum with fine mechanical tick engravings, real specular response as it turns. Typography: none. Color palette: muted neutral metal tones, no saturated accent anywhere. Implied motion: realistic motion blur on the fastest-moving part of the drum's surface, the marker itself perfectly still and sharp. Atmosphere: quiet mechanical precision — a real instrument doing its one job continuously, not a spectacle. Focal point: the exact point where the static marker edge meets the moving drum surface. Realism level: near-photoreal cinematic render, mechanical product-shot fidelity.

**Negative prompt:**
No closed 0%–100% bar shape; no visible start or end edge on the strip itself; no percentage number or numeric readout; no deceleration or acceleration implying an approaching destination; no glow, no bloom, no particles; no bright or celebratory color; no static, frozen appearance — the strip must always read as caught mid-motion; no gold or warm accent tones anywhere in frame.

### Variation C — Roblox-native

**Prompt:**
Composition: a small rounded UI card whose own frame edge doubles as the reference marker — the scrolling tick strip is visible through a narrow rounded window cut into the card, so the card's architecture itself solves the "what is this passing through" question. Camera angle: flat HUD-facing view, matching how Roblox UI actually renders. Framing: the card sized as it would appear inside a real Roblox HUD corner, rounded window and strip both clearly legible. Visual hierarchy: the rounded window's edge is the fixed reference point; the strip behind it is clearly subordinate motion. Lighting: bright, even, flat lighting typical of Roblox's default rendering — but not celebratory. Materials: smooth, flat-shaded card material, the characteristic look of a Roblox UI panel. Typography: none. Color palette: deliberately muted grey-blue, breaking from Roblox's usual bright saturated palette on purpose — the same restraint decision this Lab already made for Notification's Whisper and Confirmation. Implied motion: the strip visibly mid-scroll behind the window, a light squash-free, bounce-free continuous motion. Atmosphere: calm and unremarkable, intentionally at odds with the platform's typical UI energy. Focal point: the rounded window's edge, doing double duty as both UI chrome and the concept's own honesty-preserving reference marker. Realism level: flat-shaded stylized UI, unmistakably a Roblox interface element rather than a photoreal render.

**Negative prompt:**
No closed 0%–100% bar shape; no visible start or end edge on the strip itself; no percentage number or numeric readout; no deceleration or acceleration implying an approaching destination; no glow, no bloom, no particles; no bright or celebratory color; no static, frozen appearance — the strip must always read as caught mid-motion; no gold or warm accent tones anywhere in frame.

---

## Reassurance

### Variation A — Faithful

**Prompt:**
Composition: a small horizontal band centered in an otherwise plain neutral panel, using a soft pulsing pattern rather than a bar sweeping toward a filled state. Camera angle: flat, straight-on orthographic UI view. Framing: the band occupies a modest but clearly visible fraction of the frame — small, but never so small it risks disappearing into the background. Visual hierarchy: the band is the only element in frame, with generous plain space around it that signals restraint without implying absence. Lighting: flat, even, shadowless lighting, no directional drama. Materials: simple flat-shaded UI material, matte, no gloss. Typography: a small empty label space beside the band, left unfilled, present but not emphasized. Color palette: muted grey-blue, no bright accent color anywhere. Implied motion: a soft, non-directional pulse — brightness rising and falling evenly, never sweeping in one direction the way a determinate fill would. Atmosphere: calm and quietly present — modest, not absent. Focal point: deliberately soft, but never so weak the band can't be found in under a second by someone actually looking for it. Realism level: clean, plain flat-shaded illustration style.

**Negative prompt:**
No bright or saturated color; no glow, bloom, or halo spilling outward from the indicator; no percentage number or numeric readout of any kind; no fast or directional sweep; no celebratory framing; no oversized or dominant scale; no particles; and — critically — no rendering so faint or small that the indicator becomes indistinguishable from empty space; it must remain findable at a glance.

### Variation B — Premium / AAA

**Prompt:**
Composition: the same small band rendered with subtle material depth — a soft frosted-glass panel with a gentle internal pulse visible through its surface, rather than a flat painted pulse. Camera angle: a slight macro push toward the panel, like a close-up product shot. Framing: close-up, panel fills a modest but clearly resolved portion of frame, soft falloff at the edges. Visual hierarchy: the internal pulse is subordinate to the panel's own material presence — the material reads first, the motion second. Lighting: soft, physically-based ambient light with a gentle diffuse glow contained entirely within the frosted material itself, never spilling outward as a halo. Materials: translucent frosted glass or soft matte polymer, subtle real depth, no metallic or reflective drama. Typography: none. Color palette: muted cool neutral tones, no saturation spike anywhere. Implied motion: a slow, even internal brightness pulse, clearly non-directional, distinct at a glance from any sweeping fill. Atmosphere: quiet, contained, reassuring without ever asking for attention. Focal point: the panel's own material surface, not any single point of brightness within it. Realism level: near-photoreal material render, restrained rather than dramatic.

**Negative prompt:**
No bright or saturated color; no glow, bloom, or halo spilling outward from the indicator; no percentage number or numeric readout of any kind; no fast or directional sweep; no celebratory framing; no oversized or dominant scale; no particles; and — critically — no rendering so faint or small that the indicator becomes indistinguishable from empty space; it must remain findable at a glance.

### Variation C — Roblox-native

**Prompt:**
Composition: a small rounded pill-shaped indicator inside a plain neutral Roblox UI panel, using the same non-directional pulse pattern. Camera angle: flat HUD-facing view, matching how Roblox UI actually renders. Framing: the pill sized as it would appear inside a real Roblox loading or save indicator, modest but clearly visible. Visual hierarchy: the pill sits alone, with a small empty Builder-Sans label space beside it that stays empty in this concept. Lighting: bright, even, flat lighting typical of Roblox's default rendering, deliberately undercut by the muted palette below. Materials: smooth, flat-shaded UI material, plain and modest. Typography: a small, quiet, restrained label space, present but unfilled. Color palette: muted grey-blue, breaking from Roblox's usual bright saturated palette on purpose, same restraint precedent as Momentum's Variation C above. Implied motion: a soft, even, non-directional pulse in opacity, never a sweep. Atmosphere: calm and quietly functional, intentionally the least ambitious visual in the entire benchmark. Focal point: soft but locatable — findable within a glance, never truly hidden. Realism level: flat-shaded stylized UI, unmistakably a Roblox interface element.

**Negative prompt:**
No bright or saturated color; no glow, bloom, or halo spilling outward from the indicator; no percentage number or numeric readout of any kind; no fast or directional sweep; no celebratory framing; no oversized or dominant scale; no particles; and — critically — no rendering so faint or small that the indicator becomes indistinguishable from empty space; it must remain findable at a glance.

---

## Milestone

### Variation A — Faithful

**Prompt:**
Composition: a horizontal track divided into several distinct, unequal segments — some noticeably longer, some shorter, reflecting genuinely different real sizes — with a small step counter ("3 of 7") positioned beside the track. Camera angle: flat, straight-on orthographic UI view. Framing: tight crop on the track and its counter, no surrounding chrome. Visual hierarchy: the segment boundaries are the dominant visual feature; the step counter is secondary, present specifically to aid fast scanning without overriding the honest segmentation itself. Lighting: calm, even lighting, no dramatic highlight. Materials: simple flat-shaded UI material, uniform fill color across completed segments. Typography: a small, plain sans-serif step counter, quiet and legible, not celebratory in weight or size. Color palette: one modest, non-celebratory fill color, distinctly calmer than a reward-style gold. Implied motion: the third segment caught mid-fill, a restrained settle with no bounce or overshoot, the two completed segments already locked with a small tick mark each. Atmosphere: structured and calm — progress as real, honest bookkeeping, not spectacle. Focal point: the boundary between the most recently completed segment and the one now filling. Realism level: clean flat-shaded UI render, not photoreal.

**Negative prompt:**
No uniform or evenly spaced segments implying equal effort where the underlying steps aren't equal; no gold or celebratory color; no particles, no glow, no bloom; no bounce or overshoot on any segment lock; no missing or ambiguous step count when segments are numerous; no dramatic finale treatment on the final segment beyond what its actual significance justifies; no text larger or bolder than the segmented track itself.

### Variation B — Premium / AAA

**Prompt:**
Composition: the same unequal-segment track rendered with subtle material depth — individual physical plates or beads of varying size along a track, rather than flat painted divisions. Camera angle: a slight macro push toward the most recent boundary, like a product close-up. Framing: close-up on the track's midsection, shallow depth-of-field falloff at the edges, step counter still legible in frame. Visual hierarchy: the physical plate boundaries read first, the refined step-counter typography second. Lighting: physically-based soft key light, a faint highlight along each completed plate's edge. Materials: matte ceramic or brushed metal plates, real but subtle specular response, no gloss drama. Typography: a precisely kerned, understated numeral counter, no dramatic display type. Color palette: muted, non-celebratory tone, richer in material depth than in saturation. Implied motion: a realistic, contained settle as the current plate locks into place, no exaggerated bounce. Atmosphere: quietly substantial — real material weight without tipping into ceremony. Focal point: the specular highlight along the most recently locked plate's edge. Realism level: near-photoreal cinematic render, restrained material fidelity.

**Negative prompt:**
No uniform or evenly spaced segments implying equal effort where the underlying steps aren't equal; no gold or celebratory color; no particles, no glow, no bloom; no bounce or overshoot on any segment lock; no missing or ambiguous step count when segments are numerous; no dramatic finale treatment on the final segment beyond what its actual significance justifies; no text larger or bolder than the segmented track itself.

### Variation C — Roblox-native

**Prompt:**
Composition: a chunky rounded segmented track inside a Roblox-style card, unequal segment widths still honestly preserved, a bold but small Builder-Sans step counter beside it. Camera angle: flat HUD-facing view, matching how Roblox UI actually renders. Framing: the track sized as it would appear inside a real Roblox quest-progress panel, rounded card edge visible at one side. Visual hierarchy: the chunky segment dividers are immediately legible; the step counter sits clearly secondary, in a smaller type weight. Lighting: bright, even, flat toon-shaded lighting typical of Roblox's default rendering. Materials: smooth, glossy, slightly plasticky flat-shaded material, the characteristic look of a Roblox UI element. Typography: a chunky, rounded Builder-Sans-style step counter, legible but deliberately smaller and quieter than the segments themselves. Color palette: a single modest, calm fill color — not the bright saturated palette Roblox reward UI typically uses, a deliberate restraint choice consistent with this benchmark's other Roblox-native variations. Implied motion: a light, contained settle-and-lock on the currently filling segment, no exaggerated bounce. Atmosphere: structured and friendly but calm, not celebratory. Focal point: the boundary of the currently filling segment, reinforced by the step counter directly beside it. Realism level: flat-shaded stylized UI, unmistakably a Roblox interface element.

**Negative prompt:**
No uniform or evenly spaced segments implying equal effort where the underlying steps aren't equal; no gold or celebratory color; no particles, no glow, no bloom; no bounce or overshoot on any segment lock; no missing or ambiguous step count when segments are numerous; no dramatic finale treatment on the final segment beyond what its actual significance justifies; no text larger or bolder than the segmented track itself.
