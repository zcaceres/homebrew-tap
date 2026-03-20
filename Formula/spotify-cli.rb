class SpotifyCli < Formula
  desc "Agent (and human) friendly CLI for Spotify. JSON output. PKCE auth."
  homepage "https://spotify-cli.zach.dev"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-darwin-arm64"
      sha256 "9d104a061e4038869e2569862541e0c131eeb652da1651118b88ee6562d550c2"
    else
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-darwin-x64"
      sha256 "832accfeb996eaa8b3950659e40a4b42e3f6ecb30123d65f4cbc42e54fcc58b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-linux-arm64"
      sha256 "b04142505adb6588ad82a6c12a14690bb7ce5bbc281fd30eaf002a1daf46ef02"
    else
      url "https://github.com/zcaceres/spotify-cli/releases/download/v#{version}/spotify-linux-x64"
      sha256 "5c6daf590bb4ccad626196279ff5e214c4ba544cf289d43faefde7db2fc015bb"
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
