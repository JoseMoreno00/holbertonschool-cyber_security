#!/bin/bash
sudo nmap -sA -p $2 --scanflags $1 -oN custom_scan.txt >/dev/null  2>&1
