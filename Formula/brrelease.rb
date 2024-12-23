class Brrelease < Formula
  desc "The install scripts for brrelease"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.10.0/brrelease-v1.10.0-d3ff050-darwin-x64.tar.xz"
  sha256 "8d264fe39a59dcc504f1c55325374e74b46035d51f8658da6feb26401e810f08"
  version "1.9.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.10.0/brrelease-v1.10.0-d3ff050-darwin-arm64.tar.xz"
      sha256 "783d81c113c75fca93a621f03cd0d87de721746543aaa08ee4da1e454256bb48"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.10.0/brrelease-v1.10.0-d3ff050-linux-x64.tar.xz"
      sha256 "3fbbca05d7f2f118f06bc4870e7bc9bb54ac5829d88199e0fdfe563f89a37bcf"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.10.0/brrelease-v1.10.0-d3ff050-linux-arm64.tar.xz"
      sha256 "cde70f662d5887a080d16a96fcc51cd885119493a01b68c3443068b83cada23d"
    end
  end

  def install
    inreplace "bin/brrelease", /^CLIENT_HOME=/, "export BRRELEASE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/brrelease"
  end

  def caveats; <<~EOS
    To use the brrelease CLI's autocomplete --
      Via homebrew's shell completion:
        1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
            NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
                  and called, either explicitly or via a framework like oh-my-zsh.
        2) Then run
          $ brrelease autocomplete --refresh-cache
      OR
      Use our standalone setup:
        1) Run and follow the install steps:
          $ brrelease autocomplete
  EOS
  end

  test do
    system bin/"brrelease", "version"
  end
end
