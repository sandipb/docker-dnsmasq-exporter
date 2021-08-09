FROM golang:1.16-alpine AS build
ENV CGO_ENABLED=0
WORKDIR /code
ARG GIT_REPO=https://github.com/google/dnsmasq_exporter
ARG GIT_BRANCH=master
RUN wget ${GIT_REPO}/archive/refs/heads/${GIT_BRANCH}.zip && unzip ${GIT_BRANCH}.zip \
    && cd dnsmasq_exporter-${GIT_BRANCH} && go build -o dnsmasq_exporter \
    && echo "${GIT_REPO}:${GIT_BRANCH}" > SOURCE

FROM golang:1.16-alpine
ARG GIT_REPO=https://github.com/google/dnsmasq_exporter
ARG GIT_BRANCH=master
WORKDIR /
COPY --from=build \
     /code/dnsmasq_exporter-${GIT_BRANCH}/dnsmasq_exporter \
     /code/dnsmasq_exporter-${GIT_BRANCH}/SOURCE  \
     /
USER 1000
ENTRYPOINT ["/dnsmasq_exporter"]