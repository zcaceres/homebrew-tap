class FakerCli < Formula
  desc "Agent-friendly CLI for generating fake data. Wraps @faker-js/faker."
  homepage "https://github.com/zcaceres/faker-cli"
  license "MIT"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/faker-cli/releases/download/v#{version}/faker-darwin-arm64"
      sha256 "a4af66ffe5279da50235231927462a76e9b7a5e42140d7277ae48bd565f9e73a"
    else
      url "https://github.com/zcaceres/faker-cli/releases/download/v#{version}/faker-darwin-x64"
      sha256 "cc1e25f897e24add3ae078266977243cb4181b89f4db3dfab245544b63781ca9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zcaceres/faker-cli/releases/download/v#{version}/faker-linux-arm64"
      sha256 "5bf4a7df2beb88c89945baf7f660bf6dc23835e9da8fddeb11e7bf3bd113fd7a"
    else
      url "https://github.com/zcaceres/faker-cli/releases/download/v#{version}/faker-linux-x64"
      sha256 "2e8aaba33df8b378924b158abd39df9b25164ccca033cab2242f4c00f591c775"
    end
  end

  def install
    binary = Dir.glob("faker-*").first
    bin.install binary => "faker"
  end

  test do
    assert_match "faker", shell_output("#{bin}/faker --help")
  end
end
