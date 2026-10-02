#!/bin/bash

# Cleanup, we revert the `Fn` key back to normal.
cleanup() {
    echo -e "\n[!] Reverting Fn key back to normal..."
    hidutil property --set '{"UserKeyMapping":[]}' > /dev/null
    echo "Done. Safe to close."
    exit 0
}

# Script must always run `cleanup` if it gets killed or interrupted.
trap cleanup SIGINT SIGTERM SIGHUP

# Mapping to change the `Fn` key to the `Alt` key. Very useful for gaming, as the `Fn` key is often in a better position than the `Alt` key.
echo "=> Mapping Fn to Alt..."
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0xFF00000003,"HIDKeyboardModifierMappingDst":0x7000000E2}]}' > /dev/null
echo "=> Fn key is successfully mapped to Alt!"
echo ""
echo "Keep this terminal window open to sustain the mapping."
echo "Press Control + C (or close the window) to quit and revert keys."

# Run silently in the background.
while true; do
    sleep 1
done