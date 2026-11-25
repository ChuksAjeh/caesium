# execution/CMakeLists.txt
add_library(execution STATIC
        src/execution.cpp
)
add_library(caesium::execution ALIAS execution)
target_include_directories(execution PUBLIC include)
# PUBLIC: execution's headers will take model types, so consumers need them too.
# Do not link caesium::match: venues are reached over the wire protocol only.
target_link_libraries(execution PUBLIC caesium::model PRIVATE mp_warnings)
