class Bendit < Formula
  desc "Claude Code plugin that guards a project; run /bendit:adopt to set it up"
  homepage "https://github.com/VedangP57/bendit"
  url "https://github.com/VedangP57/bendit/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "748ed44b7a739850c5a6253ab8f25ba9eac339d98a3c159ccfe12aae65c40bf2"
  license "MIT"

  def install
    bin.install "install.sh" => "bendit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bendit --version")
  end
end
