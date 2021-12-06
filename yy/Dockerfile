# Version: 0.0.1
FROM ubuntu:14.04
MAINTAINER Frederic Tan "frederictanwj@gmail.com"
RUN apt-get update && apt-get install -y nginx
RUN echo "playing the Nginx..." \
	> /usr/share/nginx/html/index.html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-h"]
