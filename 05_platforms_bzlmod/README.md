Identical to `04_platforms` except by migrating external modules from
WORKSPACE TO MODULE.bazel per the official [Bzlmod Migration Guide]
(https://bazel.build/external/migration?authuser=1), which does not work.

To reproduce the error, run:

# Failing toolchain build
```
bazel build --config=rpi :hello
```

# Failing platform build
```
bazel build --config=rpi-platform :hello
```
