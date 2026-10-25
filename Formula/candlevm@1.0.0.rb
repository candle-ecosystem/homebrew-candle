class CandlevmAT100 < Formula
  desc "Language-independent bytecode virtual machine for the Candle ecosystem"
  homepage "https://candle.nozyx.dev"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Candle-Ecosystem/CandleVM/releases/download/v1.0.0/candlevm-v1.0.0-macos-aarch64.zip"
      sha256 "8cc17bcca730aaaaf771b68c5f57dacf28244608346c47939a0d95c1a568d4e9"
    else
      url "https://github.com/Candle-Ecosystem/CandleVM/releases/download/v1.0.0/candlevm-v1.0.0-macos-x86_64.zip"
      sha256 "744550d52f5570c175581f409c00d23069d604e79d67eebf5961099352138fb1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Candle-Ecosystem/CandleVM/releases/download/v1.0.0/candlevm-v1.0.0-linux-aarch64-glibc.zip"
      sha256 "8cc17bcca730aaaaf771b68c5f57dacf28244608346c47939a0d95c1a568d4e9"
    else
      url "https://github.com/Candle-Ecosystem/CandleVM/releases/download/v1.0.0/candlevm-v1.0.0-linux-x86_64-glibc.zip"
      sha256 "f4d36b36092282d05793e0061b5feb109febd760ba5cf0512850ce8faf80a985"
    end
  end

  def install
    prefix.install Dir["*"]
    (prefix/"plugins").mkpath
    bin.install_symlink prefix/"candlevm" => "candlevm-1.0.0"
  end

  test do
    assert_predicate prefix/"candlevm", :executable?
    assert_predicate prefix/"plugins", :directory?
  end
end