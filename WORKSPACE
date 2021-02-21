load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "wasm-binaries",
    urls = ["https://storage.googleapis.com/webassembly/emscripten-releases-builds/linux/9039d29da6d007837ab27497167d26115d96523c/wasm-binaries.tbz2"],
	build_file = "//:wasm-binaries.BUILD",
	patches = ["//:wasm-binaries.patch"],
    strip_prefix = "install",
    sha256 = "96d7241f5dbee5b8d6dc9c6e9317bb325d0a58b55fa5f1487134da8000a166f7",
    type = "tar.bz2",
)

http_archive(
	name = "node",
	urls = ["https://storage.googleapis.com/webassembly/emscripten-releases-builds/deps/node-v14.15.5-linux-x64.tar.xz"],
	build_file = "//:node.BUILD",
	strip_prefix = "node-v14.15.5-linux-x64",
)
