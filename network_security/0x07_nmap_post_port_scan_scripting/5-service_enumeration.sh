#!/bin/bash
sudo nmap -A --script=ventrilo-info,banner,ssl-enum-ciphers,default,smb-enum-domains $1 -oN service_enumeration_results.txt
