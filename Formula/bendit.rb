class Bendit < Formula
  desc "Claude Code plugin that guards a project; run /bendit:adopt to set it up"
  homepage "https://github.com/VedangP57/bendit"
  url "https://github.com/VedangP57/bendit/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "529ed60a241ff98b2b9a7603476866cdeb91c2c28ed41866e35a2169e7c4b6d3"
  license "MIT"

  def install
    bin.install "install.sh" => "bendit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bendit --version")
  end
end
