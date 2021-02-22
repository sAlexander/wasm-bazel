package(default_visibility = ['//visibility:public'])

filegroup(
    name = "all",
    srcs = glob(["**/*"], exclude=["**/* *", "**/* */**"]),
)

py_binary(
  name = "emcc",
  srcs = [
	  "emscripten/emcc.py",
  ],
  data = [
	  ":all",
	  "@wasm_node//:all",
  ],
  env = {
	"EM_CACHE": "/tmp/.emscripten_cache",
  },
)
