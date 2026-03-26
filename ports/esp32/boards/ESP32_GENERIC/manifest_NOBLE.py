freeze("$(PORT_DIR)/modules")  # keep port-level modules (uasyncio etc.)

# Your app uses its own mqttas — skip all of these:
# require("umqtt.robust")     ← NOT needed
# require("umqtt.simple")     ← NOT needed

# require("bundle-networking")← NOT needed
# require("dht")              ← NOT needed
# require("ds18x20")          ← NOT needed
# require("neopixel")         ← NOT needed
# require("onewire")          ← NOT needed

# These ARE used:
require("requests")
require("ntptime")             # NTP sync
require("mip")                 # optional: keep for updates
