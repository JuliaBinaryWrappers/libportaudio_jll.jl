# Autogenerated wrapper script for libportaudio_jll for x86_64-linux-gnu
export libpa_shim, libportaudio

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libpa_shim`
const libpa_shim_splitpath = ["lib", "libpa_shim.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libpa_shim_path = ""

# libpa_shim-specific global declaration
# This will be filled out by __init__()
libpa_shim_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libpa_shim = "libpa_shim.so"


# Relative path to `libportaudio`
const libportaudio_splitpath = ["lib", "libportaudio.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libportaudio_path = ""

# libportaudio-specific global declaration
# This will be filled out by __init__()
libportaudio_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libportaudio = "libportaudio.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"libportaudio")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libpa_shim_path = normpath(joinpath(artifact_dir, libpa_shim_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libpa_shim_handle = dlopen(libpa_shim_path)
    push!(LIBPATH_list, dirname(libpa_shim_path))

    global libportaudio_path = normpath(joinpath(artifact_dir, libportaudio_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libportaudio_handle = dlopen(libportaudio_path)
    push!(LIBPATH_list, dirname(libportaudio_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

