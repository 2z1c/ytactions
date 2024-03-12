#!/bin/bash -x

pwd
IMAGE=ubuntudemo
docker build -f docker/Dockerfile.ubuntu.arm64 -t "$IMAGE" docker/
docker images

docker run -v $(pwd):$(pwd) -w $(pwd) -i "$IMAGE" <<'EOF'
set -eux
uname -a
EOF