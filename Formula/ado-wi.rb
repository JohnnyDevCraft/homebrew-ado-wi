class AdoWi < Formula
  desc "STARC Azure DevOps work item export tool"
  homepage "https://github.com/JohnnyDevCraft/ado-wi"
  url "https://github.com/JohnnyDevCraft/ado-wi/releases/download/v0.1.4/ado-wi-0.1.4.tar.gz"
  sha256 "70715557267dcf339a395057b0ed93c03ead66b673ad85d94103a70bbd83db4f"
  license "MIT"
  version "0.1.4"

  depends_on "dotnet" => :build

  def install
    system "dotnet", "publish", "workitems.csproj", "-c", "Release", "-o", libexec
    bin.install_symlink libexec/"ado-wi"
  end

  test do
    output = shell_output("#{bin}/ado-wi --version")
    assert_match "0.1.4", output
  end
end
