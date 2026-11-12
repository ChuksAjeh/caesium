# validation/CMakeLists.txt
add_library(validation STATIC
        src/validation.cpp
)
add_library(caesium::validation ALIAS validation)
target_include_directories(validation PUBLIC include)
# PUBLIC: validation's headers will take model types, so consumers need them too.
target_link_libraries(validation PUBLIC caesium::model PRIVATE mp_warnings)
