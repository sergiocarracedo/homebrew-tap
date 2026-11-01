class Sirenodeck < Formula
  desc "Config-driven Stream Deck controller"
  homepage "https://github.com/sergiocarracedo/sireno-deck"
  url "https://registry.npmjs.org/@sirenodeck/sirenodeck/-/sirenodeck-0.2.5.tgz"
  sha256 "9931a471d9ed820418f6babfcf00b5ddc43cd0d00df3b819f2f63cc438d99a4c"
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
