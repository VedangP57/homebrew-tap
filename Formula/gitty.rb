class Gitty < Formula
  desc "A fast terminal git client with the GitHub Desktop experience"
  homepage "https://github.com/VedangP57/gitty"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.0/gitty-aarch64-apple-darwin.tar.xz"
      sha256 "8f09228fa69f03c3868a05afd71d5460b98189da1f9063ab8a42147e3e7c679f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.0/gitty-x86_64-apple-darwin.tar.xz"
      sha256 "21f2d4c8522c340213f7d32a8adf7b79a8794ca6fb4e39896f4b738dc32192cc"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.0/gitty-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ef05442cf6d8ad012a0c8062eaef41253662f0c8053a594ba1768413addbb2f2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/VedangP57/gitty/releases/download/v0.1.0/gitty-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0e62409baeb3f4923cedfe14ceda1d12d7821ade26dcdc5437f1be9484f7cf5a"
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
