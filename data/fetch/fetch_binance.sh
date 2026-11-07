#!/usr/bin/env bash
# Fetch one day of Binance spot public data from data.binance.vision.
#
# Usage: fetch_binance.sh [SYMBOL] [DATE] [TYPE]
#   SYMBOL  default BTCUSDT
#   DATE    YYYY-MM-DD, default 2025-01-01
#   TYPE    trades | aggTrades, default trades
#
# Output: data/raw/binance/<SYMBOL>-<TYPE>-<DATE>.csv
#
# Notes:
#   - Files have NO header row.
#   - trades columns: trade_id,price,qty,quote_qty,time,is_buyer_maker,is_best_match
#   - Spot timestamps are microseconds since epoch from 2025-01-01 onwards
#     (milliseconds before that).
set -euo pipefail

SYMBOL="${1:-BTCUSDT}"
DATE="${2:-2025-01-01}"
TYPE="${3:-trades}"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT_DIR="$ROOT/data/raw/binance"
NAME="$SYMBOL-$TYPE-$DATE"
URL="https://data.binance.vision/data/spot/daily/$TYPE/$SYMBOL/$NAME.zip"

mkdir -p "$OUT_DIR"
cd "$OUT_DIR"

if [[ -f "$NAME.csv" ]]; then
    echo "Already present: $OUT_DIR/$NAME.csv"
    exit 0
fi

echo "Downloading $URL"
curl -fSL --retry 3 -C - -o "$NAME.zip.part" "$URL"
mv "$NAME.zip.part" "$NAME.zip"
curl -fsSL --retry 3 -o "$NAME.zip.CHECKSUM" "$URL.CHECKSUM"

echo "Verifying SHA-256"
sha256sum -c "$NAME.zip.CHECKSUM"

echo "Extracting"
if command -v unzip >/dev/null 2>&1; then
    unzip -oq "$NAME.zip" -d .
else
    python3 -m zipfile -e "$NAME.zip" .
fi
rm -f "$NAME.zip" "$NAME.zip.CHECKSUM"

echo "Done: $OUT_DIR/$NAME.csv ($(wc -l < "$NAME.csv") rows)"
