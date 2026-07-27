cask "bubo" do
  version "1.3"

  on_arm do
    sha256 "a492384e673c9dafb2c7d72873dd7ad93ba7a5d1ac9612f0df82096ad7c84e4a"
    url "https://github.com/fajarhide/bubo/releases/download/v#{version}/Bubo-apple-silicon.dmg"
  end
  on_intel do
    sha256 "645e07d60392fcce93bdae2208bd010fdd3700500ee30577c0d7de362c971927"
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
