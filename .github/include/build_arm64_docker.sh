#!/bin/bash -x

pwd
IMAGE=ubuntudemo
docker buildx build --platform linux/arm64 -f docker/Dockerfile.ubuntu.arm64 -t "$IMAGE" --load docker/
docker images
docker ps
docker run -v $(pwd):$(pwd) -w $(pwd) -i "$IMAGE" <<'EOF'
set -eux
uname -a
EOF