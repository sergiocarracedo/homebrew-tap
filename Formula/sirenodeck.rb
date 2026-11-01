class Sirenodeck < Formula
  desc "Config-driven Stream Deck controller"
  homepage "https://github.com/sergiocarracedo/sireno-deck"
  url "https://github.com/sergiocarracedo/sireno-deck/releases/download/%40sirenodeck%2Fsirenodeck-0.2.9-homebrew/sirenodeck-sirenodeck-0.2.9.tgz"
  sha256 "fe27c835d0e47b5f948d7d072e3ddd574d36afae1b2e28fbda4bfc8d47b5d05d"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    system "npm", "install", "--prefix", libexec,
           "--omit=dev", "--ignore-scripts=false", "--legacy-peer-deps"
    bin.install_symlink libexec/"bin/sirenodeck.js" => "sirenodeck"
  end

  test do
    system bin/"sirenodeck", "--version"
  end
end
