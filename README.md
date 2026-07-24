# fajarhide/homebrew-tap

Homebrew tap for my own tools.

```sh
brew tap fajarhide/tap
```

## What's here

| Command | Kind | What it is |
|---|---|---|
| [`omni`](https://github.com/fajarhide/omni) | formula | Semantic signal engine CLI. Less noise, more signal. macOS and Linux. |
| [`bubo`](https://github.com/fajarhide/bubo) | cask | Menu-bar monitor that flags the app hogging your CPU and RAM. macOS 13+. |

## Install

```sh
brew install fajarhide/tap/omni
brew install fajarhide/tap/bubo
```

Bubo is ad-hoc signed, not notarized. The cask clears the Gatekeeper
quarantine flag on install (via `postflight`), so it launches straight away.
