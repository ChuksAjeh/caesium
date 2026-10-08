add_library(gateway
        STATIC
        src/gateway.cpp
)
add_library(caesium::gateway ALIAS gateway)

target_include_directories(gateway PUBLIC include)
target_link_libraries(gateway PRIVATE mp_warnings)