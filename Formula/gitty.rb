class Gitty < Formula
  desc "A fast terminal git client with the GitHub Desktop experience"
  homepage "https://github.com/VedangP57/gitty"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.2/gitty-cli-aarch64-apple-darwin.tar.xz"
      sha256 "d2be36c23b303cbb406d498a2baf4792a2596e7d1a42de85d5ca702be8618514"
    end
    if Hardware::CPU.intel?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.2/gitty-cli-x86_64-apple-darwin.tar.xz"
      sha256 "76a915b0eb3093d64dcf959268afc92248f787a5e2b39aeb04ea37507a2b84e9"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.2/gitty-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7e1b54e31421211a4e470988d56a2230b083b6156524e13e2a92b0164ad7e6e2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.2/gitty-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "05d4fe7f744aaf85294a92cdd1b8650a83df2f8d8ed29f533dd5e6f8c346f962"
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
