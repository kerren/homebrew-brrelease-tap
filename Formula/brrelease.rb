class Brrelease < Formula
  desc "Install script for the brrelease CLI"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.12.0/brrelease-v1.12.0-b559dc0-darwin-x64.tar.xz"
  version "1.12.0"
  sha256 "613a4be894b49e5275051b1e05d08e1263754257992a46957627a18ad5528b68"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.12.0/brrelease-v1.12.0-b559dc0-darwin-arm64.tar.xz"
      sha256 "c08e21bfa09c13d960e343a0e03d1b0f33088fa2c75cf937b555a9c86c9c1bfc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.12.0/brrelease-v1.12.0-b559dc0-linux-x64.tar.xz"
      sha256 "b9308ab66f9f8a4f930d5cfb055ae9c9df681a2bc8741ecf70a0fca93e5a073c"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.12.0/brrelease-v1.12.0-b559dc0-linux-arm64.tar.xz"
      sha256 "3494c7473c63efd3e64eefc136ff4906a137352b2a8ea03bfa3fa8eec49ac287"
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
