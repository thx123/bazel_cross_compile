Similar to `04_platforms` except:

1. Migrated external modules from WORKSPACE TO MODULE.bazel per the official 
[Bzlmod Migration Guide](https://bazel.build/external/migration?authuser=1).
(same as in 05_platforms_bzlmod)

# Regular build
```
bazel build :hello
```

# Cross-compilation to AARCH64 build
```
bazel build --config=rpi-platform :hello
```

2. Make rules_foreign_cc CMAKE target build work by (same as in 05_platforms_bzlmod):
* Reverting back to v6.4.0 to avoid some unknown v.7.0.0 bugs that breaks rules_foreign_cc CMAKE builds.
* Move toolchain definition into a .bzl function and called by the root BUILD file fix the extra relative path problem.

# Regular build
```
bazel build third_party:all
```

# Cross-compilation to AARCH64 build
```
bazel build --config=rpi-platform third_party:all
```

3. Added x86_64-aarch64-none-linux-gnu toolchain from
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
