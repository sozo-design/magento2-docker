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
ENV CAPASSWORD 'av293JY$fY9wq5h#m^U&A46V@R'

COPY nginx/nginx.conf /etc/nginx/
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir /etc/nginx/ssl
RUN mkdir /etc/nginx/ca
COPY certs/ /etc/nginx/ssl/
COPY ca-certs/ /etc/nginx/ca/

RUN apt-get update && \
    apt-get install -y openssl

RUN openssl x509 -req -days 365 -in /etc/nginx/ssl/magento.csr -CA /etc/nginx/ca/sozocacert.pem \
    -CAkey /etc/nginx/ca/sozoca.key -CAcreateserial -out /etc/nginx/ssl/magento.crt -extfile /etc/nginx/ssl/openssl.conf \
    -sha256 -extfile /etc/nginx/ssl/v3.ext -passin env:CAPASSWORD

VOLUME ${MAGENTO_ROOT}

COPY bin/* /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/docker-environment"]

ENTRYPOINT ["/usr/local/bin/docker-environment"]

EXPOSE 80 443

WORKDIR ${MAGENTO_ROOT}

CMD ["nginx", "-g", "daemon off;"]