FROM debian:12-slim

# Install basic build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git build-essential ninja-build cmake curl ca-certificates pkg-config \
    zip unzip tar \
    && rm -rf /var/lib/apt/lists/*

# Install vcpkg
RUN git clone https://github.com/microsoft/vcpkg /opt/vcpkg \
    && /opt/vcpkg/bootstrap-vcpkg.sh -disableMetrics

ENV VCPKG_ROOT=/opt/vcpkg
ENV PATH="$PATH:/opt/vcpkg"
ENV VCPKG_FEATURE_FLAGS=manifests
ENV VCPKG_DEFAULT_TRIPLET=x64-linux

WORKDIR /usr/src/app
COPY . .

# Install dependencies and build the project
RUN vcpkg install --triplet x64-linux --clean-after-build \
    && cmake -B build -G Ninja \
       -DCMAKE_TOOLCHAIN_FILE=/opt/vcpkg/scripts/buildsystems/vcpkg.cmake \
       -DCMAKE_BUILD_TYPE=Release \
       -DGIMUSRV_FRONTEND=STANDALONE \
    && cmake --build build

WORKDIR /usr/src/app/deploy
EXPOSE 9960
CMD ["../build/standalone_frontend/gimuserverw"]
