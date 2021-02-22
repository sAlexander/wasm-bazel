load("//:wasm.bzl", "cc_native_wasm_library", "cc_native_wasm_binary")

cc_native_wasm_library(
	name = "library",
	hdrs = ["library.h",],
	srcs = ["library.cc",],
)

cc_native_wasm_binary(
	name = "binary",
	srcs = ["binary.cc"],
	deps = [":library"],
)
