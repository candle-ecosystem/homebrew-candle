class CandlecAT101 < Formula
  desc "Compiler for CASM"
  homepage "https://candle.nozyx.dev"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.0.1/candlec-v1.0.1-macos-aarch64.zip"
      sha256 "0161c6cb3e8980bca052225da4048b852c26b71a92417d741dfb096a83bde094"
    else
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.0.1/candlec-v1.0.1-macos-x86_64.zip"
      sha256 "4b0a25deab5a898ba70fdf1bf057e8de1d27c5285f244fa96d7c7f4027d3fba5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.0.1/candlec-v1.0.1-linux-aarch64-glibc.zip"
      sha256 "2671b2a7baff66438c54c037ddca8537c07cfeae4f364df810b35418d8849565"
    else
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.0.1/candlec-v1.0.1-linux-x86_64-glibc.zip"
      sha256 "b86d987d4b0217f9e09e7a805fda7e99fb009cc11e4efcf06ca105b1d185763e"
    end
  end

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"candlec" => "candlec-1.0.1"
  end

  test do
    assert_predicate prefix/"candlec", :executable?
  end
end
