 # syntax=docker/dockerfile:1
ARG DOTNET_VERSION="6.0"
ARG ASPNETCORE_ENVIRONMENT="Development"
FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION} AS build
  ENV ASPNETCORE_ENVIRONMENT=ASPNETCORE_ENVIRONMENT
  RUN curl --silent --location https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && npm --version
  WORKDIR /app
  COPY oodreacttemplate/*.csproj oodreacttemplate/
  RUN dotnet restore oodreacttemplate/*.csproj
  COPY ./oodreacttemplate ./oodreacttemplate
  RUN dotnet publish oodreacttemplate/oodreacttemplate.csproj -c release -o oodreacttemplate/bin/release/ --no-cache --no-restore
  RUN file="$(ls)" && echo $file

FROM mcr.microsoft.com/dotnet/aspnet:${DOTNET_VERSION} AS production
  ENV ASPNETCORE_ENVIRONMENT=ASPNETCORE_ENVIRONMENT
  WORKDIR /app
  COPY --from=build app/oodreacttemplate/bin/release/ ./
  RUN file="$(ls)" && echo $file
ENTRYPOINT [ "dotnet", "oodreacttemplate.dll" ]
