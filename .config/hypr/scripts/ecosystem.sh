#!/usr/bin/env bash

# Configuration
KDE_DEVICE_ID="d6d18ac11e3c4deba54f73c5d4f4cec0"
MAC_IP="192.168.0.101"
MAC_SINK="mac_speakers"

# Helper function for notifications
notify_status() {
    local msg="$1"
    local urgency="${2:-normal}"
    notify-send -u "$urgency" "Ecosystem Script" "$msg"
}

# 1. LAN Mouse
# Check if already running to prevent duplicates
if pgrep -f "lan-mouse daemon" > /dev/null; then
    notify_status "LAN Mouse daemon is already running."
else
    # Start in background
    lan-mouse daemon >/dev/null 2>&1 &
    sleep 2

    if pgrep -f "lan-mouse daemon" > /dev/null; then
        notify_status "LAN Mouse daemon has been started."
    else
        notify_status "Error: Failed to start LAN Mouse daemon." "critical"
        # Do not exit, continue to next tasks
    fi
fi

# 2. KDE Connect
# Attempt to pair, suppress output
if kdeconnect-cli -d "$KDE_DEVICE_ID" --pair >/dev/null 2>&1; then
    notify_status "Successfully paired with KDE Connect device."
else
    # Log but don't fail the script
    echo "KDE Connect: Pairing skipped or failed."
fi

# 3. Mac Audio
# Check if Mac is available
if ping -c 1 -W 1 "$MAC_IP" &> /dev/null; then
    # Remove old module if exists
    pactl unload-module module-tunnel-sink 2>/dev/null
    
    # Load new module
    if pactl load-module module-tunnel-sink \
        server="${MAC_IP}:4713" \
        sink_name="$MAC_SINK" \
        latency_msec=800 >/dev/null; then
        
        # Set as default
        pactl set-default-sink "$MAC_SINK"
        notify_status "✓ Mac speakers connected"
    else
        notify_status "Error: Failed to load audio tunnel." "critical"
    fi
else
    notify_status "✗ Mac is offline"
fi

exit 0
