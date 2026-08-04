# Layout

## Design intent

The layout has one job: keep the interaction itself as the largest, calmest
thing on screen, and keep everything the developer needs to compare,
replay, and decide within a single glance — no scrolling, no hidden panels,
no navigating away from the stage to do the actual work of evaluating.

Desktop first. The Lab is a tool used in long, focused sessions at a
desk — screen real estate is not the constraint mobile has to design
around, so the desktop layout should not be a cramped version of a mobile
one; it should use the space it has to keep everything visible at once.

## Regions

```
+----------------+----------------------------------------------------+
|                |  Toolbar  [Station Name]      [Mode: Side by Side v]|
|                +----------------------------------------------------+
|                |                                                    |
|    Sidebar     |                                                    |
|                |                                                    |
|  - Buttons     |                       Stage                       |
|  - Windows     |                                                    |
|  - Rewards     |          (variant selector lives here,             |
|  - Progress    |           anchored to the top of the stage)        |
|  - Notif.      |                                                    |
|                |                                                    |
|                +----------------------------------------------------+
|                |  [Replay]  [Reset]        Result Panel   [Inspector]|
+----------------+----------------------------------------------------+
```

### Sidebar

Same role it has in the existing architecture: the list of stations. In
the product design, it additionally carries a lightweight status per
station — has this station been voted on this session, is there a
declared winner already — as a small marker next to its name (a filled dot,
a checkmark), so a developer scanning the sidebar can see at a glance what
still needs attention without opening each one.

Collapsible to icons-only on demand, but expanded by default — on desktop,
there's no reason to hide it.

### Stage

The largest region on screen, always. This is where variants actually
play. Its content depends on the active comparison mode (see
`COMPARISON.md`):

- **Single Variant** — one full-width instance of the interaction, centered.
- **Side by Side** — the stage splits into 2–3 equal panes, each a small
  self-contained "mini-stage," visually separated by a thin divider, each
  labeled with its variant name (or hidden, in blind mode).
- **Overlay** — a single pane with two variants rendered in the same space,
  one at reduced opacity or in an outline/ghost style.
- **Tournament** — behaves like Side by Side for each individual matchup,
  with a bracket strip collapsed above the stage showing where the
  developer is in the tournament.

The stage never scrolls. If a comparison mode would need more space than
the stage has (e.g., a 4-way tournament round), the Lab reduces pane size
or paginates matchups — it does not make the developer scroll to see a
variant that's cut off.

### Toolbar

A single slim bar above the stage. Left side: the current station's name
and short description (pulled straight from the station's `Description`).
Right side: the comparison mode selector — a dropdown or segmented control,
always visible, so switching modes never requires leaving the stage view.

### Variant selector

Lives directly above the stage, not in the sidebar and not in the toolbar
— it's a distinct row of tabs, one per variant in the current station,
because it's the control the developer touches most often after Replay.
In Side by Side and Overlay modes, this becomes a multi-select (choose
which 2–3 variants are currently loaded into the stage) rather than a
single active tab.

### Toolbar (bottom) — Replay / Reset

Deliberately separated from the top toolbar and pinned to the bottom edge
of the stage, directly under the content the developer is watching, so
their eyes and cursor never have to travel far between "watch" and
"replay again." Replay and Reset are the only two buttons here — nothing
else competes for that space.

### Result panel

Docked to the bottom-right, next to Replay/Reset, and only becomes
"active" (bright, expanded) once a vote exists for the current comparison.
Before any vote, it's a quiet, collapsed strip inviting one — it never
competes with the stage for attention. Once populated, it shows the vote
tally, the current leading variant, and a shortcut to Export. Voting
itself (casting a vote) happens from a control near Replay/Reset, not
buried inside this panel — the panel is for reviewing the outcome, not for
the act of deciding.

### Inspector

A collapsible side panel (right edge, closed by default) that surfaces
detail a developer wants only sometimes: the variant's description, which
file it lives in, its notes history, and later, the objective measurements
described in `TESTING.md` (timing, tween count, performance markers). It's
opt-in screen space — most sessions never need it open, so it must never
take space away from the stage by default.

## Layout states

- **Browsing** (Preview step): Sidebar + Toolbar + Stage (Single Variant)
  + Variant selector. Result panel collapsed. Inspector closed.
- **Comparing**: Stage switches to the active comparison mode's split
  view. Result panel still collapsed until a vote exists.
- **Deciding** (Vote / Notes / Winner steps): Result panel expands,
  becomes the visual anchor next to the stage. Notes field appears inline
  in the Result panel, not as a separate modal.
- **Exporting**: A lightweight overlay (not a full navigation away from
  the stage) confirming what's being exported and where it's going.

No state ever hides the Sidebar or the Stage. Everything else (Inspector,
expanded Result panel) is additive screen space, never a replacement for
the two regions that are always relevant.

## Responsive behavior

**Desktop first, meaning:** the layout above assumes a wide window and is
not compromised to make a narrow one work. Every region gets its own
horizontal space; nothing is designed to stack by default.

**Mobile later, meaning:** when a narrower layout is eventually built, it
is a distinct, simplified mode — not a squeeze of the desktop one. The
mobile version is explicitly scoped down to:

- Browsing and Single Variant preview (full width, one variant at a time).
- Voting on comparisons that were already set up on desktop, rather than
  configuring comparisons from scratch.
- Reading Result panels and notes.

Mobile is a **review and light-voting companion**, not a full authoring
surface — a developer walking around, replaying a variant on their phone
and casting a vote, not building a tournament bracket on a 6-inch screen.
This scope boundary is deliberate: trying to fit Sidebar + Stage + Toolbar
+ Variant selector + Result panel + Inspector into a phone width would
force compromises that hurt the desktop experience too, if the same
components had to serve both. They don't have to — desktop and mobile can
(and should) have separately designed layouts sharing only the underlying
comparison and voting concepts, not literal UI regions.
