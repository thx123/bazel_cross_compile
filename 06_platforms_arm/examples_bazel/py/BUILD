py_library(
    name = "greeter_lib",
    srcs = ["greeter.py"],
)

py_binary(
    name = "hello_world",
    srcs = ["hello_world.py"],
    deps = [
        ":greeter_lib",
    ],
    visibility = ["//visibility:public"]
)
