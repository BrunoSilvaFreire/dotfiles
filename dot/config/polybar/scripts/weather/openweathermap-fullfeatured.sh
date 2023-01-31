#!/bin/sh

get_icon() {
    case $1 in
        01d) icon="󰖙";;
        01n) icon="󰖔";;
        02d) icon="󰖕";;
        02n) icon="󰼱";;
        03*) icon="󰖐";;
        04*) icon="󰖐";;
        09*) icon="󰖖";;
        10*) icon="󰖗";;
        11*) icon="󰖗";;
        13*) icon="󰖓";;
        50*) icon="󰖘";;
        *) icon="?";
    esac

    echo $icon
}

get_duration() {

    osname=$(uname -s)

    case $osname in
        *BSD) date -r "$1" -u +%H:%M;;
        *) date --date="@$1" -u +%H:%M;;
    esac

}

KEY="53dc99bb16e8716a18588f0a7807eca5"
UNITS="metric"
SYMBOL="°C"

API="https://api.openweathermap.org/data/2.5"

location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)
if [ -n "$location" ]; then
    location_lat="$(echo "$location" | jq '.location.lat')"
    location_lon="$(echo "$location" | jq '.location.lng')"

    current=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    forecast=$(curl -sf "$API/forecast?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS&cnt=1")
fi

if [ -n "$current" ] && [ -n "$forecast" ]; then
    current_temp=$(echo "$current" | jq ".main.temp" | cut -d "." -f 1)
    current_icon=$(echo "$current" | jq -r ".weather[0].icon")
    CITY=$(echo "$current" | jq -r ".name")
    forecast_temp=$(echo "$forecast" | jq ".list[].main.temp" | cut -d "." -f 1)
    forecast_icon=$(echo "$forecast" | jq -r ".list[].weather[0].icon")


    trend="󰔴"
    sun_rise=$(echo "$current" | jq ".sys.sunrise")
    sun_set=$(echo "$current" | jq ".sys.sunset")
    now=$(date +%s)

    if [ "$sun_rise" -gt "$now" ]; then
        daytime=" $(get_duration "$((sun_rise-now))")"
    elif [ "$sun_set" -gt "$now" ]; then
        daytime=" $(get_duration "$((sun_set-now))")"
    else
        daytime=" $(get_duration "$((sun_rise-now))")"
    fi

    echo "󰍎 $CITY  •  $(get_icon "$current_icon") $current_temp$SYMBOL $trend $(get_icon "$forecast_icon") $forecast_temp$SYMBOL"
fi
