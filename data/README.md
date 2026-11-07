# data

Market data used for integration tests, replay and 
benchmarks. 
Because of the large size of the data we do not commit any  
of it to the repo. We do have a slice of 200 trades from 
binance. that sits in 
`[test_data](../decoder/tests/test_data)`.
Using the fetch scripts downloads land in 
`data/raw/<source>/`.

Note: we do not fetch lobster data we have to download manually from lobsterdata.com, then import.

## Sources

| Source                    | Script                                          | Format          | Notes                                                                                                                                           |
|---------------------------|-------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| Binance public data       | `fetch/fetch_binance.sh [SYMBOL] [DATE] [TYPE]` | CSV, no header  | Trades only. SHA-256 verified. Spot timestamps are µs from 2025, ms before.                                                                     |
| Nasdaq TotalView-ITCH 5.0 | `fetch/fetch_itch.sh [MMDDYYYY]`                | Binary, gzipped | Full-day order-level feed, 3-6 GB. Resumable. No checksums published.                                                                           |
| LOBSTER                   | `fetch/fetch_lobster.sh <zip>`                  | CSV, no header  | Order-level messages + book snapshots. Download the sample manually from lobsterdata.com, then import. Check their terms before redistributing. |

## Schemas

**Binance trades:**
`trade_id,price,qty,quote_qty,time,is_buyer_maker,is_best_match`

**LOBSTER message:**
`time,type,order_id,size,price,direction`. Time is seconds
after midnight; price is dollars × 10000.

**LOBSTER orderbook:** `ask_px1,ask_sz1,bid_px1,bid_sz1,...`
per level.

**ITCH 5.0:** 2-byte big-endian length, then the message;
first byte is the message type. See
the [Nasdaq spec](https://www.nasdaqtrader.com/content/technicalsupport/specifications/dataproducts/NQTVITCHspecification.pdf).

## Quick start

```sh
data/fetch/fetch_binance.sh            # ~14 MB, 1.5M trades
data/fetch/fetch_itch.sh               # ~3.4 GB
data/fetch/fetch_lobster.sh ~/Downloads/LOBSTER_SampleFile_AAPL_2012-06-21_10.zip
```
