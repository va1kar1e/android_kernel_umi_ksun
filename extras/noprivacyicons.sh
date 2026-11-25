#!/system/bin/sh
until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 2; done
device_config set_sync_disabled_for_tests persistent
device_config put privacy camera_mic_icons_enabled false
device_config put privacy location_indicators_enabled false
