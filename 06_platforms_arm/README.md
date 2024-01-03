# Cross-compilation cc toolchain build error
Using x86_64-aarch64-none-linux-gnu toolchain from: https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

## To reproduce the build error related to the `ar` tool:
```
git clone https://github.com/thx123/bazel_cross_compile.git
cd 06_platforms_arm
bazel build //examples_bazel/cpp:hello-world --platforms=//cfg-bazel/platforms:kr260_a
```

Build logs and error:
```
INFO: Options provided by the client:
  Inherited 'common' options: --isatty=1 --terminal_columns=133
INFO: Reading rc options for 'build' from /home/htie/coding/bazel/bazel_cross_compile/06_platforms_arm/.bazelrc:
  Inherited 'common' options: --enable_bzlmod --announce_rc
INFO: Reading rc options for 'build' from /home/htie/coding/bazel/bazel_cross_compile/06_platforms_arm/.bazelrc:
  'build' options: --verbose_failures --subcommands --incompatible_enable_cc_toolchain_resolution --cxxopt=-std=c++17
INFO: Found applicable config definition build:ptest3 in file /home/htie/coding/bazel/bazel_cross_compile/06_platforms_arm/.bazelrc: //examples_bazel/cpp:hello-world --platforms=//cfg-bazel/platforms:kr260_a
INFO: Analyzed target //examples_bazel/cpp:hello-world (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
SUBCOMMAND: # //examples_bazel/cpp:hello-greet [action 'Linking examples_bazel/cpp/libhello-greet.a', configuration: f0fb4f3b703dddeefc06e98de495fd603a76f63a2e7207d1123f1c3cd14809de, execution platform: @local_config_platform//:host]
(cd /home/htie/.cache/bazel/_bazel_htie/4ee483d004ffd1337ff6ec6d0c481397/execroot/_main && \
  exec env - \
    PATH=/home/htie/.cache/bazelisk/downloads/sha256/79e4f370efa6e31717b486af5d9efd95864d0ef13da138582224ac9b2a1bad86/bin:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/home/htie/.local/bin:/home/htie/bin:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin:/home/htie/.fzf/bin:/home/htie/.local/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin \
    PWD=/proc/self/cwd \
  external/_main~non_module_dependencies~x86_64_aarch64_none_linux_gnu/bin/aarch64-none-linux-gnu-ar rcsD bazel-out/k8-fastbuild/bin/examples_bazel/cpp/libhello-greet.a bazel-out/k8-fastbuild/bin/examples_bazel/cpp/_objs/hello-greet/hello-greet.o)
# Configuration: f0fb4f3b703dddeefc06e98de495fd603a76f63a2e7207d1123f1c3cd14809de
# Execution platform: @local_config_platform//:host
SUBCOMMAND: # //examples_bazel/cpp:hello-world [action 'Compiling examples_bazel/cpp/hello-world.cc', configuration: f0fb4f3b703dddeefc06e98de495fd603a76f63a2e7207d1123f1c3cd14809de, execution platform: @local_config_platform//:host]
(cd /home/htie/.cache/bazel/_bazel_htie/4ee483d004ffd1337ff6ec6d0c481397/execroot/_main && \
  exec env - \
    PATH=/home/htie/.cache/bazelisk/downloads/sha256/79e4f370efa6e31717b486af5d9efd95864d0ef13da138582224ac9b2a1bad86/bin:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/home/htie/.local/bin:/home/htie/bin:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin:/home/htie/.fzf/bin:/home/htie/.local/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin \
    PWD=/proc/self/cwd \
  external/_main~non_module_dependencies~x86_64_aarch64_none_linux_gnu/bin/aarch64-none-linux-gnu-gcc -MD -MF bazel-out/k8-fastbuild/bin/examples_bazel/cpp/_objs/hello-world/hello-world.d '-frandom-seed=bazel-out/k8-fastbuild/bin/examples_bazel/cpp/_objs/hello-world/hello-world.o' '-DBAZEL_CURRENT_REPOSITORY=""' -iquote . -iquote bazel-out/k8-fastbuild/bin -iquote external/bazel_tools -iquote bazel-out/k8-fastbuild/bin/external/bazel_tools '--sysroot=external/_main~non_module_dependencies~x86_64_aarch64_none_linux_gnu/aarch64-none-linux-gnu/libc' -no-canonical-prefixes -fno-canonical-system-headers -Wno-builtin-macro-redefined '-D__DATE__="redacted"' '-D__TIMESTAMP__="redacted"' '-D__TIME__="redacted"' '-std=c++17' -c examples_bazel/cpp/hello-world.cc -o bazel-out/k8-fastbuild/bin/examples_bazel/cpp/_objs/hello-world/hello-world.o)
# Configuration: f0fb4f3b703dddeefc06e98de495fd603a76f63a2e7207d1123f1c3cd14809de
# Execution platform: @local_config_platform//:host
ERROR: /home/htie/coding/bazel/bazel_cross_compile/06_platforms_arm/examples_bazel/cpp/BUILD:3:11: Linking examples_bazel/cpp/libhello-greet.a failed: (Exit 1): aarch64-none-linux-gnu-ar failed: error executing command (from target //examples_bazel/cpp:hello-greet)
  (cd /home/htie/.cache/bazel/_bazel_htie/4ee483d004ffd1337ff6ec6d0c481397/sandbox/linux-sandbox/27/execroot/_main && \
  exec env - \
    PATH=/home/htie/.cache/bazelisk/downloads/sha256/79e4f370efa6e31717b486af5d9efd95864d0ef13da138582224ac9b2a1bad86/bin:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/home/htie/.local/bin:/home/htie/bin:/opt/homebrew/opt/mysql-client/bin:/Users/haixintie/Library/Python/3.9/bin:/Library/PostgreSQL/15/bin:/home/htie/.cargo/bin:~/.pyenv/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin:/home/htie/.fzf/bin:/home/htie/.local/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin:~/bin:/home/htie/git-repo/_lib/protoc-22.3/bin:/home/linuxbrew/.linuxbrew/bin:/home/htie/.local/bin \
    PWD=/proc/self/cwd \
  external/_main~non_module_dependencies~x86_64_aarch64_none_linux_gnu/bin/aarch64-none-linux-gnu-ar rcsD bazel-out/k8-fastbuild/bin/examples_bazel/cpp/libhello-greet.a bazel-out/k8-fastbuild/bin/examples_bazel/cpp/_objs/hello-greet/hello-greet.o)
# Configuration: f0fb4f3b703dddeefc06e98de495fd603a76f63a2e7207d1123f1c3cd14809de
# Execution platform: @local_config_platform//:host

Use --sandbox_debug to see verbose messages from the sandbox and retain the sandbox build root for debugging
src/main/tools/linux-sandbox-pid1.cc:518: "execvp(external/_main~non_module_dependencies~x86_64_aarch64_none_linux_gnu/bin/aarch64-none-linux-gnu-ar, 0x234fdb0)": No such file or directory
Target //examples_bazel/cpp:hello-world failed to build
INFO: Elapsed time: 0.151s, Critical Path: 0.08s
INFO: 3 processes: 3 internal.
FAILED: Build did NOT complete successfully
```

Though the `ar` tool is right there:
```
htie@htie:~/coding/bazel/bazel_cross_compile/06_platforms_arm$ ls -l bazel-06_platforms_arm/external/_main~non_module_dependencies~x86_64_aarch64_none_linux_gnu/bin/aarch64-none-linux-gnu-ar
-rwxr-xr-x 2 htie htie 1382192 Oct  9 09:50 bazel-06_platforms_arm/external/_main~non_module_dependencies~x86_64_aarch64_none_linux_gnu/bin/aarch64-none-linux-gnu-ar
htie@htie:~/coding/bazel/bazel_cross_compile/06_platforms_arm$
```
