#!/usr/bin/env bash

# Clean cache - /var/cache/pacman/pkg
sudo pacman -Scc

# Clean packages
sudo pacman -Rns $(pacman -Qtdq)

# Clean files
sudo rm -rfv /var/lib/systemd/coredump/*
sudo rm -rfv /var/log/journal/*

rm -rfv ~/.cache/*
