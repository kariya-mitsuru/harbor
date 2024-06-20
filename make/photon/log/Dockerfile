ARG harbor_base_image_version
ARG harbor_base_namespace
FROM ${harbor_base_namespace}/harbor-log-base:${harbor_base_image_version}

COPY --link --chown=10000:10000 ./make/photon/log/rsyslog.conf /etc/rsyslog.conf

# rsyslog configuration file for docker
COPY --link --chown=10000:10000 ./make/photon/log/rsyslog_docker.conf /etc/rsyslog.d/

COPY --link ./make/photon/log/logrotate /etc/cron.hourly/

COPY --link --chmod=755 ./make/photon/log/start.sh /usr/local/bin/

HEALTHCHECK CMD netstat -ltun|grep 10514

VOLUME /var/log/docker/ /run/ /etc/logrotate.d/

CMD /usr/local/bin/start.sh
