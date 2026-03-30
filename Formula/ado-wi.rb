class AdoWi < Formula
  desc "STARC Azure DevOps work item export tool"
  homepage "https://github.com/JohnnyDevCraft/ado-wi"
  url "https://github.com/JohnnyDevCraft/ado-wi/releases/download/v0.1.0/ado-wi-0.1.0.tar.gz"
  sha256 "0f52a8625753c46a4016a7f6705767184eb72362d4ee9572027586d3db328d7f"
  license "MIT"
  version "0.1.0"

  depends_on "dotnet" => :build

  def install
    system "dotnet", "publish", "workitems.csproj", "-c", "Release", "-o", libexec
    bin.install_symlink libexec/"ado-wi"
  end

  test do
    output = shell_output("#{bin}/ado-wi --version")
    assert_match "0.1.0", output
  end
end
