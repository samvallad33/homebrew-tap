class Vestige < Formula
  desc "Local memory for MCP agents, on a signed append-only log"
  homepage "https://github.com/samvallad33/vestige"
  version "4.1.0"
  license "AGPL-3.0-only"

  on_arm do
    on_macos do
      url "https://github.com/samvallad33/vestige/releases/download/v4.1.0/vestige-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "48598ca11d336bab2e002c736c7e6a44c1fdbd669f2fbc2f290f9a1ad0aefea7"
    end
    on_linux do
      url "https://github.com/samvallad33/vestige/releases/download/v4.1.0/vestige-mcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9eebeb5ce4af10c52d7b2f7db064f6fc16537f1593730d4ba9ef03f94ef90e7"
    end
  end
  on_intel do
    on_macos do
      url "https://github.com/samvallad33/vestige/releases/download/v4.1.0/vestige-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "cf5d68e1ba7d4e999960ed60b8c0779f2ec4aeb5f31eb3b6aa558bcfabc68ab5"
    end
    on_linux do
      url "https://github.com/samvallad33/vestige/releases/download/v4.1.0/vestige-mcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "16798591edbdee7b6577d0d1dda76209ddaad56ea76b3e230d0eecf23edcaa1f"
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
