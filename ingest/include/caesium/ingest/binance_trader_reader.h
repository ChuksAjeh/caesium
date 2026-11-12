//
// Created by chuks on 08/11/2026.
//

#ifndef CAESIUM_INGEST_BINANCE_TRADE_READER_H
#define CAESIUM_INGEST_BINANCE_TRADE_READER_H

#include "caesium/model/trade.h"
#include <string>

namespace caesium::ingest {
class BinanceTraderReader {
  private:
    std::string file_path;

  public:
    void read_file();
    void try_read_file();
};
} // namespace caesium::ingest
#endif // CAESIUM_INGEST_BINANCE_TRADE_READER_H
