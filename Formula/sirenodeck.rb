class Sirenodeck < Formula
  desc "Config-driven Stream Deck controller"
  homepage "https://github.com/sergiocarracedo/sireno-deck"
  url "https://github.com/sergiocarracedo/sireno-deck/releases/download/%40sirenodeck%2Fsirenodeck-0.4.1-homebrew/sirenodeck-sirenodeck-0.4.1.tgz"
  sha256 "89be8dae9a87754cb9b2a4cd10c979f0985a551f1d6c46426544bdfe8f68540d"
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
