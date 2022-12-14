	.DATA
	.align	4
	.include	"os9x_65c816_common.s"

.globl asmS9xGetByte
.globl asmS9xGetWord
.globl asmS9xSetByte
.globl asmS9xSetWord
.globl asmS9xSetPCBase
@ input: r0 : address
@ return: rpc, regpcbase
@ uint8 asmS9xSetPCBase(uint32 address);
asmS9xSetPCBase:
	@ MEMMAP_SHIFT is 12, Address is 0xFFFFFFFF at max, so
	@ R1 is maxed by 0x000FFFFF, MEMMAP_MASK is 0x1000-1=0xFFF
	@ so AND MEMMAP_MASK is BIC 0xFF000
	mov	r1, r0, lsr #MEMMAP_SHIFT


	@ regpcbase = Map[block] (GetAddress)
	ldr	r2, [reg_cpu_var, #Map_ofs]
	bic	r1, r1, #0xff000			

	ldr	regpcbase, [r2, r1, lsl #2]
	bic	r0, r0, #0xff0000			@ r0 = address & 0xffff

	@ Special case ?
	cmp	regpcbase, #MAP_LAST
	ldrlo	r3, =SPCBJumpTable
	ldrlo	pc, [r3, regpcbase, lsl #2]

	@ Direct memory
	@ CPU.MemSpeed = MemorySpeed[block]
	@ Note: MemorySpeed[block] = MemorySpeed[block] << MS_SHIFT | BlockIsRAM[block]
	ldr	r2, [reg_cpu_var, #MemorySpeed_ofs]
	bic	rstatus, rstatus, #MEMSPEED_MASK
	ldr	r1, [r2, r1, lsl #2]
	add	rpc, regpcbase, r0
	mov	r1, r1, lsr #MS_SHIFT
	str	r1, [reg_cpu_var, #MemSpeed_ofs]
	orr	rstatus, rstatus, r1, lsl #MEMSPEED_SHIFT	@ Saving into rstatus for faster access	

	bx	r3
	
SPCBJumpTable:
	.long	SPCB_PPU
	.long	SPCB_CPU
	.long	SPCB_DSP
	.long	SPCB_LOROM_SRAM
	.long	SPCB_HIROM_SRAM
	.long	SPCB_LOROM_SRAM
	.long	SPCB_LOROM_SRAM
	.long	SPCB_C4
	.long	SPCB_BWRAM
	.long	SPCB_LOROM_SRAM
	.long	SPCB_LOROM_SRAM
	.long	SPCB_LOROM_SRAM
/*
	MAP_PPU 	0
	MAP_CPU 	1
	MAP_DSP 	2
	MAP_LOROM_SRAM	3
	MAP_HIROM_SRAM	4
	MAP_NONE	5
	MAP_DEBUG	6	
	MAP_C4		7
	MAP_BWRAM	8
	MAP_BWRAM_BITMAP	9
	MAP_BWRAM_BITMAP2	10
	MAP_SA1RAM	11
	MAP_LAST	12
*/

vMemory:
	.word	Memory

SPCB_PPU:
	@CPU.PCBase = Memory.FillRAM - 0x2000;
	@CPU.PC = CPU.PCBase + (Address & 0xffff);

	ldr	r1, vMemory
	ldr	regpcbase, [r1, #_fillram]
	
	sub	regpcbase, regpcbase, #0x2000
	add	rpc, regpcbase, r0

	mov	r0, #ONE_CYCLE
	bic	rstatus, rstatus, #MEMSPEED_MASK
	str	r0, [reg_cpu_var, #MemSpeed_ofs]
	orr	rstatus, rstatus, r0, lsl #MEMSPEED_SHIFT				

	@return;
	bx 	r3
	@-------------------

SPCB_CPU:
	@CPU.PCBase = Memory.FillRAM - 0x4000;
	@CPU.PC = CPU.PCBase + (Address & 0xffff);

	ldr	r1, vMemory
	ldr	regpcbase, [r1, #_fillram]
	
	sub	regpcbase, regpcbase, #0x4000
	add	rpc, regpcbase, r0
		
	mov	r0, #ONE_CYCLE
	bic	rstatus, rstatus, #MEMSPEED_MASK
	str	r0, [reg_cpu_var, #MemSpeed_ofs]
	orr	rstatus, rstatus, r0, lsl #MEMSPEED_SHIFT				

	@return;
	bx 	r3
	@-------------------

SPCB_DSP:
	@CPU.PCBase = Memory.FillRAM - 0x6000;
	@CPU.PC = CPU.PCBase + (Address & 0xffff);

	ldr	r1, vMemory
	ldr	regpcbase, [r1, #_fillram]
	
	sub	regpcbase, regpcbase, #0x6000
	add	rpc, regpcbase, r0

	mov	r0, #SLOW_ONE_CYCLE
	bic	rstatus, rstatus, #MEMSPEED_MASK
	str	r0, [reg_cpu_var, #MemSpeed_ofs]		
	orr	rstatus, rstatus, r0, lsl #MEMSPEED_SHIFT				
		
	@return;
	bx 	r3
	@-------------------

SPCB_LOROM_SRAM:
	@CPU.PCBase = Memory.SRAM;
	@CPU.PC = CPU.PCBase + (Address & 0xffff);

	ldr	r1, vMemory
	ldr	regpcbase, [r1, #_sram]

	add	rpc, regpcbase, r0
	
	mov	r0, #SLOW_ONE_CYCLE
	bic	rstatus, rstatus, #MEMSPEED_MASK
	str	r0, [reg_cpu_var, #MemSpeed_ofs]		
	orr	rstatus, rstatus, r0, lsl #MEMSPEED_SHIFT				

	@return;
	bx 	r3
	@-------------------

SPCB_HIROM_SRAM:
	@CPU.PCBase = Memory.SRAM - 0x6000;
	@CPU.PC = CPU.PCBase + (Address & 0xffff);

	ldr	r1, vMemory
	ldr	regpcbase, [r1, #_sram]
	
	sub	regpcbase, regpcbase, #0x6000
	add	rpc, regpcbase, r0

	mov	r0, #SLOW_ONE_CYCLE
	bic	rstatus, rstatus, #MEMSPEED_MASK
	str	r0, [reg_cpu_var, #MemSpeed_ofs]		
	orr	rstatus, rstatus, r0, lsl #MEMSPEED_SHIFT				

	@return;
	bx 	r3
	@-------------------

SPCB_C4:
	@CPU.PCBase = Memory.C4RAM - 0x6000;
	@CPU.PC = CPU.PCBase + (Address & 0xffff);
	ldr	r1, vMemory
	ldr	regpcbase, [r1, #_c4ram]
	
	sub	regpcbase, regpcbase, #0x6000
	add	rpc, regpcbase, r0

	mov	r0, #SLOW_ONE_CYCLE
	bic	rstatus, rstatus, #MEMSPEED_MASK
	str	r0, [reg_cpu_var, #MemSpeed_ofs]		
	orr	rstatus, rstatus, r0, lsl #MEMSPEED_SHIFT				

	@return;
	bx 	r3
	@-------------------

SPCB_BWRAM:	
	@CPU.PCBase = Memory.BWRAM - 0x6000;
	@CPU.PC = CPU.PCBase + (Address & 0xffff);
	ldr	r1, vMemory
	ldr	regpcbase, [r1, #_bwram]
	
	sub	regpcbase, regpcbase, #0x6000
	add	rpc, regpcbase, r0

	mov	r0, #SLOW_ONE_CYCLE
	bic	rstatus, rstatus, #MEMSPEED_MASK
	str	r0, [reg_cpu_var, #MemSpeed_ofs]		
	orr	rstatus, rstatus, r0, lsl #MEMSPEED_SHIFT				

	@return;
	bx 	r3
	@-------------------


@ uint8 aaS9xGetByte(uint32 address);
asmS9xGetByte:
	@  in : R0  = 0x00hhmmll
	@  out : R0 = 0x000000ll
	@  DESTROYED : R1,R2,R3
	@  UPDATE : reg_cycles
	@ r1 = block	
	@ MEMMAP_SHIFT is 12, Address is 0xFFFFFFFF at max, so
	@ r1 is maxed by 0x000FFFFF, MEMMAP_MASK is 0x1000-1=0xFFF
	@ so AND MEMMAP_MASK is BIC 0xFF000

	@ r2 = Map[block] (GetAddress)
	ldr		r2, [reg_cpu_var, #Map_ofs]
	mov		r1, r0, LSR #MEMMAP_SHIFT
	ldr		r2, [r2, r1, lsl #2]
	
	@ Special case ?	
	cmp		r2, #MAP_LAST
	ldrlo		r3, =GBJumpTable
	ldrlo		pc, [r3, r2, lsl #2]

	@  Direct ROM/RAM acess
	@ r2 = GetAddress + Address & 0xFFFF	
	@ r3 = MemorySpeed[block]; 
	@ Note: MemorySpeed[block] = MemorySpeed[block] << MS_SHIFT | BlockIsRAM[block]
	ldr		r3, [reg_cpu_var, #MemorySpeed_ofs]
	bic		r0, r0, #0xff0000			@ r0 = adress & 0xffff
	ldr		r3, [r3, r1, lsl #2]
	ldrb		r0, [r2, r0]				@ r0 = RAM[adress & 0xffff]				
	add		reg_cycles, reg_cycles, r3, lsr #MS_SHIFT	
	@ if (BlockIsRAM[block]) set shutdown	
	tst		r3, #1
	ldmeqfd		r13!, {pc} 				@ return
	ldr		r1, [reg_cpu_var, #PCAtOpcodeStart_ofs]
	orr		rstatus, rstatus, #MASK_SHUTDOWN
	str		r1, [reg_cpu_var, #WaitAddress_ofs]

	ldmfd		r13!, {pc} 				@ return

GBJumpTable:	
	.long GBPPU
	.long GBCPU
	.long GBDSP
	.long GBLSRAM
	.long GBHSRAM
	.long GBNONE
	.long GBDEBUG
	.long GBC4
	.long GBBWRAM
	.long GBNONE
	.long GBNONE
	.long GBNONE
	/*.long GB7ROM
	.long GB7RAM
	.long GB7SRM*/
GBPPU:
	@ InDMA ?
	ldrb		r1, [reg_cpu_var, #InDMA_ofs]
	bic		r0, r0, #0xff0000		
	movs		r1, r1	
	addeq		reg_cycles, reg_cycles, #ONE_CYCLE	@ No -> update Cycles
	STR		reg_cycles, [reg_cpu_var, #Cycles_ofs]	@ Save Cycles
	
	str		rstatus, [reg_cpu_var, #rstatus_ofs]
		PREPARE_C_CALL
	bl		S9xGetPPU
		RESTORE_C_CALL
	ldr		rstatus, [reg_cpu_var, #rstatus_ofs]

	ldr		reg_cycles, [reg_cpu_var, #Cycles_ofs] 	@ Load Cycles	
	ldmfd		r13!, {pc} 				@ Return
GBCPU:	
	add		reg_cycles, reg_cycles, #ONE_CYCLE	@ update Cycles	
	bic		r0, r0, #0xff0000			
	str		reg_cycles, [reg_cpu_var, #Cycles_ofs] 	@ Save Cycles
		PREPARE_C_CALL
	bl		S9xGetCPU
		RESTORE_C_CALL
	ldr		reg_cycles, [reg_cpu_var, #Cycles_ofs] 	@ Load Cycles	
	ldmfd		r13!, {pc} @ Return
	
GBDSP:
	add		reg_cycles, reg_cycles, #SLOW_ONE_CYCLE	@ update Cycles	
	bic		r0, r0, #0x0ff0000	
	str		reg_cycles, [reg_cpu_var, #Cycles_ofs] 	@ Save Cycles

	ldr		reg_cycles, [reg_cpu_var, #DSPGet_ofs]
		PREPARE_C_CALL
	blx		reg_cycles	
		RESTORE_C_CALL
	ldr		reg_cycles, [reg_cpu_var, #Cycles_ofs] 	@ Load Cycles	
	ldmfd		r13!, {pc} 				@ Return
GBLSRAM:
	ldr		r2, [reg_cpu_var, #SRAMMask]
	ldr		r1, [reg_cpu_var, #SRAM]	
	and		r0, r2, r0				@ Address&SRAMMask
	add		reg_cycles, reg_cycles, #SLOW_ONE_CYCLE	@ update Cycles		
	ldrb		r0, [r1, r0]				@ r0 = Memory.SRAM[Address & SRAMMask]
	ldmfd		r13!, {pc}
GB7SRM:	
GBHSRAM:
	add		reg_cycles, reg_cycles, #SLOW_ONE_CYCLE	@ update Cycles		
	
	MOV		R1,R0,LSL #17  
	AND		R2,R0,#0xF0000
	MOV		R1,R1,LSR #17	@ Address&0x7FFF	
	MOV		R2,R2,LSR #3 @ (Address&0xF0000 >> 3)
	ADD		R0,R2,R1
	LDR		R2,[reg_cpu_var,#SRAMMask]
	SUB		R0,R0,#0x6000 @ ((Address & 0x7fff) - 0x6000 + ((Address & 0xf0000) >> 3))
	LDR		R1,[reg_cpu_var,#SRAM]	
	AND		R0,R2,R0		@ Address&SRAMMask	
	LDRB		R0,[R1,R0]		@ *Memory.SRAM + Address&SRAMMask
	LDMFD		R13!,{PC}		@ return
GB7ROM:
GB7RAM:	
GBNONE:
	MOV		R0,R0,LSR #8
	ADD		reg_cycles,reg_cycles,#SLOW_ONE_CYCLE	@ update Cycles
	AND		R0,R0,#0xFF
	LDMFD		R13!,{PC}
GBC4:
	ADD		reg_cycles,reg_cycles,#SLOW_ONE_CYCLE	@ update Cycles	
	@MOV		R0,R0,LSL #16 @ S9xGetC4(Address&0xFFFF);	
	bic		r0, r0, #0xff0000			
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Save Cycles
		PREPARE_C_CALL
	BL		S9xGetC4
		RESTORE_C_CALL
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles		
	LDMFD		R13!,{PC} @ Return
GBDEBUG:	
GBBWRAM:
	MOV		R0,R0,LSL #17  
	ADD		reg_cycles,reg_cycles,#SLOW_ONE_CYCLE	@ update Cycles	
	MOV		R0,R0,LSR #17	@ Address&0x7FFF			
	LDR		R1,[reg_cpu_var,#BWRAM]	
	SUB		R0,R0,#0x6000   @ ((Address & 0x7fff) - 0x6000)	
	LDRB		R0,[R0,R1]		@ *Memory.BWRAM + ((Address & 0x7fff) - 0x6000)	
	LDMFD		R13!,{PC}


@ uint16 aaS9xGetWord(uint32 address);
asmS9xGetWord:
	@  in : R0  = 0x00hhmmll
	@  out : R0 = 0x000000ll
	@  DESTROYED : R1,R2,R3
	@  UPDATE : reg_cycles
	
	
	MOV		R1,R0,LSL #19	
	ADDS		R1,R1,#0x80000
	@ if = 0x1FFF => 0
	BNE		GW_NotBoundary

	STMFD		R13!,{R0}
		STMFD		R13!,{PC}	
	B		asmS9xGetByte
		MOV		R0,R0
	LDMFD		R13!,{R1}
	STMFD		R13!,{R0}
	ADD		R0,R1,#1
		STMFD		R13!,{PC}
	B		asmS9xGetByte
		MOV		R0,R0
	LDMFD		R13!,{R1}
	ORR		R0,R1,R0,LSL #8
	LDMFD		R13!,{PC}

	
GW_NotBoundary:	
	
	@ R1 <= block	
	@ MEMMAP_SHIFT is 12, Address is 0xFFFFFFFF at max, so
	@ R1 is maxed by 0x000FFFFF, MEMMAP_MASK is 0x1000-1=0xFFF
	@ so AND MEMMAP_MASK is BIC 0xFF000
	@ r2 = Map[block] (GetAddress)
	ldr		r2, [reg_cpu_var, #Map_ofs]
	mov		r1, r0, lsr #MEMMAP_SHIFT
	ldr		r2, [r2, r1, lsl #2]

	@ Special case ?
	cmp		r2, #MAP_LAST
	ldrlo		r3, =GWJumpTable
	ldrlo		pc, [r3, r2, lsl #2]

	@ Direct ROM/RAM acess	
	@  Direct ROM/RAM acess
	@ r2 = GetAddress + Address & 0xFFFF	
	@ r3 = MemorySpeed[block]; 
	@ Note: MemorySpeed[block] = MemorySpeed[block] << MS_SHIFT | BlockIsRAM[block]
	bic		r0, r0, #0xff0000		
	ldr		r3, [reg_cpu_var, #MemorySpeed_ofs]
	ldrb		r0, [r2, r0]!
	ldr		r3, [r3, r1, lsl #2]
	ldrb		r2, [r2, #1]	
	add		reg_cycles, reg_cycles, r3, lsr #(MS_SHIFT - 1)  				
	orr		r0, r0, r2, lsl #8

	@  if BlockIsRAM => update for CPUShutdown
	tst		r3, #1	
	ldmeqfd		r13!, {pc} 				@ return
	ldr		r1, [reg_cpu_var, #PCAtOpcodeStart_ofs]
	orr		rstatus, rstatus, #MASK_SHUTDOWN	
	str		r1, [reg_cpu_var, #WaitAddress_ofs]			
	ldmfd		r13!, {pc}  				@ Return

GWJumpTable:
	.long GWPPU
	.long GWCPU
	.long GWDSP
	.long GWLSRAM
	.long GWHSRAM
	.long GWNONE
	.long GWDEBUG
	.long GWC4
	.long GWBWRAM
	.long GWNONE
	.long GWNONE
	.long GWNONE
	/*.long GW7ROM
	.long GW7RAM
	.long GW7SRM*/
/*	MAP_PPU, MAP_CPU, MAP_DSP, MAP_LOROM_SRAM, MAP_HIROM_SRAM,
	MAP_NONE, MAP_DEBUG, MAP_C4, MAP_BWRAM, MAP_BWRAM_BITMAP,
	MAP_BWRAM_BITMAP2, MAP_SA1RAM, MAP_LAST*/


GWPPU:
	@ InDMA ?
	LDRB		R1,[reg_cpu_var,#InDMA_ofs]
	bic		r0, r0, #0xff0000			
	MOVS		R1,R1	
	ADDEQ		reg_cycles,reg_cycles,#(ONE_CYCLE*2)		@ No -> update Cycles
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs]	@ Save Cycles

	str		rstatus, [reg_cpu_var, #rstatus_ofs]
		PREPARE_C_CALL_R0
	BL		S9xGetPPU
	@LDMFD		R13!,{R1}
	@STMFD		R13!,{R0}
	ldr		r1, [r13]
	str		r0, [r13]

	ADD		R0,R1,#1
	BL		S9xGetPPU
		RESTORE_C_CALL_R1
	ldr		rstatus, [reg_cpu_var, #rstatus_ofs]

	ORR		R0,R1,R0,LSL #8
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
GWCPU:	
	ADD		reg_cycles,reg_cycles,#(ONE_CYCLE*2)	@ update Cycles	
	bic		r0, r0, #0xff0000			
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Save Cycles
		PREPARE_C_CALL_R0
	BL		S9xGetCPU
	@LDMFD		R13!,{R1}
	@STMFD		R13!,{R0}
	ldr		r1, [r13]
	str		r0, [r13]

	ADD		R0,R1,#1
	BL		S9xGetCPU			
		RESTORE_C_CALL_R1

	ORR		R0,R1,R0,LSL #8
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return

GWDSP:
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles	
	bic		r0, r0, #0x0ff0000		
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Save Cycles
	
	ldr		reg_cycles, [reg_cpu_var, #DSPGet_ofs]	
		PREPARE_C_CALL_R0
	blx		reg_cycles
	@LDMFD		R13!,{R1}
	@STMFD		R13!,{R0}
	ldr		r1, [r13]
	str		r0, [r13]

	ADD		R0,R1,#1
	blx		reg_cycles	
		RESTORE_C_CALL_R1
	ORR		R0,R1,R0,LSL #8
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
GWLSRAM:
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles		
	
	TST		R0,#1
	BNE		GW_Not_Aligned2
	LDR		R2,[reg_cpu_var,#SRAMMask]
	LDR		R1,[reg_cpu_var,#SRAM]
	AND		R3,R2,R0		@ Address&SRAMMask
	LDRH		R0,[R3,R1]		@ *Memory.SRAM + Address&SRAMMask		
	LDMFD		R13!,{PC}	@ return
GW_Not_Aligned2:	
	LDR		R2,[reg_cpu_var,#SRAMMask]
	LDR		R1,[reg_cpu_var,#SRAM]	
	AND		R3,R2,R0		@ Address&SRAMMask
	ADD		R0,R0,#1
	AND		R2,R0,R2		@ Address&SRAMMask
	LDRB		R3,[R1,R3]		@ *Memory.SRAM + Address&SRAMMask
	LDRB		R2,[R1,R2]		@ *Memory.SRAM + Address&SRAMMask
	ORR		R0,R3,R2,LSL #8
	LDMFD		R13!,{PC}	@ return
GW7SRM:	
GWHSRAM:
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles		
	
	TST		R0,#1
	BNE		GW_Not_Aligned3
	
	MOV		R1,R0,LSL #17  
	AND		R2,R0,#0xF0000
	MOV		R1,R1,LSR #17	@ Address&0x7FFF	
	MOV		R2,R2,LSR #3 @ (Address&0xF0000 >> 3)
	ADD		R0,R2,R1
	LDR		R2,[reg_cpu_var,#SRAMMask]
	SUB		R0,R0,#0x6000 @ ((Address & 0x7fff) - 0x6000 + ((Address & 0xf0000) >> 3))

	LDR		R1,[reg_cpu_var,#SRAM]	
	AND		R0,R2,R0		@ Address&SRAMMask	
	LDRH		R0,[R1,R0]		@ *Memory.SRAM + Address&SRAMMask
	LDMFD		R13!,{PC}		@ return
	
GW_Not_Aligned3:	
	MOV		R3,R0,LSL #17  
	AND		R2,R0,#0xF0000
	MOV		R3,R3,LSR #17	@ Address&0x7FFF	
	MOV		R2,R2,LSR #3 @ (Address&0xF0000 >> 3)	
	ADD		R2,R2,R3						
	ADD		R0,R0,#1	
	SUB		R2,R2,#0x6000 @ ((Address & 0x7fff) - 0x6000 + ((Address & 0xf0000) >> 3))
	MOV		R3,R0,LSL #17  
	AND		R0,R0,#0xF0000
	MOV		R3,R3,LSR #17	@ (Address+1)&0x7FFF	
	MOV		R0,R0,LSR #3 @ ((Address+1)&0xF0000 >> 3)	
	ADD		R0,R0,R3	
	LDR		R3,[reg_cpu_var,#SRAMMask]	@ reload mask	
	SUB		R0,R0,#0x6000 @ (((Address+1) & 0x7fff) - 0x6000 + (((Address+1) & 0xf0000) >> 3))		
	AND		R2,R3,R2		@ Address...&SRAMMask	
	AND		R0,R3,R0		@ (Address+1...)&SRAMMask	

	LDR		R3,[reg_cpu_var,#SRAM]
	LDRB		R0,[R0,R3]		@ *Memory.SRAM + (Address...)&SRAMMask	
	LDRB		R2,[R2,R3]		@ *Memory.SRAM + (Address+1...)&SRAMMask
	ORR		R0,R2,R0,LSL #8
			
	LDMFD		R13!,{PC}		@ return
GW7ROM:
GW7RAM:	
GWNONE:		
	MOV		R0,R0,LSL #16
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles
	MOV		R0,R0,LSR #24
	ORR		R0,R0,R0,LSL #8
	LDMFD		R13!,{PC}
GWDEBUG:
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles
	MOV		R0,#0
	LDMFD		R13!,{PC}
GWC4:
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles	
	bic		r0, r0, #0xff0000		
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Save Cycles
		PREPARE_C_CALL_R0
	BL		S9xGetC4
	@LDMFD		R13!,{R1}
	@STMFD		R13!,{R0}
	ldr		r1, [r13]
	str		r0, [r13]

	ADD		R0,R1,#1
	BL		S9xGetC4
		RESTORE_C_CALL_R1
	ORR		R0,R1,R0,LSL #8
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
GWBWRAM:
	TST		R0,#1
	BNE		GW_Not_Aligned4
	MOV		R0,R0,LSL #17  
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles
	MOV		R0,R0,LSR #17	@ Address&0x7FFF
	LDR		R1,[reg_cpu_var,#BWRAM]		
	SUB		R0,R0,#0x6000 @ ((Address & 0x7fff) - 0x6000)		
	LDRH		R0,[R1,R0]		@ *Memory.BWRAM + ((Address & 0x7fff) - 0x6000)	
	LDMFD		R13!,{PC}		@ return
GW_Not_Aligned4:
	MOV		R0,R0,LSL #17  	
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles
	ADD		R3,R0,#0x20000
	MOV		R0,R0,LSR #17	@ Address&0x7FFF
	MOV		R3,R3,LSR #17	@ (Address+1)&0x7FFF
	LDR		R1,[reg_cpu_var,#BWRAM]		
	SUB		R0,R0,#0x6000 @ ((Address & 0x7fff) - 0x6000)	
	SUB		R3,R3,#0x6000 @ (((Address+1) & 0x7fff) - 0x6000)	
	LDRB		R0,[R1,R0]		@ *Memory.BWRAM + ((Address & 0x7fff) - 0x6000)		
	LDRB		R3,[R1,R3]		@ *Memory.BWRAM + (((Address+1) & 0x7fff) - 0x6000)	
	ORR		R0,R0,R3,LSL #8
	LDMFD		R13!,{PC}		@ return




@ void aaS9xSetByte(uint32 address,uint8 val);
asmS9xSetByte:
	@  in : R0=0x00hhmmll  R1=0x000000ll	
	@  DESTROYED : R0,R1,R2,R3
	@  UPDATE : reg_cycles	
	@ cpu shutdown
	@ R3 <= block				
	@ MEMMAP_SHIFT is 12, Address is 0xFFFFFFFF at max, so
	@ R0 is maxed by 0x000FFFFF, MEMMAP_MASK is 0x1000-1=0xFFF
	@ so AND MEMMAP_MASK is BIC 0xFF000
	@ R2 <= Map[block] (SetAddress)
	LDR		R2,[reg_cpu_var,#WriteMap_ofs]
	MOV		R3,R0,LSR #MEMMAP_SHIFT
	LDR		R2,[R2,R3,LSL #2]
	bic		rstatus, rstatus, #MASK_SHUTDOWN
	CMP		R2,#MAP_LAST
	ldrlo		r3, =SBJumpTable
	ldrlo		pc, [r3, r2, lsl #2]

	@  Direct ROM/RAM acess
	
	@ R2 <= SetAddress + Address & 0xFFFF	
	@MOV		R0,R0,LSL #16
	bic		r0, r0, #0xff0000			
	@ADD		R2,R2,R0,LSR #16
	add		r2, r2, r0
	LDR		R0,[reg_cpu_var,#MemorySpeed_ofs]
	@ Set byte
	STRB		R1,[R2]		
	@ R0 <= MemorySpeed[block]
	LDR		R0,[R0,R3, lsl #2]	
	@ Update CPU.Cycles
	ADD		reg_cycles,reg_cycles,R0, lsr #MS_SHIFT
	@ CPUShutdown
	@ only SA1 here : TODO	
	@ Return
	LDMFD		R13!,{PC}
@SBSpecial:
	@LDR		PC,[PC,R2,LSL #2]
	@MOV		R0,R0 		@ nop, for align
SBJumpTable:
	.long SBPPU
	.long SBCPU
	.long SBDSP
	.long SBLSRAM
	.long SBHSRAM
	.long SBNONE
	.long SBDEBUG
	.long SBC4
	.long SBBWRAM
	.long SBNONE
	.long SBNONE
	.long SBNONE
	/*.long SB7ROM
	.long SB7RAM
	.long SB7SRM*/
SBPPU:
	@ InDMA ?
	LDRB		R2,[reg_cpu_var,#InDMA_ofs]
	@MOV		R0,R0,LSL #16
	bic		r0, r0, #0xff0000			
	MOVS		R2,R2	
	ADDEQ		reg_cycles,reg_cycles,#ONE_CYCLE		@ No -> update Cycles
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs]	@ Save Cycles
	@MOV		R0,R0,LSR #16
		PREPARE_C_CALL
	MOV		R12,R0
	MOV		R0,R1
	MOV		R1,R12		
	BL		S9xSetPPU		
		RESTORE_C_CALL
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
SBCPU:	
	ADD		reg_cycles,reg_cycles,#ONE_CYCLE	@ update Cycles	
	@MOV		R0,R0,LSL #16 
	bic		r0, r0, #0xff0000		
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Save Cycles
	@MOV		R0,R0,LSR #16	@ Address&0xFFFF
		PREPARE_C_CALL
	MOV		R12,R0
	MOV		R0,R1
	MOV		R1,R12		
	BL		S9xSetCPU		
		RESTORE_C_CALL
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
SBDSP:
	ADD		reg_cycles,reg_cycles,#SLOW_ONE_CYCLE	@ update Cycles	
	@MOV		R0,R0,LSL #16
	bic		r0, r0, #0x0ff0000 
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Save Cycles
	@MOV		R0,R0,LSR #16	@ Address&0xFFFF
		PREPARE_C_CALL	
	MOV		R12,R0
	MOV		R0,R1
	ldr		reg_cycles, [reg_cpu_var, #DSPSet_ofs]
	MOV		R1,R12	
	blx		reg_cycles
	@BL		S9xSetDSP		
		RESTORE_C_CALL
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
SBLSRAM:
	ADD		reg_cycles,reg_cycles,#SLOW_ONE_CYCLE	@ update Cycles		
	LDR		R2,[reg_cpu_var,#SRAMMask]
	MOVS		R2,R2
	LDMEQFD		R13!,{PC} @ return if SRAMMask=0
	LDR		R3,[reg_cpu_var,#SRAM]	
	AND		R0,R2,R0		@ Address&SRAMMask	
	STRB		R1,[R0,R3]		@ *Memory.SRAM + Address&SRAMMask	
	
	MOV		R0,#1
	STRB		R0,[reg_cpu_var,#SRAMModified_ofs]		
	LDMFD		R13!,{PC}  @ return
SB7SRM:	
SBHSRAM:
	ADD		reg_cycles,reg_cycles,#SLOW_ONE_CYCLE	@ update Cycles		
	
	@MOV		R3,R0,LSL #17  
	@AND		R2,R0,#0xF0000
	@MOV		R3,R3,LSR #17	@ Address&0x7FFF	
	@MOV		R2,R2,LSR #3 @ (Address&0xF0000 >> 3)	
	@ADD		R0,R3,R2
	mov		r3, r0, lsl #17
	and		r0, r0, #0xf0000
	mov 		r3, r3, lsr #17
	
	ldr		R2, [reg_cpu_var, #SRAMMask]
	add		r0, r3, r0, lsr #3	

	@LDR		R2,[reg_cpu_var,#SRAMMask]
	MOVS		R2,R2
	LDMEQFD		R13!,{PC} @ return if SRAMMask=0
	
	SUB		R0,R0,#0x6000 @ ((Address & 0x7fff) - 0x6000 + ((Address & 0xf0000) >> 3))
	LDR		R3,[reg_cpu_var,#SRAM]	
	AND		R0,R2,R0		@ Address&SRAMMask	
	STRB		R1,[R0,R3]		@ *Memory.SRAM + Address&SRAMMask
	
	MOV		R0,#1
	STRB		R0,[reg_cpu_var,#SRAMModified_ofs]		
	LDMFD		R13!,{PC}	@ return
SB7ROM:
SB7RAM:	
SBNONE:	
SBDEBUG:
	ADD		reg_cycles,reg_cycles,#SLOW_ONE_CYCLE	@ update Cycles
	LDMFD		R13!,{PC}
SBC4:
	ADD		reg_cycles,reg_cycles,#SLOW_ONE_CYCLE	@ update Cycles	
	@MOV		R0,R0,LSL #16 
	bic		r0, r0, #0xff0000			
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Save Cycles
	@MOV		R0,R0,LSR #16	@ Address&0xFFFF	
		PREPARE_C_CALL
	MOV		R12,R0
	MOV		R0,R1
	MOV		R1,R12		
	BL		S9xSetC4		
		RESTORE_C_CALL
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
SBBWRAM:
	MOV		R0,R0,LSL #17  
	ADD		reg_cycles,reg_cycles,#SLOW_ONE_CYCLE	@ update Cycles
	MOV		R0,R0,LSR #17	@ Address&0x7FFF			
	LDR		R2,[reg_cpu_var,#BWRAM]	
	SUB		R0,R0,#0x6000 @ ((Address & 0x7fff) - 0x6000)	
	STRB		R1,[R0,R2]		@ *Memory.BWRAM + ((Address & 0x7fff) - 0x6000)
	
	MOV		R0,#1
	STRB		R0,[reg_cpu_var,#SRAMModified_ofs]		
	
	LDMFD		R13!,{PC}



@ void aaS9xSetWord(uint32 address,uint16 val);
asmS9xSetWord:
	@  in : R0  = 0x00hhmmll R1=0x0000hhll
	@  DESTROYED : R0,R1,R2,R3
	@  UPDATE : reg_cycles
	@ R1 <= block	
	
	MOV		R2,R0,LSL #19	
	ADDS		R2,R2,#0x80000
	@ if = 0x1FFF => 0
	BNE		SW_NotBoundary
	
	STMFD		R13!,{R0,R1}
		STMFD		R13!,{PC}
	B		asmS9xSetByte
		MOV		R0,R0
	LDMFD		R13!,{R0,R1}	
	ADD		R0,R0,#1
	MOV		R1,R1,LSR #8
		STMFD		R13!,{PC}
	B		asmS9xSetByte
		MOV		R0,R0
	
	LDMFD		R13!,{PC}
	
SW_NotBoundary:	
	
	@MOV		R2,#0
	@STR		R2,[reg_cpu_var,#WaitAddress_ofs]

	@ 	
	@ R3 <= block				
	@ MEMMAP_SHIFT is 12, Address is 0xFFFFFFFF at max, so
	@ R1 is maxed by 0x000FFFFF, MEMMAP_MASK is 0x1000-1=0xFFF
	@ so AND MEMMAP_MASK is BIC 0xFF000
	@BIC		R3,R3,#0xFF000
	@ R2 <= Map[block] (SetAddress)
	LDR		R2,[reg_cpu_var,#WriteMap_ofs]
	MOV		R3,R0,LSR #MEMMAP_SHIFT
	LDR		R2,[R2,R3,LSL #2]
	bic		rstatus, rstatus, #MASK_SHUTDOWN
	CMP		R2,#MAP_LAST
	@BLO		SWSpecial  @ special
	@blo		GBSpecial 	 @ special
	ldrlo		r3, =SWJumpTable
	ldrlo		pc, [r3, r2, lsl #2]

	@  Direct ROM/RAM acess		
	
	
	@ check if address is 16bits aligned or not
	@TST		R0,#1
	@BNE		SW_not_aligned1
	@ aligned
	@bic		r0, r0, #0xff0000		
	@ Set word
	@strh		r1, [r2, r0]
	@ldr		r0, [reg_cpu_var, #MemorySpeed_ofs]		
	@ R1 <= MemorySpeed[block]
	@LDR		R0,[R0,R3, lsl #2]
	@ Update CPU.Cycles
	@ADD		reg_cycles,reg_cycles,R0, LSL #1
	@ CPUShutdown
	@ only SA1 here : TODO	
	@ Return
	@LDMFD		R13!,{PC}
	
SW_not_aligned1:	
	bic		r0, r0, #0xff0000		
	strb		r1, [r2, r0]!
	ldr		r0, [reg_cpu_var, #MemorySpeed_ofs]
	mov		r1, r1, lsr #8	
	ldr		r0, [r0, r3, lsl #2]
	strb		r1, [r2, #1]	
	add		reg_cycles, reg_cycles, r0, lsr #(MS_SHIFT - 1)  @, lsl #1
	ldmfd		r13!, {pc}

	@ R1 = (Address&0xFFFF)<<16
	@MOV		R0,R0,LSL #16
	@ First write @address
	@STRB		R1,[R2,R0,LSR #16]
	@ADD		R0,R0,#0x10000
	@MOV		R1,R1,LSR #8
	@ Second write @address+1
	@STRB		R1,[R2,R0,LSR #16]
	@ R1 <= MemorySpeed[block]
	@LDR		R0,[reg_cpu_var,#MemorySpeed_ofs]
	@LDR		R0,[R0,R3, lsl #2]	
	@ Update CPU.Cycles
	@ADD		reg_cycles,reg_cycles,R0,LSL #1
	@ CPUShutdown
	@ only SA1 here : TODO	
	@ Return
	@LDMFD		R13!,{PC}
SWJumpTable:
@SWSpecial:
	@LDR		PC,[PC,R2,LSL #2]
	@MOV		R0,R0 		@ nop, for align
	.long SWPPU
	.long SWCPU
	.long SWDSP
	.long SWLSRAM
	.long SWHSRAM
	.long SWNONE
	.long SWDEBUG
	.long SWC4
	.long SWBWRAM
	.long SWNONE
	.long SWNONE
	.long SWNONE
	/*.long SW7ROM
	.long SW7RAM
	.long SW7SRM*/
SWPPU:
	@ InDMA ?
	LDRB		R2,[reg_cpu_var,#InDMA_ofs]
	@MOV		R0,R0,LSL #16	
	bic		r0, r0, #0xff0000			
	MOVS		R2,R2	
	ADDEQ		reg_cycles,reg_cycles,#(ONE_CYCLE*2)		@ No -> update Cycles
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs]	@ Save Cycles
	@MOV		R0,R0,LSR #16
	MOV		R2,R1
	MOV		R1,R0
	MOV		R0,R2
		PREPARE_C_CALL_R0R1
	BL		S9xSetPPU		
	LDMFD		R13!,{R0,R1}
	ADD		R1,R1,#1
	MOV		R0,R0,LSR #8	
	BIC		R1,R1,#0x10000		
	BL		S9xSetPPU		
		RESTORE_C_CALL
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
SWCPU:	
	ADD		reg_cycles,reg_cycles,#(ONE_CYCLE*2)	@ update Cycles	
	@MOV		R0,R0,LSL #16 
	bic		r0, r0, #0xff0000			
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Save Cycles
	@MOV		R0,R0,LSR #16	@ Address&0xFFFF
	MOV		R2,R1
	MOV		R1,R0
	MOV		R0,R2	
		PREPARE_C_CALL_R0R1
	BL		S9xSetCPU		
	LDMFD		R13!,{R0,R1}
	ADD		R1,R1,#1
	MOV		R0,R0,LSR #8	
	BIC		R1,R1,#0x10000		
	BL		S9xSetCPU		
		RESTORE_C_CALL
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
SWDSP:
	ADD		reg_cycles,reg_cycles,#SLOW_ONE_CYCLE	@ update Cycles	
	@MOV		R0,R0,LSL #16 
	bic		r0, r0, #0x0ff0000		
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Save Cycles
	@MOV		R0,R0,LSR #16	@ Address&0xFFFF
	MOV		R2,R1
	MOV		R1,R0
	MOV		R0,R2
	ldr		reg_cycles, [reg_cpu_var, #DSPSet_ofs]
		PREPARE_C_CALL_R0R1
	blx		reg_cycles
	@BL		S9xSetDSP	
	LDMFD		R13!,{R0,R1}
	ADD		R1,R1,#1
	MOV		R0,R0,LSR #8	
	BIC		R1,R1,#0x10000
	blx		reg_cycles	
	@BL		S9xSetDSP		
		RESTORE_C_CALL
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
SWLSRAM:
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles		
	LDR		R2,[reg_cpu_var,#SRAMMask]
	MOVS		R2,R2
	LDMEQFD		R13!,{PC} @ return if SRAMMask=0
			
	AND		R3,R2,R0		@ Address&SRAMMask
	TST		R0,#1
	BNE		SW_not_aligned2
	@ aligned	
	LDR		R0,[reg_cpu_var,#SRAM]	
	STRH		R1,[R0,R3]		@ *Memory.SRAM + Address&SRAMMask		
	MOV		R0,#1
	STRB		R0,[reg_cpu_var,#SRAMModified_ofs]		
	LDMFD		R13!,{PC}  @ return	
SW_not_aligned2:	

	ADD		R0,R0,#1
	AND		R2,R2,R0		@ (Address+1)&SRAMMask		
	LDR		R0,[reg_cpu_var,#SRAM]	
	STRB		R1,[R0,R3]		@ *Memory.SRAM + Address&SRAMMask
	MOV		R1,R1,LSR #8
	STRB		R1,[R0,R2]		@ *Memory.SRAM + (Address+1)&SRAMMask	
	MOV		R0,#1
	STRB		R0,[reg_cpu_var,#SRAMModified_ofs]		
	LDMFD		R13!,{PC}  @ return
SW7SRM:	
SWHSRAM:
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles		
	
	LDR		R2,[reg_cpu_var,#SRAMMask]
	MOVS		R2,R2
	LDMEQFD		R13!,{PC} @ return if SRAMMask=0
	
	TST		R0,#1
	BNE		SW_not_aligned3	
	@ aligned
	MOV		R3,R0,LSL #17  
	AND		R2,R0,#0xF0000
	MOV		R3,R3,LSR #17	@ Address&0x7FFF	
	MOV		R2,R2,LSR #3 @ (Address&0xF0000 >> 3)	
	ADD		R0,R2,R3				
	SUB		R0,R0,#0x6000 @ ((Address & 0x7fff) - 0x6000 + ((Address & 0xf0000) >> 3))
	LDR		R2,[reg_cpu_var,#SRAMMask]
	LDR		R3,[reg_cpu_var,#SRAM]	
	AND		R0,R2,R0		@ Address&SRAMMask	
	STRH		R1,[R0,R3]		@ *Memory.SRAM + Address&SRAMMask	
	MOV		R0,#1
	STRB		R0,[reg_cpu_var,#SRAMModified_ofs]		
	LDMFD		R13!,{PC}	@ return		
SW_not_aligned3:	
	MOV		R3,R0,LSL #17  
	AND		R2,R0,#0xF0000
	MOV		R3,R3,LSR #17	@ Address&0x7FFF	
	MOV		R2,R2,LSR #3 @ (Address&0xF0000 >> 3)	
	ADD		R2,R2,R3				
	SUB		R2,R2,#0x6000 @ ((Address & 0x7fff) - 0x6000 + ((Address & 0xf0000) >> 3))
	
	ADD		R0,R0,#1	
	MOV		R3,R0,LSL #17  
	AND		R0,R0,#0xF0000
	MOV		R3,R3,LSR #17	@ (Address+1)&0x7FFF	
	MOV		R0,R0,LSR #3 @ ((Address+1)&0xF0000 >> 3)	
	ADD		R0,R0,R3	
	LDR		R3,[reg_cpu_var,#SRAMMask]	@ reload mask	
	SUB		R0,R0,#0x6000 @ (((Address+1) & 0x7fff) - 0x6000 + (((Address+1) & 0xf0000) >> 3))		
	AND		R2,R3,R2		@ Address...&SRAMMask	
	AND		R0,R3,R0		@ (Address+1...)&SRAMMask	
	
	LDR		R3,[reg_cpu_var,#SRAM]
	STRB		R1,[R2,R3]		@ *Memory.SRAM + (Address...)&SRAMMask
	MOV		R1,R1,LSR #8
	STRB		R1,[R0,R3]		@ *Memory.SRAM + (Address+1...)&SRAMMask
	
	MOV		R0,#1
	STRB		R0,[reg_cpu_var,#SRAMModified_ofs]		
	LDMFD		R13!,{PC}	@ return	
SW7ROM:
SW7RAM:	
SWNONE:	
SWDEBUG:
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles
	LDMFD		R13!,{PC}	@ return
SWC4:
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles	
	@MOV		R0,R0,LSL #16 
	bic		r0, r0, #0xff0000			
	STR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Save Cycles
	@MOV		R0,R0,LSR #16	@ Address&0xFFFF	
	MOV		R2,R1
	MOV		R1,R0
	MOV		R0,R2
		PREPARE_C_CALL_R0R1
	BL		S9xSetC4		
	LDMFD		R13!,{R0,R1}	
	ADD		R1,R1,#1
	MOV		R0,R0,LSR #8	
	BIC		R1,R1,#0x10000		
	BL		S9xSetC4		
		RESTORE_C_CALL
	LDR		reg_cycles,[reg_cpu_var,#Cycles_ofs] @ Load Cycles	
	LDMFD		R13!,{PC} @ Return
SWBWRAM:
	ADD		reg_cycles,reg_cycles,#(SLOW_ONE_CYCLE*2)	@ update Cycles
	TST		R0,#1
	BNE		SW_not_aligned4
	@ aligned
	MOV		R0,R0,LSL #17		
	LDR		R2,[reg_cpu_var,#BWRAM]
	MOV		R0,R0,LSR #17	@ Address&0x7FFF			
	SUB		R0,R0,#0x6000 @ ((Address & 0x7fff) - 0x6000)	
	MOV		R3,#1
	STRH		R1,[R0,R2]		@ *Memory.BWRAM + ((Address & 0x7fff) - 0x6000)			
	STRB		R3,[reg_cpu_var,#SRAMModified_ofs]			
	LDMFD		R13!,{PC}	@ return
SW_not_aligned4:
	MOV		R0,R0,LSL #17	
	ADD		R3,R0,#0x20000
	MOV		R0,R0,LSR #17	@ Address&0x7FFF
	MOV		R3,R3,LSR #17	@ (Address+1)&0x7FFF
	LDR		R2,[reg_cpu_var,#BWRAM]	
	SUB		R0,R0,#0x6000 @ ((Address & 0x7fff) - 0x6000)
	SUB		R3,R3,#0x6000 @ (((Address+1) & 0x7fff) - 0x6000)
	STRB		R1,[R2,R0]		@ *Memory.BWRAM + ((Address & 0x7fff) - 0x6000)
	MOV		R1,R1,LSR #8
	STRB		R1,[R2,R3]		@ *Memory.BWRAM + (((Address+1) & 0x7fff) - 0x6000)	
	MOV		R0,#1
	STRB		R0,[reg_cpu_var,#SRAMModified_ofs]			
	LDMFD		R13!,{PC}		@ return
	




