#!/bin/bash
set -euf -o pipefail

cafesData="${1:?must provide cafes data file as argument to script}"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cat "$SCRIPT_DIR/header" <(jq -r '.[]| "  <wpt lat=\"\(.latitude)\" lon=\"\(.longitude)\">\n    <name>\(.title | gsub("&";"&amp;"))</name>\n    <sym>Flag, Blue</sym>\n    <type>user</type>\n  </wpt>\n"' "$cafesData") <(echo "</gpx>")
