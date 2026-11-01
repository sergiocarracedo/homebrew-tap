class Sirenodeck < Formula
  desc "Config-driven Stream Deck controller"
  homepage "https://github.com/sergiocarracedo/sireno-deck"
  url "https://github.com/sergiocarracedo/sireno-deck/releases/download/%40sirenodeck%2Fsirenodeck-0.2.7-homebrew/sirenodeck-sirenodeck-0.2.7.tgz"
  sha256 "fc0af75c2564f56a965945b430359a618b3199ac4f1c4434e505612b730161cc"
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
