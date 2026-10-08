add_library(ipc
        STATIC
        src/ipc.cpp
)
add_library(caesium::ipc ALIAS ipc)

target_include_directories(ipc PUBLIC include)
target_link_libraries(ipc PRIVATE mp_warnings)