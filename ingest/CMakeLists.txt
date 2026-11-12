add_library(ingest STATIC
        src/binance_trade_reader.cpp
        include/caesium/ingest/binance_trader_reader.h
)
add_library(caesium::ingest ALIAS ingest)
target_include_directories(ingest PUBLIC include)
target_link_libraries(ingest PRIVATE mp_warnings)

add_executable(ingest_tests tests/ingest_test.cpp)
target_link_libraries(ingest_tests PRIVATE caesium::ingest GTest::gtest_main mp_warnings)
target_compile_definitions(ingest_tests PRIVATE
        TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/tests/test_data")
gtest_discover_tests(ingest_tests)