class Builtwith < Formula
  desc "Query the BuiltWith API from your terminal"
  homepage "https://builtwith.zach.dev"
  license "MIT"
  version "3.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-darwin-arm64"
      sha256 "14897b5286388adcfed00ce13cd533b86714b3001cf30d8832d5fa79ae476258"
    else
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-darwin-x64"
      sha256 "819878ebb7404c3ce87e32a94a27935186c0b154b258f156bab79d33369465e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-linux-arm64"
      sha256 "f3952ee49e817826348a1e1a364d86e3d3366d4879ee9bac90cebb245f52ecbb"
    else
      url "https://github.com/zcaceres/builtwith-api/releases/download/v#{version}/builtwith-linux-x64"
      sha256 "dc480b214dc8ceabd1ae026d7c1a3b4eba3c61c8db7a17b5fcc9602af525c583"
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
