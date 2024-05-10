## INTRO

Part of the source code between 7.2.1 release and last bittrider's official release for MiyooCFW is missing.

## What's needed TO be DO:

- fix ALSA output (pandora_sdk.c)
- add basic bilinear [upscaler](https://github.com/m45t3r/snes9x2002/blob/b65e88f52329696ce04beef8527ab159bcb56903/shell/scalers/scaler.c#L31) from snes9x2002 codebase.
- correct input mapping
- add argument reading for loading ROM file.
- remove redundant settings options.

## Build steps for MiyooCFW

Docker cross-compilation with uClibc-shared setup:
```sh
git clone https://github.com/Apaczer/DrPocketSNES
cd DrPocketSNES/
docker pull miyoocfw/toolchain-shared-uclibc:latest
docker run --volume ./:/src/ -it miyoocfw/toolchain-shared-uclibc:latest
cd /src
make clean
make
```

If you need to build for other libc implementation, utilize static SDK from release page with appriorate linking flags.
