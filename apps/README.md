# Apps

To be implemented. The main `caesium` executable that runs the
pipeline end to end: ingest → validation → aggregation → replay →
book. It parses arguments and wires modules together; logic
lives in the modules.

`examples/` holds single-purpose executables that showcase one module
each (e.g. `ingest_cli`). No logic in examples.
