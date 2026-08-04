# Roblox Interaction Lab

Framework Version: 1.0 Stable

This repository is **not a game**. It is a permanent Roblox laboratory used to
validate interaction quality. Every future Roblox game is built using
interactions first validated here.

The Lab exists to answer one question, over and over, for any interaction we
might ship: **"Which variant feels better?"**

## What's in v0.1

Five independent test stations, each with a few interchangeable variants:

| Station | Variants |
|---|---|
| Buttons | Standard, Bouncy, Ripple |
| Window Opening | Instant, FadeScale, SlideIn |
| Rewards | Simple, PopIn, Confetti |
| Progress Bars | LinearFill, Segmented, Circular |
| Notifications | Toast, Banner, CornerPopup |

Every station lets you:

- **Switch** between variants (tabs at the top of the stage).
- **Replay** the interaction instantly (Replay button).
- **Compare** alternatives side by side by flipping between tabs.
- **Reset** back to a clean starting state (Reset button).

## Opening the project

This repo is a [Rojo](https://rojo.space/) project. To sync it into Roblox
Studio:

1. Install the Rojo plugin in Studio and the Rojo CLI (`cargo install rojo`,
   or via [Aftman](https://github.com/LPGhatguy/aftman)).
2. From the repo root, run `rojo serve`.
3. In Studio, connect via the Rojo plugin.

`default.project.json` maps `src/` into `ReplicatedStorage.Lab` and the
client entry point (`bootstrap/LabBootstrap.client.lua`) into
`StarterPlayerScripts`. On play, the bootstrap script requires
`Lab.UI.LabApp` and calls `LabApp.Start()`, which builds the whole lab UI
and mounts the first station.

## Architecture

```
src/
  UI/          Screen layout only: sidebar, header/variant tabs, stage, control bar.
  Stations/    One folder per station. Each station is a list of variants.
  Shared/      Cross-cutting code: Signal, Theme, UIBuilder, LabController.
  Config/      LabConfig.lua - the single place that lists which stations exist.
  Assets/      Centralized asset ids (sounds, images) for variants to reference.
```

### The variant contract

Every variant is a plain table with four functions. This is the only
interface the rest of the Lab depends on:

```lua
return {
	Name = "VariantName",
	Description = "One line explaining what this variant does differently.",

	Mount = function(stage: Frame)
		-- Build this variant's UI under `stage`. Return a `handle` table
		-- holding whatever state Play/Reset/Destroy need.
	end,

	Play = function(handle)
		-- Replay the interaction from a clean start.
	end,

	Reset = function(handle)
		-- Snap back to the initial state instantly, no animation.
	end,

	Destroy = function(handle)
		-- Disconnect everything Mount connected.
	end,
}
```

`src/Stations/StationBase.lua` documents and validates this contract at load
time (`LabConfig.lua` runs every station through it), so a broken variant
fails loudly instead of silently.

A station module (e.g. `Stations/Buttons/init.lua`) just gathers its
variants:

```lua
return {
	Id = "Buttons",
	Name = "Buttons",
	Description = "...",
	Variants = { require(Variants.Standard), require(Variants.Bouncy), ... },
}
```

### LabController

`Shared/LabController.lua` is the only thing that mounts, replays, resets,
and destroys variants. The UI layer (`UI/LabApp.lua` and its components)
never touches variant internals directly - it calls `controller:SelectStation`,
`controller:SelectVariant`, `controller:Replay`, `controller:Reset`, and
listens to `controller.StationChanged` / `controller.VariantChanged` to
re-render itself. This keeps station switching, replaying, and resetting
identical across every station, no matter how different the variants inside
look.

### Why variants don't share code with each other

Each variant file is intentionally self-contained (it builds its own UI,
imports only `Shared/Theme` and `Shared/UIBuilder`). Variants are not built on
top of each other, even when two variants look similar. This is deliberate:
a variant should be safe to delete, rewrite, or replace without risking any
other variant. The only things every variant shares are cosmetic constants
(`Theme`) and construction helpers (`UIBuilder`) - never behavior.

## Adding a new station

1. Create `src/Stations/<StationName>/init.lua` returning
   `{ Id, Name, Description, Variants }`.
2. Add one file per variant under `src/Stations/<StationName>/Variants/`,
   each satisfying the contract above.
3. Register the station in `src/Config/LabConfig.lua`.

## Adding a new variant to an existing station

1. Add a file under that station's `Variants/` folder implementing
   `Mount` / `Play` / `Reset` / `Destroy`.
2. Require it from that station's `init.lua` and add it to the `Variants`
   list.

Nothing else needs to change - the sidebar, tabs, and control bar are
generic and pick up new stations/variants automatically.

## Guiding principles

- Keep it lightweight. No inventory, no persistence, no server code, no
  systems that only make sense in a real game.
- Everything is modular and replaceable. A variant is disposable; the
  contract it implements is not.
- Optimize for experimentation, not production gameplay.
