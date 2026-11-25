# Validation

To be implemented. Checks over `model` records after ingest: sequence
gaps (e.g. Binance `trade_id`), timestamps going backwards, invalid
prices/quantities, and later order lifecycle (cancel/execute for an
unknown order ID). Detects and reports only; recovery belongs to `replay`.
