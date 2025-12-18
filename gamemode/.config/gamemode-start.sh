#!/bin/bash
sudo -n cpupower frequency-set -u 2.5GHz 

sudo cp /etc/intel-undervolt-game.conf /etc/intel-undervolt.conf 

sudo intel-undervolt apply 

sudo dell-bios-fan-control 0 

sudo systemctl start i8kmon.service

notify-send -u critical -t 3000 "GameMode Active" "🚀 Jet Engine ON | CPU Limit: 18W"