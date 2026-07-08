class Builtwith < Formula
  desc "Query the BuiltWith API from your app, terminal, or AI agent"
  homepage "https://builtwith.zach.dev"
  license "MIT"
  version "3.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-darwin-arm64"
      sha256 "bd814dc162fd43a882aea2a814a554465446cc9cb6208af6082fae8131a52c2d"
    else
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-darwin-x64"
      sha256 "5d1234c97bd3495f963d1edc83d957f9747e2cfa3befb7d4edc5ee24e198ccef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-linux-arm64"
      sha256 "26d4f6ca89649a80b7e926e8fe556660830f1418a65f2266ad643ebb5c6db13e"
    else
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-linux-x64"
      sha256 "e2cd2a7c66fb96135acd26b3367c12a6e8d5803a14590b262486d3aab75cdd72"
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