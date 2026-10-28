cask "copiest" do
  version "1.0.0"
  sha256 "01e35868598e05295763bec84a1dc69a921cf1c0a57e24231c45b1c4f0b275f4"

  url "https://github.com/CraftAtom/copiest/releases/download/v#{version}/Copiest.zip"
  name "Copiest"
  desc "Clipboard history for the menu bar that keeps passwords and API keys out"
  homepage "https://github.com/CraftAtom/copiest"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app's LSMinimumSystemVersion is 14.0, so Sonoma or later.
  depends_on macos: :sonoma

  app "Copiest.app"

  uninstall quit: "com.craftatom.copiest"

  zap trash: [
    "~/Library/Application Support/Copiest",
    "~/Library/Preferences/com.craftatom.copiest.plist",
  ]
end
