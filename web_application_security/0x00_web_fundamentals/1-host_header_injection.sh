#!/bin/bash
curl  -X POST -H "host: $1" -d "$3" "$2"
