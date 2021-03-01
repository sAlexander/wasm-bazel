workspace(
    name = "wasm_bazel",
)

load("//:deps.bzl", "wasm_bazel_dev_dependencies")

wasm_bazel_dev_dependencies()

#
# Third party examples
#

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_google_brotli",
    build_file = "//examples/brotli:BUILD.com_google_brotli",
    strip_prefix = "brotli-1.0.9",
    urls = [
        "https://github.com/google/brotli/archive/v1.0.9.tar.gz",
    ],
)
