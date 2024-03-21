FROM ghcr.io/sozo-design/magento2-php:8.1-fpm

ARG USER_ID
ARG GROUP_ID

ENV USER_ID=${USER_ID}
ENV GROUP_ID=${GROUP_ID}

# Assign a new UID/GID to avoid using a generated value
RUN usermod -u ${USER_ID} www-data && \
    groupmod -g ${GROUP_ID} www-data && \
    chown -R ${USER_ID}:${GROUP_ID} /app/

EXPOSE 9000
