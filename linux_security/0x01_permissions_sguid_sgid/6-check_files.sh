#!/bin/bash
find $1 -type f -perm /-u=s,-g=s -mtime -1 -exec ls -ldb -o {} \;
