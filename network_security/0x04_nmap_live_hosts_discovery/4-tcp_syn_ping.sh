#!/bin/bash
sudo nmap -PS 22,80,443 -ns $1
