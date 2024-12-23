export const FormulaTemplate = `
class Brrelease < Formula
  desc "The install scripts for brrelease"
  homepage "https://github.com/kerren/brrelease"
  url "https://github.com/kerren/brrelease/releases/download/{{version}}/brrelease-{{version}}-{{identifier}}-darwin-x64.tar.xz"
  sha256 "{{darwin_x64_hash}}"
  version "1.9.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/{{version}}/brrelease-{{version}}-{{identifier}}-darwin-arm64.tar.xz"
      sha256 "{{darwin_arm64_hash}}"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kerren/brrelease/releases/download/{{version}}/brrelease-{{version}}-{{identifier}}-linux-x64.tar.xz"
      sha256 "{{linux_x64_hash}}"
    end
    on_arm do
      url "https://github.com/kerren/brrelease/releases/download/{{version}}/brrelease-{{version}}-{{identifier}}-linux-arm64.tar.xz"
      sha256 "{{linux_arm64_hash}}"
    end
  end

  def install
    inreplace "bin/brrelease", /^CLIENT_HOME=/, "export BRRELEASE_OCLIF_CLIENT_HOME=#{lib/"client"}\\nCLIENT_HOME="
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
`;
