#!/bin/bash
text="$1"
text="${text#'{xor}'}"
basetext=$(echo "$text" | base64 -d)

basetextxor=""
for ((i = 0; i < ${#basetext}; i++)); do
    c="${basetext:$i:1}"
    ascii_value=$(printf "%d" "'$c")
    xor=$(( ascii_value ^ 95 ))
    basetextxor+="$(printf "$(printf '\\x%x' $xor)")"
done

echo -e "$basetextxor"
