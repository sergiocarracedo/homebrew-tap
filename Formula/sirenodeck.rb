class Sirenodeck < Formula
  desc "Config-driven Stream Deck controller"
  homepage "https://github.com/sergiocarracedo/sireno-deck"
  url "https://registry.npmjs.org/@sirenodeck/sirenodeck/-/sirenodeck-0.2.1.tgz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
