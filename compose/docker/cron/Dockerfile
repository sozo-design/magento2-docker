FROM ghcr.io/sozo-design/magento2-php:8.1-cli

ARG USER_ID
ARG GROUP_ID

ENV USER_ID=${USER_ID}
ENV GROUP_ID=${GROUP_ID}

COPY cron /etc/cron.d/magento
RUN chmod 0644 /etc/cron.d/magento
RUN crontab /etc/cron.d/magento
RUN touch /var/log/cron.log

# Assign a new UID/GID to avoid using a generated value
RUN usermod -u ${USER_ID} www-data && \
    groupmod -g ${GROUP_ID} www-data && \
    chown -R ${USER_ID}:${GROUP_ID} /app/

CMD ["cron", "-f"]