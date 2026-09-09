# bench/CMakeLists.txt

add_executable(bench_book book_bench.cpp)
target_link_libraries(bench_book PRIVATE marketpulse::book benchmark::benchmark mp_warnings)

add_executable(bench_decoder decoder_bench.cpp)
target_link_libraries(bench_decoder PRIVATE marketpulse::decoder benchmark::benchmark mp_warnings)