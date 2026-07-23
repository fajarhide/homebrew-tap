cask "macmon" do
  version "2.0"
  sha256 "c007cdef1a0db6c177e8079e462a8703f97d88249edf03c8205e95e8afd44263"

  url "https://github.com/fajarhide/macmon/releases/download/v#{version}/MacMon.dmg"
  name "MacMon"
  desc "Menu-bar monitor that flags the app hogging your CPU and RAM"
  homepage "https://github.com/fajarhide/macmon"

  depends_on macos: :ventura

  app "MacMon.app"

  # MacMon is ad-hoc signed, not notarized. Homebrew quarantines every cask and
  # (since 6.0) no longer offers --no-quarantine, so without this the first launch
  # is blocked by Gatekeeper. Clear the flag on the app we just installed.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MacMon.app"]
  end

  zap trash: "~/Library/Preferences/local.macmon.plist"
end
