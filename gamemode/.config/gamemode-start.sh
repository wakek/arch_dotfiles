#!/bin/bash
sudo -n cpupower frequency-set -u 2.4GHz 

sudo cp ~/Data/Projects/arch_dotfiles/throttled/throttled-game.conf /etc/throttled.conf

sudo systemctl enable --now throttled

sudo dell-bios-fan-control 0 

sudo systemctl start i8kmon.service

notify-send -u critical -t 3000 "GameMode Active" "🚀 Jet Engine ON | CPU Limit: 18W"