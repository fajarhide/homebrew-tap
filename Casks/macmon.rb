cask "macmon" do
  version "2.0"
  sha256 "c007cdef1a0db6c177e8079e462a8703f97d88249edf03c8205e95e8afd44263"

  url "https://github.com/fajarhide/macmon/releases/download/v#{version}/MacMon.dmg"
  name "MacMon"
  desc "Menu-bar monitor that flags the app hogging your CPU and RAM"
  homepage "https://github.com/fajarhide/macmon"

  depends_on macos: :ventura

  app "MacMon.app"

  zap trash: "~/Library/Preferences/local.macmon.plist"

  caveats <<~EOS
    MacMon is ad-hoc signed, not notarized, so Gatekeeper blocks it by default.
    Install without quarantine so it launches directly:

      brew install --cask fajarhide/tap/macmon --no-quarantine

    If you already installed it, clear the flag once:

      xattr -dr com.apple.quarantine "#{appdir}/MacMon.app"

    Then right-click the menu-bar item and turn on "Open at Login".
  EOS
end
