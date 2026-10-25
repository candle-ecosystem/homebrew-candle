class Candlevm < Formula
  desc "Language-independent bytecode virtual machine for the Candle ecosystem"
  homepage "https://candle.nozyx.dev"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Candle-Ecosystem/CandleVM/releases/download/v1.0.1/candlevm-v1.0.1-macos-aarch64.zip"
      sha256 "c85243bed89bb82110c4ff01cd054bf799f407428418203fe45ff143c553f77f"
    else
      url "https://github.com/Candle-Ecosystem/CandleVM/releases/download/v1.0.1/candlevm-v1.0.1-macos-x86_64.zip"
      sha256 "08f8122577af444f0eeb66be81adc6d6230496c5271659c6fb34c0beef30dd92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Candle-Ecosystem/CandleVM/releases/download/v1.0.1/candlevm-v1.0.1-linux-aarch64-glibc.zip"
      sha256 "bf6e40a1cee61bf5931f2f10eddf7a0bb2c4e959f9fc324311e65cf00e52cd26"
    else
      url "https://github.com/Candle-Ecosystem/CandleVM/releases/download/v1.0.1/candlevm-v1.0.1-linux-x86_64-glibc.zip"
      sha256 "8160f63328a4b48a6ce91d0bd7fe65a06aa70ea75d2b8220102b878b2be686f5"
    end
  end

  def install
    prefix.install Dir["*"]
    (prefix/"plugins").mkpath
    bin.install_symlink prefix/"candlevm" => "candlevm"
  end

  test do
    assert_predicate prefix/"candlevm", :executable?
    assert_predicate prefix/"plugins", :directory?
  end
end