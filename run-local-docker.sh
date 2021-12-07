#!/bin/bash

docker build --tag=powershell-local .
docker run --rm -it --name powershell -e APIKEY="$(cat api.txt)" -v "$(pwd)":/mnt powershell-local pwsh /mnt/GenMSRCDocs.ps1
docker rmi powershell-local
