################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

if (NOT MSVC)
    include(FindPkgConfig)
    pkg_check_modules(PC_OPENSSL "openssl")
    if (PC_OPENSSL_FOUND)
        # add CFLAGS from pkg-config file, e.g. draft api.
        add_definitions(${PC_OPENSSL_CFLAGS} ${PC_OPENSSL_CFLAGS_OTHER})
        # some libraries install the headers is a subdirectory of the include dir
        # returned by pkg-config, so use a wildcard match to improve chances of finding
        # headers and SOs.
        set(PC_OPENSSL_INCLUDE_HINTS ${PC_OPENSSL_INCLUDE_DIRS} ${PC_OPENSSL_INCLUDE_DIRS}/*)
        set(PC_OPENSSL_LIBRARY_HINTS ${PC_OPENSSL_LIBRARY_DIRS} ${PC_OPENSSL_LIBRARY_DIRS}/*)
    endif(PC_OPENSSL_FOUND)
endif (NOT MSVC)

find_path (
    OPENSSL_INCLUDE_DIRS
    NAMES openssl/sha.h
    HINTS ${PC_OPENSSL_INCLUDE_HINTS}
)

find_library (
    OPENSSL_LIBRARIES
    NAMES openssl
    HINTS ${PC_OPENSSL_LIBRARY_HINTS}
)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
    OPENSSL
    REQUIRED_VARS OPENSSL_LIBRARIES OPENSSL_INCLUDE_DIRS
)
mark_as_advanced(
    OPENSSL_FOUND
    OPENSSL_LIBRARIES OPENSSL_INCLUDE_DIRS
)

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
