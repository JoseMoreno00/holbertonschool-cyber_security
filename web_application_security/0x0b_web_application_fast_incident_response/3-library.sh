#!/bin/bash
grep -oP "\"\-\" \"[[:print:]]+" logs.txt | sort | uniq -c | sort -n | tail -n 1 | head -c -6 | grep -oP "[a-zA-Z][[:print:]]+"
