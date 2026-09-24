cask "meridian" do
  version "1.5.0"
  sha256 "1ec7f09ce6b4747bc7c5095e00dda946dd13413479e7c08870caef7f86cf31f6"

  url "https://dl.gitmeridian.com/v#{version}/Meridian_#{version}_universal.dmg"
  name "Meridian"
  desc "Native Git client that opens from the terminal, one window per worktree"
  homepage "https://gitmeridian.com/"

  livecheck do
    url "https://api.gitmeridian.com/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  # The oldest floor Homebrew still accepts, not a measured one: the app's own
  # LSMinimumSystemVersion is Tauri's default (10.13) and Tauri v2 documents
  # 10.15, neither of which is tested. Anyone older can still take the DMG
  # from gitmeridian.com directly.
  depends_on macos: :big_sur

  app "Meridian.app"

  zap trash: [
    "~/Library/Application Support/com.craftatom.meridian",
    "~/Library/Caches/com.craftatom.meridian",
    "~/Library/HTTPStorages/com.craftatom.meridian",
    "~/Library/Preferences/com.craftatom.meridian.plist",
    "~/Library/Saved Application State/com.craftatom.meridian.savedState",
    "~/Library/WebKit/com.craftatom.meridian",
  ]
end
