class Datadiff < Formula
  desc "Semantic diff for structured data files (JSON, YAML, CSV, TOML, XML)"
  homepage "https://github.com/cloudroad-io/datadiff"
  version "0.2.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudroad-io/datadiff/releases/download/v0.2.0/datadiff-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "56ad9e5fd09af52469c40d82970080260b9853bb99bcc814830ef298923b17e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cloudroad-io/datadiff/releases/download/v0.2.0/datadiff-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c628922a5d9644aaf5fc440c87f275c385c82e5569a595bb2a65738e8810a5b8"
    end
    on_arm do
      url "https://github.com/cloudroad-io/datadiff/releases/download/v0.2.0/datadiff-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1aac0b377810b8a13128335eb21149545d3c275d850cfad6b1698d31937e101"
    end
  end

  def install
    bin.install "datadiff"
  end

  test do
    (testpath/"a.json").write('{"replicas": 3}')
    (testpath/"b.json").write('{"replicas": 5}')
    output = shell_output("#{bin}/datadiff --no-color a.json b.json", 1)
    assert_match "~ replicas: 3", output
  end
end
