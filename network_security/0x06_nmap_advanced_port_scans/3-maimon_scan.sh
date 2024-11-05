#!/bin/bash
sudo nmap -sM -v -p http,https,ssh,ftp,telnet $1
