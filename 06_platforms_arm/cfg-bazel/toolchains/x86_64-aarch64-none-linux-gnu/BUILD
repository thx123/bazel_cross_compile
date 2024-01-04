# Every .bzl file must have a corresponding package.
# Note that this BUILD file does not need to do anything except exist.
# Background: https://bazel.build/external/module
load("@bazel_tools//rules/core:filegroup.bzl", "filegroup")

filegroup(
    name = "exported_files",
    srcs = [
        "libX_so.patch",
    ],
    visibility = ["//visibility:public"],  # Make the exported files visible to other targets
)

