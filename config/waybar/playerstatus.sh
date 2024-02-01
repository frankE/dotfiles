#!/usr/bin/env bash

playerctl metadata -p spotify -F -f '{"text": "{{emoji(volume)}} {{xesam:title}}", "tooltip": "<big>{{xesam:artist}}</big>\n{{xesam:title}}\n{{duration(position)}} / {{duration(mpris:length)}}", "class": "{{lc(status)}}", "percentage": {{volume}}}'

