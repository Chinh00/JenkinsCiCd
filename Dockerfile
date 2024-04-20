FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app


COPY ["JenkinsCiCd/JenkinsCiCd.sln", "."]
#RUN #dotnet restore "JenkinsCiCd/JenkinsCiCd.sln"
#COPY . .
RUN ls -l JenkinsCiCd


#RUN dotnet publish -c Release -o /app/out
#
#FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS Prod
#WORKDIR /app
#EXPOSE 8080
#COPY --from=build /app/out .
#ENTRYPOINT ["dotnet", "JenkinsCiCd.dll"]
#



