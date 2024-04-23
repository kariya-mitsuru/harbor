ARG GOLANG
FROM ${GOLANG}
ARG TARGETARCH

ARG SPECTRAL_VERSION
RUN curl -fsSL -o /usr/bin/spectral https://github.com/stoplightio/spectral/releases/download/$SPECTRAL_VERSION/spectral-linux-$(echo $TARGETARCH | sed s/amd/x/) && chmod +x /usr/bin/spectral

ENTRYPOINT ["/usr/bin/spectral"]
CMD ["--version"]
