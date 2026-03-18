class Builtwith < Formula
  desc "Query the BuiltWith API from your terminal"
  homepage "https://builtwith.zach.dev"
  license "MIT"
  version "3.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-darwin-arm64"
      sha256 "c210d1ecc348a08ec045a26302df6c99e14f2818bbd253b403fe34a6092674d0"
    else
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-darwin-x64"
      sha256 "bbab952540d937328c9a47d9cbfcdf8c6b40efe7734fa9f3546d90d266ca29ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-linux-arm64"
      sha256 "ee561c117c531821e6d5afe1a3c0f3877cfe5130a21da47aac8a7ce6bdd23f18"
    else
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-linux-x64"
      sha256 "a6e993323f093b31e5ee893c882edac53b9857e9c15e97df529c56f741330186"
    end
  end

  def install
    binary = Dir.glob("builtwith-*").first
    bin.install binary => "builtwith"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/builtwith --version")
  end
end
