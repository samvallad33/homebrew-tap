class Vestige < Formula
  desc "Memory system for AI coding agents: backfill, composed-graph reasoning, FSRS-6 decay, retrieval receipts"
  homepage "https://github.com/samvallad33/vestige"
  version "3.0.0"
  license "AGPL-3.0"

  on_arm do
    on_macos do
      url "https://github.com/samvallad33/vestige/releases/download/v3.0.0/vestige-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "a1391cf5f0145805e6846f1a7f7ab1282f585d56afd61dab46ab15754e689b04"
    end
    on_linux do
      url "https://github.com/samvallad33/vestige/releases/download/v3.0.0/vestige-mcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c9ac154e25c2bb5f01533b989eb7fd1a2d2c1f54fb172a177998bbc4ac48259"
    end
  end
  on_intel do
    on_macos do
      url "https://github.com/samvallad33/vestige/releases/download/v3.0.0/vestige-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "e2181a87410ef003c4aea202310dfff6440d043de56c3813fd50b6add4559cea"
    end
    on_linux do
      url "https://github.com/samvallad33/vestige/releases/download/v3.0.0/vestige-mcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ca554c95c5295c1a3052428c3b307229d73d086e3ed06800f854b8c846bc6d4"
    end
  end

  def install
    bin.install "vestige-mcp"
    bin.install "vestige"
    bin.install "vestige-restore"
  end

  def caveats
    <<~EOS
      Wire it into Claude Code with:
        claude mcp add vestige vestige-mcp -s user
    EOS
  end

  test do
    assert_predicate bin/"vestige-mcp", :executable?
  end
end
