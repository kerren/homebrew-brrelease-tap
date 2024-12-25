class Brrelease < Formula
  desc "Install script for the brrelease CLI"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.14.3/brrelease-v1.14.3-f5c6244-darwin-x64.tar.xz"
  version "1.14.3"
  sha256 "5e6162aa9d378d0d4149d87dafa88a437562708964c0cfbda9650f2b1b348836"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.14.3/brrelease-v1.14.3-f5c6244-darwin-arm64.tar.xz"
      sha256 "eccc8ae19c1295c3dcc665b26bb7142d3decab6d5e3722c5c53ca79cd3f0830b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.14.3/brrelease-v1.14.3-f5c6244-linux-x64.tar.xz"
      sha256 "8a66675e46c5406b4cb65543cb00398b76124156c998dfc83f409bf06bd55ab5"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.14.3/brrelease-v1.14.3-f5c6244-linux-arm64.tar.xz"
      sha256 "d5fd0ee2786ccf59044ffcbfa5735b0218b08d1acc96b062789533ec15d21d78"
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
