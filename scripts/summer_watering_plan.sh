#!/bin/bash

# Addresses and name live in watering.env (not committed), see watering.env.example
source "$(dirname "$0")/watering.env"
SUBJECT="Summer Watering Plan - Week of $(date +%d/%m/%Y)"

# Generate the email content
CONTENT=$(cat <<EOF
Subject: $SUBJECT

Hello ${GREETING_NAME},

This is RasPy, your gardening assistant, ready to help you keep your plants happy through the summer heat. Here is this week's watering schedule, tailored to your plants' needs and the quirks of summer weather.

📋 Tasks to complete:

Technical checks:
  Taps: Make sure they are fully open to avoid any blockage in the irrigation system.
  Automatic irrigation system batteries: Check their charge level to ensure optimal operation.

Automatic watering schedule:
  Check the weather forecast for the week: https://www.yr.no
  Set to 3 minutes every 2 days, but adjust based on conditions (heatwave, thunderstorm, or overcast skies).

Don't forget:
  Plants not connected to the automatic system (such as ferns): Check them several times a week in summer — heat dries out the soil much faster than in winter.

🌿 Manual watering:

Cacti & Aloe Vera:
  Light watering every 10 days. In summer they can handle slightly more water, but avoid excess — root rot is still a risk.

Olive tree:
  1 full watering can per week. It loves the heat but needs regular water in summer. Open the cover during the day to maximise sunlight; close it during intense heatwaves.

Jasmine:
  1.5 watering cans per week, up to 2 during hot spells. It grows actively in summer and gets thirsty!

Other indoor plants:
  Water twice a week. Heat and evaporation speed up drying — stay attentive.

💡 Tips for successful summer watering:
  Time of day: Water early in the morning or in the evening to minimise evaporation and avoid thermal shock on the leaves.
  Water temperature: Use water at room temperature — never cold straight from the tap during a heatwave.
  Observation: Water needs increase significantly in summer. Watch for drooping leaves, cracked soil, or pots that feel unusually light.
  Mulching: If possible, cover the base of potted plants with a layer of substrate or gravel to slow evaporation.

Thank you for your time and have a great day, ${GREETING_NAME}!

RasPy, your botanical coach!
"In summer, water is life — but water smart, not blindly!"

---
EOF
)

# Send the email
echo "$CONTENT" | msmtp --from="$SENDER" "$RECIPIENT"

# Log for confirmation
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Email sent to $RECIPIENT" >> summer_watering_plan.log
