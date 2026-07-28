cask "bubo" do
  version "1.4"

  on_arm do
    sha256 "99b935f48b15e79960caadb70e8a250ac747f100e42e02ab593941bd563db123"
    url "https://github.com/fajarhide/bubo/releases/download/v#{version}/Bubo-apple-silicon.dmg"
  end
  on_intel do
    sha256 "836e187fb539bbec656683f3062139cc6af3e28b2b0ea8fa7ea24cfeb76eb765"
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
