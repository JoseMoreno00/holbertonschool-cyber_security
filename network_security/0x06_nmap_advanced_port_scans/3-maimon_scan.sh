#!/bin/bash
sudo nmap -sM -vv -p http,https,ssh,ftp,telnet $1
