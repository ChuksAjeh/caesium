# bench/CMakeLists.txt

add_executable(bench_book book_bench.cpp)
target_link_libraries(bench_book PRIVATE caesium::book benchmark::benchmark mp_warnings)

add_executable(bench_ingest ingest_bench.cpp)
target_link_libraries(bench_ingest PRIVATE caesium::ingest benchmark::benchmark mp_warnings)