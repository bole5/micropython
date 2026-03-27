# Force-disable Bluetooth at cmake level
set(MICROPY_PY_BLUETOOTH 0 CACHE BOOL "" FORCE)
set(MICROPY_BLUETOOTH_NIMBLE 0 CACHE BOOL "" FORCE)

# Keep SSL — needed for HTTPS requests
set(MICROPY_PY_SSL 1)
set(MICROPY_SSL_MBEDTLS 1)

# But no need for server-side SSL in MicroPython
set(MICROPY_SSL_AXTLS 0)

# *** Critical: force compile definitions to override ESP32_GENERIC defaults ***
# Appending AFTER board cmake means these win over any -DMICROPY_PY_BLUETOOTH=1
list(APPEND MICROPY_DEF_BOARD
    MICROPY_PY_BLUETOOTH=0
    MICROPY_BLUETOOTH_NIMBLE=0
)

# Explicitly remove NimBLE sources from build — prevents qstr scanner hitting them
list(REMOVE_ITEM MICROPY_SOURCE_EXTMOD
    ${MICROPY_DIR}/extmod/nimble/modbluetooth_nimble.c
    ${MICROPY_DIR}/extmod/nimble/nimble_poll.c
    ${MICROPY_DIR}/extmod/modbluetooth.c
    ${MICROPY_DIR}/extmod/mpbthci.c
)
list(REMOVE_ITEM MICROPY_SOURCE_PORT
    ${MICROPY_PORT_DIR}/mpnimbleport.c
)

# Point to a sdkconfig that disables BLE in ESP-IDF
set(SDKCONFIG_DEFAULTS
    boards/sdkconfig.base
    boards/ESP32_GENERIC/sdkconfig.noble
)
