To cross-compile from X86_64 to AARCH64 using toolchains, run:

```
bazel build --config=rpi :hello
```

To cross-compile from X86_64 to AARCH64 using platforms, run:

```
bazel build --config=rpi-platform :hello
```
