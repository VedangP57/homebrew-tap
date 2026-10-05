class Gitty < Formula
  desc "A fast terminal git client with the GitHub Desktop experience"
  homepage "https://github.com/VedangP57/gitty"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.1/gitty-aarch64-apple-darwin.tar.xz"
      sha256 "ba1e5175475bad4e32219daee10a126d38e077e398ed53a4e03ab616aa584cf9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.1/gitty-x86_64-apple-darwin.tar.xz"
      sha256 "55edfbbd01201bef2196cb5dfd5fe1b526769de8c51f1043cd1c698e1950c047"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.1/gitty-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6539828a5c828cecc3f0e438ea3f382ac14eef1b066d1893b96cd05ff756d4d0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.1/gitty-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a4c183b388b0c17955280cfa71a13ec4a26936a40cacfd65c20113b4612385e5"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "gitty"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "gitty"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "gitty"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "gitty"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
