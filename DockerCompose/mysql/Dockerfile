FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src

COPY ["src/Dotz.Fidelidade.API/Dotz.Fidelidade.API.csproj", "src/Dotz.Fidelidade.API/"]
COPY ["src/Dotz.Fidelidade.Application/Dotz.Fidelidade.Application.csproj","src/Dotz.Fidelidade.Application/"]
COPY ["src/Dotz.Fidelidade.Domain/Dotz.Fidelidade.Domain.csproj","src/Dotz.Fidelidade.Domain/"]
COPY ["src/Dotz.Fidelidade.Infra.Dataaccess/Dotz.Fidelidade.Infra.Dataaccess.csproj","src/Dotz.Fidelidade.Infra.Dataaccess/"]

RUN dotnet restore "src/Dotz.Fidelidade.API/Dotz.Fidelidade.API.csproj"
COPY . .

WORKDIR "/src/src/Dotz.Fidelidade.API"
RUN dotnet build "Dotz.Fidelidade.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Dotz.Fidelidade.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Dotz.Fidelidade.API.dll"]
