/*
 * Snes9x - Portable Super Nintendo Entertainment System (TM) emulator.
 *
 * (c) Copyright 1996 - 2001 Gary Henderson (gary.henderson@ntlworld.com) and
 *                           Jerremy Koot (jkoot@snes9x.com)
 *
 * Super FX C emulator code 
 * (c) Copyright 1997 - 1999 Ivar (ivar@snes9x.com) and
 *                           Gary Henderson.
 * Super FX assembler emulator code (c) Copyright 1998 zsKnight and _Demo_.
 *
 * DSP1 emulator code (c) Copyright 1998 Ivar, _Demo_ and Gary Henderson.
 * C4 asm and some C emulation code (c) Copyright 2000 zsKnight and _Demo_.
 * C4 C code (c) Copyright 2001 Gary Henderson (gary.henderson@ntlworld.com).
 *
 * DOS port code contains the works of other authors. See headers in
 * individual files.
 *
 * Snes9x homepage: http://www.snes9x.com
 *
 * Permission to use, copy, modify and distribute Snes9x in both binary and
 * source form, for non-commercial purposes, is hereby granted without fee,
 * providing that this license information and copyright notice appear with
 * all copies and any derived work.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event shall the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Snes9x is freeware for PERSONAL USE only. Commercial users should
 * seek permission of the copyright holders first. Commercial use includes
 * charging money for Snes9x or software derived from Snes9x.
 *
 * The copyright holders request that bug fixes and improvements to the code
 * should be forwarded to them so everyone can benefit from the modifications
 * in future versions.
 *
 * Super NES and Super Nintendo Entertainment System are trademarks of
 * Nintendo Co., Limited and its subsidiary companies.
 */

#ifdef USE_SA1

#include "snes9x.h"
#include "ppu.h"
#include "cpuexec.h"

#include "sa1.h"

static void S9xSA1CharConv2 ();
static void S9xSA1DMA ();
static void S9xSA1ReadVariableLengthData (bool8 inc, bool8 no_shift);

void S9xSA1Init ()
{
    SA1.NMIActive = FALSE;
    SA1.IRQActive = FALSE;
    SA1.WaitingForInterrupt = FALSE;
    SA1.Waiting = FALSE;
    SA1.Flags = 0;
    SA1.Executing = FALSE;
    memset (&Memory.FillRAM [0x2200], 0, 0x200);
    Memory.FillRAM [0x2200] = 0x20;
    Memory.FillRAM [0x2220] = 0x00;
    Memory.FillRAM [0x2221] = 0x01;
    Memory.FillRAM [0x2222] = 0x02;
    Memory.FillRAM [0x2223] = 0x03;
    Memory.FillRAM [0x2228] = 0xff;
    SA1.op1 = 0;
    SA1.op2 = 0;
    SA1.arithmetic_op = 0;
    SA1.sum = 0;
    SA1.overflow = FALSE;
}

void S9xSA1Reset ()
{
    SA1Registers.PB = 0;
    SA1Registers.PC = Memory.FillRAM [0x2203] |
		      (Memory.FillRAM [0x2204] << 8);
    SA1Registers.D.W = 0;
    SA1Registers.DB = 0;
    SA1Registers.SH = 1;
    SA1Registers.SL = 0xFF;
    SA1Registers.XH = 0;
    SA1Registers.YH = 0;
    SA1Registers.P.W = 0;

    SA1.ShiftedPB = 0;
    SA1.ShiftedDB = 0;
    SA1SetFlags (MemoryFlag | IndexFlag | IRQ | Emulation);
    SA1ClearFlags (Decimal);

    SA1.WaitingForInterrupt = FALSE;
    SA1.PC = NULL;
    SA1.PCBase = NULL;
    S9xSA1SetPCBase (SA1Registers.PC);
    SA1.S9xOpcodes = S9xSA1OpcodesM1X1;

    S9xSA1UnpackStatus();
    S9xSA1FixCycles ();
    SA1.Executing = TRUE;
    SA1.BWRAM = Memory.SRAM;
    Memory.FillRAM [0x2225] = 0;
}

void S9xSA1SetBWRAMMemMap (uint8 val)
{
    int c;

    if (val & 0x80)
    {
	for (c = 0; c < 0x400; c += 16)
	{
	    SA1_Map [c + 6] = SA1_Map [c + 0x806] = (uint8 *) CMemory::MAP_BWRAM_BITMAP2;
	    SA1_Map [c + 7] = SA1_Map [c + 0x807] = (uint8 *) CMemory::MAP_BWRAM_BITMAP2;
	    SA1_WriteMap [c + 6] = SA1_WriteMap [c + 0x806] = (uint8 *) CMemory::MAP_BWRAM_BITMAP2;
	    SA1_WriteMap [c + 7] = SA1_WriteMap [c + 0x807] = (uint8 *) CMemory::MAP_BWRAM_BITMAP2;
	}
	SA1.BWRAM = Memory.SRAM + (val & 0x7f) * 0x2000 / 4;
    }
    else
    {
	for (c = 0; c < 0x400; c += 16)
	{
	    SA1_Map [c + 6] = SA1_Map [c + 0x806] = (uint8 *) CMemory::MAP_BWRAM;
	    SA1_Map [c + 7] = SA1_Map [c + 0x807] = (uint8 *) CMemory::MAP_BWRAM;
	    SA1_WriteMap [c + 6] = SA1_WriteMap [c + 0x806] = (uint8 *) CMemory::MAP_BWRAM;
	    SA1_WriteMap [c + 7] = SA1_WriteMap [c + 0x807] = (uint8 *) CMemory::MAP_BWRAM;
	}
	SA1.BWRAM = Memory.SRAM + (val & 7) * 0x2000;
    }
}

void S9xFixSA1AfterSnapshotLoad ()
{
    SA1.ShiftedPB = (uint32) SA1Registers.PB << 16;
    SA1.ShiftedDB = (uint32) SA1Registers.DB << 16;

    S9xSA1SetPCBase (SA1.ShiftedPB + SA1Registers.PC);
    S9xSA1UnpackStatus ();
    S9xSA1FixCycles ();
    SA1.VirtualBitmapFormat = (Memory.FillRAM [0x223f] & 0x80) ? 2 : 4;
    Memory.BWRAM = Memory.SRAM + (Memory.FillRAM [0x2224] & 7) * 0x2000;
    S9xSA1SetBWRAMMemMap (Memory.FillRAM [0x2225]);

    SA1.Waiting = (Memory.FillRAM [0x2200] & 0x60) != 0;
    SA1.Executing = !SA1.Waiting;
}

// SA9xSA1GetByte --- begin
static uint8 S9xSA1GetByte_default (uint32 address) {
#ifdef DEBUGGER
//	printf ("R(B) %06x\n", address);
#endif
	return (0);
}
static uint8 S9xSA1GetByte_PPU (uint32 address) {
	return (S9xGetSA1 (address & 0xffff));
}
static uint8 S9xSA1GetByte_SA1RAM (uint32 address) {
	return (*(Memory.SRAM + (address & 0xffff)));
}
static uint8 S9xSA1GetByte_BWRAM (uint32 address) {
	return (*(SA1.BWRAM + ((address & 0x7fff) - 0x6000)));
}
static uint8 S9xSA1GetByte_BWRAM_BITMAP (uint32 address) {
	address -= 0x600000;
	if (SA1.VirtualBitmapFormat == 2)
	    return ((Memory.SRAM [(address >> 2) & 0xffff] >> ((address & 3) << 1)) & 3);
	else
	    return ((Memory.SRAM [(address >> 1) & 0xffff] >> ((address & 1) << 2)) & 15);
}
static uint8 S9xSA1GetByte_BWRAM_BITMAP2 (uint32 address) {
	address = (address & 0xffff) - 0x6000;
	if (SA1.VirtualBitmapFormat == 2)
	    return ((SA1.BWRAM [(address >> 2) & 0xffff] >> ((address & 3) << 1)) & 3);
	else
	    return ((SA1.BWRAM [(address >> 1) & 0xffff] >> ((address & 1) << 2)) & 15);
}

// GetByte JumpTable for Memmory map modes
uint8 (*S9xSA1GetByte_JumpTable[(1 << (16 - 12))]) (uint32 address) = {
	S9xSA1GetByte_PPU, // MAP_PPU 
	S9xSA1GetByte_default, // MAP_CPU
	S9xSA1GetByte_default, // MAP_DSP
	S9xSA1GetByte_SA1RAM, // MAP_LOROM_SRAM
	S9xSA1GetByte_default, // MAP_HIROM_SRAM
	S9xSA1GetByte_default, // MAP_NONE
	S9xSA1GetByte_default, // MAP_DEBUG
	S9xSA1GetByte_default, // MAP_C4
	S9xSA1GetByte_BWRAM, // MAP_BWRAM
	S9xSA1GetByte_BWRAM_BITMAP, // MAP_BWRAM_BITMAP
	S9xSA1GetByte_BWRAM_BITMAP2, // MAP_BWRAM_BITMAP2
	S9xSA1GetByte_SA1RAM, // MAP_SA1RAM
	S9xSA1GetByte_default, // MAP_LAST
	S9xSA1GetByte_default, // MAP_LAST+1
	S9xSA1GetByte_default, // MAP_LAST+2
	S9xSA1GetByte_default  // MAP_LAST+3
};  

uint8 S9xSA1GetByte (uint32 address)
{
    uint8 *GetAddress = SA1_Map [(address >> MEMMAP_SHIFT) & MEMMAP_MASK];
    if (GetAddress >= (uint8 *) CMemory::MAP_LAST) return (*(GetAddress + (address & 0xffff)));
    return S9xSA1GetByte_JumpTable[(int) GetAddress](address);
//	return (SA1_Map [(address >> MEMMAP_SHIFT) & MEMMAP_MASK] >= (uint8 *)CMemory::MAP_LAST) ? 
//		(*((uint8 *)(SA1_Map [(address >> MEMMAP_SHIFT) & MEMMAP_MASK]) + (address & 0xffff))) : 
//		S9xSA1GetByte_JumpTable[(int) SA1_Map [(address >> MEMMAP_SHIFT) & MEMMAP_MASK]](address); 
}

/*
uint16 S9xSA1GetWord (uint32 address)
{
    uint8 *GetAddress = SA1_Map [(address >> MEMMAP_SHIFT) & MEMMAP_MASK];
    if (GetAddress >= (uint8 *) CMemory::MAP_LAST)
	return (*(GetAddress + (address & 0xffff))) | ((*(GetAddress + ((address+1) & 0xffff))) << 8);
    return (S9xSA1GetByte_JumpTable[(int) GetAddress](address)) | ((S9xSA1GetByte_JumpTable[(int) GetAddress](address+1)) << 8);
}
*/
// SA9xSA1SetByte --- begin
static void S9xSA1SetByte_default (uint8 byte, uint32 address) {
}
static void S9xSA1SetByte_PPU (uint8 byte, uint32 address) {
	S9xSetSA1 (byte, address & 0xffff);
}
static void S9xSA1SetByte_SA1RAM (uint8 byte, uint32 address) {
	*(Memory.SRAM + (address & 0xffff)) = byte;
}
static void S9xSA1SetByte_BWRAM (uint8 byte, uint32 address) {
	*(SA1.BWRAM + ((address & 0x7fff) - 0x6000)) = byte;
}
static void S9xSA1SetByte_BWRAM_BITMAP (uint8 byte, uint32 address) {
	uint8 *ptr;	
	address -= 0x600000;
	if (SA1.VirtualBitmapFormat == 2) {
	    ptr = &Memory.SRAM [(address >> 2) & 0xffff];
	    *ptr &= ~(3 << ((address & 3) << 1));
	    *ptr |= (byte & 3) << ((address & 3) << 1);
	} else {
	    ptr = &Memory.SRAM [(address >> 1) & 0xffff];
	    *ptr &= ~(15 << ((address & 1) << 2));
	    *ptr |= (byte & 15) << ((address & 1) << 2);
	}
	address -= 0x600000;
}
static void S9xSA1SetByte_BWRAM_BITMAP2 (uint8 byte, uint32 address) {
	uint8 *ptr;	
	address = (address & 0xffff) - 0x6000;
	if (SA1.VirtualBitmapFormat == 2)
	{
	    ptr = &SA1.BWRAM [(address >> 2) & 0xffff];
	    *ptr &= ~(3 << ((address & 3) << 1));
	    *ptr |= (byte & 3) << ((address & 3) << 1);
	}
	else
	{
	    ptr = &SA1.BWRAM [(address >> 1) & 0xffff];
	    *ptr &= ~(15 << ((address & 1) << 2));
	    *ptr |= (byte & 15) << ((address & 1) << 2);
	}
}

// SetByte JumpTable for Memmory map modes
void (*S9xSA1SetByte_JumpTable[(1 << (16 - 12))]) (uint8 byte, uint32 address) = {
	S9xSA1SetByte_PPU, // MAP_PPU 
	S9xSA1SetByte_default, // MAP_CPU
	S9xSA1SetByte_default, // MAP_DSP
	S9xSA1SetByte_SA1RAM, // MAP_LOROM_SRAM
	S9xSA1SetByte_default, // MAP_HIROM_SRAM
	S9xSA1SetByte_default, // MAP_NONE
	S9xSA1SetByte_default, // MAP_DEBUG
	S9xSA1SetByte_default, // MAP_C4
	S9xSA1SetByte_BWRAM, // MAP_BWRAM
	S9xSA1SetByte_BWRAM_BITMAP, // MAP_BWRAM_BITMAP
	S9xSA1SetByte_BWRAM_BITMAP2, // MAP_BWRAM_BITMAP2
	S9xSA1SetByte_SA1RAM, // MAP_SA1RAM
	S9xSA1SetByte_default, // MAP_LAST
	S9xSA1SetByte_default, // MAP_LAST+1
	S9xSA1SetByte_default, // MAP_LAST+2
	S9xSA1SetByte_default  // MAP_LAST+3
};  

void S9xSA1SetByte (uint8 byte, uint32 address)
{
	// MEMMAP_SHIFT 12
	// MEMMAP_MASK 0xFFF

    uint8 *Setaddress = SA1_WriteMap [(address >> MEMMAP_SHIFT) & MEMMAP_MASK];
    if (Setaddress >= (uint8 *) CMemory::MAP_LAST)
    {
	*(Setaddress + (address & 0xffff)) = byte;
	return;
    }
    S9xSA1SetByte_JumpTable[(int)Setaddress](byte, address);
}

void S9xSA1SetPCBase (uint32 address)
{
    uint8 *GetAddress = SA1_Map [(address >> MEMMAP_SHIFT) & MEMMAP_MASK];
    if (GetAddress >= (uint8 *) CMemory::MAP_LAST)
    {
	SA1.PCBase = GetAddress;
	SA1.PC = GetAddress + (address & 0xffff);
	return;
    }

    switch ((int) GetAddress)
    {
    case CMemory::MAP_PPU:
	SA1.PCBase = Memory.FillRAM - 0x2000;
	SA1.PC = SA1.PCBase + (address & 0xffff);
	return;
	
    case CMemory::MAP_CPU:
	SA1.PCBase = Memory.FillRAM - 0x4000;
	SA1.PC = SA1.PCBase + (address & 0xffff);
	return;
	
    case CMemory::MAP_DSP:
	SA1.PCBase = Memory.FillRAM - 0x6000;
	SA1.PC = SA1.PCBase + (address & 0xffff);
	return;
	
    case CMemory::MAP_SA1RAM:
    case CMemory::MAP_LOROM_SRAM:
	SA1.PCBase = Memory.SRAM;
	SA1.PC = SA1.PCBase + (address & 0xffff);
	return;

    case CMemory::MAP_BWRAM:
	SA1.PCBase = SA1.BWRAM - 0x6000;
	SA1.PC = SA1.PCBase + (address & 0xffff);
	return;
    case CMemory::MAP_HIROM_SRAM:
	SA1.PCBase = Memory.SRAM - 0x6000;
	SA1.PC = SA1.PCBase + (address & 0xffff);
	return;

    case CMemory::MAP_DEBUG:
#ifdef DEBUGGER
	printf ("SBP %06x\n", address);
#endif
	
    default:
    case CMemory::MAP_NONE:
	SA1.PCBase = Memory.RAM;
	SA1.PC = Memory.RAM + (address & 0xffff);
	return;
    }
}

void S9xSA1ExecuteDuringSleep ()
{
}

void S9xSetSA1MemMap (uint32 which1, uint8 map)
{
    int c;
    int start = which1 * 0x100 + 0xc00;
    int start2 = which1 * 0x200;
	uint8 *block;
	int i;

    if (which1 >= 2)
	start2 += 0x400;

    for (c = 0; c < 0x100; c += 16)
    {
	block = &Memory.ROM [(map & 7) * 0x100000 + (c << 12)];
	for (i = c; i < c + 16; i++)
	    Memory.Map [start + i] = SA1_Map [start + i] = block;
    }
    
    for (c = 0; c < 0x200; c += 16)
    {
	block = &Memory.ROM [(map & 7) * 0x100000 + (c << 11) - 0x8000];
	for (i = c + 8; i < c + 16; i++)
	    Memory.Map [start2 + i] = SA1_Map [start2 + i] = block;
    }
}

uint8 S9xGetSA1 (uint32 address)
{
    if ((address < 0x2300) && (address > 0x230d)) return (Memory.FillRAM [address]);
    switch (address)
    {
    case 0x2300:
		return ((uint8) ((Memory.FillRAM [0x2209] & 0x5f) | 
		 (CPU.IRQActive & (SA1_IRQ_SOURCE | SA1_DMA_IRQ_SOURCE))));
    case 0x2301:
		return ((Memory.FillRAM [0x2200] & 0xf) |
		(Memory.FillRAM [0x2301] & 0xf0));
    case 0x2306:
		return ((uint8)  SA1.sum);
    case 0x2307:
		return ((uint8) (SA1.sum >>  8));
    case 0x2308:
		return ((uint8) (SA1.sum >> 16));
    case 0x2309:
		return ((uint8) (SA1.sum >> 24));
    case 0x230a:
		return ((uint8) (SA1.sum >> 32));
    case 0x230b:
		return (Memory.FillRAM [address]);
    case 0x230c:
		return (Memory.FillRAM [0x230c]);
    case 0x230d:
    {
			uint8 byte = Memory.FillRAM [0x230d];
		
			if (Memory.FillRAM [0x2258] & 0x80)
			{
			    S9xSA1ReadVariableLengthData (TRUE, FALSE);
			}
			return (byte);
    }
    }
    
}

void S9xSetSA1 (uint8 byte, uint32 address)
{
  
    if (address < 0x2200 || address > 0x22ff) return;

    switch (address)
    {
    case 0x2200:
		SA1.Waiting = (byte & 0x60) != 0;
	
		if (!(byte & 0x20) && (Memory.FillRAM [0x2200] & 0x20))
		{
		    S9xSA1Reset ();
		}
		if (byte & 0x80)
		{
		    Memory.FillRAM [0x2301] |= 0x80;
		    if (Memory.FillRAM [0x220a] & 0x80)
		    {
					SA1.Flags |= IRQ_PENDING_FLAG;
					SA1.IRQActive |= SNES_IRQ_SOURCE;
					SA1.Executing = !SA1.Waiting && SA1.S9xOpcodes;
		    }
		}
		if (byte & 0x10)
		{
		    Memory.FillRAM [0x2301] |= 0x10;
		}
		break;

    case 0x2201:
		if (((byte ^ Memory.FillRAM [0x2201]) & 0x80) &&
		    (Memory.FillRAM [0x2300] & byte & 0x80))
		{
		    S9xSetIRQ (SA1_IRQ_SOURCE);
		}
		if (((byte ^ Memory.FillRAM [0x2201]) & 0x20) &&
		    (Memory.FillRAM [0x2300] & byte & 0x20))
		{
		    S9xSetIRQ (SA1_DMA_IRQ_SOURCE);
		}
		break;
    case 0x2202:
		if (byte & 0x80)
		{
		    Memory.FillRAM [0x2300] &= ~0x80;
		    S9xClearIRQ (SA1_IRQ_SOURCE);
		}
		if (byte & 0x20)
		{
		    Memory.FillRAM [0x2300] &= ~0x20;
		    S9xClearIRQ (SA1_DMA_IRQ_SOURCE);
		}
		break;

    case 0x2209:
		Memory.FillRAM [0x2209] = byte;
		if (byte & 0x80)
		    Memory.FillRAM [0x2300] |= 0x80;
	
		if (byte & Memory.FillRAM [0x2201] & 0x80)
		{
		    S9xSetIRQ (SA1_IRQ_SOURCE);
		}
		return;
    case 0x220a:
		if (((byte ^ Memory.FillRAM [0x220a]) & 0x80) &&
		    (Memory.FillRAM [0x2301] & byte & 0x80))
		{
		    SA1.Flags |= IRQ_PENDING_FLAG;
		    SA1.IRQActive |= SNES_IRQ_SOURCE;
		}
		if (((byte ^ Memory.FillRAM [0x220a]) & 0x40) &&
		    (Memory.FillRAM [0x2301] & byte & 0x40))
		{
		    SA1.Flags |= IRQ_PENDING_FLAG;
		    SA1.IRQActive |= TIMER_IRQ_SOURCE;
		}
		if (((byte ^ Memory.FillRAM [0x220a]) & 0x20) &&
		    (Memory.FillRAM [0x2301] & byte & 0x20))
		{
		    SA1.Flags |= IRQ_PENDING_FLAG;
		    SA1.IRQActive |= DMA_IRQ_SOURCE;
		}
		if (((byte ^ Memory.FillRAM [0x220a]) & 0x10) &&
		    (Memory.FillRAM [0x2301] & byte & 0x10))
		{
		}
		break;
    case 0x220b:
		if (byte & 0x80)
		{
		    SA1.IRQActive &= ~SNES_IRQ_SOURCE;
		    Memory.FillRAM [0x2301] &= ~0x80;
		}
		if (byte & 0x40)
		{
		    SA1.IRQActive &= ~TIMER_IRQ_SOURCE;
		    Memory.FillRAM [0x2301] &= ~0x40;
		}
		if (byte & 0x20)
		{
		    SA1.IRQActive &= ~DMA_IRQ_SOURCE;
		    Memory.FillRAM [0x2301] &= ~0x20;
		}
		if (byte & 0x10)
		{
		    // Clear NMI
		    Memory.FillRAM [0x2301] &= ~0x10;
		}
		if (!SA1.IRQActive)
		    SA1.Flags &= ~IRQ_PENDING_FLAG;
		break;
    case 0x2220:
    case 0x2221:
    case 0x2222:
    case 0x2223:
		S9xSetSA1MemMap (address - 0x2220, byte);
		break;
    case 0x2224:
		Memory.BWRAM = Memory.SRAM + (byte & 7) * 0x2000;
		break;
    case 0x2225:
		if (byte != Memory.FillRAM [address])
		    S9xSA1SetBWRAMMemMap (byte);
		break;
    case 0x2231:
		if (byte & 0x80)
		    SA1.in_char_dma = FALSE;
		break;
    case 0x2236:
		Memory.FillRAM [address] = byte;
		if ((Memory.FillRAM [0x2230] & 0xa4) == 0x80)
		{
		    // Normal DMA to I-RAM
		    S9xSA1DMA ();
		}
		else
		if ((Memory.FillRAM [0x2230] & 0xb0) == 0xb0)
		{
		    Memory.FillRAM [0x2300] |= 0x20;
		    if (Memory.FillRAM [0x2201] & 0x20)
				S9xSetIRQ (SA1_DMA_IRQ_SOURCE);
		    SA1.in_char_dma = TRUE;
		}
		return;
    case 0x2237:
		Memory.FillRAM [address] = byte;
		if ((Memory.FillRAM [0x2230] & 0xa4) == 0x84)
		{
		    // Normal DMA to BW-RAM
		    S9xSA1DMA ();
		}
		return;
    case 0x223f:
		SA1.VirtualBitmapFormat = (byte & 0x80) ? 2 : 4;
		break;

    case 0x224f:
		Memory.FillRAM [address] = byte;
		if ((Memory.FillRAM [0x2230] & 0xb0) == 0xa0)
		{
		    // Char conversion 2 DMA enabled
		    memmove (&Memory.ROM [CMemory::MAX_ROM_SIZE - 0x10000] + (SA1.in_char_dma << 4),
			     &Memory.FillRAM [0x2240], 16);
		    SA1.in_char_dma = (SA1.in_char_dma + 1) & 7;
		    if ((SA1.in_char_dma & 3) == 0)
		    {
					S9xSA1CharConv2 ();
		    }
		}
		return;
    case 0x2250:
		if (byte & 2)
		  SA1.sum = 0;
			SA1.arithmetic_op = byte & 3;
		break;
    
    case 0x2251:
		SA1.op1 = (SA1.op1 & 0xff00) | byte;
		break;
    case 0x2252:
		SA1.op1 = (SA1.op1 & 0xff) | (byte << 8);
		break;
    case 0x2253:
		SA1.op2 = (SA1.op2 & 0xff00) | byte;
		break;
    case 0x2254:
		SA1.op2 = (SA1.op2 & 0xff) | (byte << 8);
		switch (SA1.arithmetic_op)
		{
    		case 0:	// multiply
		    SA1.sum = SA1.op1 * SA1.op2;
		    break;
				case 1: // divide
		    if (SA1.op2 == 0)
				SA1.sum = SA1.op1 << 16;
		    else
		    {
					unsigned int x = (SA1.op1 / (int) ((uint16) SA1.op2));
					SA1.sum = x | ((SA1.op1 - (x * (uint16) SA1.op2)) << 16);
				//	SA1.sum = (SA1.op1 / (int) ((uint16) SA1.op2)) |
				  //((SA1.op1 % (int) ((uint16) SA1.op2)) << 16);
		    }
		    break;
				default: // cumulative sum
		    SA1.sum += SA1.op1 * SA1.op2;
		    if (SA1.sum & ((int64) 0xffffff << 32))
					SA1.overflow = TRUE;
		    break;
		}
		break;
    case 0x2258:    // Variable bit-field length/auto inc/start.
		Memory.FillRAM [0x2258] = byte;
		S9xSA1ReadVariableLengthData (TRUE, FALSE);
		return;
    case 0x2259:
    case 0x225a:
    case 0x225b:    // Variable bit-field start address
		Memory.FillRAM [address] = byte;
		// XXX: ???
		SA1.variable_bit_pos = 0;
		S9xSA1ReadVariableLengthData (FALSE, TRUE);
		return;
    }
  	if (address >= 0x2200 && address <= 0x22ff)
			Memory.FillRAM [address] = byte;
}

static void S9xSA1CharConv2 ()
{
    uint32 dest = Memory.FillRAM [0x2235] | (Memory.FillRAM [0x2236] << 8);
    uint32 offset = (SA1.in_char_dma & 7) ? 0 : 1;
    int depth = (Memory.FillRAM [0x2231] & 3) == 0 ? 8 :
		(Memory.FillRAM [0x2231] & 3) == 1 ? 4 : 2;
    int bytes_per_char = 8 * depth;
    uint8 *p = &Memory.FillRAM [0x3000] + dest + offset * bytes_per_char;
    uint8 *q = &Memory.ROM [CMemory::MAX_ROM_SIZE - 0x10000] + offset * 64;

    if (depth == 8)
    {
	 		for (int l = 0; l < 8; l++, q += 8)
			{
		    for (int b = 0; b < 8; b++)
		    {
					uint8 r = *(q + b);
					*(p +  0) = (*(p +  0) << 1) | ((r >> 0) & 1);
					*(p +  1) = (*(p +  1) << 1) | ((r >> 1) & 1);
					*(p + 16) = (*(p + 16) << 1) | ((r >> 2) & 1);
					*(p + 17) = (*(p + 17) << 1) | ((r >> 3) & 1);
					*(p + 32) = (*(p + 32) << 1) | ((r >> 4) & 1);
					*(p + 33) = (*(p + 33) << 1) | ((r >> 5) & 1);
					*(p + 48) = (*(p + 48) << 1) | ((r >> 6) & 1);
					*(p + 49) = (*(p + 49) << 1) | ((r >> 7) & 1);
		    }
		    p += 2;
			}
	   }
}

static void S9xSA1DMA ()
{
    uint32 src =  Memory.FillRAM [0x2232] |
	         (Memory.FillRAM [0x2233] << 8) |
		 (Memory.FillRAM [0x2234] << 16);
    uint32 dst =  Memory.FillRAM [0x2235] |
	         (Memory.FillRAM [0x2236] << 8) |
		 (Memory.FillRAM [0x2237] << 16);
    uint32 len =  Memory.FillRAM [0x2238] |
		 (Memory.FillRAM [0x2239] << 8);

    uint8 *s;
    uint8 *d;

    switch (Memory.FillRAM [0x2230] & 3)
    {
    case 0: // ROM
	s = SA1_Map [(src >> MEMMAP_SHIFT) & MEMMAP_MASK];
	if (s >= (uint8 *) CMemory::MAP_LAST)
	    s += (src & 0xffff);
	else
	    s = Memory.ROM + (src & 0xffff);
	break;
    case 1: // BW-RAM
	src &= CPU.Memory_SRAMMask;
	len &= CPU.Memory_SRAMMask;
	s = Memory.SRAM + src;
	break;
    default:
    case 2:
	src &= 0x3ff;
	len &= 0x3ff;
	s = &Memory.FillRAM [0x3000] + src;
	break;
    }

    if (Memory.FillRAM [0x2230] & 4)
    {
	dst &= CPU.Memory_SRAMMask;
	len &= CPU.Memory_SRAMMask;
	d = Memory.SRAM + dst;
    }
    else
    {
	dst &= 0x3ff;
	len &= 0x3ff;
	d = &Memory.FillRAM [0x3000] + dst;
    }
    memmove (d, s, len);
    Memory.FillRAM [0x2301] |= 0x20;
    
    if (Memory.FillRAM [0x220a] & 0x20)
    {
			SA1.Flags |= IRQ_PENDING_FLAG;
			SA1.IRQActive |= DMA_IRQ_SOURCE;
    }
}

void S9xSA1ReadVariableLengthData (bool8 inc, bool8 no_shift)
{
    uint32 addr =  Memory.FillRAM [0x2259] |
		  (Memory.FillRAM [0x225a] << 8) |
		  (Memory.FillRAM [0x225b] << 16);
    uint8 shift = Memory.FillRAM [0x2258] & 15;

    if (no_shift)
			shift = 0;
    else
    if (shift == 0)
			shift = 16;

    uint8 s = shift + SA1.variable_bit_pos;

    if (s >= 16)
    {
			addr += (s >> 4) << 1;
			s &= 15;
    }
    uint32 data = S9xSA1GetWord (addr) |
		  (S9xSA1GetWord (addr + 2) << 16);

    data >>= s;
    Memory.FillRAM [0x230c] = (uint8) data;
    Memory.FillRAM [0x230d] = (uint8) (data >> 8);
    if (inc)
    {
			SA1.variable_bit_pos = (SA1.variable_bit_pos + shift) & 15;
			Memory.FillRAM [0x2259] = (uint8) addr;
			Memory.FillRAM [0x225a] = (uint8) (addr >> 8);
			Memory.FillRAM [0x225b] = (uint8) (addr >> 16);
    }
}

#endif // USE_SA1
