ARG GOLANG
FROM ${GOLANG}

ARG SPECTRAL_VERSION
ARG TARGETARCH
ARG arch=${TARGETARCH/amd/x}
RUN curl -fsSL -o /usr/bin/spectral https://github.com/stoplightio/spectral/releases/download/$SPECTRAL_VERSION/spectral-linux-$arch && chmod +x /usr/bin/spectral

ENTRYPOINT ["/usr/bin/spectral"]
CMD ["--version"]
