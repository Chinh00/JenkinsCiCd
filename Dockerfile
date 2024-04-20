FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
RUN pwd

COPY ["JenkinsCiCd/JenkinsCiCd/JenkinsCiCd.csproj", "JenkinsCiCd/"]
#RUN dotnet restore "JenkinsCiCd/JenkinsCiCd.csproj"
#
COPY . .
RUN ls -l JenkinsCiCd
#RUN dotnet publish -c Release -o ./out
#
#
#FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS Prod
#WORKDIR /app
#EXPOSE 8080
#COPY --from=build /app/out .
#ENTRYPOINT ["dotnet", "JenkinsCiCd.dll"]
#



