# use the 730MB sdk image to build
FROM mcr.microsoft.com/dotnet/sdk:8.0-noble-arm64v8 as builder

# install the latest version of PowerShell
RUN dotnet tool install -g PowerShell

# discard all that builder data then just copy the required changed files from "builder" to the smaller 180MB base image
FROM mcr.microsoft.com/dotnet/runtime:8.0-noble-arm64v8
COPY --from=builder /root/.dotnet/tools/ /bin

# run powershell
CMD [ "pwsh" ]
