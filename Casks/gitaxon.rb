cask "gitaxon" do
  version "0.1.0"
  sha256 "9012dc4885a1ffb9134a90ab2ec20649ace70aafa89e33860746d5ff954c7b79"

  url "https://github.com/VedangP57/GitAxon/releases/download/v#{version}/GitAxon_#{version}_aarch64.dmg"
  name "GitAxon"
  desc "Fast desktop Git GUI — commit graph, multi-repo tabs, conflict resolver"
  homepage "https://github.com/VedangP57/GitAxon"

  app "GitAxon.app"

  zap trash: [
    "~/Library/Application Support/com.gitaxon.desktop",
    "~/Library/Preferences/com.gitaxon.desktop.plist",
    "~/Library/Caches/com.gitaxon.desktop",
  ]

  caveats <<~EOS
    GitAxon is not notarized. If macOS blocks it on first launch, run:
      xattr -cr /Applications/GitAxon.app
  EOS
end
