FROM debian:latest
LABEL version = "1.0" description="Siscs debian container"
RUN apt-get update && apt-get install -y nginx && apt-get clean
EXPOSE 80/tcp
ENTRYPOINT [ "/usr/sbin/nginx" ]
CMD ["-g","daemon off;"] 

