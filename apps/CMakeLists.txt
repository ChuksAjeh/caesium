add_executable(caesium main.cpp)
target_link_libraries(caesium PRIVATE
        mp_warnings)
# Single-purpose executables showcasing one module each. No logic here:
# if an example needs logic, it belongs in the module.
add_executable(ingest_cli examples/ingest_cli.cpp)
target_link_libraries(ingest_cli PRIVATE caesium::ingest mp_warnings)
