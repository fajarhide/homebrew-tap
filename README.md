# fajarhide/homebrew-tap

Homebrew tap for my own tools.

```sh
brew tap fajarhide/tap
```

## What's here

| Command | Kind | What it is |
|---|---|---|
| [`omni`](https://github.com/fajarhide/omni) | formula | Semantic signal engine CLI. Less noise, more signal. macOS and Linux. |
| [`macmon`](https://github.com/fajarhide/macmon) | cask | Menu-bar monitor that flags the app hogging your CPU and RAM. macOS 13+. |

## Install

```sh
brew install fajarhide/tap/omni
brew install --cask fajarhide/tap/macmon
```

MacMon is ad-hoc signed, not notarized. The cask clears the Gatekeeper
quarantine flag on install (via `postflight`), so it launches straight away.
