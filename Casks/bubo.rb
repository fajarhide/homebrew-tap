cask "bubo" do
  version "1.5"

  on_arm do
    sha256 "f40c70b4715ab1be09a963de6474741418460b4ecf103a93b2ee3aab5f0e6ce1"
    url "https://github.com/fajarhide/bubo/releases/download/v#{version}/Bubo-apple-silicon.dmg"
  end
  on_intel do
    sha256 "372886f8a037eb891005d5f9e053884cbb0e113587d5c3f2b9fadad7d8d97bc7"
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

  zap trash: [
    "~/Library/Preferences/local.bubo.plist",
    "~/Library/Application Support/Bubo",
  ]
end
