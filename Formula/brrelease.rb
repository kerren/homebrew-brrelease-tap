class Brrelease < Formula
  desc "Install script for the brrelease CLI"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.14.0/brrelease-v1.14.0-677383a-darwin-x64.tar.xz"
  version "1.14.0"
  sha256 "231cf672eca7e82d47c464f20772cf6aaf5a24806213ddb19eba5493b04d56dc"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.14.0/brrelease-v1.14.0-677383a-darwin-arm64.tar.xz"
      sha256 "2d30732dc3af4e58ab690f5d0d64244bd9ce08a0f15f0f5e393cfaaf5508ab41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.14.0/brrelease-v1.14.0-677383a-linux-x64.tar.xz"
      sha256 "7f6f4770cf8e5129bde5e707072cfa208082c47ccfc110319cd40bb4a387ed6c"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.14.0/brrelease-v1.14.0-677383a-linux-arm64.tar.xz"
      sha256 "b1aca85b5be3bc1e2cf978cfbf2269868a4ae418309f2767b9d5351b80179b35"
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
