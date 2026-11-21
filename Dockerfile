# syntax=docker/dockerfile:1

# Build stage: use the 730MB sdk image to build
FROM mcr.microsoft.com/dotnet/sdk:10.0@sha256:bef136a371963aaa46ec97882845ef6f54dec15728bb4b128b1c2a400ffbc9b4 AS builder

LABEL maintainer="MSRC Project"

# PowerShell 7.6 (LTS, runs on .NET 10)
RUN dotnet tool install -g PowerShell --version 7.6.9

# Final stage: discard all builder data, copy only required files to smaller 180MB base image
FROM mcr.microsoft.com/dotnet/runtime:10.0@sha256:64a538092439382d055c87c0f49092efb8bca883c736c54ae523da7fd8e02d18

LABEL maintainer="MSRC Project"

COPY --from=builder /root/.dotnet/tools/ /bin

# Run powershell
CMD ["pwsh"]
