# syntax=docker/dockerfile:1

ARG VERSION
FROM ghcr.io/getpaseo/paseo:${VERSION}

# The upstream image does not bundle any agent CLI. Its entrypoint needs root
# for first-run volume setup (then drops to the `paseo` user), so stay root.
USER root

# renovate: datasource=npm depName=@anthropic-ai/claude-code
ARG CLAUDE_CODE_VERSION=2.1.322
# renovate: datasource=npm depName=opencode-ai
ARG OPENCODE_VERSION=1.19.5
# renovate: datasource=github-releases depName=cli/cli
ARG GH_VERSION=2.103.3

RUN npm install -g \
        @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION} \
        opencode-ai@${OPENCODE_VERSION} \
    && npm cache clean --force

# GitHub CLI, from the release tarball (the base image has no curl/wget).
ARG TARGETARCH
ADD https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_${TARGETARCH}.tar.gz /tmp/gh.tar.gz
RUN tar -xzf /tmp/gh.tar.gz -C /tmp \
    && install -m 0755 /tmp/gh_${GH_VERSION}_linux_${TARGETARCH}/bin/gh /usr/local/bin/gh \
    && rm -rf /tmp/gh.tar.gz /tmp/gh_${GH_VERSION}_linux_${TARGETARCH}
