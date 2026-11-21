# syntax=docker/dockerfile:1

# Build stage: use the 730MB sdk image to build
FROM mcr.microsoft.com/dotnet/sdk:11.0@sha256:65f3c7c6a25a239ab3e6719f2896147e7b68242ff2d8818dd70498bde6ef8bea AS builder

LABEL maintainer="MSRC Project"

# PowerShell 7.6 (LTS, runs on .NET 10)
RUN dotnet tool install -g PowerShell --version 7.6.9

# Final stage: discard all builder data, copy only required files to smaller 180MB base image
FROM mcr.microsoft.com/dotnet/runtime:11.0@sha256:3fe5f5495141c97986a49d3a4e76061f6225c3f93f94e8a7e522781376193863

LABEL maintainer="MSRC Project"

COPY --from=builder /root/.dotnet/tools/ /bin

# Run powershell
CMD ["pwsh"]
