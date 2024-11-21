#!/bin/bash
sort logs.txt | uniq -c | sort -n | tail -n 1 | grep -oP "[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+"
