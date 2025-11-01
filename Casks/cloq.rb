cask "cloq" do
  version "2.0.0"
  sha256 "767a419742d8ef3ae937342b58079784b7279ce7cee555e537b987c8075d2097"

  url "https://github.com/CloqApp/cloq-release/releases/download/v2.0.0/Cloq-2.0.0-mac-arm64.dmg"
  name "Cloq"
  desc "Stealthy floating AI & WhatsApp assistant for macOS"
  homepage "https://yourwebsite.com"

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
