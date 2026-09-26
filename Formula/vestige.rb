class Vestige < Formula
  desc "Memory system for AI coding agents: backfill, composed-graph reasoning, FSRS-6 decay, retrieval receipts"
  homepage "https://github.com/samvallad33/vestige"
  version "3.1.0"
  license "AGPL-3.0"

  on_arm do
    on_macos do
      url "https://github.com/samvallad33/vestige/releases/download/v3.1.0/vestige-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "a298cb12682d00f6f382da120f7a35923f0f7982ecdad00c15236cd5107aaa89"
    end
    on_linux do
      url "https://github.com/samvallad33/vestige/releases/download/v3.1.0/vestige-mcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b593fb9b08526a2ca4b92c9c4cd7ed37df5363ed00fbbc06e81623e360242d1"
    end
  end
  on_intel do
    on_macos do
      url "https://github.com/samvallad33/vestige/releases/download/v3.1.0/vestige-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "35c0359ca8e85ff0ec4d8a4dcbc6a9da263654a1dca40e9bdb59d478a8fcad50"
    end
    on_linux do
      url "https://github.com/samvallad33/vestige/releases/download/v3.1.0/vestige-mcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa3b2f944555cbb9d0333604a569041a38b96db803bb5d8d525a84f779430159"
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
