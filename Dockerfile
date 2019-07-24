ARG BASE_IMAGE=senzing/senzing-base:1.1.0
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-07-23

LABEL Name="senzing/g2command" \
      Maintainer="support@senzing.com" \
      Version="1.1.0"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Copy files from repository.

COPY ./rootfs /

# Make non-root container.

USER 1001

# Runtime execution.

WORKDIR /opt/senzing/g2/python
ENTRYPOINT ["/opt/senzing/g2/python/G2Command.py" ]
