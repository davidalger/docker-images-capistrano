FROM centos:8
LABEL maintainer="David Alger"

RUN dnf -y module install ruby:2.6 \
    && dnf clean all \
    && rm -rf /var/cache/dnf

ARG CAPISTRANO_VERSION
RUN set -eux \
    && if [[ ${CAPISTRANO_VERSION} =~ ^[0-9]+\.[0-9]+$ ]]; \
        then CAPISTRANO_VERSION="~> ${CAPISTRANO_VERSION}.0"; \
    fi \
    && gem install capistrano --version "${CAPISTRANO_VERSION}" \
    && gem install bundler capistrano-slackify
