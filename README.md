# Curfew

Applies increasing damage to all online players once it's past 10:30pm real-world time, and kicks anyone who drops to half a heart. Curfew lifts at 07:00am real-world time

## How does it work?

Past the configured curfew, all players will start taking damage. The longer users stay online past curfew, the faster the damage is applied. If 5 mins past curfew is reached, `Wither II` is applied.

But fear not! The power of friendship can lighten the blow of an early night! Standing within 4 blocks of another player gives `Regeneration III`. Don't stand too close though! You gotta leave room for Jesus mhm mhm 🙂‍↕️

## Requirements

This pack does **not** read real-world time on its own — Minecraft has no built-in way to do that. It relies on the **Get SysTime** datapack:

https://modrinth.com/datapack/get-systime

Get SysTime must be installed **alongside** Curfew (both folders sit side-by-side in your `datapacks` folder) or Curfew's functions will fail with "unknown function" errors.

## Install (on Aternos)

1. Download **Get SysTime** from the link above (get the version for 26.2 / 26.2-pre-3, or the newest one listed).
2. Stop your server, open the Aternos file manager (or FTP), and go to `world/datapacks/` (the `datapacks` folder inside your active world's save folder — not the server root).
3. Drop in both the `getsystime` folder/zip and this `curfew` folder/zip, unzipped, so you have:
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
   This places the command block + marker Get SysTime uses to read the clock. You only need to do this once, ever (unless you regenerate the spawn area).

That's it — Curfew checks the real-world time from then on.

## Configuring the curfew window

Default is **11 PM – 7 AM** (server's real-world clock, 24h). To change it, run these as an operator, any time:

```
/scoreboard players set $start_hour curfew.cfg 23
/scoreboard players set $start_min curfew.cfg 30

/scoreboard players set $end_hour curfew.cfg 7
/scoreboard players set $end_min curfew.cfg 15
```

This uses a 24hr clock. The window can cross midnight (like the default) or not (e.g. `$start_hour 9` / `$end_hour 17` for a daytime curfew) — either works.

## How it decides who to kick

Health is tracked in half-heart points (0–20, since 1 heart = 2 points). Anyone at **1 point or less** — half a heart or a sliver above zero — gets `/kick`ed immediately, before the next Wither tick can finish them off.

## Uninstalling

Run `/function curfew:uninstall`, then delete both the `curfew` and `getsystime` folders from `world/datapacks/`
