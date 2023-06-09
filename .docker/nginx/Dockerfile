FROM nginx:alpine-slim as base

MAINTAINER "Softavis Ltd" "support@softavis.com"

ARG SERVER_NAME
ENV SERVER_NAME symfony-docker.local

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
