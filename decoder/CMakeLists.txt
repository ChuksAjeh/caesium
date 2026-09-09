add_library(decoder
        STATIC
        src/csv_reader.cpp
)
add_library(marketpulse::decoder ALIAS decoder)

target_include_directories(decoder PUBLIC include)
target_link_libraries(decoder PRIVATE mp_warnings)