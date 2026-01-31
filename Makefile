# Two stages Makefile

## Common vars

HOMEPATH = /mnt
DEFAULT = miyoo
NFAST =	fast
NCOMP = compatible
ALL_TARGETS = miyoo
ODIR_SUFFIX = objs
PNAME = drpocketsnes

PROFILE ?= 0

## First stage
ifneq ($(STAGE),2)

FILE_DATE = $(shell date +%Y-%m-%d)

export VNAME
export COPT
export OBJS
export ARCH
export SDK
export STAGE
export FILE_DATE

all: 
	$(MAKE) miyoo

fast:
	$(MAKE) miyoof

comp:
	$(MAKE) miyooc

# default to fast version
default: $(DEFAULT)f

# clean
clean: ALL_TARGETS_DIRS = $(addsuffix _$(NFAST)_$(ODIR_SUFFIX)/,$(ALL_TARGETS)) $(addsuffix _$(NCOMP)_$(ODIR_SUFFIX)/,$(ALL_TARGETS)) 
clean: 
#	rm -f $(addsuffix *.o,$(ALL_TARGETS_DIRS))
	rm -f compatible_objs/*.o
	rm -f fast_objs/*.o
	rm -f $(PNAME)_compatible* $(PNAME)_fast*
	-rm -rf rel/
	-gm2xpkg --clean pkg.cfg
	-rm -f $(PNAME) $(PNAME).ipk

# when release is targeted compile both fast and compatible versions
release: comp
	mkdir -p rel
	cp MANUAL COPYRIGHT CHANGELOG rel/
	mv rel/MANUAL rel/manual.man.txt
	mv rel/COPYRIGHT rel/COPYRIGHT.txt
	mv rel/CHANGELOG rel/CHANGELOG.txt
	cp -r menu_header.bmp assets/* rel/
	cp icon.png rel/$(PNAME).png
	cp $(PNAME)_compatible rel/
# only include fast build if present
	-cp $(PNAME)_fast rel/

zip: release
	cd rel && zip -r ../$(PNAME)-$(FILE_DATE).zip .

ipk: comp
	cp icon.png assets/$(PNAME).png
	cp $(PNAME)_compatible $(PNAME)
	gm2xpkg --ipk pkg.cfg

# invoke stage 2
do: STAGE = 2
do: 
	$(MAKE)

# ---------------------
# Common flags
# ---------------------

# -- common
common: COPT += -mcpu=arm926ej-s -mtune=arm926ej-s -g -D__MIYOO__
#common: COPT += -D__FAST_OBJS__
common: COPT += -O3 -fno-inline
common: COPT += -finline-limit=42 -fno-unroll-loops -fno-ipa-cp -ffast-math
common: COPT += -fno-common -fno-stack-protector -fno-caller-saves -fno-regmove 
# Use "Delayed Raster FX" if enabled
common: COPT += -D__OLD_RASTER_FX__
# Miyoo obj
common: OBJS = miyoo_sdk.o
common: OBJS += os9x_65c816_global.o os9x_65c816_spcasm.o os9x_65c816_spcc.o os9x_asm_cpu.o
common: ARCH = $(CROSS_COMPILE)
common: SDK = $(CROSS_ROOT)/usr
common: do

# -- Fast version
miyoof: VNAME = $(NFAST)
miyoof: COPT = -DASMCPU -DDEBUG
miyoof: common

# -- Normal version 
miyooc: VNAME = $(NCOMP)
miyooc: COPT = -DUSE_SA1 -DDEBUG
miyooc: common

miyoo:
	$(MAKE) $@f
	$(MAKE) $@c
	
## Second stage
else

TOOLS = $(SDK)/bin
GCC = $(TOOLS)/$(ARCH)gcc
STRIP = $(TOOLS)/$(ARCH)strip
ADSASM = $(TOOLS)/$(ARCH)as
CFLAGS = -Isrc
LIBS = -I$(SDK)/include
ODIR = $(VNAME)_$(ODIR_SUFFIX)

# PGO (gcc 9)
ifeq ($(PROFILE), YES)
CFLAGS	+= -fprofile-generate=$(HOMEPATH)/profile
LIBS += -lgcov
else ifeq ($(PROFILE), APPLY)
CFLAGS	+= -fprofile-use=profile -fbranch-probabilities
else
CFLAGS	+= -fno-guess-branch-probability
endif

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
COPT += $(CFLAGS) $(INCS) $(LIBS)

executable: $(FOBJS)
	$(GCC) $(COPT) $(FOBJS) -o $(PNAME)_$(VNAME)_d -lSDL -lasound -lstdc++ -lz -lpthread -lts
	$(STRIP) $(PNAME)_$(VNAME)_d -o $(PNAME)_$(VNAME)

$(FOBJS): | $(ODIR)

$(ODIR): 
	mkdir -p $(ODIR)
	
tidy:
	rm $(ODIR)/*.o

# -- Compilation rules
$(ODIR)/%.o: src/%.cpp 
	$(GCC) $(COPT) -c $< -o $@

$(ODIR)/%.o: src/%.c 
	$(GCC) $(COPT) -c $< -o $@

$(ODIR)/%.o: src/%.s 
	$(GCC) $(COPT) -c $< -o $@

$(ODIR)/%.o: src/%.S
	$(GCC) $(COPT) -c $< -o $@

endif
