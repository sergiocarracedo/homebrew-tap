class Sirenodeck < Formula
  desc "Config-driven Stream Deck controller"
  homepage "https://github.com/sergiocarracedo/sireno-deck"
  url "https://registry.npmjs.org/@sirenodeck/sirenodeck/-/sirenodeck-0.1.1-alpha.0.tgz"
  sha256 "b5be3818ceaaea7cb4194afc8d3b71a3954d47d32550f779315380299f4583af"
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
