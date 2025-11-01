cask "cloq" do
  version "2.0.3"
  sha256 "4ee93454ba40fdaef5a2281e5abd65ded5569e62a023201cfe29f846a7f72462"

  url "https://github.com/CloqApp/cloq-release/releases/download/v2.0.3/Cloq-2.0.3-mac-arm64.dmg"
  name "Cloq"
  desc "Stealthy floating AI & WhatsApp assistant for macOS"
  homepage ""

  app "Cloq.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "/Applications/Cloq.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Cloq",
    "~/Library/Preferences/com.cupcake.cloq.plist",
  ]
end
