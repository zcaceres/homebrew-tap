class SpotifyCli < Formula
  desc "Agent (and human) friendly CLI for Spotify. JSON output. PKCE auth."
  homepage "https://spotify-cli.zach.dev"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-darwin-arm64"
      sha256 "edc4a7e91f9cb62a8d1a15c1f64828441d4a3165a851a251ee96e347c9a87c26"
    else
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-darwin-x64"
      sha256 "bce3dc6e9741d6f6db56da7811bfdaa573754b7f7a147eec6b466bb7e811ec94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-linux-arm64"
      sha256 "b0e1b88b5d6800521a4356ddcecbc19e24453ac10c7cec715c578d3cfce32e4f"
    else
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-linux-x64"
      sha256 "a3ec2fd22a3a7944c8cb299b6aa5716bc61266f57cb57635d9401483287c2fdc"
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
