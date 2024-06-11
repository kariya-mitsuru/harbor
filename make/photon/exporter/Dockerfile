ARG build_image
ARG harbor_base_image_version
ARG harbor_base_namespace

FROM --platform=$BUILDPLATFORM ${build_image} AS build

ARG TARGETARCH

COPY --link src /harbor/src
WORKDIR /harbor/src/cmd/exporter
RUN CGO_ENABLED=0 GOOS=linux GOARCH=$TARGETARCH go build -o /out/harbor_exporter

FROM ${harbor_base_namespace}/harbor-exporter-base:${harbor_base_image_version}

COPY --link --from=build --chown=10000:10000 --chmod=755 /out/harbor_exporter /harbor/harbor_exporter
COPY --link --chown=10000:10000 --chmod=744 ./make/photon/exporter/entrypoint.sh /harbor/
COPY --link --chown=10000:10000 --chmod=755 ./make/photon/common/install_cert.sh /harbor/

WORKDIR /harbor
USER harbor

ENTRYPOINT ["/harbor/entrypoint.sh"]
