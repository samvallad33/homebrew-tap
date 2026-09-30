class Vestige < Formula
  desc "Local memory for MCP agents, on a signed append-only log"
  homepage "https://github.com/samvallad33/vestige"
  version "4.0.0"
  license "AGPL-3.0-only"

  on_arm do
    on_macos do
      url "https://github.com/samvallad33/vestige/releases/download/v4.0.0/vestige-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "7eedb508191b1adb616b11e80f784da4ffba0b8dc3936d5d1afc80f50290a5f3"
    end
    on_linux do
      url "https://github.com/samvallad33/vestige/releases/download/v4.0.0/vestige-mcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fbb49efe901263cfe4661bcd4fc62e3a5fcbcfa3371e831e26aa50d70790b914"
    end
  end
  on_intel do
    on_macos do
      url "https://github.com/samvallad33/vestige/releases/download/v4.0.0/vestige-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "8c3cc6832468a4bbd0f9ac97379100be6dd73650af456ea7861db63858e7a764"
    end
    on_linux do
      url "https://github.com/samvallad33/vestige/releases/download/v4.0.0/vestige-mcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7df3f70ed593b01f7e64b5d02fbcdcb93a9db07925c1806f7f606ef76f03797"
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
    assert_match "4.0.0", shell_output("#{bin}/vestige-mcp --version")
    assert_predicate bin/"vestige-upgrade", :executable?
  end
end
