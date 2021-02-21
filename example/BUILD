load("//:wasm.bzl", "wasm_library", "wasm_binary")

wasm_library(
	name = "library",
	hdrs = ["library.h",],
	srcs = ["library.cc",],
)

wasm_binary(
	name = "binary",
	deps = [":library"],
)
