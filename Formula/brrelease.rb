class Brrelease < Formula
  desc "Install script for the brrelease CLI"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.16.1/brrelease-v1.16.1-abcc93c-darwin-x64.tar.xz"
  version "1.16.1"
  sha256 "27df198c6637a9c41fe39d639795caedc068de2923b1c8602e593561b649495b"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.16.1/brrelease-v1.16.1-abcc93c-darwin-arm64.tar.xz"
      sha256 "56398f14d54bf4277195aad4124104c2234b86004c185d3363407626e19e56dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.16.1/brrelease-v1.16.1-abcc93c-linux-x64.tar.xz"
      sha256 "e0244ca1d1c47397320110858ee19aa5b63440c9ac6102ccaa7ef9b51940dfb1"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.16.1/brrelease-v1.16.1-abcc93c-linux-arm64.tar.xz"
      sha256 "c28e7a2e57b23f94021c0a7c60a5d180abaf259879efa7b2481ed00ec1d38442"
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
