FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
LABEL version = "1.0" description="Siscs Asp.net Application"
COPY dist /app
WORKDIR /app
EXPOSE 80/tcp
ENTRYPOINT [ "dotnet","app.dll" ]

#PARAMETROS
#CMD ["-a","-h"] 

