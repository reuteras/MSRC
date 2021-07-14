#!/bin/bash

docker run --rm -it --name powershell -e APIKEY="$(cat api.txt)" -v "$(pwd)":/mnt mcr.microsoft.com/powershell pwsh /mnt/GenMSRCDocs.ps1
