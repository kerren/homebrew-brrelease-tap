class Brrelease < Formula
  desc "Install script for the brrelease CLI"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.11.0/brrelease-v1.11.0-eac3c18-darwin-x64.tar.xz"
  version "1.11.0"
  sha256 "f6d163626796e2f9b5e3b308bf21b170f0d21d8300c9bbadbd3f9c1d74218fbd"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.11.0/brrelease-v1.11.0-eac3c18-darwin-arm64.tar.xz"
      sha256 "92a29221e98ed20467edf6fc1ba3d62bbcf1bc0b53dc702f7ce44afa1183d2e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.11.0/brrelease-v1.11.0-eac3c18-linux-x64.tar.xz"
      sha256 "412d395401c44ce05ea3dfb87a07f208757f9d562c715b2feccceefe6e0647c1"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.11.0/brrelease-v1.11.0-eac3c18-linux-arm64.tar.xz"
      sha256 "f8d795eb9d1607c9cb61951d1792e833b98bc97c1efd69eca02e9534ab690ab3"
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
