#!/usr/bin/env bash
# Import a LOBSTER sample zip into data/raw/lobster/.
#
# LOBSTER no longer serves its sample files from static URLs; the site
# (https://lobsterdata.com) gates them behind a sign-up/request flow and its
# terms (https://lobsterdata.com/terms/trial-and-sample-data). So this script
# does not download: get the zip through the site, then run:
#
# Usage: fetch_lobster.sh <path/to/LOBSTER_SampleFile_*.zip>
#
# Output: data/raw/lobster/<zip name>/
#   *_message_<N>.csv    time,type,order_id,size,price,direction  (no header)
#   *_orderbook_<N>.csv  ask_px1,ask_sz1,bid_px1,bid_sz1,...      (no header)
#   Prices are integers: dollars * 10000. Time is seconds after midnight.
set -euo pipefail

if [[ $# -ne 1 ]]; then
    sed -n '2,14p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
    exit 1
fi

ZIP="$1"
if [[ ! -f "$ZIP" ]]; then
    echo "Error: no such file: $ZIP" >&2
    exit 1
fi
if [[ "$(head -c 2 "$ZIP")" != "PK" ]]; then
    echo "Error: $ZIP is not a zip file" >&2
    exit 1
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
DEST="$ROOT/data/raw/lobster/$(basename "$ZIP" .zip)"
mkdir -p "$DEST"

echo "Extracting to $DEST"
if command -v unzip >/dev/null 2>&1; then
    unzip -oq "$ZIP" -d "$DEST"
else
    python3 -m zipfile -e "$ZIP" "$DEST"
fi

echo "Done:"
ls -1 "$DEST"
