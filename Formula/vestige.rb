class Vestige < Formula
  desc "Local memory for MCP agents, on a signed append-only log"
  homepage "https://github.com/samvallad33/vestige"
  version "4.1.1"
  license "AGPL-3.0-only"

  on_arm do
    on_macos do
      url "https://github.com/samvallad33/vestige/releases/download/v4.1.1/vestige-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "1cdf6445757a56f977f1a51cd43451c1ab5827d577d162646cd521995650c383"
    end
    on_linux do
      url "https://github.com/samvallad33/vestige/releases/download/v4.1.1/vestige-mcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f6b6d0421a950cbb2aa9d5da65c0055a3d2205acf08db5d898822bc21d4f7e8"
    end
  end
  on_intel do
    on_macos do
      url "https://github.com/samvallad33/vestige/releases/download/v4.1.1/vestige-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "f8f21565732bb72fbdc214da91fee27cbb9c4c6255f990ced239767c68536f5d"
    end
    on_linux do
      url "https://github.com/samvallad33/vestige/releases/download/v4.1.1/vestige-mcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e00bdf609fc4a0034aa25889d0776d291b022565c05b82a49f9d010818947b6f"
    end
  end

  def install
    # vestige-upgrade must sit beside vestige-mcp: the first 4.0 launch on a
    # v3 data directory runs it to import vestige.db.
    bin.install "vestige-mcp", "vestige", "vestige-restore", "vestige-upgrade"
  end

  def caveats
    <<~EOS
      Wire it into Claude Code with:
        claude mcp add vestige vestige-mcp -s user
      Coming from v3? Quit every app running Vestige v3 first; the first 4.0
      launch upgrades vestige.db into a Strata log and leaves the v3 file as is.
    EOS
  end

  test do
    assert_match "4.1.0", shell_output("#{bin}/vestige-mcp --version")
    assert_predicate bin/"vestige-upgrade", :executable?
  end
end
