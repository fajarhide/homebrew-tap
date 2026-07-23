# fajarhide/homebrew-tap

Homebrew tap for [MacMon](https://github.com/fajarhide/macmon).

```sh
brew install --cask fajarhide/tap/macmon
```

MacMon is ad-hoc signed, not notarized. The cask clears the Gatekeeper
quarantine flag on install (via `postflight`), so it launches straight away.
