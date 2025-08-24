class Zls < Formula
  desc "Language Server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://github.com/zigtools/zls/archive/refs/tags/0.15.0.tar.gz"
  sha256 "e5f12bc3f7286b0ca6a3d6bc0b48f1dfa68be3249fa05c7f2bf2ff9c1d8ce84c"
  license "MIT"
  head "https://github.com/zigtools/zls.git", branch: "master"

  bottle do
    sha256 arm64_sequoia: "3d345e68e7da58f62e1b96ecd4a57b0e1084c4f9abf972de508d4accb19af12f"
  end

  depends_on "zig"

  def install
    # Fix illegal instruction errors when using bottles on older CPUs.
    # https://github.com/Homebrew/homebrew-core/issues/92282
    cpu = case ENV.effective_arch
    when :arm_vortex_tempest then "apple_m1" # See `zig targets`.
    when :armv8 then "xgene1" # Closest to `-march=armv8-a`
    else ENV.effective_arch
    end

    args = []
    args << "-Dcpu=#{cpu}" if build.bottle?

    system "zig", "build", *args, *std_zig_args
  end

  test do
    test_config = testpath/"zls.json"
    test_config.write <<~JSON
      {
        "enable_semantic_tokens": true
      }
    JSON

    json = <<~JSON
      {
        "jsonrpc": "2.0",
        "id": 1,
        "method": "initialize",
        "params": {
          "rootUri": null,
          "capabilities": {}
        }
      }
    JSON

    input = "Content-Length: #{json.size}\r\n\r\n#{json}"
    output = pipe_output("#{bin}/zls --config-path #{test_config}", input, 1)
    assert_match(/^Content-Length: \d+/i, output)

    assert_match version.to_s, shell_output("#{bin}/zls --version")
  end
end