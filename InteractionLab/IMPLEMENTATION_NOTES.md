# Implementation Notes — Companion Panel

What actually changed in this pass, what was traded off to ship it, and what
it doesn't cover yet. Written after implementing, per the "build first,
document the decisions" rule in `PHILOSOPHY.md`.

**Docs read before implementing:** `PHILOSOPHY.md` and
`ProductDesign/LAYOUT_V2.md` (there is no separate `CompanionPanel.md` — the
approved proposal is that document's "Final recommendation: The Companion
Panel" section). `DesignSystem/` and `DesignBible/`, referenced in the
brief, do not exist anywhere in this repository — `Shared/Theme.lua` and
`Shared/UIBuilder.lua` are the only established design system here, and
were treated as the source of truth for color, type, and spacing instead.

## Architectural changes

- **`LabApp.lua` rewritten.** The fixed sidebar + header + boxed stage +
  control bar layout is gone. It now builds exactly two things: a
  full-screen, fully transparent `WorldStage` (the game world is the
  preview) and the floating `CompanionPanel`.
- **`LabController.lua` untouched.** `SetStage`, `GetStations`,
  `SelectStation`, `SelectVariant`, `Replay`, `Reset`, and both signals are
  unchanged. This is the "working system" the task asked not to rewrite,
  and it didn't need to change: every variant already positions its own
  content relative to whatever `stage` frame it's given, so handing it a
  full-screen stage instead of a small boxed one was enough to make
  buttons, windows, and notifications land where they'd land in a real
  game — with zero changes to any file under `Stations/`.
- **New files:** `Shared/Draggable.lua` (reusable drag-to-move helper),
  `UI/Components/CompanionPanel.lua`, `BenchmarkSelector.lua`,
  `VariantSelector.lua`, `ActionRow.lua`.
- **Deleted files:** `Sidebar.lua`, `VariantSwitcher.lua`, `ControlBar.lua`
  — fully superseded, nothing references them anymore.
- **Panel content matches the approved list exactly:** benchmark selector,
  variant selector, Replay, Compare/Blind Test/Present (placeholders),
  a settings button (placeholder). Reset is intentionally **not** on the
  panel — it wasn't in the approved content list. `LabController:Reset()`
  itself still exists and works; it's just not exposed anywhere in this
  UI right now.
- **Default position: bottom-left, 280px wide, ~190px tall expanded.**
  Chosen and verified, not guessed — I traced the `Position`/`AnchorPoint`
  math of all 16 variants across the 5 stations against this corner:
  Buttons/Rewards/ProgressBars/WindowOpening all center on screen,
  Notifications' Banner spans the full top edge, CornerPopup claims the
  top-right, and Toast is bottom-center but narrower than the gap between
  screen-center and the panel at any normal desktop width. None currently
  render in the bottom-left corner.

## Compromises

- **`panel.ClipsDescendants` left at its default (`false`).** The
  benchmark dropdown needs to render outside the panel's own bounds (see
  below), which clipping would prevent. The trade-off: the title bar's
  square top corners sit a few pixels inside the panel's own ~8px rounded
  corners instead of being perfectly masked. Visually minor; fixing it
  properly would mean rendering the dropdown in a separate overlay layer
  with its own absolute-position tracking, which felt like real added
  complexity for a handful of pixels.
- **Dropdown opens upward, unconditionally.** The panel defaults to the
  bottom of the screen, so a downward-opening dropdown would render past
  the bottom edge and be invisible — it always opens upward instead. This
  is hardcoded to the panel's known default position, not adaptive; if
  it's ever dragged very close to the top edge, the dropdown could clip
  off-screen there instead.
- **Variant tab widths are estimated from character count**, not
  measured against the actual rendered text. Fine for the current variant
  names; could misjudge width if a much longer name or a different font
  size shows up later.
- **"Compare" shipped as a placeholder**, alongside Blind Test and
  Presentation Mode, even though the brief listed it without an explicit
  "(placeholder)" tag. Real side-by-side rendering needs `LabController`
  to mount more than one variant handle at once into split regions of
  `WorldStage` — a real, scoped feature in its own right, not a UI-only
  change, and the brief's own validation checklist doesn't test Compare.
  Building it now would have meant extending `LabController` in the
  middle of a UI redesign, which is exactly the kind of speculative
  framework growth `PHILOSOPHY.md` argues against doing ahead of need.
  Noted here as a deliberate call, not an oversight.
- **Existing trigger-button placements inside variants weren't retuned.**
  e.g. Window Opening's "Open Window" button still sits at 85% down its
  stage — a position tuned for the old, much shorter boxed stage. It still
  renders correctly on a full screen (verified geometrically), just not
  necessarily in the most natural spot for a full viewport. Left alone
  per "preserve architecture, don't rewrite working systems."

## Remaining improvements

- Retune each variant's internal trigger-button placement for full-screen
  scale, station by station — ideally informed by actually watching them,
  which leads to the caveat below.
- Smarter dropdown positioning (pick up/down based on actual remaining
  screen space, not a hardcoded assumption).
- The settings button is fully inert; no settings surface exists yet.
- No keyboard shortcut for instant hide/show yet — `LAYOUT_V2.md`'s
  Companion Panel proposal mentions one, but it wasn't part of this pass's
  explicit requirements (Minimize button, Collapse/Expand, dragging).
- Panel position is remembered only for the current session, by design
  (the panel `Frame` is created once and never destroyed, so its dragged
  `Position` persists naturally) — no cross-session persistence, per the
  brief and per `PHILOSOPHY.md`'s "don't build what isn't needed yet."

## Future ideas (optional)

- Once Compare is real, its result surface (vote/notes/winner) probably
  belongs either as a fourth section in the panel body or as a small
  overlay near wherever the two compared variants are actually rendering
  — worth deciding once Compare exists, not before.
- The "render in real context" principle could extend further: a station
  could declare its own preferred screen region, so the panel could avoid
  it automatically instead of by the coincidence checked above.

## Validation performed

- `luau-ast` parsed every `.lua` file under `src/` and `bootstrap/` after
  every change — clean throughout.
- Every `require()` path in the new and changed files was checked against
  the actual file/folder structure, including confirming nothing still
  references the three deleted components.
- All 16 variants' fixed `Position`/`AnchorPoint`/`Size` values were read
  and checked by hand against the panel's default bottom-left geometry —
  this is the "no interaction is clipped by the panel" check, done
  geometrically rather than visually.
- The drag/minimize/collapse state logic was traced by hand: pointer-type
  handling in `Draggable` (`MouseButton1`/`Touch` for press,
  `MouseMovement`/`Touch` for move — an easy mismatch to get wrong, and
  the first draft did), and the three-state `applyState()` transitions in
  `CompanionPanel`.
- **What this validation is not:** there is no Roblox client available in
  this execution environment, so none of this was actually seen rendered.
  Dragging, minimizing, collapsing, and the panel's real on-screen
  appearance next to a running game have not been visually confirmed —
  only reasoned about from the code and Roblox's documented UDim2/GUI
  behavior. "Every benchmark still works" was validated by confirming the
  Mount/Play/Reset/Destroy contract and every station's `init.lua` are
  byte-for-byte unchanged, plus the geometric trace above — not by
  clicking Replay and watching it happen. This should be opened in Studio
  before being trusted as done.
