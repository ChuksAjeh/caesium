add_library(book
        src/order_book.cpp
)
add_library(marketpulse::book ALIAS book)

target_include_directories(book PUBLIC include)
target_link_libraries(book PRIVATE mp_warnings)