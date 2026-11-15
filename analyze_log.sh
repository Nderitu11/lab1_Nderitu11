#!/bin/bash

LOG_FILE="${1:-transit_session.log}"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' does not exist."
    exit 1
fi

echo "**** KIGALI FSD TRANSIT LOG SUMMARY ****" 



SESSIONS=$(grep -c -i "session\|start" "$LOG_FILE")
echo "Total sessions (runs): $SESSIONS"

ZEBRA_STOPS=$(grep -c -i "zebra" "$LOG_FILE")
LANE_CHANGES=$(grep -c -i "lane\|bus" "$LOG_FILE")
echo "Zebra crossing stops : $ZEBRA_STOPS"
echo "Lane changes         : $LANE_CHANGES"

echo "Latest trip details:"
grep -i "driver" "$LOG_FILE" | tail -n 1
grep -i "top speed\|max speed\|speed" "$LOG_FILE" | tail -n 1