class Candlec < Formula
  desc "Compiler for CASM"
  homepage "https://candle.nozyx.dev"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.1.0/candlec-v1.1.0-macos-aarch64.zip"
      sha256 "04e471a0645fe219b8e52e06623979af568954c207eacb7bf80eba313517a02d"
    else
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.1.0/candlec-v1.1.0-macos-x86_64.zip"
      sha256 "e075dffc34d5ccc4df69b98caf706eaa355297abbbb808af723050435ccb871c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.1.0/candlec-v1.1.0-linux-aarch64-glibc.zip"
      sha256 "3e11860ef098908767e70a25ec2b84e92a3cb1e5628cd36cc6c79613f60f4591"
    else
      url "https://github.com/candle-ecosystem/candlec/releases/download/v1.1.0/candlec-v1.1.0-linux-x86_64-glibc.zip"
      sha256 "77cf6bcbbcf128dcd60dde027842daf780c65b0213ec2f94070259f7af354d3e"
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
