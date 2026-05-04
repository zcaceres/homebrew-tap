class SpotifyCli < Formula
  desc "Agent (and human) friendly CLI for Spotify. JSON output. PKCE auth."
  homepage "https://spotify-cli.zach.dev"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-darwin-arm64"
      sha256 "ba6e192f4129234611e9a429a9c50a31a53c7b7e56ddfd9b1704b1c3460ffff7"
    else
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-darwin-x64"
      sha256 "c893359c3b67b7e8d5696e35409a2e7a3eea53b4f64475939a3918340961ebf6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-linux-arm64"
      sha256 "58191db65d2985f659ef5904014700a5d86feb45d696c5f8913998df0f43a52d"
    else
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-linux-x64"
      sha256 "a5a9707b593153b0895a1cb13eb075084be63b5a8c33d3ec2a36aeb473807aad"
    end
  end

  def install
    binary = Dir.glob("spotify-*").first
    bin.install binary => "spotify"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spotify --version")
  end
end
