class AdoWi < Formula
  desc "STARC Azure DevOps work item export tool"
  homepage "https://github.com/JohnnyDevCraft/ado-wi"
  url "https://github.com/JohnnyDevCraft/ado-wi/releases/download/v0.1.1/ado-wi-0.1.1.tar.gz"
  sha256 "5043c8686b60272e0c22e7cb1f6f3dd5034de027a190921e62b064d7aba81fdd"
  license "MIT"
  version "0.1.1"

  depends_on "dotnet" => :build

  def install
    system "dotnet", "publish", "workitems.csproj", "-c", "Release", "-o", libexec
    bin.install_symlink libexec/"ado-wi"
  end

  test do
    output = shell_output("#{bin}/ado-wi --version")
    assert_match "0.1.1", output
  end
end
