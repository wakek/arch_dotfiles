#!/bin/bash
sudo -n cpupower frequency-set -u 4.1GHz 

sudo cp ~/Data/Projects/arch_dotfiles/throttled/throttled-work.conf /etc/throttled.conf

sudo systemctl enable --now throttled

sudo dell-bios-fan-control 1 

sudo systemctl stop i8kmon.service;

notify-send -u low -t 3000 "GameMode Ended" "🍃 Silent Mode Restored"