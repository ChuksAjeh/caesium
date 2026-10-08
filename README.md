# Caesium

A learning project for relearning modern C++ (up to C++20) through the lens of trading systems.
The goal is to build the pieces of a small trading stack from scratch (market-data decoding,
an order book, a matching engine, replay and benchmarking) and document what I learn along the way.

## Tech stack
- **C++20**, built with **CMake** (≥ 3.25) and **Ninja**
- **CPM** for dependencies: GoogleTest (unit tests) and Google Benchmark (benchmarks)
- **clang-format** / **clang-tidy** for formatting and linting

## Project layout
Each top-level folder has its own CMake module:

| Module | Purpose |
|---|---|
| `decoder/` | Reads and parses tick data (CSV). Library, CLI tool and tests |
| `apps/` | Main `caesium` executable |
| `bench/` | Google Benchmark micro-benchmarks |
| `book/`, `match/`, `replay/`, `protocol/`, `gateway/`, `instrument/`, `loadgen/`, `alloc/`, `concurrent/`, `ipc/` | Planned modules (work in progress) |

## Devlogs
My learnings are tracked as dated devlogs in [`docs/devlogs/`](docs/devlogs/):

- [09/09/2026: Initial project and toolchain setup](docs/devlogs/devlog-09-09-2026.md)
- [26/09/2026: Test data, decoder CLI and unit tests](docs/devlogs/devlog-26-09-2026.md)
