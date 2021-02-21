EmInfo = provider(
  "Info needed to compile/link c++ using the emscripten compiler.",
  fields={
    "hdrs": "depset of header Files from transitive dependencies.",
    "objs": "depset of Files from compilation.",
  })

def _wasm_binary_impl(ctx):
  transitive_hdrs = [dep[EmInfo].hdrs for dep in ctx.attr.deps]
  transitive_objs = [dep[EmInfo].objs for dep in ctx.attr.deps]

  tool_deps = ctx.attr._compiler.default_runfiles.files

  hdrs = depset(ctx.files.hdrs, transitive=transitive_hdrs)
  objs = []
  for src in ctx.files.srcs:
    inputs = depset([src], transitive=[hdrs, tool_deps])
    out = ctx.actions.declare_file(src.path + ".o")

    args = ctx.actions.args()
    args.add(src)
    args.add("-o", out)
    args.add("-c")
    args.add("-I.")

    ctx.actions.run(
        mnemonic="EmscriptenCompile",
        executable = ctx.executable._compiler,
        arguments = [args],
        inputs = inputs,
        outputs = [out],
        env = {
        "EM_CACHE": "/tmp/.cache",
        },
      )
    objs.append(out)

  # Create the binary.
  to_link = depset(objs, transitive=transitive_objs)
  inputs = depset(transitive=[hdrs, tool_deps, to_link])
  out_js = ctx.actions.declare_file(ctx.label.name + ".js")
  out_wasm = ctx.actions.declare_file(ctx.label.name + ".wasm")

  args = ctx.actions.args()
  args.add_all(to_link)
  args.add("-o", out_js)
  args.add("-I.")
  args.add("--bind")

  ctx.actions.run(
    mnemonic="EmscriptenLink",
    executable = ctx.executable._compiler,
    arguments = [args],
    inputs = inputs,
    outputs = [out_js, out_wasm],
    env = {
    "EM_CACHE": "/tmp/.cache",
    },
  )
  objs.append(out_js)
  objs.append(out_wasm)

  files = depset(objs + [out_js, out_wasm])
  return [DefaultInfo(files=files), EmInfo(hdrs = hdrs, objs = depset(objs, transitive=transitive_objs))]

def _wasm_library_impl(ctx):
  transitive_hdrs = [dep[EmInfo].hdrs for dep in ctx.attr.deps]
  transitive_objs = [dep[EmInfo].objs for dep in ctx.attr.deps]

  tool_deps = ctx.attr._compiler.default_runfiles.files

  hdrs = depset(ctx.files.hdrs, transitive=transitive_hdrs)
  objs = []
  for src in ctx.files.srcs:
    inputs = depset([src], transitive=[hdrs, tool_deps])
    out = ctx.actions.declare_file(src.path + ".o")

    args = ctx.actions.args()
    args.add(src)
    args.add("-o", out)
    args.add("-c")
    args.add("-I.")

    ctx.actions.run(
        mnemonic="EmscriptenCompile",
        executable = ctx.executable._compiler,
        arguments = [args],
        inputs = inputs,
        outputs = [out],
        env = {
        "EM_CACHE": "/tmp/.cache",
        },
      )
    objs.append(out)

  return [DefaultInfo(files=depset(objs)), EmInfo(hdrs = hdrs, objs = depset(objs, transitive=transitive_objs))]


wasm_library = rule(
  implementation = _wasm_library_impl,
  attrs = {
    "srcs": attr.label_list(allow_files = True),
    "hdrs": attr.label_list(allow_files = True),
    "deps": attr.label_list(providers = [EmInfo]),
    "_compiler": attr.label(
    default = Label("@wasm-binaries//:emcc"),
        executable = True,
        cfg = "exec",),
  }
)

wasm_binary = rule(
  implementation = _wasm_binary_impl,
  attrs = {
    "srcs": attr.label_list(allow_files = True),
    "hdrs": attr.label_list(allow_files = True),
    "deps": attr.label_list(providers = [EmInfo]),
    "_compiler": attr.label(
		default = Label("@wasm-binaries//:emcc"),
        executable = True,
        cfg = "exec",),
  }
)
