

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

COPY ["JenkinsCiCd/JenkinsCiCd.sln", "JenkinsCiCd/JenkinsCiCd.sln"]
COPY ["JenkinsCiCd/JenkinsCiCd/JenkinsCiCd.csproj", "JenkinsCiCd/JenkinsCiCd/JenkinsCiCd.csproj"]
ENV ASPNETCORE_HTTP_PORTS=8080

RUN dotnet restore "JenkinsCiCd/JenkinsCiCd.sln"

COPY . .

COPY JenkinsCiCd JenkinsCiCd

WORKDIR /app
RUN dotnet publish -c Release -o /app "JenkinsCiCd/JenkinsCiCd.sln"
FROM mcr.microsoft.com/dotnet/aspnet:8.0
ENV ASPNETCORE_HTTP_PORTS=80
EXPOSE 80
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "JenkinsCiCd.dll"]