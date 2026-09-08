add_library(instrument INTERFACE)
add_library(marketpulse::instrument ALIAS instrument)

target_include_directories(instrument INTERFACE include)