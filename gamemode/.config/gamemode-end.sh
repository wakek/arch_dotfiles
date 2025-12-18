#!/bin/bash
sudo -n cpupower frequency-set -u 4.1GHz 

sudo cp /etc/intel-undervolt-work.conf /etc/intel-undervolt.conf 

sudo intel-undervolt apply 

sudo dell-bios-fan-control 1 

sudo systemctl stop i8kmon.service;