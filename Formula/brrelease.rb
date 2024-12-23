class Brrelease < Formula
  desc "The install scripts for brrelease"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/v1.8.3/brrelease-v1.8.3-93401e0-darwin-x64.tar.xz"
  sha256 "8ed2330c7e964b5c926ca514c42805e60d1ece1c7b4122004084cb9c9dedc366"
  version "1.8.3"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.8.3/brrelease-v1.8.3-93401e0-darwin-arm64.tar.xz"
      sha256 "4cf305aac5cad480404e7d1256531fbab2972ec23588c8ef23092a0b5cec0e48"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/v1.8.3/brrelease-v1.8.3-93401e0-linux-x64.tar.xz"
      sha256 "290d3b00d84bb0e461a9109f1893f32dea78c88e0d35e0e1dc93a816a19aa91d"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/v1.8.3/brrelease-v1.8.3-93401e0-linux-arm.tar.xz"
      sha256 "290d3b00d84bb0e461a9109f1893f32dea78c88e0d35e0e1dc93a816a19aa91d"
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
