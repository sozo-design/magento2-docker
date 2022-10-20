FROM nginx:1.20.2
MAINTAINER Clive Walkden <clive@sozodesign.co.uk>

ENV UPLOAD_MAX_FILESIZE 64M
ENV FPM_HOST fpm
ENV FPM_PORT 9000
ENV MAGENTO_ROOT /app
ENV MAGENTO_RUN_MODE production
ENV UPSTREAM_HOST web
ENV UPSTREAM_PORT 8080
ENV MFTF_UTILS 0
ENV DEBUG false
ENV NGINX_WORKER_PROCESSES 1
ENV NGINX_WORKER_CONNECTIONS 1024

COPY nginx/nginx.conf /etc/nginx/
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir /etc/nginx/certs

RUN apt-get update && \
    apt-get install -y curl libnss3-tools openssl && \
    apt-get clean

RUN mkdir /etc/nginx/certs \
  && echo -e "\n\n\n\n\n\n\n" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/nginx.key -out /etc/nginx/certs/nginx.crt

RUN cd /usr/local/bin/ \
    && curl -L https://dl.filippo.io/mkcert/latest?for=linux/amd64 -o mkcert \
    && chmod +x mkcert

VOLUME ${MAGENTO_ROOT}

COPY bin/* /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/docker-environment"]

ENTRYPOINT ["/usr/local/bin/docker-environment"]

EXPOSE 80 443

WORKDIR ${MAGENTO_ROOT}

CMD ["nginx", "-g", "daemon off;"]