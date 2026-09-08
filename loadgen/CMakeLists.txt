# loadgen/CMakeLists.txt
add_library(loadgen STATIC
        src/loadgen.cpp
)
add_library(marketpulse::loadgen ALIAS loadgen)
target_include_directories(loadgen PUBLIC include)
target_link_libraries(loadgen PRIVATE mp_warnings marketpulse::book)