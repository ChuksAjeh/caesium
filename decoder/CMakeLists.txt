add_library(decoder STATIC src/csv_reader.cpp)          # no decoder_cli.cpp here
add_library(caesium::decoder ALIAS decoder)
target_include_directories(decoder PUBLIC include)
target_link_libraries(decoder PRIVATE mp_warnings)

add_executable(decoder_cli tools/decoder_cli.cpp)
target_link_libraries(decoder_cli PRIVATE caesium::decoder mp_warnings)

add_executable(decoder_tests tests/csv_reader_test.cpp)
target_link_libraries(decoder_tests PRIVATE caesium::decoder GTest::gtest_main mp_warnings)
target_compile_definitions(decoder_tests PRIVATE
        FIXTURES_DIR="${CMAKE_CURRENT_SOURCE_DIR}/tests/fixtures")
gtest_discover_tests(decoder_tests)