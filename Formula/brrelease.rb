class Brrelease < Formula
  desc "Install script for the brrelease CLI"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.16.0/brrelease-v1.16.0-97e309c-darwin-x64.tar.xz"
  version "1.16.0"
  sha256 "9c94db8f676d6abbdff748bc21c412a2df86d719bb0a16bd68ba52db103b3c98"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.16.0/brrelease-v1.16.0-97e309c-darwin-arm64.tar.xz"
      sha256 "660163d86cd9dcec69b1126fb57f02c4be7cb6d211ee74da0e2f70d8948ec758"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.16.0/brrelease-v1.16.0-97e309c-linux-x64.tar.xz"
      sha256 "0052eab1f4bdf00fd07cc80199e9471161a98a9fe96ced190e9563e3b73ea39d"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.16.0/brrelease-v1.16.0-97e309c-linux-arm64.tar.xz"
      sha256 "6e744acb1c99eddd89bc5d2ee5648e267195f9bb5ec18c2dd76177e1658d7a8d"
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
