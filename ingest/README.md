# Ingest

In progress. Loads raw market data files (Binance trades CSV now;
LOBSTER and ITCH later) into typed `model` records. Handles syntax
only: malformed numbers and missing fields are ingest errors. Checks
on the meaning of the data belong to `validation`.
