#!/system/bin/sh
# Light HDMI (HD) or CVBS (SD) front-panel icon based on the active output.
LED=/sys/class/leds/openvfd
prev=""
while true; do
    mode=$(cat /sys/class/display/mode 2>/dev/null)
    case "$mode" in
        *cvbs*) cur=sd ;;
        *)      cur=hd ;;
    esac
    if [ "$cur" != "$prev" ]; then
        case "$cur" in
            sd) echo cvbs > $LED/led_on;  echo hdmi > $LED/led_off ;;
            hd) echo hdmi > $LED/led_on;  echo cvbs > $LED/led_off ;;
        esac
        prev=$cur
    fi
    sleep 5
done
