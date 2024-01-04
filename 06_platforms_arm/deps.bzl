load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

URL_TOOLCHAIN = "https://github.com/ltekieli/devboards-toolchains/releases/download/v2021.12.01/"
URL_SYSROOT = "https://github.com/ltekieli/buildroot/releases/download/v2021.12.01/"

def aarch64_rpi3_linux_gnu():
    if "aarch64-rpi3-linux-gnu" not in native.existing_rules():
        http_archive(
            name = "aarch64-rpi3-linux-gnu",
            build_file = Label("//third_party/toolchains:aarch64-rpi3-linux-gnu.BUILD"),
            url = URL_TOOLCHAIN + "aarch64-rpi3-linux-gnu.tar.gz",
            sha256 = "02d1186d61dd253a6138d858f63c34f4036a80d0b0eeeb8f2d6666c987cadfad",
        )

def aarch64_rpi3_linux_gnu_sysroot():
    if "aarch64-rpi3-linux-gnu-sysroot" not in native.existing_rules():
        http_archive(
            name = "aarch64-rpi3-linux-gnu-sysroot",
            build_file = Label("//third_party/toolchains:aarch64-rpi3-linux-gnu-sysroot.BUILD"),
            url = URL_SYSROOT + "raspberrypi3_64.tar.gz",
            sha256 = "bde52d18418dfa294f7c3442deaaebe644cb1c6e5bb24435255d311f994c06e1",
        )

def arm_cortex_a8_linux_gnueabihf():
    if "arm-cortex_a8-linux-gnueabihf" not in native.existing_rules():
        http_archive(
            name = "arm-cortex_a8-linux-gnueabihf",
            build_file = Label("//third_party/toolchains:arm-cortex_a8-linux-gnueabihf.BUILD"),
            url = URL_TOOLCHAIN + "arm-cortex_a8-linux-gnueabihf.tar.gz",
            sha256 = "bf731dcdc1b8e925334a26d01d822f5e65efc580785f9fcbf90405b9397f16a8",
        )

def arm_cortex_a8_linux_gnueabihf_sysroot():
    if "arm-cortex_a8-linux-gnueabihf-sysroot" not in native.existing_rules():
        http_archive(
            name = "arm-cortex_a8-linux-gnueabihf-sysroot",
            build_file = Label("//third_party/toolchains:arm-cortex_a8-linux-gnueabihf-sysroot.BUILD"),
            url = URL_SYSROOT + "beaglebone.tar.gz",
            sha256 = "c716440776ec0e8823e226268ce490bf7e705c2c869e41b1bebcf26ff99fd19d",
        )

def x86_64_aarch64_none_linux_gnu():
    """required for C/C++ cross-compilation from X86_64 build environment to AARCH64 target environment"""
    if "x86_64_aarch64_none_linux_gnu" not in native.existing_rules():
        http_archive(
            # Arm GNU Toolchain Downloads homepage:
            # https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
            name = "x86_64_aarch64_none_linux_gnu",
            patch_args = ["-p1"],
            patches = ["//cfg-bazel/toolchains/x86_64-aarch64-none-linux-gnu:libX_so.patch"],
            urls = ["https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz?rev=22c39fc25e5541818967b4ff5a09ef3e&hash=E7676169CE35FC2AAECF4C121E426083871CA6E5"],
            sha256 = "12fcdf13a7430655229b20438a49e8566e26551ba08759922cdaf4695b0d4e23",
            strip_prefix = "arm-gnu-toolchain-13.2.Rel1-x86_64-aarch64-none-linux-gnu",
            # build_file = "@//cfg-bazel/toolchains/x86_64-aarch64-none-linux-gnu:BUILD.repo",
            build_file = Label("//cfg-bazel/toolchains/x86_64-aarch64-none-linux-gnu:BUILD.repo"),
        )

# This is needed to build 3rd-party non-Bazel modules (e.g. external projects
# that are based on CMake, Autotools, or other build systems).
# Background: https://bazelbuild.github.io/rules_foreign_cc/main/cmake.html
_ALL_CONTENT = """\
filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

def zeromq():
    """required by cppzmq below"""
    if "zeromq" not in native.existing_rules():
        http_archive(
            name = "zeromq",
            urls = ["https://github.com/zeromq/libzmq/releases/download/v4.3.5/zeromq-4.3.5.tar.gz"],
            strip_prefix = "zeromq-4.3.5",
            build_file_content = _ALL_CONTENT,
        )

def cppzmq():
    if "cppzmq" not in native.existing_rules():
        http_archive(
            name = "cppzmq",
            urls = ["https://github.com/zeromq/cppzmq/archive/refs/tags/v4.10.0.tar.gz"],
            strip_prefix = "cppzmq-4.10.0",
            build_file_content = _ALL_CONTENT,
        )

def _non_module_dependencies_impl(_ctx):
    aarch64_rpi3_linux_gnu()
    aarch64_rpi3_linux_gnu_sysroot()
    arm_cortex_a8_linux_gnueabihf()
    arm_cortex_a8_linux_gnueabihf_sysroot()
    x86_64_aarch64_none_linux_gnu()
    zeromq()
    cppzmq()

non_module_dependencies = module_extension(
    implementation = _non_module_dependencies_impl,
)

