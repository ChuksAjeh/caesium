# model/CMakeLists.txt
# Header-only for now (plain types, no logic), so INTERFACE: nothing to compile,
# consumers just get the include path. Switch to STATIC if a .cpp is ever added.
add_library(model INTERFACE
        include/caesium/model/trade.h)
add_library(caesium::model ALIAS model)
target_include_directories(model INTERFACE include)
