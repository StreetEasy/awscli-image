FROM debian:9
ARG AWS_CLI_VERSION
RUN apt-get update -y \
  && apt-get install -y curl vim python python-pip python-setuptools ca-certificates groff less \
  && pip install awscli==${AWS_CLI_VERSION}
RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb" \
  && dpkg -i session-manager-plugin.deb
ENTRYPOINT ["aws"]
