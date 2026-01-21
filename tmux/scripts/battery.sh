#!/bin/bash

BATT=$(pmset -g batt 2>/dev/null | grep -o '[0-9]*%' | head -1)

if [[ -z "$BATT" ]]; then
  echo "🔌"
else
  PERCENT=${BATT%\%}

  # Define color codes (RGB for truecolor terminals)
  RED="#FF0000"
  ORANGE="#FFA500"
  YELLOW="#FFFF00"
  GREEN="#00FF00"
  WHITE="#FFFFFF"

  # Choose color based on percentage
  if ((PERCENT >= 80)); then
    COLOR="$GREEN"
  elif ((PERCENT >= 60)); then
    COLOR="$YELLOW"
  elif ((PERCENT >= 40)); then
    COLOR="$ORANGE"
  else
    COLOR="$RED"
  fi

  # Build 10-segment bar
  BAR=""
  SEGMENTS=10
  FILLED=$(((PERCENT * SEGMENTS) / 100))
  EMPTY=$((SEGMENTS - FILLED))

  # Fill segments with color
  for i in $(seq 1 $FILLED); do
    BAR="${BAR}#[fg=$COLOR]■"
  done

  # Empty segments (gray)
  for i in $(seq 1 $EMPTY); do
    BAR="${BAR}#[fg=#585b70]■"
  done

  # Output: lightning + bar + percentage
  echo "⚡ ${BAR} #[fg=$WHITE]$BATT"
fi
