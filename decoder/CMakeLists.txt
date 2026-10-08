add_library(decoder
        STATIC
        src/csv_reader.cpp
        tools/decoder_cli.cpp
)
add_library(caesium::decoder ALIAS decoder)

target_include_directories(decoder PUBLIC include)
target_link_libraries(decoder PRIVATE mp_warnings)

add_executable(decoder_cli
        tools/decoder_cli.cpp
)

target_link_libraries(decoder_cli
        PRIVATE
        caesium::decoder
        mp_warnings
)
add_executable(decoder_tests
        tests/csv_reader_test.cpp
)

target_link_libraries(decoder_tests
        PRIVATE
        caesium::decoder
        GTest::gtest_main
        mp_warnings
)

