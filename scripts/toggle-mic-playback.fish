#!/usr/bin/env fish

set card Microphone 
amixer -c $card cset numid=3 toggle
set state (amixer -c $card cget numid=3)

if string match -q '*values=of*' $state
   noctalia msg notification-show '{"summary": "Retorno", "body": "Desligado", "icon": "microphone-mute"}'
else
   noctalia msg notification-show '{"summary": "Retorno", "body": "Ligado", "icon": "microphone"}'
end

