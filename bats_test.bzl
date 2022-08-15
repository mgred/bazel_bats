def _bats_test_impl(ctx):

  CONTENT = """
#! /usr/bin/env bash

{bats_bin} {bats_test}
  """.format(
      bats_bin = ctx.executable._bats.short_path,
      bats_test = " ".join(['"{}"'.format(s.short_path) for s in ctx.files.srcs]))

  runner = ctx.actions.declare_file(ctx.label.name + "_bats_runnner.sh")

  ctx.actions.write(
      output = runner,
      content = CONTENT,
      is_executable = True,
  )

  runfiles = ctx.runfiles(
    files = ctx.files.srcs,
    transitive_files = depset(ctx.files.data + ctx.files.deps),
  ).merge(ctx.attr._bats.default_runfiles)

  providers = [
      DefaultInfo(files = depset([runner]), executable = runner, runfiles = runfiles),
  ]

  return providers

bats_test = rule(
    implementation = _bats_test_impl,
    attrs = {
        "data": attr.label_list(allow_files = True),
        "deps": attr.label_list(),
        "srcs": attr.label_list(
            allow_files = [".bats"],
        ),
        "_bats": attr.label(
            default = Label("@bats-core//:bats"),
            executable = True,
            cfg = "exec",
        )
    },
    test = True,
)
