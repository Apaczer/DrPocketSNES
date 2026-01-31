## INTRO

This project is a rework of 7.2.1 available src release, aimed at MiyooCFW compatible devices (armv5).

## Future Plans
- move code to pure C (apply [commit](https://github.com/libretro/snes9x2002/commit/7a7857f47b33f1b63fb585d2dc6c60d87c3e928f#diff-542e90878b5c30fbd7f56346c17ac4f10819c0af1a4fc200a2a63e9ef6a5641a) && rename 's/\.cpp$/.c/' *.cpp)
- add quick load/savestate (initLoad, exit, hotkey event)
- savestate sreenshots in saveMenu

## Build steps for MiyooCFW

Docker cross-compilation with uClibc-shared setup:
```sh
git clone https://github.com/Apaczer/DrPocketSNES
cd DrPocketSNES/
docker pull miyoocfw/toolchain-static-musl:latest
docker run --volume ./:/src/ -it miyoocfw/toolchain-static-musl:latest
cd /src
make clean
make
```
It is recommended to use COMPATIBLE build, thus `make comp`. For speed and compatibility please use "musl" libc SDK. Append PROFILE=[YES|APPLY] flag in make to generete|apply PGO, put *.gcda in ./profile dir.
