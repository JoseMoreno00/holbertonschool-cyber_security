#!/bin/bash
find $1 -perm -u=s -exec ls -ldb {} \; 2>/dev/null
