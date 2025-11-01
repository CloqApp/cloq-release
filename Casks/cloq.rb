cask "cloq" do
  version "2.0.1"
  sha256 "f42cbdb5fb74e544cd7f5bd2815582e1896a085c80d618d4c480419df9f9bcb8"

  url "https://github.com/CloqApp/cloq-release/releases/download/v2.0.1/Cloq-2.0.1-mac-arm64.dmg"
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
