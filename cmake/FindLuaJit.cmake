find_path(LUAJIT_INCLUDE_DIR luajit.h
          PATH_SUFFIXES luajit-2.0 luajit-2.1)

if(MSVC)
  list(APPEND LUAJIT_NAMES lua51)
elseif(MINGW)
  list(APPEND LUAJIT_NAMES libluajit libluajit-5.1)
else()
  list(APPEND LUAJIT_NAMES luajit-5.1)
endif()

find_library(LUAJIT_LIBRARY NAMES ${LUAJIT_NAMES})

set(LUAJIT_LIBRARIES ${LUAJIT_LIBRARY})
set(LUAJIT_INCLUDE_DIRS ${LUAJIT_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LUAJIT_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(LuaJit DEFAULT_MSG
                                  LUAJIT_LIBRARY LUAJIT_INCLUDE_DIR)

mark_as_advanced(LUAJIT_INCLUDE_DIR LUAJIT_LIBRARY)
