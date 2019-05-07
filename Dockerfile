ARG BASE_IMAGE=senzing/senzing-base
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-05-01

LABEL Name="senzing/g2command" \
      Maintainer="support@senzing.com" \
      Version="1.0.0"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apt.

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

WORKDIR /opt/senzing/g2/python
ENTRYPOINT ["/app/docker-entrypoint.sh", "python G2Command.py" ]
CMD [""]
