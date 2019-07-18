ARG BASE_IMAGE=senzing/senzing-base:1.0.3
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-07-11

LABEL Name="senzing/g2command" \
      Maintainer="support@senzing.com" \
      Version="1.0.1"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

WORKDIR /opt/senzing/g2/python
ENTRYPOINT ["/app/docker-entrypoint.sh", "python3 G2Command.py" ]
CMD [""]
