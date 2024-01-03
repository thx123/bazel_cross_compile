load("//bazel/toolchain/aarch64-rpi3-linux-gnu:aarch64_toolchain_setup.bzl", "setup_aarch64_toolchain")

setup_aarch64_toolchain()


cc_library(
    name = "fun",
    hdrs = ["fun.h"],
    srcs = ["fun.cpp"],
)

cc_binary(
    name = "hello",
    srcs = ["main.cpp"],
    deps = [":fun"],
)
