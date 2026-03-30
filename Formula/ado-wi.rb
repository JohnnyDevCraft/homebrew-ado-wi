class AdoWi < Formula
  desc "STARC Azure DevOps work item export tool"
  homepage "https://github.com/JohnnyDevCraft/ado-wi"
  url "https://github.com/JohnnyDevCraft/ado-wi/releases/download/v0.1.2/ado-wi-0.1.2.tar.gz"
  sha256 "979a7b032bfe62b53a118fa26a96ba47782715c25bfff20d23cf2a9454e52f21"
  license "MIT"
  version "0.1.2"

  depends_on "dotnet" => :build

  def install
    system "dotnet", "publish", "workitems.csproj", "-c", "Release", "-o", libexec
    bin.install_symlink libexec/"ado-wi"
  end

  test do
    output = shell_output("#{bin}/ado-wi --version")
    assert_match "0.1.2", output
  end
end
