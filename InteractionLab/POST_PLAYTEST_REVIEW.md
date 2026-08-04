# Post-Playtest Review — Companion Panel

First real usage pass on the Companion Panel, inside actual Roblox Studio.
This document treats the panel as shipped, working software and reviews
what usage surfaced — not a redesign.

## Problems discovered

1. Dragging the panel by its title bar made it disappear.
2. The draggable area gave no visual signal that it was draggable.
3. (Self-review, requested) General friction pass, pretending to be a
   senior UX designer looking for small, repeated annoyances.
4. Whether F8/Space/R/Left-Right should be wired up as shortcuts.
5. Whether panel position should survive a Stop+Play cycle in Studio, not
   just the current session.

## Root cause: the disappearing panel

**Root cause:** `Draggable.lua`'s clamping function silently discarded the
`Scale` component of the panel's position and treated its `Offset` as if
it were already an absolute pixel value — while also unconditionally
forcing the *returned* position's `Scale` to `0`. The panel is anchored
with `AnchorPoint = (0, 1)` and an initial `Position` of
`UDim2.new(0, 16, 1, -16)` — `Y.Scale = 1`, meaning "measured from the
bottom of the screen." The moment a drag produced its first mouse-move
event:

- The in-progress position correctly kept `Y.Scale = 1` and adjusted only
  `Y.Offset` (`-16 + delta`) — still meaningful, still bottom-relative.
- The clamp function read `position.Y.Offset` directly (`-16 + delta`,
  a small number) as though it were the *absolute* Y coordinate, clamped
  it (a no-op, since it was already in range), and returned
  `UDim2.new(0, x, 0, y)` — `Scale` hard-coded to `0`.
- A position of `Scale = 0, Offset ≈ -16` measured from the **top** of the
  screen puts the panel's anchor point (its bottom-left corner) about 16px
  below the top edge. For a ~190px-tall panel, that's almost entirely
  above the visible viewport — the panel didn't vanish, it jumped off the
  top of the screen on the very first pixel of drag movement.

This was a coordinate-space bug, not a bad clamp value — the two halves of
the function disagreed about whether `Scale` was in play at all. Patching
the clamp bounds without fixing that disagreement would have just moved
where the jump landed.

**Fix:** `Draggable.lua` now resolves `Scale * containerSize + Offset` to
a true absolute pixel coordinate once, at the start of every drag,
regardless of whether the target's position currently uses `Scale` (its
default, edge-anchored state) or pure `Offset` (after a previous drag). It
works entirely in that single absolute space for the rest of the drag and
only converts back to a `UDim2` at the very end. Input handling was also
corrected in the same pass: pointer-*down* detection legitimately checks
`MouseButton1`/`Touch`, but pointer-*move* detection needs
`MouseMovement`/`Touch` — the previous version checked for
`MouseButton1` on both, which meant `UserInputService.InputChanged` events
during an actual mouse drag (reported as `MouseMovement`) would have been
silently ignored even after the coordinate fix.

**Trade-off, stated plainly:** once a drag happens, the panel's `Position`
permanently switches from `Scale`-anchored to pure `Offset`. It no longer
automatically re-anchors to the bottom edge if the Studio viewport is
resized after that point. This is a real, accepted cost — see "Remaining
known issues."

## Drag affordance

Added, without new UI regions or icon fonts:

- Three small always-visible "grip dots" at the left edge of the title
  bar (plain circular `Frame`s, not text glyphs — avoids any risk of an
  unsupported Unicode symbol silently failing to render).
- A subtle background tint on hover over the draggable region
  (`BackgroundTransparency` from fully transparent to 0.88 — visible but
  quiet), reverting on `MouseLeave`.
- The same hover tint applied to the minimized chip, for consistency,
  since it's draggable too.

## UX polish (senior-review pass)

Three real, repeat-use papercuts found by tracing actual interaction
paths through the existing panel, not by redesigning it:

- **Benchmark dropdown didn't close on an outside click.** Opening the
  station picker, then changing your mind and clicking back into the game
  left the dropdown floating open indefinitely — nothing closed it except
  re-clicking the toggle. Added a transparent scrim (sized to comfortably
  cover the screen without needing a `ScreenGui` reference, `ZIndex`
  between the panel's normal content and the popout) that closes the list
  on any click outside it — standard dropdown behavior everywhere else.
- **Variant tab strip didn't reset its scroll position on station
  change.** Scroll right on a station with many variants, switch to one
  with fewer, and the tab strip could stay scrolled past the end of the
  new, shorter list — visually blank or missing the first tab. Now resets
  `CanvasPosition` to zero every time the list rebuilds.
- **Placeholder buttons were visually indistinguishable from working
  ones.** Compare, Blind Test, Present, and Settings used the same
  background color as genuinely interactive elements (like the benchmark
  selector), inviting repeated confused clicks that produced zero
  feedback. They're now visibly "ghosted" (lower background and text
  opacity) so they read as *not yet available* rather than *broken*.

## Keyboard shortcuts

| Shortcut | Verdict | Reasoning |
|---|---|---|
| F8 → Toggle panel | **Implemented** | F-keys aren't bound by Roblox's default systems and are a well-established convention for dev-tool toggles. Checks `gameProcessedEvent` so it won't fire while typing in chat or any text field. |
| Space → Replay | **Not implemented** | Space is Roblox's default jump key and is bound in the overwhelming majority of Roblox games. `UserInputService.InputBegan` can't prevent the character from also jumping — binding this would make every Replay also jump the developer's avatar, or make every jump also replay a benchmark. Directly conflicts with the Lab's own "must never interfere with real gameplay" principle. |
| R → Reset | **Not implemented** | Two independent reasons: R is a common in-game bind (reload, various abilities) with the same collision risk as Space, and Reset isn't currently exposed anywhere in the Companion Panel's UI (dropped from the approved content list in the previous pass). Adding a shortcut for a control that isn't visible anywhere would be undiscoverable by design. |
| Left/Right → Prev/Next variant | **Not implemented** | Roblox's default avatar movement script binds arrow keys as a *built-in alternate to WASD* — this isn't a hypothetical conflict, it's the out-of-the-box behavior for essentially every Roblox character. Binding these globally would make strafing while testing also cycle variants. |

Only F8 was implemented. The other three all fail the same test: they'd
work fine in an empty test scene and then quietly misbehave the moment
someone tests an interaction inside a game that has actual movement or
combat — exactly the "real context" this Lab exists to test in.

## Persistence across Studio Play sessions

**Evaluated, not implemented.** The panel's position already survives for
as long as the current Play session runs, for free — the panel `Frame`
is created once and never destroyed. The question is whether it should
survive a **Stop, then Play again** cycle.

There isn't a genuinely lightweight way to do this from where the Lab
sits architecturally right now:

- Studio discards changes made to the DataModel during a Play session
  when you press Stop — writing an `Attribute` to some instance during
  Play doesn't survive the next Play, because Studio reverts to its
  pre-Play saved state regardless.
- `DataStoreService` would survive that, but requires "Enable Studio
  Access to API Services" to be turned on manually (not on by default —
  a real setup step for anyone trying this Lab), adds network latency and
  failure handling for what is, at bottom, one pixel coordinate, and
  turns a cosmetic preference into a system with its own error states.
- `plugin:SetSetting` would also survive it and is the "correct" Roblox
  mechanism for this exact problem — but it only exists for Studio
  plugins. The Lab is deliberately *not* built as a plugin
  (`ProductDesign/LAYOUT_V2.md`'s Concept 4 was evaluated and rejected as
  the primary architecture, specifically because a plugin can't test
  interactions in a live, published context). Adopting it now, even only
  for one saved coordinate, would be a real architectural pivot wearing
  the disguise of a persistence fix.

Given the panel's default position is already verified not to collide
with any current benchmark, the realistic cost of *not* persisting is:
occasionally re-dragging it once per Play session, only for a developer
whose specific game's own HUD happens to conflict with the bottom-left
default. That's a smaller cost than either alternative above. If this
turns out to be a recurring, real complaint — per `PHILOSOPHY.md`'s "build
first, learn from reality" — `DataStoreService` is the natural next step,
gated behind actual evidence it's needed, not added speculatively now.

## Remaining known issues

- The benchmark dropdown still always opens *upward*, unconditionally
  (not adaptive to how much space is actually free above the panel).
  Unchanged from the previous pass.
- Toast notifications (Notifications station) are horizontally centered
  and could theoretically overlap the panel on viewports narrower than
  roughly 850px. Unchanged from the previous pass; not an issue at normal
  desktop resolutions.
- Trigger-button placements inside individual variants (e.g. Window
  Opening's "Open Window" button at 85% down the stage) still reflect the
  old boxed-stage layout and weren't retuned here — out of scope for a
  polish pass per "do not redesign the UI."
- After a first drag, the panel's position is pure `Offset` and no longer
  re-anchors to the bottom edge if the Studio viewport is resized (see
  the Draggable fix above). Accepted trade-off, not solved.
- Settings is still fully inert; Compare, Blind Test, and Presentation
  Mode are still placeholders with no underlying functionality.
- **I still have no Roblox client in this execution environment.**
  Everything above was fixed by reading the reported symptom, tracing the
  actual coordinate math by hand to find the mechanism, and reasoning
  from Roblox's documented `UDim2`/`GuiObject`/`UserInputService`
  behavior — not by opening Studio and confirming the fix. That is the
  exact gap that caused the bug this review starts with: a previous "this
  should work" claim that turned out to be wrong the first time a human
  actually used it. The fixes here are logically sound as far as I can
  verify statically, but they carry the same caveat until someone
  confirms them by dragging the panel in a real session.

## Confidence level before calling this v1.0

**Not v1.0.** Concretely:

1. **Nothing in this review has been seen running.** The whole reason
   this document exists is that a change I was confident in failed the
   first time it met real usage. Calling anything "done" again without a
   human confirming it in Studio would repeat exactly that mistake.
2. **Core promised capabilities are still placeholders.** Compare, Blind
   Test, and Presentation Mode — three of the panel's seven content
   items — do nothing yet. `ROADMAP_V2.md` scopes real Compare support as
   part of "Lab Polish" (Milestone 1) specifically because it needs
   `LabController` to mount more than one variant at once; that hasn't
   been built.
3. **`ROADMAP_V2.md`'s own definition of v1.0** (in the original
   `ProductDesign/ROADMAP.md`, still the most detailed criteria available)
   ties v1.0 to the *complete* evaluation surface — objective
   measurement, accessibility checks, a mobile companion mode, a stable
   export contract. None of that exists yet; this pass only touched the
   floating panel shell.

What *is* true: the panel is closer to trustworthy for daily use than it
was before this pass — the bug that would have made every single session
start with "the tool is broken" is fixed, and the friction that would
have compounded over hundreds of uses (stray dropdowns, unclear
placeholders, no drag affordance) is addressed. That's real progress
toward a daily tool. It is not the same claim as "ready for long-term
daily use," which is what v1.0 means, and I'm not making that claim here.
