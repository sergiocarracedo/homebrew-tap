class Sirenodeck < Formula
  desc "Config-driven Stream Deck controller"
  homepage "https://github.com/sergiocarracedo/sireno-deck"
  url "https://github.com/sergiocarracedo/sireno-deck/releases/download/%40sirenodeck%2Fsirenodeck-0.2.6-homebrew/sirenodeck-sirenodeck-0.2.6.tgz"
  sha256 "8237ffb79142c02ab12b788909b796eb70fc339f675751697ed6fb44e4640490"
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
