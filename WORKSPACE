workspace(name="bazel_bats")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

new_git_repository(
    name = "bats-core",
    remote = "https://github.com/bats-core/bats-core.git",
    branch = "master",
    build_file = "//:bats/BUILD.core.bazel"
)

new_git_repository(
    name = "bats-support",
    remote = "https://github.com/bats-core/bats-support.git",
    branch = "master",
    build_file = "//:bats/BUILD.support.bazel"
)

new_git_repository(
    name = "bats-assert",
    remote = "https://github.com/bats-core/bats-assert.git",
    branch = "master",
    build_file = "//:bats/BUILD.assert.bazel"
)
