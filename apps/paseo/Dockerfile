# syntax=docker/dockerfile:1

ARG VERSION
FROM ghcr.io/getpaseo/paseo:${VERSION}

# The upstream image does not bundle any agent CLI. Its entrypoint needs root
# for first-run volume setup (then drops to the `paseo` user), so stay root.
USER root

# renovate: datasource=npm depName=@anthropic-ai/claude-code
ARG CLAUDE_CODE_VERSION=2.1.319
# renovate: datasource=npm depName=opencode-ai
ARG OPENCODE_VERSION=1.19.5

RUN npm install -g \
        @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION} \
        opencode-ai@${OPENCODE_VERSION} \
    && npm cache clean --force
