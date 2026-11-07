#!/usr/bin/env bash
# Fetch a Nasdaq TotalView-ITCH 5.0 sample day from emi.nasdaq.com.
#
# Usage: fetch_itch.sh [MMDDYYYY]
#   default 12302019 (~3.5 GB compressed, the smallest full-day sample)
#   others: 01302019 (~4.8 GB), 01302020 (~5.6 GB), see the listing at
#   https://emi.nasdaq.com/ITCH/Nasdaq%20ITCH/
#
# Output: data/raw/itch/<MMDDYYYY>.NASDAQ_ITCH50.gz (left compressed)
#
# Notes:
#   - Binary format: each message is a 2-byte big-endian length followed by
#     the message; first payload byte is the message type. Spec:
#     https://www.nasdaqtrader.com/content/technicalsupport/specifications/dataproducts/NQTVITCHspecification.pdf
#   - The .md5sum files in the listing return 404, so integrity is checked by
#     comparing size against Content-Length, plus an optional `gzip -t`
#     (set ITCH_VERIFY=1; slow on multi-GB files).
#   - Downloads resume if interrupted; just rerun the script.
set -euo pipefail

DAY="${1:-12302019}"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT_DIR="$ROOT/data/raw/itch"
NAME="$DAY.NASDAQ_ITCH50.gz"
URL="https://emi.nasdaq.com/ITCH/Nasdaq%20ITCH/$NAME"

mkdir -p "$OUT_DIR"
cd "$OUT_DIR"

if [[ -f "$NAME" ]]; then
    echo "Already present: $OUT_DIR/$NAME"
    exit 0
fi

if ! curl -fsIL -o /dev/null "$URL"; then
    echo "Error: $URL not found (check the day against the listing)" >&2
    exit 1
fi

EXPECTED=$(curl -fsSIL "$URL" | tr -d '\r' | awk 'tolower($1)=="content-length:" {n=$2} END {print n}')
if [[ -z "$EXPECTED" ]]; then
    echo "Error: server did not report a size for $URL" >&2
    exit 1
fi

AVAIL=$(( $(df --output=avail -B1 . | tail -1) ))
if (( AVAIL < EXPECTED )); then
    echo "Error: need $((EXPECTED / 1024 / 1024)) MiB, only $((AVAIL / 1024 / 1024)) MiB free in $OUT_DIR" >&2
    exit 1
fi

echo "Downloading $URL ($((EXPECTED / 1024 / 1024)) MiB)"
curl -fSL --retry 3 -C - -o "$NAME.part" "$URL"

ACTUAL=$(stat -c %s "$NAME.part")
if [[ "$ACTUAL" != "$EXPECTED" ]]; then
    echo "Error: size mismatch (got $ACTUAL, expected $EXPECTED). Rerun to resume." >&2
    exit 1
fi

if [[ "${ITCH_VERIFY:-0}" == "1" ]]; then
    echo "Verifying gzip integrity"
    gzip -t "$NAME.part"
fi

mv "$NAME.part" "$NAME"
echo "Done: $OUT_DIR/$NAME"
