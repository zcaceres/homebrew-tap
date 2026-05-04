class SpotifyCli < Formula
  desc "Agent (and human) friendly CLI for Spotify. JSON output. PKCE auth."
  homepage "https://spotify-cli.zach.dev"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-darwin-arm64"
      sha256 "41aaa2647a6abaf06d7c1c36bc189cc7abb8b5361214e0e930eefbd4ea58c2ba"
    else
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-darwin-x64"
      sha256 "01754d1e1a33c6991fdf5a2ada8dd4b206ab3bf1bf91356aba53987e3bd3ae3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-linux-arm64"
      sha256 "a71118a2d015dd3da05b2efdca3c29e1f7ab860ba300e7a160a58a4e6b2af0bd"
    else
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-linux-x64"
      sha256 "29c03bdd804dec7b38c344d3122fcb898fd97a142821e85a773acb861a17737a"
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
