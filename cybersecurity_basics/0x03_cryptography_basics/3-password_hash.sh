#!/bin/bash
echo $1 | openssl sha512 >> 3_hash.txt
