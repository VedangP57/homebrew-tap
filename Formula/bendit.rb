class Bendit < Formula
  desc "Claude Code plugin that guards a project; run /bendit:adopt to set it up"
  homepage "https://github.com/VedangP57/bendit"
  url "https://github.com/VedangP57/bendit/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "2638bf7d0033d7e3fd7c478851ea82894644f4abee5867a3b3624921f3594a46"
  license "MIT"

  def install
    bin.install "install.sh" => "bendit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bendit --version")
  end
end
