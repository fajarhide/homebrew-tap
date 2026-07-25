cask "bubo" do
  version "1.1"

  on_arm do
    sha256 "3ac75e1ecea8c7923065cb2eea7ad97c057eb250194c7a0dca18c8a22e1ee1e1"
    url "https://github.com/fajarhide/bubo/releases/download/v#{version}/Bubo-apple-silicon.dmg"
  end
  on_intel do
    sha256 "014c035eaa6d593742dc508f67e81d0043fec3db72a54e961dad25953c3619de"
    url "https://github.com/fajarhide/bubo/releases/download/v#{version}/Bubo-intel.dmg"
  end

  name "Bubo"
  desc "Menu-bar monitor that flags the app hogging your CPU and RAM"
  homepage "https://github.com/fajarhide/bubo"

  depends_on macos: :ventura

  app "Bubo.app"

  # Ad-hoc signed, not notarized. Homebrew quarantines every cask and (since 6.0)
  # dropped --no-quarantine, so clear the flag ourselves or the first launch is
  # blocked by Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Bubo.app"]
  end

  zap trash: "~/Library/Preferences/local.bubo.plist"
end
