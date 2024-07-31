#!/bin/bash
sha256sum $1 > file
sha256sum --check file
