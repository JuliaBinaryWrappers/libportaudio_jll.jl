# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule libportaudio_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("libportaudio")
JLLWrappers.@generate_main_file("libportaudio", UUID("2d7b7beb-0762-5160-978e-1ab83a1e8a31"))
end  # module libportaudio_jll
