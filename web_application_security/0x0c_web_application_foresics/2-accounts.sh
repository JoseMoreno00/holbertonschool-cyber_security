#!/bin/bash
tail -n 1000 auth.log | awk '/Failed password/ {fail[$9]++} /Accepted password/ {accept[$9]++} END {for (usser in accept) if (fail[usser] && accept[usser]) print usser}'
