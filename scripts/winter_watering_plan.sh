#!/bin/bash

# Addresses and name live in watering.env (not committed), see watering.env.example
source "$(dirname "$0")/watering.env"
SUBJECT="Winter Watering Plan - Week of $(date +%d/%m/%Y)"

# Generate the email content
CONTENT=$(cat <<EOF
Subject: $SUBJECT

Hello ${GREETING_NAME},

This is RasPy, your gardening assistant, ready to help you get through winter stress-free for your plants. Here is this week's special winter watering schedule, tailored to your plants' needs and the whims of the weather.

📋 Tasks to complete:

Technical checks:
  Taps: Make sure they are fully open to avoid any blockage in the irrigation system.
  Automatic irrigation system batteries: Check their charge level to ensure optimal operation.

Automatic watering schedule:
  Check the weather forecast for the week: https://www.yr.no
  Set to 1 minute every 8 days, but adjust based on conditions (rain, frost, or sunshine).

Don't forget:
  Plants not connected to the automatic system (such as ferns): Take a moment each week to check on them. They have no voice, but their appearance will tell you if they are thirsty.

🌿 Manual watering:

Cacti & Aloe Vera:
  Light watering every 15 days. These plants prefer drought over excess water. Too much moisture can lead to root rot.

Olive tree:
  Half a watering can per week. Native to the Mediterranean, it appreciates winter sunshine. Open the cover whenever possible so it can make the most of the light.

Jasmine:
  1 full watering can per week to maintain its vitality.

Other indoor plants:
  Water once a week. Even in winter, they need regular attention.

💡 Tips for successful watering:
  Water temperature: Use water at room temperature to avoid thermal shock.
  Observation: In winter, water needs decrease, but stay alert to signs of dehydration (drooping leaves, overly dry soil).

Thank you for your time and have a great day, ${GREETING_NAME}!

RasPy, your botanical coach!
"In winter, less water — but never forget: balance is the key!"

---
EOF
)

# Send the email
echo "$CONTENT" | msmtp --from="$SENDER" "$RECIPIENT"

# Log for confirmation
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Email sent to $RECIPIENT" >> /renaud/logs/winter_watering_plan.log
