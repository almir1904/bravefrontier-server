# Decompfrontier Server
This is an unofficial, **EXPERIMENTAL** C++ game server that aims to emulate the official server used for Brave Frontier (v2.19.6.0)

The source code will eventually be part of a "Brave Frontier Offline Mod" release started
in late 2022 which took inspiration from the original GimuFrontier C# code made back in 2022 as a PoC to demonstrate
the feasibility of a server emulator. 

For more information about the strategy of the offline mod/purpose of this server, please check [How the offline mod works](https://decompfrontier.github.io/pages/Architecture/Offlinemod-architecture.html) and [Emulator (Server) architecture](https://decompfrontier.github.io/pages/Architecture/Emulator-architecture.html)

## Requirements
- Visual Studio 2022 (Windows)
- Ninja, GCC/Clang (Linux)
- CMake
- vcpkg

## Building
See the [Tutorial](https://decompfrontier.github.io/pages/Tutorial/index.html) pages section "Development setup" for more information.

### Docker
For a quick Linux build you can use the provided `Dockerfile`. It compiles the
server on a Debian base image and runs the standalone frontend. The image
includes the extra tools (`zip`, `unzip`, and `tar`) required by the vcpkg build
system.

```bash
docker build -t gimuserv .
docker run -p 9960:9960 gimuserv
```

The server will start using the configuration files from the `deploy` directory.

## Legal
The code of this project is released under the Affero GNU Public License v3.0+.

This project is not associated, affiliated or sponsored with/by Alim Co., Ltd or gumi Inc.
