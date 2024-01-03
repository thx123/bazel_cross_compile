load(":cc_toolchain_config.bzl", "cc_toolchain_config")

def setup_aarch64_toolchain():
    native.filegroup(name = "empty")
    
    native.filegroup(
      name = 'all_files',
      srcs = [
        '@aarch64-rpi3-linux-gnu-sysroot//:sysroot',
        '@aarch64-rpi3-linux-gnu//:toolchain',
      ],
    )
    
    cc_toolchain_config(
        name = "aarch64_toolchain_config",
        toolchain_ref = "@aarch64-rpi3-linux-gnu//:toolchain",
        sysroot_ref = "@aarch64-rpi3-linux-gnu-sysroot//:sysroot",
    )
    
    native.cc_toolchain(
        name = "aarch64_toolchain",
        toolchain_identifier = "aarch64-toolchain",
        toolchain_config = ":aarch64_toolchain_config",
        all_files = ":all_files",
        ar_files = ":all_files",
        compiler_files = ":all_files",
        dwp_files = ":empty",
        linker_files = ":all_files",
        objcopy_files = ":empty",
        strip_files = ":empty",
    )
    
    native.cc_toolchain_suite(
        name = "aarch64_toolchain_suite",
        toolchains = {
            "aarch64": ":aarch64_toolchain",
        },
        tags = ["manual"]
    )
    
    native.toolchain(
        name = "aarch64_linux_toolchain",
        exec_compatible_with = [
            "@platforms//os:linux",
            "@platforms//cpu:x86_64",
        ],
        target_compatible_with = [
            "@platforms//os:linux",
            "@platforms//cpu:aarch64",
        ],
        toolchain = ":aarch64_toolchain",
        toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    )
