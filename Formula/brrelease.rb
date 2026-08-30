class Brrelease < Formula
  desc "Install script for the brrelease CLI"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.15.0/brrelease-v1.15.0-74d7379-darwin-x64.tar.xz"
  version "1.15.0"
  sha256 "3217063bfce18ae138f753265e6679bb46ef4fb46a0f157dfdbc3d1b190f5d38"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.15.0/brrelease-v1.15.0-74d7379-darwin-arm64.tar.xz"
      sha256 "a29effad9b90f15194c3290ce62c447f8eaab4149221224a944cd74178f017d2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.15.0/brrelease-v1.15.0-74d7379-linux-x64.tar.xz"
      sha256 "9ab12c2f66fca268767587c3437e328338ab86f60901a75f802fb80674ef969d"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.15.0/brrelease-v1.15.0-74d7379-linux-arm64.tar.xz"
      sha256 "0d2d1df32b0f32982b3f47c3fb2944f053c7b01fe71914a9c24808b81f249e4b"
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
