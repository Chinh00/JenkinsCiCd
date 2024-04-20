FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
RUN echo github.workspace
WORKDIR /app


COPY ["JenkinsCiCd/JenkinsCiCd/JenkinsCiCd.csproj", "JenkinsCiCd/JenkinsCiCd/JenkinsCiCd.csproj"]


RUN dotnet restore "JenkinsCiCd/JenkinsCiCd/JenkinsCiCd.csproj"
COPY ["JenkinsCiCd/", "JenkinsCiCd/" ]
RUN ls -l JenkinsCiCd/
WORKDIR /app/JenkinsCiCd
RUN dotnet publish -c Release -o /app/out

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS Prod
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "JenkinsCiCd.dll"]




