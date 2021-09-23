FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src

COPY ["src/WebSocket.Application.API/WebSocket.Application.API.csproj", "src/WebSocket.Application.API/"]
COPY ["src/WebSocket.Application/WebSocket.Application.csproj", "src/WebSocket.Application/"]
COPY ["src/WebSocket.Domain/WebSocket.Domain.csproj", "src/WebSocket.Domain/"]
COPY ["src/WebSocket.Infra.Signalr/WebSocket.Infra.Signalr.csproj", "src/WebSocket.Infra.Signalr/"]
COPY ["nuget.config", "src/"]

RUN dotnet restore "src/WebSocket.Application.API/WebSocket.Application.API.csproj"
COPY . .
WORKDIR "/src/src/WebSocket.Application.API"
RUN dotnet build "WebSocket.Application.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebSocket.Application.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "FnxDigital.Service.WebSocket.Application.API.dll"]