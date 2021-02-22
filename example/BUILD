load("@wasm_bazel//:wasm.bzl", "cc_native_wasm_binary", "cc_native_wasm_library", "wasm_extract_js", "wasm_extract_wasm")

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

cc_native_wasm_binary(
	name = "binary_bind",
	srcs = ["binary_bind.cc"],
	deps = [":library"],
	bind = True,
)

wasm_extract_js(
	name = "binary-wasm-js",
	src = ":binary-wasm",
)

wasm_extract_wasm(
	name = "binary-wasm-wasm",
	src = ":binary-wasm",
)
