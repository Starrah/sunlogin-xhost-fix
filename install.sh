#!/bin/bash
install -D -m755 "sddm-Xsetup.sh" "/etc/sddm/Xsetup"
install -D -m644 "sddm-display-command.conf" "/etc/sddm.conf.d/display-command.conf"