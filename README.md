# wasm-bazel

A simple set of bazel rules and macros to build web assembly files with the Emscripten compiler.

# Usage

```
# WORKSPACE

http_archive(
    name = "wasm-bazel",
    urls = [{ LATEST RELEASE URL FOR THIS REPO }],
)
```

```
# BUILD file somewhere in your project
load("@wasm-bazel//:wasm.bzl", "cc_native_wasm_library", "cc_native_wasm_binary")

# Defines both a cc_library for the host system and a wasm_library for web assembly.
cc_native_wasm_library(
  name = "library",
  ...
)

# Defines both a cc_binary for the host system and a wasm_binary for web assembly.
#
# wasm_biniary will output two files that are generated by Emscripten:
#  - binary-wasm.js
#  - binary-wasm.wasm
# 
# See Emscripten for more details.
cc_native_wasm_library(
  name = "binary",
  deps = [
      ":library",
  ],
  ...
)
```

See a working example in the examples directory.

# License

Licensed under MIT (see LICENSE).
