# Brotli in WebAssembly

This example shows how to use the brotli compression library ([github](https://github.com/google/brotli)) with wasm_bazel.

## Usage:

```
# From the root of wasm_bazel

# This command builds all of the needed web assembly pieces.
bazel build -c opt //examples/brotli:main-wasm

# Copy all of the files for serving
mkdir -p tmp/brotli
cp examples/brotli/index.html tmp/brotli/
cp bazel-bin/examples/brotli/main-wasm.js tmp/brotli/
cp bazel-bin/examples/brotli/main-wasm.wasm tmp/brotli/

# Start a simple webserver.
(cd tmp/brotli; python3 -m http.server)
```

