#!/usr/bin/env python3
import requests
import sys

url = sys.argv[1]
times = sys.argv[2]

for i in range(int(times)):
    print(requests.get(url).cookies.get_dict()['hijack_session'])
