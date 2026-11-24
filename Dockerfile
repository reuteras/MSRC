# syntax=docker/dockerfile:1

# Build stage: use the 730MB sdk image to build
FROM mcr.microsoft.com/dotnet/sdk:10.0@sha256:8c6edfb26c85153f236d26efebd9ad349aec403583f343f201ee67838b23658d AS builder

LABEL maintainer="MSRC Project"

# PowerShell 7.6 (LTS, runs on .NET 10)
RUN dotnet tool install -g PowerShell --version 7.6.9

# Final stage: discard all builder data, copy only required files to smaller 180MB base image
FROM mcr.microsoft.com/dotnet/runtime:10.0@sha256:0a0e20d12b84b081fb737fddb92d8d205edce9ac2dc62796d2aab30f03804498

LABEL maintainer="MSRC Project"

COPY --from=builder /root/.dotnet/tools/ /bin

# Run powershell
CMD ["pwsh"]
