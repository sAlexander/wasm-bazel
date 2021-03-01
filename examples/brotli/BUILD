load("@wasm_bazel//:wasm.bzl", "cc_native_wasm_binary")

cc_native_wasm_binary(
    name = "main",
    srcs = ["main.cc"],
    deps = [
        "@com_google_brotli//:brotlidec",
        "@com_google_brotli//:brotlienc",
    ],
)

exports_files(["index.html"])
