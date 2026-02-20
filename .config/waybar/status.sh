#!/usr/bin/env bash

# Unicode spaces we’ll inject (actual characters, not strings " \ ")
NBSP="$(printf '\u00A0')"   # non-breaking space
THIN="$(printf '\u2009')"   # thin space

# --- Battery ---
BAT="$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "?")"
if [[ "$BAT" =~ ^[0-9]+$ ]]; then
  if   [ "$BAT" -le 20 ]; then BAT_GLYPH=""
  elif [ "$BAT" -le 40 ]; then BAT_GLYPH=""
  elif [ "$BAT" -le 60 ]; then BAT_GLYPH=""
  elif [ "$BAT" -le 80 ]; then BAT_GLYPH=""
  else                         BAT_GLYPH=""
  fi
else
  BAT_GLYPH=""
fi

# --- Volume ---
VOL="$(pamixer --get-volume 2>/dev/null || echo "?')"
MUTE="$(pamixer --get-mute 2>/dev/null)"
if [ "$MUTE" = "true" ]; then
  VOL_GLYPH=""
elif [ "$VOL" != "?" ] && [ "$VOL" -le 30 ]; then
  VOL_GLYPH=""
else
  VOL_GLYPH=""
fi

# Icon spans with built-in tracking (letter_spacing is in 1/1024 em)
ICON_OPEN="<span font_family='Font Awesome 6 Free Solid' letter_spacing='1024'>"
ICON_CLOSE="</span>"

# Text span (Monaco)
TXT_OPEN="<span font_family='Monaco'>"
TXT_CLOSE="</span>"

# Compose with NBSP/THIN so there’s always room between icon and text
BAT_SEG="${ICON_OPEN}${BAT_GLYPH}${ICON_CLOSE}${NBSP}${TXT_OPEN}${BAT}%${TXT_CLOSE}"
VOL_SEG="${ICON_OPEN}${VOL_GLYPH}${ICON_CLOSE}${NBSP}${TXT_OPEN}${VOL}%${TXT_CLOSE}"
TIME_SEG="${TXT_OPEN}$(date +'%I:%M %p')${TXT_CLOSE}"

# Add a little gap between segments
SEP="${THIN}${THIN}${THIN}"

OUT="${BAT_SEG}${SEP}${VOL_SEG}${SEP}${TIME_SEG}"

# Emit JSON for Waybar (Pango markup enabled)
printf '{ "text": "%s", "class": "status" }\n' "$(printf '%s' "$OUT" | sed 's/"/\\"/g')"
