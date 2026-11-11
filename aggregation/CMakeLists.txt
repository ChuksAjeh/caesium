# aggregation/CMakeLists.txt
add_library(aggregation STATIC
        src/aggregation.cpp
)
add_library(caesium::aggregation ALIAS aggregation)
target_include_directories(aggregation PUBLIC include)
# PUBLIC: aggregation's headers will take model types, so consumers need them too.
target_link_libraries(aggregation PUBLIC caesium::model PRIVATE mp_warnings)
