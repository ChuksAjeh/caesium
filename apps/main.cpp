//
// Created by chuks on 08/09/2026.
//


#include <iostream>

// Planned pipeline:
//   1. ingest     - load raw files (Binance CSV, LOBSTER, ITCH) into model records
//   2. validation - check records: sequence gaps, timestamps going backwards,
//                   invalid values; report breaks
//   3. aggregation - build bars (OHLCV), VWAP, buy/sell volume from validated records
//   4. replay     - feed validated records in time order; resync on gaps
//   5. book       - rebuild the order book from order-level events
//   later: match, gateway, loadgen

int main() {
     std::cout << "Hello World!";
}
