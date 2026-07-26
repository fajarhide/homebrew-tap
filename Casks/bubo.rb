cask "bubo" do
  version "1.2"

  on_arm do
    sha256 "1533b01961c164f191d4e52fb01f1eb3ebed06b4709d9b3d56088eb768a3d07c"
    url "https://github.com/fajarhide/bubo/releases/download/v#{version}/Bubo-apple-silicon.dmg"
  end
  on_intel do
    sha256 "089055c6e4a6e6deed564dc8a7532c835f949e3ea1b4494f986ae97b99d01b47"
    url "https://github.com/fajarhide/bubo/releases/download/v#{version}/Bubo-intel.dmg"
  end

  name "Bubo"
  desc "Menu-bar monitor that flags the app hogging your CPU and RAM"
  homepage "https://github.com/fajarhide/bubo"

  depends_on macos: :ventura

  app "Bubo.app"

  # Ad-hoc signed, not notarized. Homebrew quarantines every cask and
  # (since 6.0) dropped --no-quarantine, so clear the flag ourselves or
  # the first launch is blocked by Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Bubo.app"]
  end

  zap trash: "~/Library/Preferences/local.bubo.plist"
end
