cask "cloq" do
  version "2.0.0"
  sha256 "767a419742d8ef3ae937342b58079784b7279ce7cee555e537b987c8075d2097"

  url "https://github.com/CloqApp/cloq-release/releases/download/v#{version}/Cloq-#{version}-mac-arm64.dmg",
      verified: "github.com/CloqApp/cloq-release/"
  name "Cloq"
  desc "Stealthy floating AI & WhatsApp assistant for macOS"
  homepage "https://github.com/CloqApp/cloq-release"

  installer script: {
    executable: "install.sh",
    sudo: false,
  }

  uninstall quit: "com.cloq.app"

  zap trash: [
    "~/Library/Application Support/Cloq",
    "~/Library/Preferences/com.cloq.app.plist",
  ]
end
