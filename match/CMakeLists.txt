add_library(match STATIC
        src/match.cpp
)
add_library(marketpulse::match ALIAS match)

target_include_directories(match PUBLIC include)
target_link_libraries(match PRIVATE mp_warnings)