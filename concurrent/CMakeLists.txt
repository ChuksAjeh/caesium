add_library(concurrent INTERFACE)
add_library(marketpulse::concurrent ALIAS concurrent)

target_include_directories(concurrent INTERFACE include)