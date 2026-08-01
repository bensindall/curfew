# Curfew

Applies Wither I to all online players once it's past 11 PM real-world
time, and kicks anyone who drops to half a heart. Curfew lifts at 7 AM
real-world time. Built for Minecraft 26.2 (works on Aternos).

## Requirements

This pack does **not** read real-world time on its own — Minecraft has
no built-in way to do that. It relies on the **Get SysTime** datapack:

https://modrinth.com/datapack/get-systime

Get SysTime must be installed **alongside** Curfew (both folders sit
side-by-side in your `datapacks` folder) or Curfew's functions will
fail with "unknown function" errors.

## Install (on Aternos)

1. Download **Get SysTime** from the link above (get the version for
   26.2 / 26.2-pre-3, or the newest one listed).
2. Stop your server, open the Aternos file manager (or FTP), and go to
   `world/datapacks/` (the `datapacks` folder inside your active
   world's save folder — not the server root).
3. Drop in both the `getsystime` folder/zip and this `curfew`
   folder/zip, unzipped, so you have:
   ```
   world/datapacks/getsystime/...
   world/datapacks/curfew/...
   ```
4. Start the server.
5. In-game, run:
   ```
   /reload
   ```
6. Stand at (or near) your world spawn and run:
   ```
   /function curfew:install
   ```
   This places the command block + marker Get SysTime uses to read the
   clock. You only need to do this once, ever (unless you regenerate
   the spawn area).

That's it — Curfew checks the real-world time once a second from then on.

## Configuring the curfew window

Default is **11 PM – 7 AM** (server's real-world clock, 24h). To
change it, run these as an operator, any time:

```
/scoreboard players set $start_hour curfew.cfg 23
/scoreboard players set $end_hour curfew.cfg 7
```

Both are 24-hour values, 0–23. The window can cross midnight (like the
default) or not (e.g. `$start_hour 9` / `$end_hour 17` for a daytime curfew) —
either works.

## Changing the Wither strength

You picked Wither I (mild). If you ever want it nastier, open
`data/curfew/function/apply_wither.mcfunction` and change the `0` to
`1` (Wither II) or `2` (Wither III):

```
effect give @a minecraft:wither 5 0 false
                                   ^ amplifier
```

## How it decides who to kick

Health is tracked in half-heart points (0–20, since 1 heart = 2
points). Anyone at **1 point or less** — half a heart or a sliver
above zero — gets `/kick`ed immediately, before the next Wither tick
can finish them off.

## Uninstalling

Run `/function curfew:uninstall`, then delete both the `curfew` and
`getsystime` folders from `world/datapacks/`.

## Notes for your 2-player server

- The pack doesn't do anything special for player count — it just
  applies to whoever's online (`@a`), so it works fine whether it's
  one of you or both online.
- Time resolution is to the hour (matching Get SysTime's `$Hour`
  scoreboard value), so curfew flips on/off exactly at the top of the
  hour, not the minute.
