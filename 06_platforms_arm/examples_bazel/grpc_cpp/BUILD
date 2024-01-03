cc_binary(
    name = "greeter_client",
    srcs = ["greeter_client.cc"],
    deps = [
        "@grpc//:grpc++",
        "//examples_bazel/protos:helloworld_cpp_grpc",
        "@com_google_absl//absl/flags:flag",
        "@com_google_absl//absl/flags:parse",
    ],
)

cc_binary(
    name = "greeter_server",
    srcs = ["greeter_server.cc"],
    deps = [
        "@grpc//:grpc++",
        "@grpc//:grpc++_reflection",
        "//examples_bazel/protos:helloworld_cpp_grpc",
        "@com_google_absl//absl/flags:flag",
        "@com_google_absl//absl/flags:parse",
        "@com_google_absl//absl/strings:str_format",
    ],
)
