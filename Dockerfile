# Use the .NET Core SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env

# Set environment variable for ASP.NET Core to use port 80
ENV ASPNETCORE_HTTP_PORTS=80

# Set the working directory inside the container
WORKDIR /app

# Copy the solution file into the container
COPY "JenkinsCiCd.sln" "JenkinsCiCd.sln"
COPY "JenkinsCiCd/JenkinsCiCd/JenkinsCiCd.csproj" "JenkinsCiCd/JenkinsCiCd/JenkinsCiCd.csproj"

# Restore NuGet packages
RUN dotnet restore "JenkinsCiCd.sln"

# Copy the rest of the application source code into the container
COPY . .

# Change working directory to /app
WORKDIR /app

# Publish the application
RUN dotnet publish -c Release -o out "JenkinsCiCd.sln"


# Use the .NET Core ASP.NET Runtime image for running the application
FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Set environment variable for ASP.NET Core to use port 80
ENV ASPNETCORE_HTTP_PORTS=80

# Expose port 80 to the outside world
EXPOSE 80

# Set the working directory inside the container
WORKDIR /app

# Copy the published output from the build environment into the container
COPY --from=build-env /app/out .

# Set the entry point for the container
ENTRYPOINT ["dotnet", "JenkinsCiCd.dll"]
