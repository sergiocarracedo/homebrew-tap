class Sirenodeck < Formula
  desc "Config-driven Stream Deck controller"
  homepage "https://github.com/sergiocarracedo/sireno-deck"
  url "https://registry.npmjs.org/@sirenodeck/sirenodeck/-/sirenodeck-0.2.2.tgz"
  sha256 "6c6732316e8410a6fafb3b73fc74bdbd678208f628024af3bd44dd4768ecf310"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    system "npm", "install", "--prefix", libexec, "--omit=dev", "--ignore-scripts=false"
    bin.install_symlink libexec/"bin/sirenodeck"
  end

  test do
    system bin/"sirenodeck", "--version"
  end
end
