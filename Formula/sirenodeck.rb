class Sirenodeck < Formula
  desc "Config-driven Stream Deck controller"
  homepage "https://github.com/sergiocarracedo/sireno-deck"
  url "https://github.com/sergiocarracedo/sireno-deck/releases/download/%40sirenodeck%2Fsirenodeck-0.4.0-homebrew/sirenodeck-sirenodeck-0.4.0.tgz"
  sha256 "8c1ba5cfbd1ad257636557568fd90e283e735f40eb2499a1ebf0a43d0cdc8274"
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
