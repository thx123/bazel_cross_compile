# project/BUILD.bazel
load("@rules_cc//cc:defs.bzl", "cc_binary")
load("@aspect_bazel_lib//lib:transitions.bzl", "platform_transition_filegroup")

package(
    default_visibility = ["//visibility:public"],
)

cc_library(
    name = "functions",
    hdrs = ["functions.h"],
    srcs = ["functions.c"],
)

cc_binary(
    name = "main",
    srcs = [
        "main.c",
    ],
    deps = [
      ":functions",
    ],
    linkopts = [
        "-Wl,-entry=main",
    ],
    target_compatible_with = [
        # target criteria for STM32G4
        "@platforms//os:none",
        "//cfg-bazel/cpu:cortex_m4",
    ],
)

platform_transition_filegroup(
    name = "cortex_m4_elf",
    srcs = [":main"],
    target_platform = "//cfg-bazel/platforms:stm32g4",
)
