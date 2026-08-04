# User Flow

## Design intent

The flow below is the *default* path — the one a developer falls into
without having to think about the tool. Every step has to earn its place by
reducing effort or improving the quality of the eventual decision. Any step
that only adds ceremony gets cut.

Two things are true about every session at once:

- It should be possible to run the **whole** flow, start to finish, in
  under two minutes for a simple two-variant comparison.
- It should be possible to **stop early** at any point and still walk away
  with something useful (a replay you liked, a note you jotted, a vote you
  cast) — a session is never "wasted" for stopping short.

## The full flow

```
Launch Lab
    |
    v
Choose benchmark (station)
    |
    v
Preview variants  <-------------------+
    |                                 |
    v                                 |
Compare  (pick a mode) ---------------+   (jump back to preview
    |                                     a different variant)
    v
Replay (as many times as needed)
    |
    v
Blind comparison  (optional, recommended before voting)
    |
    v
Vote
    |
    v
Notes  (optional, encouraged)
    |
    v
Winner declared
    |
    v
Export result
```

## Step by step

### 1. Launch Lab

The Lab opens directly into the last station and variant that were active
when it was last closed — never a blank state, never a "choose where to
start" screen. Zero setup between opening the tool and seeing something
move.

### 2. Choose benchmark (station)

The sidebar lists stations (Buttons, Window Opening, Rewards, Progress
Bars, Notifications, and whatever is added later). Selecting one is a
single click with no confirmation, no loading state the developer has to
wait through. Switching stations is treated as cheap and reversible —
developers should feel free to bounce between stations mid-thought instead
of committing to "finishing" one before looking at another.

### 3. Preview variants

The moment a station is chosen, its first variant plays automatically —
the developer never has to press anything to see the *first* thing. From
there, variant tabs let them step through the rest at will. Preview is
passive: switching variants shows the new one in its resting/idle state
immediately, so browsing never triggers unwanted replays.

### 4. Compare

The developer picks how they want to look at the candidates — Side by
Side by default, or Overlay / Blind Test / Tournament / Random when the
situation calls for it (see `COMPARISON.md`). This is a mode toggle, not a
new screen; switching modes must never lose the developer's place (which
variants are loaded, what they've already seen).

### 5. Replay

Replay is the single most-used action in the tool and has to feel that
way: one button, one keyboard shortcut (`Space`), always in the same
screen position no matter which comparison mode is active. Replaying never
resets scroll position, never requires re-selecting the variant, never has
a cooldown. If the developer wants to hit replay thirty times in a row to
catch a subtle timing detail, that should be as frictionless as the first
time.

### 6. Blind comparison

Before a vote counts as final, the Lab offers to re-run the same
comparison with variant names hidden and order randomized (see
`COMPARISON.md`). This step is **optional but strongly nudged** — skipping
it is one click away, but the default button under "Compare" always reads
something like *"Vote blind"* rather than defaulting straight to a named
vote. The goal is to make the unbiased path the path of least resistance,
without ever blocking someone in a hurry.

### 7. Vote

Voting is a single choice among the variants currently in view (or "no
preference," which is a legitimate, recorded outcome — not a failure to
decide). A vote is cast with one click or a number key. Nothing about
casting a vote should feel heavier than the replay action that precedes
it.

### 8. Notes

An optional, always-visible text field attached to the current comparison.
Notes are for the *why* behind the vote — "feels floaty," "reads better at
low frame rate," "matches the reward station's timing." Notes are never
required to proceed; a vote with no note is a complete, valid outcome. But
the field is never hidden behind a menu — friction to add a note should be
zero for the developer who has something to say.

### 9. Winner

Once enough votes exist for the current benchmark (as few as one), the Lab
surfaces a clear, unambiguous winner call: which variant, by what margin,
with links back to the notes that were attached along the way. This is a
summary, not a new step the developer has to build — it exists the moment
there's enough data to support it, and updates live as more votes come in.

### 10. Export result

The winner, the vote tally, and the notes trail can be exported as a
single artifact (see `ROADMAP.md` for format specifics) — something that
can be pasted into a design doc, a PR description, or handed to another
developer without them needing to open the Lab at all. Export is the exit
door: it's how a decision made inside this tool becomes a decision the
rest of the team can see.

## The fast path

Not every comparison deserves the full ceremony. A developer doing a quick
gut-check should be able to compress the whole flow into: **choose station
→ replay two variants a few times → vote → done.** Blind comparison and
notes stay available but never mandatory, and export can happen later, in
bulk, for a whole session rather than one result at a time. The full flow
above is the *complete* path, not the *required* one — every optional step
is optional in practice, not just in principle.

## The rigorous path

For decisions that matter — the interaction that will get reused across
twenty future games — the flow above should be run in full, deliberately:
preview every variant once before comparing anything, use blind comparison
every time, write a note on every vote, and only call a winner after
running the comparison more than once across separate short sessions
(catching the difference between "felt good right now" and "felt good on a
different day"). Nothing in the tool should force this rigor, but nothing
should make it harder than the fast path either — the rigor is a matter of
how many times the developer walks the same easy loop, not a separate,
heavier tool.
