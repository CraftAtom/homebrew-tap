cask "zombieport" do
  version "1.0.0"
  sha256 "f1653841dbbe6cc839eba1e273a92b52b845f16bc452747646133fabf447b022"

  url "https://github.com/CraftAtom/zombieport/releases/download/v#{version}/Zombieport.zip"
  name "Zombieport"
  desc "Menu bar app that finds and stops forgotten local dev servers"
  homepage "https://github.com/CraftAtom/zombieport"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app's LSMinimumSystemVersion is 14.0, so Sonoma or later.
  depends_on macos: :sonoma

  app "Zombieport.app"

  uninstall quit: "com.craftatom.zombieport"

  zap trash: "~/Library/Preferences/com.craftatom.zombieport.plist"
end
