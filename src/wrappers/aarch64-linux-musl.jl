# Autogenerated wrapper script for libportaudio_jll for aarch64-linux-musl
export libportaudio

using alsa_jll
JLLWrappers.@generate_wrapper_header("libportaudio")
JLLWrappers.@declare_library_product(libportaudio, "libportaudio.so")
function __init__()
    JLLWrappers.@generate_init_header(alsa_jll)
    JLLWrappers.@init_library_product(
        libportaudio,
        "lib/libportaudio.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
