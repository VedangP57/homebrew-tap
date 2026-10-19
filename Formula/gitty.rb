class Gitty < Formula
  desc "A fast terminal git client with the GitHub Desktop experience"
  homepage "https://gitty.runs-on.dev"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/VedangP57/gitty/releases/download/v0.2.0/gitty-cli-aarch64-apple-darwin.tar.xz"
      sha256 "11717635ca9f99171b5d10218c8a407267ce086a656c10db3224baa744207966"
    end
    if Hardware::CPU.intel?
      url "https://github.com/VedangP57/gitty/releases/download/v0.2.0/gitty-cli-x86_64-apple-darwin.tar.xz"
      sha256 "0fa43cef651c356d51b0b17a7434736a2faba0111cdf7f928370f841058e2f1a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/VedangP57/gitty/releases/download/v0.2.0/gitty-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "414635ded833ef145e57c5e89fa97d6efabfc41f3a5abb7ba1239490bbf198fd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/VedangP57/gitty/releases/download/v0.2.0/gitty-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9e2bc4a0b262e25f0d735a1394902783ca21b1f6938993182d154944d79cb8f0"
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
