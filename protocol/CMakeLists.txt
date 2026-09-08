add_library(protocol STATIC
        src/protocol.cpp
)
add_library(marketpulse::protocol ALIAS protocol)

target_include_directories(protocol PUBLIC include)
target_link_libraries(protocol PRIVATE mp_warnings)