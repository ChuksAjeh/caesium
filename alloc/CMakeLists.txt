add_library(alloc INTERFACE)
add_library(caesium::alloc ALIAS alloc)

target_include_directories(alloc INTERFACE include)