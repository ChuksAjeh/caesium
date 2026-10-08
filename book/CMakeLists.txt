add_library(book
        STATIC
        src/order_book.cpp
)
add_library(caesium::book ALIAS book)

target_include_directories(book PUBLIC include)
target_link_libraries(book PRIVATE mp_warnings)