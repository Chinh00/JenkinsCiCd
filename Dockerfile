

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

COPY ["JenkinsCiCd/JenkinsCiCd.sln", "JenkinsCiCd/JenkinsCiCd.sln"]
COPY ["JenkinsCiCd/JenkinsCiCd/JenkinsCiCd.csproj", "JenkinsCiCd/JenkinsCiCd/JenkinsCiCd.csproj"]
ENV ASPNETCORE_HTTP_PORTS=8080

RUN dotnet restore "JenkinsCiCd/JenkinsCiCd.sln"

COPY . .

WORKDIR "/src/JenkinsCiCd"
RUN dotnet build "JenkinsCiCd.sln" -c Release -o /app/build


FROM build AS publish
RUN dotnet publish -c Release -o /app/publish


FROM build AS final
EXPOSE 8080
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "JenkinsCiCd.dll"]