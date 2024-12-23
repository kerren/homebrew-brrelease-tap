class Brrelease < Formula
  desc "The install scripts for brrelease"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.9.0/brrelease-v1.9.0-4ea9a89-darwin-x64.tar.xz"
  sha256 "494bc3be40c5b96c3b500c74bc50beae95e409b080e55059dffd2b75306f524e"
  version "1.9.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.9.0/brrelease-v1.9.0-4ea9a89-darwin-arm64.tar.xz"
      sha256 "78983fbc612f0d835403120aa1b6cf315f4c1b05c0366a959bb8bb3f0a30bf39"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.9.0/brrelease-v1.9.0-4ea9a89-linux-x64.tar.xz"
      sha256 "bf213c93672cfc7f0c7e5c733afdff41244e2c2dfd8230414352620d911bbbd8"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.9.0/brrelease-v1.9.0-4ea9a89-linux-arm64.tar.xz"
      sha256 "59394fd5fad821109da697eefaa192f5efd9923830e0f73b27d1c9269ec4eb8a"
    end
  end

  def install
    inreplace "bin/brrelease", /^CLIENT_HOME=/, "export BRRELEASE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/brrelease"

    bash_completion.install libexec/"autocomplete-scripts/brew/bash" => "brrelease"
    zsh_completion.install libexec/"autocomplete-scripts/brew/zsh/_brrelease"
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
