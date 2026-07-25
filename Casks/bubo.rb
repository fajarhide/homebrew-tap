cask "bubo" do
  version "1.1"

  on_arm do
    sha256 "3f6fb7c2ef37f972607360fde53e176fc62090d060f4b46251b3bb8e7a7032e0"
    url "https://github.com/fajarhide/bubo/releases/download/v#{version}/Bubo-apple-silicon.dmg"
  end
  on_intel do
    sha256 "1e1fa42c439a01b94b7abda5c795e649146436188796184bdc430f6670e37a62"
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
