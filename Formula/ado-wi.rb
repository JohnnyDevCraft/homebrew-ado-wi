class AdoWi < Formula
  desc "STARC Azure DevOps work item export tool"
  homepage "https://github.com/JohnnyDevCraft/ado-wi"
  url "file:///Users/john/Source/repos/xelseor/workitems/dist/ado-wi-0.1.0.tar.gz"
  sha256 "a8af244f668b4690adfdff84f1f5f533ba714014a53d58effaad032388428fd6"
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
