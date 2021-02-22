load("@wasm_bazel//:wasm.bzl", "cc_native_wasm_binary", "cc_native_wasm_library")

cc_native_wasm_library(
    name = "library",
    srcs = ["library.cc"],
    hdrs = ["library.h"],
)

cc_native_wasm_binary(
    name = "binary",
    srcs = ["binary.cc"],
    deps = [":library"],
)
