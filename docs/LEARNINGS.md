# Learnings

This is a dev log dedicated to my learnings as I relearn C++ up to C++ 20.

## 09/2026 – Initial project setup and toolchain setup

### Project structure:
Similar to Java, in that with maven every sub project has a CMakeLists.txt. Where dependencies are defined in root pom and gotten from maven central,
CPM is used to manage dependencies.

Not all CMakeLists.txt are lists are the same. Some are used to define libraries, others are used to define executables or interfaces.
CMakeLists.txt is used to define the build process. CPM is used to manage dependencies. And Ninja is used to build the project.
Clang-format is used to format the code. Clang-tidy is used to check the code.
RelWithDebInfo is used to debug the code but is optimized. Better for measuring performance and profiling.
 
STATIC libraries are used to share code between projects.


### next steps:
- [ ] Begin building the CLI tool - a decoder that ingests tick data/CSV:
  - [] reads the incoming file
  - [] transforms the data
  - [] outputs the data
  - [] unit tested


