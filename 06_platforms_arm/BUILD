load("//bazel/toolchain/aarch64-rpi3-linux-gnu:aarch64_toolchain_setup.bzl", "setup_aarch64_toolchain")
load("//cfg-bazel/toolchains/x86_64-aarch64-none-linux-gnu:x86_64_aarch64_none_linux_gnu_setup.bzl",
     "setup_x86_64_aarch64_none_linux_gnu_cc_toolchain")

setup_aarch64_toolchain()  # for aarch64-rpi3-linux-gnu
# setup_x86_64_aarch64_none_linux_gnu_cc_toolchain()


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
