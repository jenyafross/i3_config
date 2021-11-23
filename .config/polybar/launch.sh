#!/bin/bash

# Завершить текущие экземпляры polybar
killall -q polybar

# Ожидание полного завершения работы процессов
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mybar &
  done
else
# Запуск Polybar со стандартным расположением конфигурационного файла в ~/.config/polybar/config
  polybar --reload mybar &
fi

echo "Polybar загрузился..."
