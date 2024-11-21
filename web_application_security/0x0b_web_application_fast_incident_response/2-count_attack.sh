#!/bin/bash
grep -oP "[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+" logs.txt| sort | uniq -c | sort -n | tail -n 1 | grep -oP "[[:digit:]]+" | head -n 1
