# syntax=docker/dockerfile:1

# Build stage: use the 730MB sdk image to build
FROM mcr.microsoft.com/dotnet/sdk:10.0-noble-arm64v8 AS builder

LABEL maintainer="MSRC Project"

# Install the latest version of PowerShell
RUN dotnet tool install -g PowerShell --version 7.4.7

# Final stage: discard all builder data, copy only required files to smaller 180MB base image
FROM mcr.microsoft.com/dotnet/runtime:10.0-noble-arm64v8

LABEL maintainer="MSRC Project"

COPY --from=builder /root/.dotnet/tools/ /bin

# Run powershell
CMD ["pwsh"]
