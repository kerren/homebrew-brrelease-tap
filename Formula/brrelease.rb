class Brrelease < Formula
  desc "Install script for the brrelease CLI"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.10.2/brrelease-v1.10.2-fd11b4a-darwin-x64.tar.xz"
  version "v1.10.2"
  sha256 "6229ff6e8f84d737c16ed5162533e2814be07c589a4da5eb6295ac30f3fb8835"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.10.2/brrelease-v1.10.2-fd11b4a-darwin-arm64.tar.xz"
      sha256 "4babcc5d1fce3a122afb294b45c4323f4c225c008a18fd97126d2005e3c767ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.10.2/brrelease-v1.10.2-fd11b4a-linux-x64.tar.xz"
      sha256 "ebfc2d8a9e20110843f92af550391fc8df7c665bef938456bb72db47d8353777"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.10.2/brrelease-v1.10.2-fd11b4a-linux-arm64.tar.xz"
      sha256 "d9f9328642aef1732d2f0da435d334af886707fb68206107cb865e1ce894c95c"
    end
  end

  def install
    inreplace "bin/brrelease", /^CLIENT_HOME=/, "export BRRELEASE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/brrelease"
  end

  test do
    system bin/"brrelease", "version"
  end
end
