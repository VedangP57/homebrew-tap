cask "gitaxon" do
  version "0.1.0"
  sha256 "6f8cd2deb1147518d3013d2e4e55b0915b4025e22d7491b8ee9d1bfcfa9c0daf"

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
    On Intel Macs, Rosetta 2 runs this automatically.
  EOS
end
