load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def wasm_bazel_dev_dependencies():
    """Import dependencies that are needed for wasm_bazel."""

    # Both dependencies were extracted from the emsdk.

    # To update this file:
    #   - Go to https://chromium.googlesource.com/emscripten-releases
    #   - Grab the hash from the most recent commit
    #   - Replace the url here and remove sha256.
    #   - Update the sha256 with the latest sha.
    http_archive(
        name = "wasm_binaries",
        build_file = "@wasm_bazel//:wasm_binaries.BUILD",
        patches = ["@wasm_bazel//:wasm_binaries.patch"],
        sha256 = "96d7241f5dbee5b8d6dc9c6e9317bb325d0a58b55fa5f1487134da8000a166f7",
        strip_prefix = "install",
        type = "tar.bz2",
        urls = ["https://storage.googleapis.com/webassembly/emscripten-releases-builds/linux/9039d29da6d007837ab27497167d26115d96523c/wasm-binaries.tbz2"],
    )

    # To update this file:
    #    - Look at the version used in emsdk.
    http_archive(
        name = "wasm_node",
        build_file = "@wasm_bazel//:wasm_node.BUILD",
        strip_prefix = "node-v14.15.5-linux-x64",
        sha256 = "fa198afa9a2872cde991c3aa71796894bf7b5310d6eb178c3eafcf66e3ae79a7",
        urls = ["https://storage.googleapis.com/webassembly/emscripten-releases-builds/deps/node-v14.15.5-linux-x64.tar.xz"],
    )
