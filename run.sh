#!/bin/bash

docker run --rm -it --name powershell -e APIKEY="$(cat api.txt)" -v "$(pwd)":/mnt microsoft/powershell pwsh /mnt/GenMSRCDocs.ps1
