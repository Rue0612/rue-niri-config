#!/usr/bin/env fish

set card 3

set state (amixer -c $card cget numid=3)

if string match -q '*values=on*' $state
    amixer -c $card cset numid=3 off
    qs -c noctalia-shell ipc call toast send '{"title": "Retorno", "body": "Desligado", "icon": "microphone-mute"}'
else
    amixer -c $card cset numid=3 on
    qs -c noctalia-shell ipc call toast send '{"title": "Retorno", "body": "Ligado", "icon": "microphone"}'
end

