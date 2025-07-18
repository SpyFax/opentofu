ARG app_version

FROM ghcr.io/opentofu/opentofu:${app_version}-minimal AS tofu

FROM debian:bookworm-slim

COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu

WORKDIR /workspace

ENTRYPOINT ["tofu"]
