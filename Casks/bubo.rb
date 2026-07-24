cask "bubo" do
  version "1.0"
  sha256 "4c3761fa8326b4b08410adeb93e33af63942f63254814c2bbbfb8049896e9a34"

  url "https://github.com/fajarhide/bubo/releases/download/v#{version}/Bubo.dmg"
  name "Bubo"
  desc "Menu-bar monitor that flags the app hogging your CPU and RAM"
  homepage "https://github.com/fajarhide/bubo"

  depends_on macos: :ventura

  app "Bubo.app"

  # Bubo is ad-hoc signed, not notarized. Homebrew quarantines every cask and
  # (since 6.0) no longer offers --no-quarantine, so without this the first launch
  # is blocked by Gatekeeper. Clear the flag on the app we just installed.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Bubo.app"]
  end

  zap trash: "~/Library/Preferences/local.bubo.plist"
end
