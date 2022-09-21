COPT = -mcpu=arm920t -mtune=arm920t -g -I . -I/opt/miyoo/include  -O3 -D__GP2X__
COPT += -ffast-math -fexpensive-optimizations -finline -finline-functions -msoft-float -falign-functions=32 -falign-loops -falign-labels -falign-jumps -fomit-frame-pointer
GCC = /opt/miyoo/bin/arm-linux-gcc
STRIP = /opt/miyoo/bin/arm-linux-strip
ADSASM = /opt/miyoo/bin/arm-linux-as

#
# SNES stuff (c-based)
#
OBJS = memset.o memcpy.o 2xsaiwin.o apu.o c4.o c4emu.o cheats.o cheats2.o clip.o cpu.o cpuexec.o data.o 
OBJS += dma.o dsp1.o fxemu.o fxinst.o gfx.o globals.o loadzip.o memmap.o ppu.o  
OBJS += sdd1.o sdd1emu.o snapshot.o soundux.o spc700.o srtc.o tile.o usbjoy.o
#
# ASM CPU Core, ripped from Yoyo's OpenSnes9X
#
OBJS += os9x_asm_cpu.o os9x_65c816.o spc700a.o
#
# and some asm from LJP...
#
OBJS += m3d_func.o
#
# Dave's minimal SDK
#
OBJS += gp2x_sdk.o menu.o input.o gp2x_menutile.o gp2x_highlightbar.o \
	gp2x_menu_header.o unzip.o ioapi.o squidgehack.o mmuhack.o

#
# and the glue code that sticks it all together :)
#
OBJS += main.o

# Inopia's menu system, hacked for the GP2X under rlyeh's sdk
PRELIBS = -L/opt/miyoo/lib -lpthread -lz $(LIBS)

all: pocketsnes.gpe
clean: tidy pocketsnes.gpe

.c.o:
	$(GCC) $(COPT) -c $< -o $@

.cpp.o:
	$(GCC) $(COPT) -c $< -o $@

# make seems to lowercase the extensions, so files with '.S' end up being passed to the compiler as '.s', which means thousands of errors.
# this is a small workaround. 

spc700a.o: spc700a.s
	$(GCC) $(COPT) -c $< -o $@

os9x_65c816.o: os9x_65c816.s
	$(GCC) $(COPT) -c $< -o $@

osnes9xgp_asmfunc.o: osnes9xgp_asmfunc.s
	$(GCC) $(COPT) -c $< -o $@

m3d_func.o: m3d_func.S
	$(GCC) $(COPT) -c $< -o $@

spc_decode.o: spc_decode.s
	$(GCC) $(COPT) -c $< -o $@

memset.o: memset.s
	$(GCC) $(COPT) -c $< -o $@

memcpy.o: memcpy.s
	$(GCC) $(COPT) -c $< -o $@

dspMixer.o: dspMixer.s
	$(GCC) $(COPT) -c $< -o $@

pocketsnesd.gpe: $(OBJS)
	$(GCC) $(COPT) $(OBJS) -static $(PRELIBS) -o $@ -lstdc++ -lm

pocketsnes.gpe: pocketsnesd.gpe
	$(STRIP) pocketsnesd.gpe -o pocketsnes.gpe
tidy:
	del *.o
