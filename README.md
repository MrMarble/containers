# containers

Personal container images, built from `apps/<name>/` and published to `ghcr.io/mrmarble/<name>`.
Layout and pipeline are adapted from [home-operations/containers](https://github.com/home-operations/containers).

Each app has a `Dockerfile` and a `docker-bake.hcl` whose `VERSION` variable is tracked by Renovate.
Merging a version bump to `main` builds a multi-arch image tagged `X.Y.Z`, `X.Y`, `X` and `rolling`.
Pin by digest in your manifests: `ghcr.io/mrmarble/paseo:0.15.3@sha256:...`.
