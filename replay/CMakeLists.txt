# replay/CMakeLists.txt
add_library(replay STATIC
        src/reader.cpp
        src/reconciler.cpp
)
add_library(marketpulse::replay ALIAS replay)
target_include_directories(replay PUBLIC include)
target_link_libraries(replay PRIVATE mp_warnings marketpulse::book)