cmake_minimum_required(VERSION 3.25)
project(marketpulse VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)   # now it's an error, not a downgrade
set(CMAKE_CXX_EXTENSIONS OFF)         # -std=c++20, not -std=gnu++20
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)  # clang-tidy and clangd read this

include(cmake/CPM.cmake)                      # defines CPMAddPackage()
CPMAddPackage("gh:google/googletest@1.18.0")
include(GoogleTest)                           # defines gtest_discover_tests()

add_library(mp_warnings INTERFACE)
target_compile_options(mp_warnings INTERFACE -Wall -Wextra -Werror)

enable_testing()                       # must come before any add_test/GoogleTest

add_executable(marketpulse main.cpp
        book/src/order_book.cpp)

add_subdirectory(book)
#add_subdirectory(match)
#add_subdirectory(replay)
#add_subdirectory(protocol)
#add_subdirectory(gateway)
#add_subdirectory(instrument)
#add_subdirectory(loadgen)
#add_subdirectory(bench)
#add_subdirectory(alloc)
#add_subdirectory(concurrent)
#add_subdirectory(ipc)
