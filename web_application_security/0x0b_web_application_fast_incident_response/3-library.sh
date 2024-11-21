#!/bin/bash
grep -oP "\"\-\" \"[[:print:]]+" logs.txt | sort | uniq -c | sort -n | tail -n 1 | grep -oP "[a-zA-Z][[:print:]]+" | head -c -6
