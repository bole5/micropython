# Force-disable Bluetooth at cmake level
set(MICROPY_PY_BLUETOOTH 0 CACHE BOOL "" FORCE)
set(MICROPY_BLUETOOTH_NIMBLE 0 CACHE BOOL "" FORCE)

# Point to a sdkconfig that disables BLE in ESP-IDF
set(SDKCONFIG_DEFAULTS
    boards/sdkconfig.base
    boards/ESP32_GENERIC/sdkconfig.noble
)
