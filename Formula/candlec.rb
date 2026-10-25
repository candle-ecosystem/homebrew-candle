class Candlec < Formula
  desc "Compiler for CASM"
  homepage "https://candle.nozyx.dev"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.0.0/candlec-v1.0.0-macos-aarch64.zip"
      sha256 "d608d9c3f4cbec9f50a166c63f474a77120b1019de2293fc107aa4c5040c3e9f"
    else
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.0.0/candlec-v1.0.0-macos-x86_64.zip"
      sha256 "38a03c076702cb5c11078ab8f673e20867ee03600655a56fb6162518f0601575"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.0.0/candlec-v1.0.0-linux-aarch64-glibc.zip"
      sha256 "75da2ebd557311186c98848172977592097d48687d581e5b79579c01ca6a3b08"
    else
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.0.0/candlec-v1.0.0-linux-x86_64-glibc.zip"
      sha256 "c916b31f809294737f8599bc76d67ffebf41cb1bc24f6eea433228b98109bce4"
    end
  end

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"candlec" => "candlec"
  end

  test do
    assert_predicate prefix/"candlec", :executable?
  end
end
