class Builtwith < Formula
  desc "Query the BuiltWith API from your app, terminal, or AI agent"
  homepage "https://builtwith.zach.dev"
  license "MIT"
  version "3.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-darwin-arm64"
      sha256 "c7bf573204742f66891ae260190a01a1b014bfb7d84e673b917d50797d13fc1a"
    else
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-darwin-x64"
      sha256 "bf8736463eae27f0ed2e3224a090e575484d062e66b3ea560c0c91db61fef2a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-linux-arm64"
      sha256 "32db1ae758b31da0fe6e312dc1f3daf486f75680d65ff04c77440ee305f5f77b"
    else
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-linux-x64"
      sha256 "f423ec96c3a74aff86bc7532623fee028e570827f00e53745181b34007322f32"
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