# Workspace Redesign — Coexisting With Gameplay

## Status

This document supersedes the layout described in `LAYOUT.md`. That version
was designed as a self-contained screen: Sidebar, Stage, Toolbar, Result
panel, filling the viewport. It works, but it makes the Lab behave like a
second application competing with the game for the whole screen, rather
than a tool that sits alongside it. That's a fundamental problem, not a
polish issue, and it's what this document exists to fix.

## Design intent

Every layout in this document is judged against one standard: **the
developer must never lose the game to see the tool.** Roblox's world,
CoreGui, and live gameplay have to stay visible and interactive at all
times, by default, without the developer doing anything to earn that. The
Lab is a guest on that screen, not the host.

The four concepts below are deliberately not variations on a theme — each
one answers "where does the tool live relative to the game" in a
genuinely different way, borrowed from a different professional tool
tradition. None is a strawman; each is something a real team could ship
and be happy with. The final recommendation is a considered combination,
not a fifth idea invented from nothing.

---

## Concept 1 — Docked Rail (Inspector-style)

**Philosophy:** Borrow the Unity Inspector / Unreal Details panel model
directly: a fixed-width strip permanently docked to one screen edge
(right, by convention). It never floats and never moves. The game
viewport gets whatever width remains. Predictability is the entire point
— the tool is always in the same place, so finding it costs nothing.

**Target user:** A developer running long, deliberate evaluation
sessions — the "rigorous path" from `USER_FLOW.md` — who wants the tool
present the whole time without thinking about where it is.

**Advantages**
- Zero cost to locate — same place, every session, every station.
- Enough stable space for a full Sidebar, variant tabs, and Result panel
  without anything collapsing behind a click.
- Instantly familiar to anyone coming from Unity or Unreal.

**Disadvantages**
- Permanently claims real screen width even during the seconds it isn't
  actively being read — in tension with "must never replace gameplay."
- Even its "hidden" state is a collapsed rail, not true absence.
- Proportionally worse on narrow or vertical viewports (mobile testing).
- Weakest of the four at "hide the tool instantly" — going to zero
  footprint always takes an explicit action.

**Best use cases:** Long focused sessions on one station; onboarding a
new developer (a fixed location removes "where did it go" confusion);
desktop workflows with screen space to spare.

**Why someone would prefer it:** For a developer who evaluates
interactions for hours at a stretch, a fixed instrument panel that never
needs to be summoned costs less over a full day than repeatedly opening
and closing something that isn't always there.

```
EXPANDED
+----------------------------------------------------------------+---------------------+
|                                                                 | INTERACTION LAB   x |
|                                                                 +---------------------+
|                                                                 | Window Opening   [v]|
|                     ROBLOX GAME VIEWPORT                       +---------------------+
|             (CoreGui, HUD, gameplay fully visible               | Premium | Instant  |
|                    and fully interactive)                       | FadeScale| SlideIn |
|                                                                 +---------------------+
|                                                                 |  [ live variant ]   |
|                                                                 |   preview here      |
|                                                                 +---------------------+
|                                                                 | [Replay]  [Reset]   |
|                                                                 +---------------------+
|                                                                 | Vote:  A | B | --   |
+----------------------------------------------------------------+---------------------+

COLLAPSED (rail only)
+------------------------------------------------------------------------------+------+
|                                                                               | I  L |
|                     ROBLOX GAME VIEWPORT (full width restored)               | a  b |
+------------------------------------------------------------------------------+------+
```

---

## Concept 2 — Floating Palette (Figma-style)

**Philosophy:** A small, frameless, draggable window with no fixed home —
like a Figma properties palette, or a Roblox Studio widget pulled loose
from its dock. The developer parks it wherever it's least in the way
right now: a corner, empty sky, off to one side. It snaps to edges for
tidiness but is never forced anywhere.

**Target user:** A developer testing an interaction that lives in a
specific screen region (a reward popup in the top-right, a notification
in a corner) who needs that exact region kept clear and wants to put the
Lab wherever the *rest* of the screen has room.

**Advantages**
- Total placement control — the one thing a fixed dock can't offer.
  Never forced to overlap something the developer needs to see.
- Naturally smaller than a docked rail, since it holds only what's needed
  right now instead of a full-height sidebar structure.
- Visually reads as "a tool sitting on the game," reinforcing the
  coexistence goal at a glance, rather than "a second screen region."
- Minimizes to a small pill without losing its remembered position.

**Disadvantages**
- Position is the developer's problem to manage — forget where you left
  it, or it ends up behind something, and that's on you now.
- Hard to fit real structure (many stations, a full Result panel) without
  it quietly growing back into Concept 1's footprint, just floating.
- Dragging and resizing over a 3D game view has its own friction
  (accidental drags, z-order confusion with game UI).
- A saved position doesn't necessarily make sense on a different
  developer's screen resolution.

**Best use cases:** Testing interactions with a known, specific screen
footprint that needs to stay clear; quick, casual sessions where a full
docked structure is overkill.

**Why someone would prefer it:** They value control over convention —
spending a few seconds placing the panel exactly where it won't interfere
beats accepting a fixed location that sometimes will.

```
+------------------------------------------------------------------------------------------+
|                                                                                            |
|                                                              +----------------------+      |
|                                                              | :: Interaction Lab  x|      |
|                        ROBLOX GAME VIEWPORT                 +----------------------+      |
|                    (CoreGui + gameplay fully visible,        | Window Opening   [v] |      |
|                     panel dragged clear of the popup         | <Premium> Instant...  |      |
|                     under test, top-left)                    | [ compact preview ]  |      |
|                                                               | [Replay]  [Reset]    |      |
|    +-------------------+                                    +----------------------+      |
|    |  REWARD POPUP     |                                                                  |
|    |  (under test)     |                                                                  |
|    +-------------------+                                                                  |
|                                                                                            |
|                                                minimized:  ( Lab )   <- small draggable pill |
+------------------------------------------------------------------------------------------+
```

---

## Concept 3 — Command-Driven Overlay (DevTools-style)

**Philosophy:** Borrow Chrome DevTools' summon-and-dismiss behavior and a
command-palette interaction model (VS Code's `Cmd+Shift+P`, a Quake-style
console). By default, almost nothing is on screen — just a tiny,
unobtrusive HUD chip (like an FPS counter) naming the current benchmark.
A hotkey summons a compact overlay for switching station/variant and
voting; the same hotkey (or losing focus) dismisses it instantly, back to
just the chip. Resting state is nearly invisible; active state is brief
and deliberate.

**Target user:** A developer deep in flow, bouncing between playtesting
and quick interaction checks dozens of times an hour, who wants zero
persistent footprint and instant on/off.

**Advantages**
- Best of the four at "hide the tool instantly" and "minimize
  distractions" — at rest, it's effectively not there.
- Matches the Lab's own "fast path" from `USER_FLOW.md`: summoning and
  dismissing cost almost nothing, so quick gut-checks stay quick.
- Keyboard-first, so no precise mouse targeting over a 3D game view.
- The resting HUD chip still answers "what am I testing right now" at a
  glance, with nothing open.

**Disadvantages**
- Poor discoverability — a tool invisible until you know the hotkey is a
  tool many people never find unassisted.
- Awkward for browsing — comparing several variants side by side, or
  reading longer notes, doesn't fit a transient overlay built to get out
  of the way quickly.
- Weakest fit for the "rigorous path" (notes, blind testing, tournaments)
  — the overlay's brevity actively works against lingering in it.
- The hotkey has to be chosen carefully to avoid colliding with whatever
  keybinds the game under test already uses.

**Best use cases:** Rapid, repeated gut-checks during active playtesting;
developers who already live in keyboard-driven tools; moments where even
a small floating panel is one distraction too many.

**Why someone would prefer it:** For someone testing dozens of times in
one sitting, the cumulative cost of "a small panel sits in the corner"
adds up. This concept drives that cost to nearly zero, at the expense of
comfort during deep, structured sessions.

```
RESTING STATE (hotkey not pressed)
+------------------------------------------------------------------------------------------+
|                                                                                            |
|                          ROBLOX GAME VIEWPORT (100% visible)                              |
|                    (CoreGui + gameplay fully visible and interactive)                     |
|                                                                                            |
|                                                                          +--------------+ |
|                                                                          | Window Open. | |
|                                                                          | > Premium    | |
+--------------------------------------------------------------------------+--------------+-+

SUMMONED STATE ( ` held / pressed )
+------------------------------------------------------------------------------------------+
|                               +-------------------------------------------+               |
|                               |  Window Opening > Premium Simulator       |               |
|                               |-------------------------------------------|               |
|                               |  [Replay: Space]  [Reset: R]  [Vote: 1/2] |               |
|                               |  > Instant   > FadeScale   > SlideIn      |               |
|                               +-------------------------------------------+               |
|                                (dismisses instantly on key release)                        |
|                         game viewport dimmed slightly behind the overlay only               |
+------------------------------------------------------------------------------------------+
```

---

## Concept 4 — External Studio Widget (Roblox Studio dockable panel)

**Philosophy:** Stop rendering the Lab inside the game's own viewport at
all. Build it as a native Roblox Studio plugin using a dockable widget —
the same mechanism behind the Properties, Explorer, and Output panels. It
lives in Studio's own docking shell, entirely outside the 3D viewport and
outside the running experience's ScreenGuis/CoreGui. The game viewport is
then 100% game, always, because the Lab was never drawn on top of it in
the first place.

**Target user:** A developer working primarily in Studio's Edit mode or
Play Solo, who wants the strongest possible separation between "the
tool" and "the thing being tested" — thinking of the Lab the way they
think of the Properties panel: adjacent, never overlapping.

**Advantages**
- Perfect separation — it structurally cannot occlude gameplay or
  CoreGui, because it isn't part of that render surface at all. The
  fullest possible answer to "must never replace gameplay."
- Persists across sessions and place files the way other Studio panels
  do; docking, undocking, resizing, and tabbing are all already familiar.
- Free to use Studio's own UI idioms (trees, property grids) instead of
  rebuilding them inside a game ScreenGui.
- The most literal match for the "Roblox Studio widgets" reference point
  in the brief.

**Disadvantages**
- Only exists in Studio. It cannot evaluate an interaction in a live
  published experience, on an actual mobile device, on console, or with a
  remote playtester — a direct conflict with "test interactions in their
  real context" for every context except "in Studio, on this machine."
- Requires building and maintaining a genuinely separate technical
  surface (a Studio plugin with its own APIs) alongside the in-experience
  architecture already in `src/` — a real maintenance cost, not just a
  UX change.
- Studio plugins and the running game live in different script contexts;
  replay/reset commands have to cross that boundary deliberately, they
  aren't free.
- Loses the "coexists in the same frame as gameplay" feeling entirely —
  it can't do things like sit directly beside where an interaction is
  actually happening on screen, because it isn't on that screen.

**Best use cases:** Early prototyping and iteration inside Studio, before
an interaction is anywhere near ready for a real device or a live
server; developers who spend most of a working day in Edit mode.

**Why someone would prefer it:** If "professional dev tool" means
"behaves exactly like the other panels already docked in my IDE," this is
the only concept that's actually true to that reading — every other
concept here is still, structurally, an overlay drawn on top of the game.

---

## Comparing all four against the stated goals

| Goal | Docked Rail | Floating Palette | Command Overlay | Studio Widget |
|---|---|---|---|---|
| See the Roblox world | Mostly (rail takes a fixed slice) | Yes | Yes, nearly 100% | Yes, 100% (separate surface) |
| See CoreGui | Yes | Yes | Yes | Yes |
| Test in real context | Partial (preview boxed in panel) | Partial (preview boxed in panel) | Partial (preview boxed in panel) | No (Studio-only, not live) |
| Minimize distractions | Medium | Medium-high | Highest | High, but a separate window/context switch |
| Quick benchmark switching | Fast, always visible | Fast once opened | Fastest, keyboard-driven | Fast within Studio, but requires being in Studio |
| Replay | Instant | Instant | Instant | Requires a plugin <-> game bridge |
| Compare variants | Best (most room) | Good | Weakest (small overlay) | Good |
| Hide instantly | Weakest (manual collapse) | Manual (drag/minimize) | Best (hotkey) | N/A - already off the viewport |

No single column is best on every row. That's the signal that the right
answer draws from more than one concept rather than picking a winner
outright.

---

## Final recommendation: The Companion Panel

Combine Concept 3's resting-state discipline, Concept 2's placement
freedom, and Concept 1's structural stability once open - plus one idea
none of the four fully commits to on its own: **the interaction itself
should render in the same layer as the game, not boxed inside the
panel's preview pane.**

### The three states

**1. Resting - a chip, not a rail.** By default the Lab is a single
small, edge-snapped tab (think: a collapsed Studio panel's tab, or Chrome
DevTools' collapsed indicator) naming the current station and variant.
It's always present, so it never suffers the Command Overlay's
discoverability problem, but it's small enough that it never competes
with the Floating Palette's minimal footprint at rest.

**2. Expanded - a floating panel, snapped by default.** One click (or the
hotkey) expands the chip into a compact floating panel: station switcher,
variant tabs, Replay/Reset, and a lightweight vote affordance. It opens
snapped to whichever edge the chip was sitting on - Concept 1's
predictability - but is fully draggable from there, like Concept 2, for
the developer who needs that exact spot cleared. It is deliberately
smaller than the original `LAYOUT.md` design: no full Sidebar, no
full-height Stage, because of the next point.

**3. Hidden - one keypress from anything.** A single hotkey (chosen to be
unlikely to collide with common game keybinds, and rebindable) instantly
collapses the panel all the way to nothing, and a second press restores
it to whatever state - chip or expanded - it was in before. This is
Concept 3's best trait, made available from every other state, not just
the overlay's own.

### Where the interaction actually renders

The panel is a remote control, not a stage. Rather than replaying the
variant inside a boxed preview pane (as every one of the four concepts
above still does, including this one's own panel), the variant renders
where it would really appear in the finished game - a reward pops up
where a reward would pop up, a notification slides in from the real
corner it would use, a window opens over the real CoreGui and HUD it
would compete with in production. The floating panel just triggers it,
watches for the replay to finish, and collects the vote. This is what
actually delivers "test interactions in their real context" - a small
preview box, no matter how nicely it floats, is still a simulation of
context, not the context itself.

This isn't a requirement for every station on day one - some interactions
(a progress bar tied to a specific gameplay event) are harder to trigger
believably outside their real trigger condition than others (a button, a
notification). It's the direction to build toward, not a blocker for
everything that came before it.

### Studio Companion Mode - optional, not default

Concept 4 doesn't disappear - it becomes an optional secondary surface
for developers working in Studio's Edit mode, mirroring the same
station/variant state as the in-experience Companion Panel when both are
open. It's additive, not a replacement: nobody testing on a live server
or an actual device loses anything by it not existing yet, and nobody in
Studio is forced to use it over the in-experience panel if they'd rather
not context-switch.

### Why this beats picking one concept wholesale

Each of the four concepts is a clean answer to a different piece of the
brief, and each is visibly weak somewhere the others are strong -the
comparison table above shows no single column winning every row. A
hybrid isn't a compromise here; it's the only way to actually hit every
goal in the brief at once, because the brief itself is asking for
properties (always reachable, minimal by default, fully repositionable,
instantly hideable, faithful to real context) that no single tradition -
Inspector, Figma palette, DevTools console, or Studio widget - was
designed to deliver all of simultaneously.

### Checked against the stated goals

- **See the Roblox world / CoreGui / gameplay** - default state is a
  single small chip; nothing else is ever drawn unless summoned.
- **Test interactions in their real context** - variants render in the
  game's own layer, not in a boxed preview.
- **Minimize distractions** - resting footprint is smaller than any of
  the four concepts' own resting state except the Command Overlay's,
  which this design matches by sharing its hotkey-hide behavior.
- **Quickly switch benchmarks / Replay / Compare variants** - the
  expanded panel keeps Concept 1's structure for exactly this, so nothing
  about speed or comparison depth is sacrificed once it's open.
- **Hide the tool instantly** - one hotkey, from any state, always.

### What this defers, on purpose

- Exact chip placement defaults, hotkey bindings, and the expanded
  panel's precise dimensions are implementation decisions, not design
  decisions, and belong to a later, code-writing pass.
- Rendering every variant "in real context" for every station is a
  direction, not a v-next requirement - some stations will keep a boxed
  preview for longer than others, and that's fine.
- Studio Companion Mode is scoped as optional and secondary; it does not
  need to ship alongside the Companion Panel to make the Companion Panel
  worth building.
- Multi-monitor-specific layouts aren't addressed here - the Companion
  Panel is designed to work correctly on one screen first.
