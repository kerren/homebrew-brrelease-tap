class Brrelease < Formula
  desc "Install script for the brrelease CLI"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.13.0/brrelease-v1.13.0-282cc37-darwin-x64.tar.xz"
  version "1.13.0"
  sha256 "d4231650ab51c0a7329088de3ef3fd03ba013260efa7897666ece095ccd63ca5"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.13.0/brrelease-v1.13.0-282cc37-darwin-arm64.tar.xz"
      sha256 "213f4de6352333f60bef5e208f4a9fb7b7a7231f9b5ebfdcb80efe49e0e78ded"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.13.0/brrelease-v1.13.0-282cc37-linux-x64.tar.xz"
      sha256 "28fdb6e8be09ddb1ada739514c6eb5683134950c7cf360c8a3cb1be9e3184f5b"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.13.0/brrelease-v1.13.0-282cc37-linux-arm64.tar.xz"
      sha256 "b3ef79151e43680235137dbf62a0c4e543c2ab5797108e793fced1ed54c8fd76"
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
