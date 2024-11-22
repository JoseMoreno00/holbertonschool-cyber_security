#!/bin/bash
grep "sshd" auth.log | tr -s ' ' '\n'  |sort | uniq -c | sort -nr
