#!/bin/bash
grep -oP "[A-Z]+ \/" logs.txt | sort | uniq -c | sort -n | tail -n 1  | grep -oP "\/"
