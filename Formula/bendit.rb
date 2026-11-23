class Bendit < Formula
  desc "Claude Code plugin that guards a project; run /bendit:adopt to set it up"
  homepage "https://github.com/VedangP57/bendit"
  url "https://github.com/VedangP57/bendit/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "a929db5aab03151d01354cba60c41b35a6285c4b35d776e6f2be2bb445c80184"
  license "MIT"

  def install
    bin.install "install.sh" => "bendit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bendit --version")
  end
end
