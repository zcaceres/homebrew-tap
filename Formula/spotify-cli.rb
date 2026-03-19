class SpotifyCli < Formula
  desc "Agent (and human) friendly CLI for Spotify. JSON output. PKCE auth."
  homepage "https://spotify-cli.zach.dev"
  license "MIT"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-darwin-arm64"
      sha256 "42ae4e3f2777d87c4d13ec6ec6c7fccbb0e79f17cb14f275fa412a4671db0348"
    else
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-darwin-x64"
      sha256 "1053757369165d997c2d65026b51bcb6132d610650b76198b7e1ececefc034bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-linux-arm64"
      sha256 "68481b58c18f61b266f6475e288a519be28cd6a4191bbba72780ae38e9e9c7a2"
    else
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-linux-x64"
      sha256 "700f5c6dbcb60a91876307f23e38dfc8e10a0d44021985419defccd8c87848d4"
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
