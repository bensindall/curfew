# Curfew

Applies increasing damage to all online players once it's past 10:30pm real-world time, and kicks anyone who drops to half a heart. Curfew lifts at 07:00am real-world time

## How does it work?

Past the configured curfew, all players will start taking damage. The longer users stay online past curfew, the faster the damage is applied. If 3 mins past curfew is reached, `Wither II` is applied.

But fear not! The power of friendship can lighten the blow of an early night! Standing within 4 blocks of another player gives `Regeneration III`. Don't stand too close though! You gotta leave room for Jesus mhm mhm 🙂‍↕️

If a user reaches half a heart, they are automatically kicked from the server. All effects are cleared.

## Requirements

This pack does **not** read real-world time on its own — Minecraft has no built-in way to do that. It relies on the **Get SysTime** datapack:

https://modrinth.com/datapack/get-systime

Get SysTime must be installed **alongside** Curfew (both folders sit side-by-side in your `datapacks` folder) or Curfew's functions will fail with "unknown function" errors.

## Install

1. Download **Get SysTime** from the link above (get the version for 26.2 / 26.2-pre-3, or the newest one listed).
2. Find the `datapacks/` folder inside the world save file.
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

Default is **10:30pm – 07:00am** (server's real-world clock, 24h). To change it, run these as an operator, any time:

```
/scoreboard players set $start_hour curfew.cfg 23
/scoreboard players set $start_min curfew.cfg 30

/scoreboard players set $end_hour curfew.cfg 7
/scoreboard players set $end_min curfew.cfg 15
```

The window can cross midnight (like the default) or not (e.g. `$start_hour 9` / `$end_hour 17` for a daytime curfew) — either works.

## Uninstalling

Run `/function curfew:uninstall`, then delete both the `curfew` and `getsystime` folders from `world/datapacks/`. This safely removes the command block (that finds the real world time) too.
