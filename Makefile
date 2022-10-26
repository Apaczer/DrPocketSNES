# Two stages Makefile

## Common vars

DEFAULT = wiz
NFAST =	fast
NCOMP = compatible
ALL_TARGETS = wiz
ODIR_SUFFIX = objs
PNAME = pocketsnes

## First stage
ifneq ($(STAGE),2)

FILE_DATE = $(shell date +%Y-%m-%d)

export MNAME
export VNAME
export COPT
export OBJS
export ARCH
export SDK
export STAGE
export FILE_DATE

all: 
	make wiz

# default to fast version
default: $(DEFAULT)f

# clean
clean: ALL_TARGETS_DIRS = $(addsuffix _$(NFAST)_$(ODIR_SUFFIX)/,$(ALL_TARGETS)) $(addsuffix _$(NCOMP)_$(ODIR_SUFFIX)/,$(ALL_TARGETS)) 
clean: 
#	rm -f $(addsuffix *.o,$(ALL_TARGETS_DIRS))
	rm -f compatible_objs/*.o
	rm -f fast_objs/*.o
	rm -f $(PNAME)_compatible* $(PNAME)_fast*

# when release is targeted compile both fast and compatible versions
release: 
	make $(DEFAULT)f
	make $(DEFAULT)c
	rm -f rel/*.gpe
	cp $(PNAME)_$(DEFAULT)_*.gpe rel/.
	zip $(PNAME)-$(FILE_DATE).zip rel/*

# invoke stage 2
do: STAGE = 2
do: 
	make

# ---------------------
# Wiz
# ---------------------

# -- Wiz common
wiz_common: MNAME = wiz
wiz_common: COPT += -mcpu=arm926ej-s -mtune=arm926ej-s -g -D__PANDORA__
#wiz_common: COPT += -D__FAST_OBJS__
wiz_common: COPT += -O3
#wiz_common: COPT += -Os 
wiz_common: COPT += -static -ffast-math -msoft-float
wiz_common: COPT += -finline-limit=42 -fno-unroll-loops -fno-ipa-cp -ffast-math
wiz_common: COPT += -fno-common -fno-stack-protector -fno-guess-branch-probability -fno-caller-saves -fno-regmove 
#wiz_common: COPT += -finline -finline-functions -fexpensive-optimizations 
#wiz_common: COPT += -falign-functions=32 -falign-loops -falign-labels -falign-jumps
#wiz_common: COPT += -fomit-frame-pointer 
#wiz_common: COPT += -fno-common -fno-builtin -fstrict-aliasing -mstructure-size-boundary=32 
# -fweb -frename-registers 
# -fsplit-ivs-in-unroller
#wiz_common: COPT += -Wall -Wno-sign-compare -Wunused -Wpointer-arith -Wcast-align -Waggregate-return 
wiz_common: OBJS = pandora_sdk.o
wiz_common: OBJS += os9x_65c816_global.o os9x_65c816_spcasm.o os9x_65c816_spcc.o os9x_asm_cpu.o
wiz_common: ARCH = $(CROSS)
wiz_common: SDK = $(SDKC)
#/$(ARCH)
#wiz_common: ARCH = arm-openwiz-linux-gnu
#wiz_common: SDK = /opt/openwiz/toolchain/$(ARCH)
wiz_common: do

# -- Fast version
wizf: VNAME = $(NFAST)
#wizf: COPT = -DASMCPU -D__DEBUG__
wizf: COPT = -DASMCPU -DDEBUG
wizf: wiz_common

# -- Normal version 
wizc: VNAME = $(NCOMP)
wizc: COPT = -DUSE_SA1 -DDEBUG 
wizc: wiz_common

wiz:
	make $@f
	make $@c
	
## Second stage
else

TOOLS = $(SDK)/bin
GCC = $(TOOLS)/$(ARCH)-gcc
STRIP = $(TOOLS)/$(ARCH)-strip
ADSASM = $(TOOLS)/$(ARCH)-as
LIBS = -I$(SDK)/include
INCS = -L$(SDK)/lib
ODIR = $(VNAME)_$(ODIR_SUFFIX)
# Inopia's menu system, hacked for the GP2X under rlyeh's sdk
PRELIBS = -lpthread -lz $(LIBS)

#
# SNES stuff (c-based)
#
#OBJS += touchscreen.o
OBJS += apu.o apuaux.o c4.o c4emu.o cheats.o cheats2.o clip.o data.o screenshot.o
OBJS += dsp1.o fxemu.o fxinst.o globals.o loadzip.o  ppu.o 
OBJS += dma.o memmap.o
OBJS += cpu.o cpuexec.o
OBJS += cpuops.o 
OBJS += sa1.o sa1cpu.o 
OBJS += sdd1.o sdd1emu.o snapshot.o soundux.o spc700.o spc700a.o srtc.o
#OBJS += spc_decode.o 
OBJS += tile16.o tile16add.o tile16add1_2.o tile16fadd1_2.o tile16sub.o tile16sub1_2.o tile16fsub1_2.o 
OBJS += mode7new.o mode7.o mode7add.o mode7add1_2.o mode7sub.o mode7sub1_2.o
OBJS += mode7prio.o mode7addprio.o mode7add1_2prio.o mode7subprio.o mode7sub1_2prio.o
OBJS += gfx16.o rops.o
OBJS += usbjoy.o 
#
# and some asm from LJP...
#
#OBJS += m3d_func.o
#
# Dave's minimal SDK
#
OBJS += menu.o config.o input.o gp2x_menutile.o gp2x_highlightbar.o \
	gp2x_menu_header.o unzip.o ioapi.o zip.o asm_util.o png.o graphics.o lodepng.o theme.o minIni.o
OBJS += disk_img.o 
#OBJS += memset.o memcmp.o memcpy.o strlen.o strcmp.o strncmp.o

#
# and the glue code that sticks it all together :)
#
OBJS += main.o
FOBJS = $(addprefix $(ODIR)/,$(OBJS))
COPT += $(INCS) $(LIBS)

executable: $(FOBJS)
	$(GCC) $(COPT)  $(FOBJS) $(PRELIBS) -o $(PNAME)_$(VNAME)_d -lstdc++ -lm -lSDL -lasound -static
	$(STRIP) $(PNAME)_$(VNAME)_d -o $(PNAME)_$(VNAME)

$(FOBJS): | $(ODIR)

$(ODIR): 
	mkdir -p $(ODIR)
	
tidy:
	rm $(ODIR)/*.o

# -- Compilation rules
$(ODIR)/%.o: %.cpp 
	$(GCC) $(COPT) -c $< -o $@

$(ODIR)/%.o: %.c 
	$(GCC) $(COPT) -c $< -o $@

$(ODIR)/%.o: %.s 
	$(GCC) $(COPT) -c $< -o $@

$(ODIR)/%.o: %.S
	$(GCC) $(COPT) -c $< -o $@

endif
