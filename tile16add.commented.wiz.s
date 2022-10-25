ARM GAS  /tmp/ccV38c0o.s 			page 1


   1              		.file	"tile16add.cpp"
   2              		.section	.debug_abbrev,"",%progbits
   3              	.Ldebug_abbrev0:
   4              		.section	.debug_info,"",%progbits
   5              	.Ldebug_info0:
   6              		.section	.debug_line,"",%progbits
   7              	.Ldebug_line0:
   8 0000 F2000000 		.text
   8      02008F00 
   8      00000201 
   8      FB0E0A00 
   8      01010101 
   9              	.Ltext0:
  10              		.align	2
  11              		.p2align 5,,31
  12              		.global	_Z13DrawTile16Addjjjj
  13              		.type	_Z13DrawTile16Addjjjj, %function
  14              	_Z13DrawTile16Addjjjj:
  15              	.LFB26:
  16              		.file 1 "tile16_t.h"
   1:tile16_t.h    **** /*
   2:tile16_t.h    ****  Templates for
   3:tile16_t.h    **** 
   4:tile16_t.h    ****  DrawTile16
   5:tile16_t.h    ****  DrawClippedTile16
   6:tile16_t.h    **** */
   7:tile16_t.h    **** 
   8:tile16_t.h    **** #include "snes9x.h"
   9:tile16_t.h    **** #include "memmap.h"
  10:tile16_t.h    **** #include "ppu.h"
  11:tile16_t.h    **** #include "display.h"
  12:tile16_t.h    **** #include "gfx.h"
  13:tile16_t.h    **** #include "tile16.h"
  14:tile16_t.h    **** 
  15:tile16_t.h    **** #define MACRO_CONCAT(a,b) a##b
  16:tile16_t.h    **** #define DEC_DRAW(n) MACRO_CONCAT(void DrawTile16, n)(uint32 Tile, uint32 Offset, uint32 StartLine, 
  17:tile16_t.h    **** #define DEC_DRAWCLIPPED(n) MACRO_CONCAT(void DrawClippedTile16, n)(uint32 Tile, uint32 Offset, uint
  18:tile16_t.h    **** 
  19:tile16_t.h    **** #ifdef __FAST_OBJS__
  20:tile16_t.h    **** 
  21:tile16_t.h    **** #define DEC_DRAWNOZ(n) MACRO_CONCAT(void DrawNoZTile16, n)(uint32 Tile, uint32 Offset, uint32 Start
  22:tile16_t.h    **** 
  23:tile16_t.h    **** #define ROW(width) \
  24:tile16_t.h    **** 			"	mov	r10, " width "			\n" \
  25:tile16_t.h    **** 			"7:\n" \
  26:tile16_t.h    **** 			"	ldrb	r9, [%[bp]], #1			\n"\
  27:tile16_t.h    **** 			"	add	%[depth], %[depth], #1		\n"\
  28:tile16_t.h    **** 			"	movs	r9, r9, lsl #2			\n"\
  29:tile16_t.h    **** 			"	beq	3f				\n"\
  30:tile16_t.h    **** 										\
  31:tile16_t.h    **** 			"	ldrb	r8, [%[subdepth], %[depth]]	\n"\
  32:tile16_t.h    **** 			"	ldr	r9, [%[colors], r9]		\n"\
  33:tile16_t.h    **** 			"	strb	%[gfx_z2], [%[depth], #(-1)]	\n"\
  34:tile16_t.h    **** 										\
  35:tile16_t.h    **** 			"	cmp	r8, #1				\n"\
  36:tile16_t.h    **** 			"	blo	4f				\n"\
  37:tile16_t.h    **** 			"	ldrneh	r8, [%[screen], %[delta]]	\n"\
ARM GAS  /tmp/ccV38c0o.s 			page 2


  38:tile16_t.h    **** 			"	moveq	r8, %[fixedcolour]		\n"\
  39:tile16_t.h    **** 			ROP \
  40:tile16_t.h    **** 			"4:						\n"\
  41:tile16_t.h    **** 			"	strh	r9, [%[screen]] 	\n"\
  42:tile16_t.h    **** 										\
  43:tile16_t.h    **** 			"3:						\n"\
  44:tile16_t.h    **** 			"	subs	r10, r10, #1			\n"\
  45:tile16_t.h    **** 			"	add	%[screen], %[screen], #2	\n"\
  46:tile16_t.h    **** 			"	bne	7b				\n"
  47:tile16_t.h    **** 
  48:tile16_t.h    **** #define ROW1(width)	\
  49:tile16_t.h    **** 			"	mov	r10, " width "			\n" \
  50:tile16_t.h    **** 			"7:\n" \
  51:tile16_t.h    **** 			"	ldrb	r9, [%[bp]], #-1		\n"\
  52:tile16_t.h    **** 			"	add	%[depth], %[depth], #1		\n"\
  53:tile16_t.h    **** 			"	movs	r9, r9, lsl #2			\n"\
  54:tile16_t.h    **** 			"	beq	3f				\n"\
  55:tile16_t.h    **** 										\
  56:tile16_t.h    **** 			"	ldrb	r8, [%[subdepth], %[depth]]	\n"\
  57:tile16_t.h    **** 			"	ldr	r9, [%[colors], r9]		\n"\
  58:tile16_t.h    **** 			"	strb	%[gfx_z2], [%[depth], #(-1)]	\n"\
  59:tile16_t.h    **** 										\
  60:tile16_t.h    **** 			"	cmp	r8, #1				\n"\
  61:tile16_t.h    **** 			"	blo	4f				\n"\
  62:tile16_t.h    **** 			"	ldrneh	r8, [%[screen], %[delta]]	\n"\
  63:tile16_t.h    **** 			"	moveq	r8, %[fixedcolour]		\n"\
  64:tile16_t.h    **** 			ROP \
  65:tile16_t.h    **** 			"4:						\n"\
  66:tile16_t.h    **** 			"	strh	r9, [%[screen]]		 	\n"\
  67:tile16_t.h    **** 										\
  68:tile16_t.h    **** 			"3:						\n"\
  69:tile16_t.h    **** 			"	subs	r10, r10, #1			\n"\
  70:tile16_t.h    **** 			"	add	%[screen], %[screen], #2	\n"\
  71:tile16_t.h    **** 			"	bne	7b				\n"
  72:tile16_t.h    **** 
  73:tile16_t.h    **** 
  74:tile16_t.h    **** 
  75:tile16_t.h    **** 
  76:tile16_t.h    **** // DrawNoZTile16 -----------------------------------------
  77:tile16_t.h    **** DEC_DRAWNOZ(ROPNAME)
  78:tile16_t.h    **** {
  79:tile16_t.h    ****      TILE_PREAMBLE 
  80:tile16_t.h    **** 
  81:tile16_t.h    ****   if (Tile & V_FLIP){
  82:tile16_t.h    ****     if (!(Tile & H_FLIP)){
  83:tile16_t.h    **** 		asm volatile (
  84:tile16_t.h    **** 		"2:					\n"
  85:tile16_t.h    **** 
  86:tile16_t.h    **** 		ROW("#8")
  87:tile16_t.h    **** 
  88:tile16_t.h    **** 		"	sub	%[bp], %[bp], #(8+8)		\n"	
  89:tile16_t.h    **** 		"	add	%[screen], %[screen], #(640-16)	\n" 
  90:tile16_t.h    **** 		"	add	%[depth], %[depth], #(320-8)	\n"
  91:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
  92:tile16_t.h    **** 		"	bne	2b"
  93:tile16_t.h    **** 		// output
  94:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
ARM GAS  /tmp/ccV38c0o.s 			page 3


  95:tile16_t.h    **** 		// input
  96:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
  97:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
  98:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
  99:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 100:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 101:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 102:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 103:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 104:tile16_t.h    ****  		  [bp] "r" (pCache + 56 - StartLine)
 105:tile16_t.h    **** 		// clobbered
 106:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 107:tile16_t.h    **** 		);
 108:tile16_t.h    **** 	} else {
 109:tile16_t.h    **** 		asm volatile (
 110:tile16_t.h    **** 		"2:						\n"
 111:tile16_t.h    **** 		ROW1("#8")
 112:tile16_t.h    **** 
 113:tile16_t.h    **** 		"	add	%[screen], %[screen], #(640-16)	\n" 
 114:tile16_t.h    **** 		"	add	%[depth], %[depth], #(320-8)	\n"
 115:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 116:tile16_t.h    **** 		"	bne	2b"
 117:tile16_t.h    **** 		// output
 118:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
 119:tile16_t.h    **** 		// input
 120:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 121:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 122:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 123:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 124:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 125:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 126:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 127:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 128:tile16_t.h    **** 		  [bp] "r" (pCache + 56 - StartLine + 7)
 129:tile16_t.h    **** 		// clobbered
 130:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 131:tile16_t.h    **** 		);
 132:tile16_t.h    **** 	}
 133:tile16_t.h    **** } else {
 134:tile16_t.h    ****     if (!(Tile & H_FLIP)){
 135:tile16_t.h    **** 		asm volatile (
 136:tile16_t.h    **** 		"2:					\n"
 137:tile16_t.h    **** 		ROW("#8")
 138:tile16_t.h    **** 
 139:tile16_t.h    **** 		"	add	%[screen], %[screen], #(640-16)	\n" 
 140:tile16_t.h    **** 		"	add	%[depth], %[depth], #(320-8)	\n"
 141:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 142:tile16_t.h    **** 		"	bne	2b"
 143:tile16_t.h    **** 		// output
 144:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
 145:tile16_t.h    **** 		// input
 146:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 147:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 148:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 149:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 150:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 151:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
ARM GAS  /tmp/ccV38c0o.s 			page 4


 152:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 153:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 154:tile16_t.h    **** 		  [bp] "r" (pCache + StartLine)
 155:tile16_t.h    **** 		// clobbered
 156:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 157:tile16_t.h    **** 		);
 158:tile16_t.h    **** 	} else {
 159:tile16_t.h    **** 		asm volatile (
 160:tile16_t.h    **** 		"2:						\n"
 161:tile16_t.h    **** 		ROW1("#8")
 162:tile16_t.h    **** 
 163:tile16_t.h    **** 		"	add	%[bp], %[bp], #(8+8)		\n"	
 164:tile16_t.h    **** 		"	add	%[screen], %[screen], #(640-16)	\n" 
 165:tile16_t.h    **** 		"	add	%[depth], %[depth], #(320-8)	\n"
 166:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 167:tile16_t.h    **** 		"	bne	2b"
 168:tile16_t.h    **** 
 169:tile16_t.h    **** 		// output
 170:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
 171:tile16_t.h    **** 		// input
 172:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 173:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 174:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 175:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 176:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 177:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 178:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 179:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 180:tile16_t.h    **** 		  [bp] "r" (pCache + StartLine + 7)
 181:tile16_t.h    **** 		// clobbered
 182:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 183:tile16_t.h    **** 		);
 184:tile16_t.h    **** 
 185:tile16_t.h    **** 	}
 186:tile16_t.h    ****    }
 187:tile16_t.h    **** }
 188:tile16_t.h    **** 
 189:tile16_t.h    **** #undef ROW
 190:tile16_t.h    **** #undef ROW1
 191:tile16_t.h    **** 
 192:tile16_t.h    **** #endif // #ifdef __FAST_OBJS__
 193:tile16_t.h    **** 
 194:tile16_t.h    **** 
 195:tile16_t.h    **** #define ROW(width) \
 196:tile16_t.h    **** 			"	ldrb	r8, [%[depth]], #1		\n"\
 197:tile16_t.h    **** 			"	mov	r10, " width "			\n" \
 198:tile16_t.h    **** 			"7:\n" \
 199:tile16_t.h    **** 			\
 200:tile16_t.h    **** 			"	cmp	%[gfx_z1], r8			\n"\
 201:tile16_t.h    **** 			"	ldrhib	r9, [%[bp]]		\n"\
 202:tile16_t.h    **** 			"	bls	3f				\n"\
 203:tile16_t.h    **** 										\
 204:tile16_t.h    **** 			"	movs	r9, r9, lsl #2			\n"\
 205:tile16_t.h    **** 			"	beq	3f				\n"\
 206:tile16_t.h    **** 										\
 207:tile16_t.h    **** 			"	ldrb	r8, [%[subdepth], %[depth]]	\n"\
 208:tile16_t.h    **** 			"	ldr	r9, [%[colors], r9]		\n"\
ARM GAS  /tmp/ccV38c0o.s 			page 5


 209:tile16_t.h    **** 			"	strb	%[gfx_z2], [%[depth], #(-1)]	\n"\
 210:tile16_t.h    **** 										\
 211:tile16_t.h    **** 			"	cmp	r8, #1				\n"\
 212:tile16_t.h    **** 			"	blo	4f				\n"\
 213:tile16_t.h    **** 			"	ldrneh	r8, [%[screen], %[delta]]	\n"\
 214:tile16_t.h    **** 			"	moveq	r8, %[fixedcolour]		\n"\
 215:tile16_t.h    **** 										\
 216:tile16_t.h    **** 			ROP \
 217:tile16_t.h    **** 			"4:						\n"\
 218:tile16_t.h    **** 			"	strh	r9, [%[screen]] 	\n"\
 219:tile16_t.h    **** 										\
 220:tile16_t.h    **** 			"3:						\n"\
 221:tile16_t.h    **** 			\
 222:tile16_t.h    **** 			"	subs	r10, r10, #1			\n"\
 223:tile16_t.h    **** 			"	add	%[bp], %[bp], #1		\n"\
 224:tile16_t.h    **** 			"	add	%[screen], %[screen], #2	\n"\
 225:tile16_t.h    **** 			"	ldrneb	r8, [%[depth]], #1		\n"\
 226:tile16_t.h    **** 			"	bne	7b				\n"
 227:tile16_t.h    **** 
 228:tile16_t.h    **** #define ROW1(width)	\
 229:tile16_t.h    **** 			"	ldrb	r8, [%[depth]], #1		\n"\
 230:tile16_t.h    **** 			"	mov	r10, " width "			\n" \
 231:tile16_t.h    **** 			"7:\n" \
 232:tile16_t.h    **** 			\
 233:tile16_t.h    **** 			"	cmp	%[gfx_z1], r8			\n"\
 234:tile16_t.h    **** 			"	ldrhib	r9, [%[bp]]			\n"\
 235:tile16_t.h    **** 			"	bls	3f				\n"\
 236:tile16_t.h    **** 										\
 237:tile16_t.h    **** 			"	movs	r9, r9, lsl #2			\n"\
 238:tile16_t.h    **** 			"	beq	3f				\n"\
 239:tile16_t.h    **** 										\
 240:tile16_t.h    **** 			"	ldrb	r8, [%[subdepth], %[depth]]	\n"\
 241:tile16_t.h    **** 			"	ldr	r9, [%[colors], r9]		\n"\
 242:tile16_t.h    **** 			"	strb	%[gfx_z2], [%[depth], #(-1)]	\n"\
 243:tile16_t.h    **** 										\
 244:tile16_t.h    **** 			"	cmp	r8, #1				\n"\
 245:tile16_t.h    **** 			"	blo	4f				\n"\
 246:tile16_t.h    **** 			"	ldrneh	r8, [%[screen], %[delta]]	\n"\
 247:tile16_t.h    **** 			"	moveq	r8, %[fixedcolour]		\n"\
 248:tile16_t.h    **** 										\
 249:tile16_t.h    **** 			ROP \
 250:tile16_t.h    **** 			"4:						\n"\
 251:tile16_t.h    **** 			"	strh	r9, [%[screen]]		 	\n"\
 252:tile16_t.h    **** 										\
 253:tile16_t.h    **** 			"3:						\n"\
 254:tile16_t.h    **** 			\
 255:tile16_t.h    **** 			"	subs	r10, r10, #1			\n"\
 256:tile16_t.h    **** 			"	sub	%[bp], %[bp], #1  		\n"\
 257:tile16_t.h    **** 			"	add	%[screen], %[screen], #2	\n"\
 258:tile16_t.h    **** 			"	ldrneb	r8, [%[depth]], #1		\n"\
 259:tile16_t.h    **** 			"	bne	7b				\n"
 260:tile16_t.h    **** 
 261:tile16_t.h    **** 
 262:tile16_t.h    **** // DrawTile16 -----------------------------------------
 263:tile16_t.h    **** DEC_DRAW(ROPNAME)
  17              		.loc 1 263 0
  18              		@ args = 0, pretend = 0, frame = 8
ARM GAS  /tmp/ccV38c0o.s 			page 6


  19              		@ frame_needed = 0, uses_anonymous_args = 0
  20              	.LVL0:
  21 0000 F04F2DE9 		stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  22              	.LCFI0:
  23              	.LBB2:
 264:tile16_t.h    **** {
 265:tile16_t.h    ****      TILE_PREAMBLE 
  24              		.loc 1 265 0
  25 0004 A8739FE5 		ldr	r7, .L14
  26              	.LBE2:
  27              		.loc 1 263 0
  28 0008 0080A0E1 		mov	r8, r0
  29              	.LBB3:
  30              		.loc 1 265 0
  31 000c 08E097E5 		ldr	lr, [r7, #8]
  32 0010 0CC097E5 		ldr	ip, [r7, #12]
  33 0014 000BA0E1 		mov	r0, r0, asl #22
  34              	.LVL1:
  35 0018 200BA0E1 		mov	r0, r0, lsr #22
  36 001c 10CE8CE0 		add	ip, ip, r0, asl lr
  37 0020 0C48A0E1 		mov	r4, ip, asl #16
  38              	.LVL2:
  39 0024 2448A0E1 		mov	r4, r4, lsr #16
  40 0028 289097E5 		ldr	r9, [r7, #40]
  41 002c 345EA0E1 		mov	r5, r4, lsr lr
  42              	.LVL3:
  43 0030 0900D5E7 		ldrb	r0, [r5, r9]	@ zero_extendqisi2
  44 0034 24C097E5 		ldr	ip, [r7, #36]
  45              	.LBE3:
  46              		.loc 1 263 0
  47 0038 08D04DE2 		sub	sp, sp, #8
  48              	.LCFI1:
  49              	.LBB4:
  50              		.loc 1 265 0
  51 003c 000050E3 		cmp	r0, #0
  52              	.LBE4:
  53              		.loc 1 263 0
  54 0040 01A0A0E1 		mov	sl, r1
  55 0044 04208DE5 		str	r2, [sp, #4]
  56 0048 03B0A0E1 		mov	fp, r3
  57              	.LBB5:
  58              		.loc 1 265 0
  59 004c 05638CE0 		add	r6, ip, r5, asl #6
  60              	.LVL4:
  61 0050 1900001A 		bne	.L2
  62              	.LVL5:
  63 0054 0410A0E1 		mov	r1, r4
  64 0058 0600A0E1 		mov	r0, r6
  65 005c 54339FE5 		ldr	r3, .L14+4
  66 0060 0FE0A0E1 		mov	lr, pc
  67 0064 00F093E5 		ldr	pc, [r3, #0]
  68 0068 0900C5E7 		strb	r0, [r5, r9]
  69              	.LVL6:
  70              	.L2:
  71 006c 283097E5 		ldr	r3, [r7, #40]
  72 0070 0530D3E7 		ldrb	r3, [r3, r5]	@ zero_extendqisi2
  73 0074 020053E3 		cmp	r3, #2
ARM GAS  /tmp/ccV38c0o.s 			page 7


  74 0078 3C339F05 		ldreq	r3, .L14+8
  75 007c 00808305 		streq	r8, [r3, #0]
  76 0080 E900000A 		beq	.L13
  77 0084 34039FE5 		ldr	r0, .L14+12
 266:tile16_t.h    **** 
 267:tile16_t.h    ****   if (Tile & V_FLIP){
  78              		.loc 1 267 0
  79 0088 020918E3 		tst	r8, #32768
  80              		.loc 1 265 0
  81 008c 343090E5 		ldr	r3, [r0, #52]
  82 0090 381090E5 		ldr	r1, [r0, #56]
  83 0094 033008E0 		and	r3, r8, r3
  84 0098 302090E5 		ldr	r2, [r0, #48]
  85 009c 3331A0E1 		mov	r3, r3, lsr r1
  86 00a0 037182E0 		add	r7, r2, r3, asl #2
  87 00a4 2C7080E5 		str	r7, [r0, #44]
  88 00a8 013908E2 		and	r3, r8, #16384
  89              		.loc 1 267 0
  90 00ac 8900000A 		beq	.L7
 268:tile16_t.h    ****     if (!(Tile & H_FLIP)){
  91              		.loc 1 268 0
  92 00b0 000053E3 		cmp	r3, #0
  93 00b4 04309DE5 		ldr	r3, [sp, #4]
  94 00b8 4150D0E5 		ldrb	r5, [r0, #65]	@ zero_extendqisi2
  95              	.LVL7:
  96 00bc 068063E0 		rsb	r8, r3, r6
  97              	.LVL8:
  98 00c0 142090E5 		ldr	r2, [r0, #20]
  99 00c4 3C3090E5 		ldr	r3, [r0, #60]
 100 00c8 4060D0E5 		ldrb	r6, [r0, #64]	@ zero_extendqisi2
 101              	.LVL9:
 102 00cc 444090E5 		ldr	r4, [r0, #68]
 103              	.LVL10:
 104 00d0 8AE0A0E1 		mov	lr, sl, asl #1
 105 00d4 24C090E5 		ldr	ip, [r0, #36]
 106 00d8 081090E5 		ldr	r1, [r0, #8]
 107 00dc 6000001A 		bne	.L9
 269:tile16_t.h    **** 		asm volatile (
 270:tile16_t.h    **** 		"2:					\n"
 271:tile16_t.h    **** 
 272:tile16_t.h    **** 		ROW("#8")
 273:tile16_t.h    **** 
 274:tile16_t.h    **** 		"	sub	%[bp], %[bp], #(8+8)		\n"	
 275:tile16_t.h    **** 		"	add	%[screen], %[screen], #(640-16)	\n" 
 276:tile16_t.h    **** 		"	add	%[depth], %[depth], #(320-8)	\n"
 277:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 278:tile16_t.h    **** 		"	bne	2b"
 279:tile16_t.h    **** 		// output
 280:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
 281:tile16_t.h    **** 		// input
 282:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 283:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 284:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 285:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 286:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 287:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 288:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
ARM GAS  /tmp/ccV38c0o.s 			page 8


 289:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 290:tile16_t.h    ****  		  [bp] "r" (pCache + 56 - StartLine)
 291:tile16_t.h    **** 		// clobbered
 292:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 293:tile16_t.h    **** 		);
 108              		.loc 1 293 0
 109 00e0 01008AE0 		add	r0, sl, r1
 110 00e4 0CC08EE0 		add	ip, lr, ip
 111 00e8 8210A0E1 		mov	r1, r2, asl #1
 112 00ec 012043E2 		sub	r2, r3, #1
 113 00f0 383088E2 		add	r3, r8, #56
 114              	#APP
 115              		2:					
 116 00f4 0180D0E4 		ldrb	r8, [r0], #1		
 117 00f8 08A0A0E3 		mov	r10, #8			
 118              	7:
 119 00fc 080056E1 		cmp	r6, r8			
 120 0100 0090D385 		ldrhib	r9, [r3]		
 121 0104 5500009A 		bls	3f				
 122 0108 0991B0E1 		movs	r9, r9, lsl #2			
 123 010c 5500000A 		beq	3f				
 124 0110 0080D2E7 		ldrb	r8, [r2, r0]	
 125 0114 099097E7 		ldr	r9, [r7, r9]		
 126 0118 015040E5 		strb	r5, [r0, #(-1)]	
 127 011c 010058E3 		cmp	r8, #1				
 128 0120 5400003A 		blo	4f				
 129 0124 B1809C11 		ldrneh	r8, [ip, r1]	
 130 0128 0480A001 		moveq	r8, r4		
 131 012c 828ED8E3 		bics	r8, r8, #0b00000100000100000	
 132 0130 5400000A 		beq	999f 
 133 0134 829ED9E3 		bics	r9, r9, #0b00000100000100000	
 134 0138 089089E0 		add	r9, r9, r8 			
 135 013c 5400000A 		beq	999f 
 136 0140 200019E3 		tst	r9, 	#0b00000000000100000	
 137 0144 1F908913 		orrne	r9, r9, #0b00000000000011111	
 138 0148 020B19E3 		tst	r9, 	#0b00000100000000000	
 139 014c 7E9E8913 		orrne	r9, r9, #0b00000011111100000	
 140 0150 010819E3 		tst	r9, 	#0b10000000000000000	
 141 0154 3E9B8913 		orrne	r9, r9, #0b01111100000000000	
 142              	999:
 143              	4:						
 144 0158 B090CCE1 		strh	r9, [ip] 	
 145              	3:						
 146 015c 01A05AE2 		subs	r10, r10, #1			
 147 0160 013083E2 		add	r3, r3, #1		
 148 0164 02C08CE2 		add	ip, ip, #2	
 149 0168 0180D014 		ldrneb	r8, [r0], #1		
 150 016c 3D00001A 		bne	7b				
 151 0170 103043E2 		sub	r3, r3, #(8+8)		
 152 0174 27CE8CE2 		add	ip, ip, #(640-16)	
 153 0178 4E0F80E2 		add	r0, r0, #(320-8)	
 154 017c 01B05BE2 		subs 	fp, fp, #1	
 155 0180 3B00001A 		bne	2b
 156              	.LVL11:
 157 0184 E90000EA 		b	.L13
 158              	.LVL12:
 159              	.L9:
ARM GAS  /tmp/ccV38c0o.s 			page 9


 294:tile16_t.h    **** 	} else {
 295:tile16_t.h    **** 		asm volatile (
 296:tile16_t.h    **** 		"2:						\n"
 297:tile16_t.h    **** 		ROW1("#8")
 298:tile16_t.h    **** 
 299:tile16_t.h    **** 		"	add	%[screen], %[screen], #(640-16)	\n" 
 300:tile16_t.h    **** 		"	add	%[depth], %[depth], #(320-8)	\n"
 301:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 302:tile16_t.h    **** 		"	bne	2b"
 303:tile16_t.h    **** 		// output
 304:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
 305:tile16_t.h    **** 		// input
 306:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 307:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 308:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 309:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 310:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 311:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 312:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 313:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 314:tile16_t.h    **** 		  [bp] "r" (pCache + 56 - StartLine + 7)
 315:tile16_t.h    **** 		// clobbered
 316:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 317:tile16_t.h    **** 		);
 160              		.loc 1 317 0
 161 0188 01008AE0 		add	r0, sl, r1
 162 018c 0CC08EE0 		add	ip, lr, ip
 163 0190 8210A0E1 		mov	r1, r2, asl #1
 164 0194 012043E2 		sub	r2, r3, #1
 165 0198 3F3088E2 		add	r3, r8, #63
 166              	#APP
 167              		2:						
 168 019c 0180D0E4 		ldrb	r8, [r0], #1		
 169 01a0 08A0A0E3 		mov	r10, #8			
 170              	7:
 171 01a4 080056E1 		cmp	r6, r8			
 172 01a8 0090D385 		ldrhib	r9, [r3]			
 173 01ac 7F00009A 		bls	3f				
 174 01b0 0991B0E1 		movs	r9, r9, lsl #2			
 175 01b4 7F00000A 		beq	3f				
 176 01b8 0080D2E7 		ldrb	r8, [r2, r0]	
 177 01bc 099097E7 		ldr	r9, [r7, r9]		
 178 01c0 015040E5 		strb	r5, [r0, #(-1)]	
 179 01c4 010058E3 		cmp	r8, #1				
 180 01c8 7E00003A 		blo	4f				
 181 01cc B1809C11 		ldrneh	r8, [ip, r1]	
 182 01d0 0480A001 		moveq	r8, r4		
 183 01d4 828ED8E3 		bics	r8, r8, #0b00000100000100000	
 184 01d8 7E00000A 		beq	999f 
 185 01dc 829ED9E3 		bics	r9, r9, #0b00000100000100000	
 186 01e0 089089E0 		add	r9, r9, r8 			
 187 01e4 7E00000A 		beq	999f 
 188 01e8 200019E3 		tst	r9, 	#0b00000000000100000	
 189 01ec 1F908913 		orrne	r9, r9, #0b00000000000011111	
 190 01f0 020B19E3 		tst	r9, 	#0b00000100000000000	
 191 01f4 7E9E8913 		orrne	r9, r9, #0b00000011111100000	
 192 01f8 010819E3 		tst	r9, 	#0b10000000000000000	
ARM GAS  /tmp/ccV38c0o.s 			page 10


 193 01fc 3E9B8913 		orrne	r9, r9, #0b01111100000000000	
 194              	999:
 195              	4:						
 196 0200 B090CCE1 		strh	r9, [ip]		 	
 197              	3:						
 198 0204 01A05AE2 		subs	r10, r10, #1			
 199 0208 013043E2 		sub	r3, r3, #1  		
 200 020c 02C08CE2 		add	ip, ip, #2	
 201 0210 0180D014 		ldrneb	r8, [r0], #1		
 202 0214 6700001A 		bne	7b				
 203 0218 27CE8CE2 		add	ip, ip, #(640-16)	
 204 021c 4E0F80E2 		add	r0, r0, #(320-8)	
 205 0220 01B05BE2 		subs 	fp, fp, #1	
 206 0224 6500001A 		bne	2b
 207              	.LVL13:
 208 0228 E90000EA 		b	.L13
 209              	.LVL14:
 210              	.L7:
 211 022c 04C09DE5 		ldr	ip, [sp, #4]
 318:tile16_t.h    **** 	}
 319:tile16_t.h    **** } else {
 320:tile16_t.h    ****     if (!(Tile & H_FLIP)){
 212              		.loc 1 320 0
 213 0230 000053E3 		cmp	r3, #0
 214 0234 0C6086E0 		add	r6, r6, ip
 215              	.LVL15:
 216 0238 00608DE5 		str	r6, [sp, #0]
 217 023c 3C3090E5 		ldr	r3, [r0, #60]
 218 0240 4060D0E5 		ldrb	r6, [r0, #64]	@ zero_extendqisi2
 219 0244 4150D0E5 		ldrb	r5, [r0, #65]	@ zero_extendqisi2
 220              	.LVL16:
 221 0248 142090E5 		ldr	r2, [r0, #20]
 222 024c 444090E5 		ldr	r4, [r0, #68]
 223              	.LVL17:
 224 0250 8AE0A0E1 		mov	lr, sl, asl #1
 225 0254 24C090E5 		ldr	ip, [r0, #36]
 226 0258 081090E5 		ldr	r1, [r0, #8]
 227 025c BF00001A 		bne	.L11
 321:tile16_t.h    **** 		asm volatile (
 322:tile16_t.h    **** 		"2:					\n"
 323:tile16_t.h    **** 		ROW("#8")
 324:tile16_t.h    **** 
 325:tile16_t.h    **** 		"	add	%[screen], %[screen], #(640-16)	\n" 
 326:tile16_t.h    **** 		"	add	%[depth], %[depth], #(320-8)	\n"
 327:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 328:tile16_t.h    **** 		"	bne	2b"
 329:tile16_t.h    **** 		// output
 330:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
 331:tile16_t.h    **** 		// input
 332:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 333:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 334:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 335:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 336:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 337:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 338:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 339:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
ARM GAS  /tmp/ccV38c0o.s 			page 11


 340:tile16_t.h    **** 		  [bp] "r" (pCache + StartLine)
 341:tile16_t.h    **** 		// clobbered
 342:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 343:tile16_t.h    **** 		);
 228              		.loc 1 343 0
 229 0260 0C008EE0 		add	r0, lr, ip
 230 0264 01108AE0 		add	r1, sl, r1
 231 0268 8220A0E1 		mov	r2, r2, asl #1
 232 026c 013043E2 		sub	r3, r3, #1
 233 0270 00E09DE5 		ldr	lr, [sp, #0]
 234              	#APP
 235              		2:					
 236 0274 0180D1E4 		ldrb	r8, [r1], #1		
 237 0278 08A0A0E3 		mov	r10, #8			
 238              	7:
 239 027c 080056E1 		cmp	r6, r8			
 240 0280 0090DE85 		ldrhib	r9, [lr]		
 241 0284 B500009A 		bls	3f				
 242 0288 0991B0E1 		movs	r9, r9, lsl #2			
 243 028c B500000A 		beq	3f				
 244 0290 0180D3E7 		ldrb	r8, [r3, r1]	
 245 0294 099097E7 		ldr	r9, [r7, r9]		
 246 0298 015041E5 		strb	r5, [r1, #(-1)]	
 247 029c 010058E3 		cmp	r8, #1				
 248 02a0 B400003A 		blo	4f				
 249 02a4 B2809011 		ldrneh	r8, [r0, r2]	
 250 02a8 0480A001 		moveq	r8, r4		
 251 02ac 828ED8E3 		bics	r8, r8, #0b00000100000100000	
 252 02b0 B400000A 		beq	999f 
 253 02b4 829ED9E3 		bics	r9, r9, #0b00000100000100000	
 254 02b8 089089E0 		add	r9, r9, r8 			
 255 02bc B400000A 		beq	999f 
 256 02c0 200019E3 		tst	r9, 	#0b00000000000100000	
 257 02c4 1F908913 		orrne	r9, r9, #0b00000000000011111	
 258 02c8 020B19E3 		tst	r9, 	#0b00000100000000000	
 259 02cc 7E9E8913 		orrne	r9, r9, #0b00000011111100000	
 260 02d0 010819E3 		tst	r9, 	#0b10000000000000000	
 261 02d4 3E9B8913 		orrne	r9, r9, #0b01111100000000000	
 262              	999:
 263              	4:						
 264 02d8 B090C0E1 		strh	r9, [r0] 	
 265              	3:						
 266 02dc 01A05AE2 		subs	r10, r10, #1			
 267 02e0 01E08EE2 		add	lr, lr, #1		
 268 02e4 020080E2 		add	r0, r0, #2	
 269 02e8 0180D114 		ldrneb	r8, [r1], #1		
 270 02ec 9D00001A 		bne	7b				
 271 02f0 270E80E2 		add	r0, r0, #(640-16)	
 272 02f4 4E1F81E2 		add	r1, r1, #(320-8)	
 273 02f8 01B05BE2 		subs 	fp, fp, #1	
 274 02fc 9B00001A 		bne	2b
 275              	.LVL18:
 276 0300 E90000EA 		b	.L13
 277              	.LVL19:
 278              	.L11:
 344:tile16_t.h    **** 	} else {
 345:tile16_t.h    **** 		asm volatile (
ARM GAS  /tmp/ccV38c0o.s 			page 12


 346:tile16_t.h    **** 		"2:						\n"
 347:tile16_t.h    **** 		ROW1("#8")
 348:tile16_t.h    **** 
 349:tile16_t.h    **** 		"	add	%[bp], %[bp], #(8+8)		\n"	
 350:tile16_t.h    **** 		"	add	%[screen], %[screen], #(640-16)	\n" 
 351:tile16_t.h    **** 		"	add	%[depth], %[depth], #(320-8)	\n"
 352:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 353:tile16_t.h    **** 		"	bne	2b"
 354:tile16_t.h    **** 
 355:tile16_t.h    **** 		// output
 356:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
 357:tile16_t.h    **** 		// input
 358:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 359:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 360:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 361:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 362:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 363:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 364:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 365:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 366:tile16_t.h    **** 		  [bp] "r" (pCache + StartLine + 7)
 367:tile16_t.h    **** 		// clobbered
 368:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 369:tile16_t.h    **** 		);
 279              		.loc 1 369 0
 280 0304 0CC08EE0 		add	ip, lr, ip
 281 0308 00E09DE5 		ldr	lr, [sp, #0]
 282 030c 01008AE0 		add	r0, sl, r1
 283 0310 8210A0E1 		mov	r1, r2, asl #1
 284 0314 012043E2 		sub	r2, r3, #1
 285 0318 07308EE2 		add	r3, lr, #7
 286              	#APP
 287              		2:						
 288 031c 0180D0E4 		ldrb	r8, [r0], #1		
 289 0320 08A0A0E3 		mov	r10, #8			
 290              	7:
 291 0324 080056E1 		cmp	r6, r8			
 292 0328 0090D385 		ldrhib	r9, [r3]			
 293 032c DF00009A 		bls	3f				
 294 0330 0991B0E1 		movs	r9, r9, lsl #2			
 295 0334 DF00000A 		beq	3f				
 296 0338 0080D2E7 		ldrb	r8, [r2, r0]	
 297 033c 099097E7 		ldr	r9, [r7, r9]		
 298 0340 015040E5 		strb	r5, [r0, #(-1)]	
 299 0344 010058E3 		cmp	r8, #1				
 300 0348 DE00003A 		blo	4f				
 301 034c B1809C11 		ldrneh	r8, [ip, r1]	
 302 0350 0480A001 		moveq	r8, r4		
 303 0354 828ED8E3 		bics	r8, r8, #0b00000100000100000	
 304 0358 DE00000A 		beq	999f 
 305 035c 829ED9E3 		bics	r9, r9, #0b00000100000100000	
 306 0360 089089E0 		add	r9, r9, r8 			
 307 0364 DE00000A 		beq	999f 
 308 0368 200019E3 		tst	r9, 	#0b00000000000100000	
 309 036c 1F908913 		orrne	r9, r9, #0b00000000000011111	
 310 0370 020B19E3 		tst	r9, 	#0b00000100000000000	
 311 0374 7E9E8913 		orrne	r9, r9, #0b00000011111100000	
ARM GAS  /tmp/ccV38c0o.s 			page 13


 312 0378 010819E3 		tst	r9, 	#0b10000000000000000	
 313 037c 3E9B8913 		orrne	r9, r9, #0b01111100000000000	
 314              	999:
 315              	4:						
 316 0380 B090CCE1 		strh	r9, [ip]		 	
 317              	3:						
 318 0384 01A05AE2 		subs	r10, r10, #1			
 319 0388 013043E2 		sub	r3, r3, #1  		
 320 038c 02C08CE2 		add	ip, ip, #2	
 321 0390 0180D014 		ldrneb	r8, [r0], #1		
 322 0394 C700001A 		bne	7b				
 323 0398 103083E2 		add	r3, r3, #(8+8)		
 324 039c 27CE8CE2 		add	ip, ip, #(640-16)	
 325 03a0 4E0F80E2 		add	r0, r0, #(320-8)	
 326 03a4 01B05BE2 		subs 	fp, fp, #1	
 327 03a8 C500001A 		bne	2b
 328              	.LVL20:
 329              	.LVL21:
 330              	.L13:
 331              	.LBE5:
 370:tile16_t.h    **** 
 371:tile16_t.h    **** 	}
 372:tile16_t.h    ****    }
 373:tile16_t.h    **** }
 332              		.loc 1 373 0
 333 03ac 08D08DE2 		add	sp, sp, #8
 334 03b0 F08FBDE8 		ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 335              	.L15:
 336              		.align	2
 337              	.L14:
 338 03b4 00000000 		.word	BG
 339 03b8 00000000 		.word	ConvertTile
 340 03bc 00000000 		.word	TileBlank
 341 03c0 00000000 		.word	GFX
 342              	.LFE26:
 343              		.size	_Z13DrawTile16Addjjjj, .-_Z13DrawTile16Addjjjj
 344              		.global	__gxx_personality_sj0
 345              		.align	2
 346 03c4 0000A0E1 		.p2align 5,,31
 346      0000A0E1 
 346      0000A0E1 
 346      0000A0E1 
 346      0000A0E1 
 347              		.global	_Z20DrawClippedTile16Addjjjjjj
 348              		.type	_Z20DrawClippedTile16Addjjjjjj, %function
 349              	_Z20DrawClippedTile16Addjjjjjj:
 350              	.LFB27:
 374:tile16_t.h    **** 
 375:tile16_t.h    **** // DrawClippedTile16 -----------------------------------------
 376:tile16_t.h    **** DEC_DRAWCLIPPED(ROPNAME)
 351              		.loc 1 376 0
 352              		@ args = 8, pretend = 0, frame = 4
 353              		@ frame_needed = 0, uses_anonymous_args = 0
 354              	.LVL22:
 355 03e0 F04F2DE9 		stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 356              	.LCFI2:
 357              	.LBB6:
ARM GAS  /tmp/ccV38c0o.s 			page 14


 377:tile16_t.h    **** {
 378:tile16_t.h    **** if (Width == 0) return;
 358              		.loc 1 378 0
 359 03e4 00B053E2 		subs	fp, r3, #0
 360              	.LBE6:
 361              		.loc 1 376 0
 362 03e8 04D04DE2 		sub	sp, sp, #4
 363              	.LCFI3:
 364              		.loc 1 376 0
 365 03ec 00A0A0E1 		mov	sl, r0
 366 03f0 00108DE5 		str	r1, [sp, #0]
 367 03f4 0290A0E1 		mov	r9, r2
 368 03f8 2C709DE5 		ldr	r7, [sp, #44]
 369              	.LBB7:
 370              		.loc 1 378 0
 371 03fc F401000A 		beq	.L29
 372              	.LVL23:
 379:tile16_t.h    **** 
 380:tile16_t.h    ****      TILE_PREAMBLE 
 373              		.loc 1 380 0
 374 0400 D8539FE5 		ldr	r5, .L30
 375 0404 002BA0E1 		mov	r2, r0, asl #22
 376 0408 081095E5 		ldr	r1, [r5, #8]
 377 040c 0C3095E5 		ldr	r3, [r5, #12]
 378 0410 222BA0E1 		mov	r2, r2, lsr #22
 379 0414 123183E0 		add	r3, r3, r2, asl r1
 380 0418 03C8A0E1 		mov	ip, r3, asl #16
 381              	.LVL24:
 382 041c 2CC8A0E1 		mov	ip, ip, lsr #16
 383 0420 286095E5 		ldr	r6, [r5, #40]
 384 0424 3C81A0E1 		mov	r8, ip, lsr r1
 385              	.LVL25:
 386 0428 0630D8E7 		ldrb	r3, [r8, r6]	@ zero_extendqisi2
 387 042c 242095E5 		ldr	r2, [r5, #36]
 388 0430 000053E3 		cmp	r3, #0
 389 0434 084382E0 		add	r4, r2, r8, asl #6
 390              	.LVL26:
 391 0438 1301001A 		bne	.L19
 392              	.LVL27:
 393 043c 0C10A0E1 		mov	r1, ip
 394 0440 0400A0E1 		mov	r0, r4
 395              	.LVL28:
 396 0444 98339FE5 		ldr	r3, .L30+4
 397 0448 0FE0A0E1 		mov	lr, pc
 398 044c 00F093E5 		ldr	pc, [r3, #0]
 399              	.LVL29:
 400 0450 0600C8E7 		strb	r0, [r8, r6]
 401              	.LVL30:
 402              	.L19:
 403 0454 283095E5 		ldr	r3, [r5, #40]
 404 0458 0830D3E7 		ldrb	r3, [r3, r8]	@ zero_extendqisi2
 405 045c 020053E3 		cmp	r3, #2
 406 0460 80339F05 		ldreq	r3, .L30+8
 407 0464 00A08305 		streq	sl, [r3, #0]
 408 0468 F401000A 		beq	.L29
 409 046c 78039FE5 		ldr	r0, .L30+12
 381:tile16_t.h    **** 
ARM GAS  /tmp/ccV38c0o.s 			page 15


 382:tile16_t.h    **** Offset = Offset + StartPixel;
 383:tile16_t.h    **** if (Tile & V_FLIP){
 410              		.loc 1 383 0
 411 0470 02091AE3 		tst	sl, #32768
 412              		.loc 1 380 0
 413 0474 343090E5 		ldr	r3, [r0, #52]
 414 0478 381090E5 		ldr	r1, [r0, #56]
 415 047c 302090E5 		ldr	r2, [r0, #48]
 416 0480 03300AE0 		and	r3, sl, r3
 417 0484 3331A0E1 		mov	r3, r3, lsr r1
 418 0488 036182E0 		add	r6, r2, r3, asl #2
 419              		.loc 1 382 0
 420 048c 00209DE5 		ldr	r2, [sp, #0]
 421              		.loc 1 380 0
 422 0490 2C6080E5 		str	r6, [r0, #44]
 423              		.loc 1 382 0
 424 0494 091082E0 		add	r1, r2, r9
 425              	.LVL31:
 426 0498 01290AE2 		and	r2, sl, #16384
 427              		.loc 1 383 0
 428 049c 8E01000A 		beq	.L23
 384:tile16_t.h    ****     if (!(Tile & H_FLIP)){
 429              		.loc 1 384 0
 430 04a0 000052E3 		cmp	r2, #0
 431 04a4 28209DE5 		ldr	r2, [sp, #40]
 432 04a8 3CA090E5 		ldr	sl, [r0, #60]
 433              	.LVL32:
 434 04ac 043062E0 		rsb	r3, r2, r4
 435 04b0 4050D0E5 		ldrb	r5, [r0, #64]	@ zero_extendqisi2
 436 04b4 4140D0E5 		ldrb	r4, [r0, #65]	@ zero_extendqisi2
 437              	.LVL33:
 438 04b8 142090E5 		ldr	r2, [r0, #20]
 439 04bc 44E090E5 		ldr	lr, [r0, #68]
 440 04c0 24C090E5 		ldr	ip, [r0, #36]
 441              	.LVL34:
 442 04c4 8180A0E1 		mov	r8, r1, asl #1
 443              	.LVL35:
 444 04c8 080090E5 		ldr	r0, [r0, #8]
 445 04cc 6001001A 		bne	.L25
 446              	.LVL36:
 385:tile16_t.h    **** 		asm volatile (
 386:tile16_t.h    **** 		"2:					\n"
 387:tile16_t.h    **** 
 388:tile16_t.h    **** 		ROW("%[width]")
 389:tile16_t.h    **** 
 390:tile16_t.h    **** 		// Loop	
 391:tile16_t.h    **** 		"1:						\n"	
 392:tile16_t.h    **** 		"	sub	%[bp], %[bp], #8		\n"
 393:tile16_t.h    **** 		"	add	%[screen], %[screen], #640	\n" 
 394:tile16_t.h    **** 		"	add	%[depth], %[depth], #320	\n" 
 395:tile16_t.h    **** 		// --
 396:tile16_t.h    **** 		"	sub	%[bp], %[bp], %[width]		\n"
 397:tile16_t.h    **** 		"	sub	%[screen], %[screen], %[width], lsl #1	\n"
 398:tile16_t.h    **** 		"	sub	%[depth], %[depth], %[width]	\n"
 399:tile16_t.h    **** 		// --
 400:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 401:tile16_t.h    **** 		"	bne	2b"
ARM GAS  /tmp/ccV38c0o.s 			page 16


 402:tile16_t.h    **** 		// output
 403:tile16_t.h    **** 		: [lcount] "+r" (LineCount)	
 404:tile16_t.h    **** 		// input
 405:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 406:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 407:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 408:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 409:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 410:tile16_t.h    **** 		  [width] "r" (Width),
 411:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 412:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 413:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 414:tile16_t.h    **** 		  [bp] "r" (pCache + 56 - StartLine + StartPixel)
 415:tile16_t.h    **** 		// clobbered
 416:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 417:tile16_t.h    **** 		);
 447              		.loc 1 417 0
 448 04d0 093083E0 		add	r3, r3, r9
 449 04d4 000081E0 		add	r0, r1, r0
 450 04d8 0CC088E0 		add	ip, r8, ip
 451 04dc 8210A0E1 		mov	r1, r2, asl #1
 452              	.LVL37:
 453 04e0 383083E2 		add	r3, r3, #56
 454 04e4 01204AE2 		sub	r2, sl, #1
 455              	#APP
 456              		2:					
 457 04e8 0180D0E4 		ldrb	r8, [r0], #1		
 458 04ec 0BA0A0E1 		mov	r10, fp			
 459              	7:
 460 04f0 080055E1 		cmp	r5, r8			
 461 04f4 0090D385 		ldrhib	r9, [r3]		
 462 04f8 5201009A 		bls	3f				
 463 04fc 0991B0E1 		movs	r9, r9, lsl #2			
 464 0500 5201000A 		beq	3f				
 465 0504 0080D2E7 		ldrb	r8, [r2, r0]	
 466 0508 099096E7 		ldr	r9, [r6, r9]		
 467 050c 014040E5 		strb	r4, [r0, #(-1)]	
 468 0510 010058E3 		cmp	r8, #1				
 469 0514 5101003A 		blo	4f				
 470 0518 B1809C11 		ldrneh	r8, [ip, r1]	
 471 051c 0E80A001 		moveq	r8, lr		
 472 0520 828ED8E3 		bics	r8, r8, #0b00000100000100000	
 473 0524 5101000A 		beq	999f 
 474 0528 829ED9E3 		bics	r9, r9, #0b00000100000100000	
 475 052c 089089E0 		add	r9, r9, r8 			
 476 0530 5101000A 		beq	999f 
 477 0534 200019E3 		tst	r9, 	#0b00000000000100000	
 478 0538 1F908913 		orrne	r9, r9, #0b00000000000011111	
 479 053c 020B19E3 		tst	r9, 	#0b00000100000000000	
 480 0540 7E9E8913 		orrne	r9, r9, #0b00000011111100000	
 481 0544 010819E3 		tst	r9, 	#0b10000000000000000	
 482 0548 3E9B8913 		orrne	r9, r9, #0b01111100000000000	
 483              	999:
 484              	4:						
 485 054c B090CCE1 		strh	r9, [ip] 	
 486              	3:						
 487 0550 01A05AE2 		subs	r10, r10, #1			
ARM GAS  /tmp/ccV38c0o.s 			page 17


 488 0554 013083E2 		add	r3, r3, #1		
 489 0558 02C08CE2 		add	ip, ip, #2	
 490 055c 0180D014 		ldrneb	r8, [r0], #1		
 491 0560 3A01001A 		bne	7b				
 492              	1:						
 493 0564 083043E2 		sub	r3, r3, #8		
 494 0568 0ACD8CE2 		add	ip, ip, #640	
 495 056c 050D80E2 		add	r0, r0, #320	
 496 0570 0B3043E0 		sub	r3, r3, fp		
 497 0574 8BC04CE0 		sub	ip, ip, fp, lsl #1	
 498 0578 0B0040E0 		sub	r0, r0, fp	
 499 057c 017057E2 		subs 	r7, r7, #1	
 500 0580 3801001A 		bne	2b
 501              	.LVL38:
 502 0584 F40100EA 		b	.L29
 503              	.LVL39:
 504              	.L25:
 418:tile16_t.h    **** 	} else {
 419:tile16_t.h    **** 		asm volatile (
 420:tile16_t.h    **** 		"2:					\n"
 421:tile16_t.h    **** 		ROW1("%[width]")
 422:tile16_t.h    **** 		// Loop	
 423:tile16_t.h    **** 		"1:						\n"	
 424:tile16_t.h    **** 		"	sub	%[bp], %[bp], #8		\n"	
 425:tile16_t.h    **** 		"	add	%[screen], %[screen], #640	\n" 
 426:tile16_t.h    **** 		"	add	%[depth], %[depth], #320	\n" 
 427:tile16_t.h    **** 		// --
 428:tile16_t.h    **** 		"	add	%[bp], %[bp], %[width]		\n"
 429:tile16_t.h    **** 		"	sub	%[screen], %[screen], %[width], lsl #1	\n"
 430:tile16_t.h    **** 		"	sub	%[depth], %[depth], %[width]	\n"
 431:tile16_t.h    **** 		// --
 432:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 433:tile16_t.h    **** 		"	bne	2b"
 434:tile16_t.h    **** 		// output
 435:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
 436:tile16_t.h    **** 		// input
 437:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 438:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 439:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 440:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 441:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 442:tile16_t.h    **** 		  [width] "r" (Width),
 443:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 444:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 445:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 446:tile16_t.h    **** 		  [bp] "r" (pCache + 56 - StartLine - StartPixel + 7)
 447:tile16_t.h    **** 		// clobbered
 448:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 449:tile16_t.h    **** 		);
 505              		.loc 1 449 0
 506 0588 033069E0 		rsb	r3, r9, r3
 507 058c 000081E0 		add	r0, r1, r0
 508 0590 0CC088E0 		add	ip, r8, ip
 509 0594 8210A0E1 		mov	r1, r2, asl #1
 510              	.LVL40:
 511 0598 3F3083E2 		add	r3, r3, #63
 512 059c 01204AE2 		sub	r2, sl, #1
ARM GAS  /tmp/ccV38c0o.s 			page 18


 513              	#APP
 514              		2:					
 515 05a0 0180D0E4 		ldrb	r8, [r0], #1		
 516 05a4 0BA0A0E1 		mov	r10, fp			
 517              	7:
 518 05a8 080055E1 		cmp	r5, r8			
 519 05ac 0090D385 		ldrhib	r9, [r3]			
 520 05b0 8001009A 		bls	3f				
 521 05b4 0991B0E1 		movs	r9, r9, lsl #2			
 522 05b8 8001000A 		beq	3f				
 523 05bc 0080D2E7 		ldrb	r8, [r2, r0]	
 524 05c0 099096E7 		ldr	r9, [r6, r9]		
 525 05c4 014040E5 		strb	r4, [r0, #(-1)]	
 526 05c8 010058E3 		cmp	r8, #1				
 527 05cc 7F01003A 		blo	4f				
 528 05d0 B1809C11 		ldrneh	r8, [ip, r1]	
 529 05d4 0E80A001 		moveq	r8, lr		
 530 05d8 828ED8E3 		bics	r8, r8, #0b00000100000100000	
 531 05dc 7F01000A 		beq	999f 
 532 05e0 829ED9E3 		bics	r9, r9, #0b00000100000100000	
 533 05e4 089089E0 		add	r9, r9, r8 			
 534 05e8 7F01000A 		beq	999f 
 535 05ec 200019E3 		tst	r9, 	#0b00000000000100000	
 536 05f0 1F908913 		orrne	r9, r9, #0b00000000000011111	
 537 05f4 020B19E3 		tst	r9, 	#0b00000100000000000	
 538 05f8 7E9E8913 		orrne	r9, r9, #0b00000011111100000	
 539 05fc 010819E3 		tst	r9, 	#0b10000000000000000	
 540 0600 3E9B8913 		orrne	r9, r9, #0b01111100000000000	
 541              	999:
 542              	4:						
 543 0604 B090CCE1 		strh	r9, [ip]		 	
 544              	3:						
 545 0608 01A05AE2 		subs	r10, r10, #1			
 546 060c 013043E2 		sub	r3, r3, #1  		
 547 0610 02C08CE2 		add	ip, ip, #2	
 548 0614 0180D014 		ldrneb	r8, [r0], #1		
 549 0618 6801001A 		bne	7b				
 550              	1:						
 551 061c 083043E2 		sub	r3, r3, #8		
 552 0620 0ACD8CE2 		add	ip, ip, #640	
 553 0624 050D80E2 		add	r0, r0, #320	
 554 0628 0B3083E0 		add	r3, r3, fp		
 555 062c 8BC04CE0 		sub	ip, ip, fp, lsl #1	
 556 0630 0B0040E0 		sub	r0, r0, fp	
 557 0634 017057E2 		subs 	r7, r7, #1	
 558 0638 6601001A 		bne	2b
 559              	.LVL41:
 560 063c F40100EA 		b	.L29
 561              	.LVL42:
 562              	.L23:
 450:tile16_t.h    **** 	}
 451:tile16_t.h    **** } else {
 452:tile16_t.h    ****     if (!(Tile & H_FLIP)){
 563              		.loc 1 452 0
 564 0640 000052E3 		cmp	r2, #0
 565 0644 28209DE5 		ldr	r2, [sp, #40]
 566 0648 3CA090E5 		ldr	sl, [r0, #60]
ARM GAS  /tmp/ccV38c0o.s 			page 19


 567              	.LVL43:
 568 064c 023084E0 		add	r3, r4, r2
 569 0650 4050D0E5 		ldrb	r5, [r0, #64]	@ zero_extendqisi2
 570 0654 4140D0E5 		ldrb	r4, [r0, #65]	@ zero_extendqisi2
 571              	.LVL44:
 572 0658 142090E5 		ldr	r2, [r0, #20]
 573 065c 44E090E5 		ldr	lr, [r0, #68]
 574 0660 24C090E5 		ldr	ip, [r0, #36]
 575              	.LVL45:
 576 0664 8180A0E1 		mov	r8, r1, asl #1
 577              	.LVL46:
 578 0668 080090E5 		ldr	r0, [r0, #8]
 579 066c C701001A 		bne	.L27
 580              	.LVL47:
 453:tile16_t.h    **** 		asm volatile (
 454:tile16_t.h    **** 		"2:					\n"
 455:tile16_t.h    **** 		ROW("%[width]")
 456:tile16_t.h    **** 		// Loop	
 457:tile16_t.h    **** 		"1:						\n"
 458:tile16_t.h    **** 		"	add	%[bp], %[bp], #8		\n"	
 459:tile16_t.h    **** 		"	add	%[screen], %[screen], #640	\n" 
 460:tile16_t.h    **** 		"	add	%[depth], %[depth], #320	\n" 
 461:tile16_t.h    **** 		// --
 462:tile16_t.h    **** 		"	sub	%[bp], %[bp], %[width]		\n"
 463:tile16_t.h    **** 		"	sub	%[screen], %[screen], %[width], lsl #1	\n"
 464:tile16_t.h    **** 		"	sub	%[depth], %[depth], %[width]	\n"
 465:tile16_t.h    **** 		// --
 466:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 467:tile16_t.h    **** 		"	bne	2b"
 468:tile16_t.h    **** 		// output
 469:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
 470:tile16_t.h    **** 		// input
 471:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 472:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 473:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 474:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 475:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 476:tile16_t.h    **** 		  [width] "r" (Width),
 477:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 478:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 479:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 480:tile16_t.h    **** 		  [bp] "r" (pCache + StartLine + StartPixel)	
 481:tile16_t.h    **** 		// clobbered
 482:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 483:tile16_t.h    **** 		);
 581              		.loc 1 483 0
 582 0670 000081E0 		add	r0, r1, r0
 583 0674 0CC088E0 		add	ip, r8, ip
 584 0678 091083E0 		add	r1, r3, r9
 585              	.LVL48:
 586 067c 8220A0E1 		mov	r2, r2, asl #1
 587 0680 01304AE2 		sub	r3, sl, #1
 588              	#APP
 589              		2:					
 590 0684 0180D0E4 		ldrb	r8, [r0], #1		
 591 0688 0BA0A0E1 		mov	r10, fp			
 592              	7:
ARM GAS  /tmp/ccV38c0o.s 			page 20


 593 068c 080055E1 		cmp	r5, r8			
 594 0690 0090D185 		ldrhib	r9, [r1]		
 595 0694 B901009A 		bls	3f				
 596 0698 0991B0E1 		movs	r9, r9, lsl #2			
 597 069c B901000A 		beq	3f				
 598 06a0 0080D3E7 		ldrb	r8, [r3, r0]	
 599 06a4 099096E7 		ldr	r9, [r6, r9]		
 600 06a8 014040E5 		strb	r4, [r0, #(-1)]	
 601 06ac 010058E3 		cmp	r8, #1				
 602 06b0 B801003A 		blo	4f				
 603 06b4 B2809C11 		ldrneh	r8, [ip, r2]	
 604 06b8 0E80A001 		moveq	r8, lr		
 605 06bc 828ED8E3 		bics	r8, r8, #0b00000100000100000	
 606 06c0 B801000A 		beq	999f 
 607 06c4 829ED9E3 		bics	r9, r9, #0b00000100000100000	
 608 06c8 089089E0 		add	r9, r9, r8 			
 609 06cc B801000A 		beq	999f 
 610 06d0 200019E3 		tst	r9, 	#0b00000000000100000	
 611 06d4 1F908913 		orrne	r9, r9, #0b00000000000011111	
 612 06d8 020B19E3 		tst	r9, 	#0b00000100000000000	
 613 06dc 7E9E8913 		orrne	r9, r9, #0b00000011111100000	
 614 06e0 010819E3 		tst	r9, 	#0b10000000000000000	
 615 06e4 3E9B8913 		orrne	r9, r9, #0b01111100000000000	
 616              	999:
 617              	4:						
 618 06e8 B090CCE1 		strh	r9, [ip] 	
 619              	3:						
 620 06ec 01A05AE2 		subs	r10, r10, #1			
 621 06f0 011081E2 		add	r1, r1, #1		
 622 06f4 02C08CE2 		add	ip, ip, #2	
 623 06f8 0180D014 		ldrneb	r8, [r0], #1		
 624 06fc A101001A 		bne	7b				
 625              	1:						
 626 0700 081081E2 		add	r1, r1, #8		
 627 0704 0ACD8CE2 		add	ip, ip, #640	
 628 0708 050D80E2 		add	r0, r0, #320	
 629 070c 0B1041E0 		sub	r1, r1, fp		
 630 0710 8BC04CE0 		sub	ip, ip, fp, lsl #1	
 631 0714 0B0040E0 		sub	r0, r0, fp	
 632 0718 017057E2 		subs 	r7, r7, #1	
 633 071c 9F01001A 		bne	2b
 634              	.LVL49:
 635 0720 F40100EA 		b	.L29
 636              	.LVL50:
 637              	.L27:
 484:tile16_t.h    **** 	} else {
 485:tile16_t.h    **** 		asm volatile (
 486:tile16_t.h    **** 		"2:					\n"
 487:tile16_t.h    **** 		ROW1("%[width]")
 488:tile16_t.h    **** 		// Loop	
 489:tile16_t.h    **** 		"1:						\n"	
 490:tile16_t.h    **** 		"	add	%[bp], %[bp], #8		\n"	
 491:tile16_t.h    **** 		"	add	%[screen], %[screen], #640	\n" 
 492:tile16_t.h    **** 		"	add	%[depth], %[depth], #320	\n" 
 493:tile16_t.h    **** 		// --
 494:tile16_t.h    **** 		"	add	%[bp], %[bp], %[width]		\n"
 495:tile16_t.h    **** 		"	sub	%[screen], %[screen], %[width], lsl #1	\n"
ARM GAS  /tmp/ccV38c0o.s 			page 21


 496:tile16_t.h    **** 		"	sub	%[depth], %[depth], %[width]	\n"
 497:tile16_t.h    **** 		// --		
 498:tile16_t.h    **** 		"	subs 	%[lcount], %[lcount], #1	\n"
 499:tile16_t.h    **** 		"	bne	2b"
 500:tile16_t.h    **** 		// output
 501:tile16_t.h    **** 		: [lcount] "+r" (LineCount)
 502:tile16_t.h    **** 		// input
 503:tile16_t.h    **** 		: [gfx_z1] "r" (GFX.Z1),
 504:tile16_t.h    **** 		  [gfx_z2] "r" (GFX.Z2),
 505:tile16_t.h    **** 		  [colors] "r" (GFX.ScreenColors),
 506:tile16_t.h    **** 		  [delta] "r" (GFX.Delta << 1),
 507:tile16_t.h    **** 		  [fixedcolour] "r" (GFX.FixedColour),
 508:tile16_t.h    **** 		  [width] "r" (Width),
 509:tile16_t.h    **** 		  [screen] "r" ((uint16 *) GFX.S + Offset),
 510:tile16_t.h    **** 		  [depth] "r" (GFX.ZBuffer + Offset),
 511:tile16_t.h    **** 		  [subdepth] "r" (GFX.DepthDelta - 1),
 512:tile16_t.h    **** 		  [bp] "r" (pCache + StartLine - StartPixel + 7)
 513:tile16_t.h    **** 		// clobbered
 514:tile16_t.h    **** 		: "r8", "r9", "r10", "cc" 				
 515:tile16_t.h    **** 		);
 638              		.loc 1 515 0
 639 0724 033069E0 		rsb	r3, r9, r3
 640 0728 000081E0 		add	r0, r1, r0
 641 072c 0CC088E0 		add	ip, r8, ip
 642 0730 8210A0E1 		mov	r1, r2, asl #1
 643              	.LVL51:
 644 0734 073083E2 		add	r3, r3, #7
 645 0738 01204AE2 		sub	r2, sl, #1
 646              	#APP
 647              		2:					
 648 073c 0180D0E4 		ldrb	r8, [r0], #1		
 649 0740 0BA0A0E1 		mov	r10, fp			
 650              	7:
 651 0744 080055E1 		cmp	r5, r8			
 652 0748 0090D385 		ldrhib	r9, [r3]			
 653 074c E701009A 		bls	3f				
 654 0750 0991B0E1 		movs	r9, r9, lsl #2			
 655 0754 E701000A 		beq	3f				
 656 0758 0080D2E7 		ldrb	r8, [r2, r0]	
 657 075c 099096E7 		ldr	r9, [r6, r9]		
 658 0760 014040E5 		strb	r4, [r0, #(-1)]	
 659 0764 010058E3 		cmp	r8, #1				
 660 0768 E601003A 		blo	4f				
 661 076c B1809C11 		ldrneh	r8, [ip, r1]	
 662 0770 0E80A001 		moveq	r8, lr		
 663 0774 828ED8E3 		bics	r8, r8, #0b00000100000100000	
 664 0778 E601000A 		beq	999f 
 665 077c 829ED9E3 		bics	r9, r9, #0b00000100000100000	
 666 0780 089089E0 		add	r9, r9, r8 			
 667 0784 E601000A 		beq	999f 
 668 0788 200019E3 		tst	r9, 	#0b00000000000100000	
 669 078c 1F908913 		orrne	r9, r9, #0b00000000000011111	
 670 0790 020B19E3 		tst	r9, 	#0b00000100000000000	
 671 0794 7E9E8913 		orrne	r9, r9, #0b00000011111100000	
 672 0798 010819E3 		tst	r9, 	#0b10000000000000000	
 673 079c 3E9B8913 		orrne	r9, r9, #0b01111100000000000	
 674              	999:
ARM GAS  /tmp/ccV38c0o.s 			page 22


 675              	4:						
 676 07a0 B090CCE1 		strh	r9, [ip]		 	
 677              	3:						
 678 07a4 01A05AE2 		subs	r10, r10, #1			
 679 07a8 013043E2 		sub	r3, r3, #1  		
 680 07ac 02C08CE2 		add	ip, ip, #2	
 681 07b0 0180D014 		ldrneb	r8, [r0], #1		
 682 07b4 CF01001A 		bne	7b				
 683              	1:						
 684 07b8 083083E2 		add	r3, r3, #8		
 685 07bc 0ACD8CE2 		add	ip, ip, #640	
 686 07c0 050D80E2 		add	r0, r0, #320	
 687 07c4 0B3083E0 		add	r3, r3, fp		
 688 07c8 8BC04CE0 		sub	ip, ip, fp, lsl #1	
 689 07cc 0B0040E0 		sub	r0, r0, fp	
 690 07d0 017057E2 		subs 	r7, r7, #1	
 691 07d4 CD01001A 		bne	2b
 692              	.LVL52:
 693              	.LVL53:
 694              	.L29:
 695              	.LBE7:
 516:tile16_t.h    **** 
 517:tile16_t.h    **** 	}
 518:tile16_t.h    ****    }
 519:tile16_t.h    **** }
 696              		.loc 1 519 0
 697 07d8 04D08DE2 		add	sp, sp, #4
 698 07dc F08FBDE8 		ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 699              	.L31:
 700              		.align	2
 701              	.L30:
 702 07e0 00000000 		.word	BG
 703 07e4 00000000 		.word	ConvertTile
 704 07e8 00000000 		.word	TileBlank
 705 07ec 00000000 		.word	GFX
 706              	.LFE27:
 707              		.size	_Z20DrawClippedTile16Addjjjjjj, .-_Z20DrawClippedTile16Addjjjjjj
 708              		.section	.debug_frame,"",%progbits
 709              	.Lframe0:
 710 0000 0C000000 		.4byte	.LECIE0-.LSCIE0
 711              	.LSCIE0:
 712 0004 FFFFFFFF 		.4byte	0xffffffff
 713 0008 01       		.byte	0x1
 714 0009 00       		.ascii	"\000"
 715 000a 01       		.uleb128 0x1
 716 000b 7C       		.sleb128 -4
 717 000c 0E       		.byte	0xe
 718 000d 0C       		.byte	0xc
 719 000e 0D       		.uleb128 0xd
 720 000f 00       		.uleb128 0x0
 721              		.align	2
 722              	.LECIE0:
 723              	.LSFDE0:
 724 0010 24000000 		.4byte	.LEFDE0-.LASFDE0
 725              	.LASFDE0:
 726 0014 00000000 		.4byte	.Lframe0
 727 0018 00000000 		.4byte	.LFB26
ARM GAS  /tmp/ccV38c0o.s 			page 23


 728 001c C4030000 		.4byte	.LFE26-.LFB26
 729 0020 44       		.byte	0x4
 730              		.4byte	.LCFI0-.LFB26
 731 0021 0E       		.byte	0xe
 732 0022 24       		.uleb128 0x24
 733 0023 8E       		.byte	0x8e
 734 0024 01       		.uleb128 0x1
 735 0025 8B       		.byte	0x8b
 736 0026 02       		.uleb128 0x2
 737 0027 8A       		.byte	0x8a
 738 0028 03       		.uleb128 0x3
 739 0029 89       		.byte	0x89
 740 002a 04       		.uleb128 0x4
 741 002b 88       		.byte	0x88
 742 002c 05       		.uleb128 0x5
 743 002d 87       		.byte	0x87
 744 002e 06       		.uleb128 0x6
 745 002f 86       		.byte	0x86
 746 0030 07       		.uleb128 0x7
 747 0031 85       		.byte	0x85
 748 0032 08       		.uleb128 0x8
 749 0033 84       		.byte	0x84
 750 0034 09       		.uleb128 0x9
 751 0035 78       		.byte	0x4
 752              		.4byte	.LCFI1-.LCFI0
 753 0036 0E       		.byte	0xe
 754 0037 2C       		.uleb128 0x2c
 755              		.align	2
 756              	.LEFDE0:
 757              	.LSFDE2:
 758 0038 24000000 		.4byte	.LEFDE2-.LASFDE2
 759              	.LASFDE2:
 760 003c 00000000 		.4byte	.Lframe0
 761 0040 E0030000 		.4byte	.LFB27
 762 0044 10040000 		.4byte	.LFE27-.LFB27
 763 0048 44       		.byte	0x4
 764              		.4byte	.LCFI2-.LFB27
 765 0049 0E       		.byte	0xe
 766 004a 24       		.uleb128 0x24
 767 004b 8E       		.byte	0x8e
 768 004c 01       		.uleb128 0x1
 769 004d 8B       		.byte	0x8b
 770 004e 02       		.uleb128 0x2
 771 004f 8A       		.byte	0x8a
 772 0050 03       		.uleb128 0x3
 773 0051 89       		.byte	0x89
 774 0052 04       		.uleb128 0x4
 775 0053 88       		.byte	0x88
 776 0054 05       		.uleb128 0x5
 777 0055 87       		.byte	0x87
 778 0056 06       		.uleb128 0x6
 779 0057 86       		.byte	0x86
 780 0058 07       		.uleb128 0x7
 781 0059 85       		.byte	0x85
 782 005a 08       		.uleb128 0x8
 783 005b 84       		.byte	0x84
 784 005c 09       		.uleb128 0x9
ARM GAS  /tmp/ccV38c0o.s 			page 24


 785 005d 48       		.byte	0x4
 786              		.4byte	.LCFI3-.LCFI2
 787 005e 0E       		.byte	0xe
 788 005f 28       		.uleb128 0x28
 789              		.align	2
 790              	.LEFDE2:
 791              		.file 2 "port.h"
 792              		.file 3 "<built-in>"
 793              		.file 4 "rops.h"
 794              		.file 5 "snes9x.h"
 795              		.file 6 "65c816.h"
 796              		.file 7 "memmap.h"
 797              		.file 8 "ppu.h"
 798              		.file 9 "gfx.h"
 799              		.file 10 "cpuexec.h"
 800              		.file 11 "tile16.h"
 801              		.text
 802              	.Letext0:
 803 07f0 0000A0E1 		.section	.debug_loc,"",%progbits
 803      0000A0E1 
 803      0000A0E1 
 803      0000A0E1 
 804              	.Ldebug_loc0:
 805              	.LLST0:
 806 0000 00000000 		.4byte	.LFB26-.Ltext0
 807 0004 04000000 		.4byte	.LCFI0-.Ltext0
 808 0008 0100     		.2byte	0x1
 809 000a 5D       		.byte	0x5d
 810 000b 04000000 		.4byte	.LCFI0-.Ltext0
 811 000f 3C000000 		.4byte	.LCFI1-.Ltext0
 812 0013 0200     		.2byte	0x2
 813 0015 7D       		.byte	0x7d
 814 0016 24       		.sleb128 36
 815 0017 3C000000 		.4byte	.LCFI1-.Ltext0
 816 001b C4030000 		.4byte	.LFE26-.Ltext0
 817 001f 0200     		.2byte	0x2
 818 0021 7D       		.byte	0x7d
 819 0022 2C       		.sleb128 44
 820 0023 00000000 		.4byte	0x0
 821 0027 00000000 		.4byte	0x0
 822              	.LLST1:
 823 002b 00000000 		.4byte	.LVL0-.Ltext0
 824 002f 18000000 		.4byte	.LVL1-.Ltext0
 825 0033 0100     		.2byte	0x1
 826 0035 50       		.byte	0x50
 827 0036 18000000 		.4byte	.LVL1-.Ltext0
 828 003a C0000000 		.4byte	.LVL8-.Ltext0
 829 003e 0100     		.2byte	0x1
 830 0040 58       		.byte	0x58
 831 0041 2C020000 		.4byte	.LVL14-.Ltext0
 832 0045 00030000 		.4byte	.LVL18-.Ltext0
 833 0049 0100     		.2byte	0x1
 834 004b 58       		.byte	0x58
 835 004c 04030000 		.4byte	.LVL19-.Ltext0
 836 0050 AC030000 		.4byte	.LVL20-.Ltext0
 837 0054 0100     		.2byte	0x1
 838 0056 58       		.byte	0x58
ARM GAS  /tmp/ccV38c0o.s 			page 25


 839 0057 AC030000 		.4byte	.LVL21-.Ltext0
 840 005b C4030000 		.4byte	.LFE26-.Ltext0
 841 005f 0100     		.2byte	0x1
 842 0061 58       		.byte	0x58
 843 0062 00000000 		.4byte	0x0
 844 0066 00000000 		.4byte	0x0
 845              	.LLST2:
 846 006a 00000000 		.4byte	.LVL0-.Ltext0
 847 006e 54000000 		.4byte	.LVL5-.Ltext0
 848 0072 0100     		.2byte	0x1
 849 0074 51       		.byte	0x51
 850 0075 54000000 		.4byte	.LVL5-.Ltext0
 851 0079 84010000 		.4byte	.LVL11-.Ltext0
 852 007d 0100     		.2byte	0x1
 853 007f 5A       		.byte	0x5a
 854 0080 88010000 		.4byte	.LVL12-.Ltext0
 855 0084 28020000 		.4byte	.LVL13-.Ltext0
 856 0088 0100     		.2byte	0x1
 857 008a 5A       		.byte	0x5a
 858 008b 2C020000 		.4byte	.LVL14-.Ltext0
 859 008f 00030000 		.4byte	.LVL18-.Ltext0
 860 0093 0100     		.2byte	0x1
 861 0095 5A       		.byte	0x5a
 862 0096 04030000 		.4byte	.LVL19-.Ltext0
 863 009a AC030000 		.4byte	.LVL20-.Ltext0
 864 009e 0100     		.2byte	0x1
 865 00a0 5A       		.byte	0x5a
 866 00a1 AC030000 		.4byte	.LVL21-.Ltext0
 867 00a5 C4030000 		.4byte	.LFE26-.Ltext0
 868 00a9 0100     		.2byte	0x1
 869 00ab 5A       		.byte	0x5a
 870 00ac 00000000 		.4byte	0x0
 871 00b0 00000000 		.4byte	0x0
 872              	.LLST3:
 873 00b4 00000000 		.4byte	.LVL0-.Ltext0
 874 00b8 54000000 		.4byte	.LVL5-.Ltext0
 875 00bc 0100     		.2byte	0x1
 876 00be 52       		.byte	0x52
 877 00bf 54000000 		.4byte	.LVL5-.Ltext0
 878 00c3 C4030000 		.4byte	.LFE26-.Ltext0
 879 00c7 0200     		.2byte	0x2
 880 00c9 91       		.byte	0x91
 881 00ca 74       		.sleb128 -12
 882 00cb 00000000 		.4byte	0x0
 883 00cf 00000000 		.4byte	0x0
 884              	.LLST4:
 885 00d3 00000000 		.4byte	.LVL0-.Ltext0
 886 00d7 54000000 		.4byte	.LVL5-.Ltext0
 887 00db 0100     		.2byte	0x1
 888 00dd 53       		.byte	0x53
 889 00de 54000000 		.4byte	.LVL5-.Ltext0
 890 00e2 C4030000 		.4byte	.LFE26-.Ltext0
 891 00e6 0100     		.2byte	0x1
 892 00e8 5B       		.byte	0x5b
 893 00e9 00000000 		.4byte	0x0
 894 00ed 00000000 		.4byte	0x0
 895              	.LLST5:
ARM GAS  /tmp/ccV38c0o.s 			page 26


 896 00f1 50000000 		.4byte	.LVL4-.Ltext0
 897 00f5 CC000000 		.4byte	.LVL9-.Ltext0
 898 00f9 0100     		.2byte	0x1
 899 00fb 56       		.byte	0x56
 900 00fc 2C020000 		.4byte	.LVL14-.Ltext0
 901 0100 38020000 		.4byte	.LVL15-.Ltext0
 902 0104 0100     		.2byte	0x1
 903 0106 56       		.byte	0x56
 904 0107 AC030000 		.4byte	.LVL21-.Ltext0
 905 010b C4030000 		.4byte	.LFE26-.Ltext0
 906 010f 0100     		.2byte	0x1
 907 0111 56       		.byte	0x56
 908 0112 00000000 		.4byte	0x0
 909 0116 00000000 		.4byte	0x0
 910              	.LLST6:
 911 011a 24000000 		.4byte	.LVL2-.Ltext0
 912 011e D0000000 		.4byte	.LVL10-.Ltext0
 913 0122 0100     		.2byte	0x1
 914 0124 54       		.byte	0x54
 915 0125 2C020000 		.4byte	.LVL14-.Ltext0
 916 0129 50020000 		.4byte	.LVL17-.Ltext0
 917 012d 0100     		.2byte	0x1
 918 012f 54       		.byte	0x54
 919 0130 AC030000 		.4byte	.LVL21-.Ltext0
 920 0134 C4030000 		.4byte	.LFE26-.Ltext0
 921 0138 0100     		.2byte	0x1
 922 013a 54       		.byte	0x54
 923 013b 00000000 		.4byte	0x0
 924 013f 00000000 		.4byte	0x0
 925              	.LLST7:
 926 0143 30000000 		.4byte	.LVL3-.Ltext0
 927 0147 BC000000 		.4byte	.LVL7-.Ltext0
 928 014b 0100     		.2byte	0x1
 929 014d 55       		.byte	0x55
 930 014e 2C020000 		.4byte	.LVL14-.Ltext0
 931 0152 48020000 		.4byte	.LVL16-.Ltext0
 932 0156 0100     		.2byte	0x1
 933 0158 55       		.byte	0x55
 934 0159 AC030000 		.4byte	.LVL21-.Ltext0
 935 015d C4030000 		.4byte	.LFE26-.Ltext0
 936 0161 0100     		.2byte	0x1
 937 0163 55       		.byte	0x55
 938 0164 00000000 		.4byte	0x0
 939 0168 00000000 		.4byte	0x0
 940              	.LLST8:
 941 016c E0030000 		.4byte	.LFB27-.Ltext0
 942 0170 E4030000 		.4byte	.LCFI2-.Ltext0
 943 0174 0100     		.2byte	0x1
 944 0176 5D       		.byte	0x5d
 945 0177 E4030000 		.4byte	.LCFI2-.Ltext0
 946 017b EC030000 		.4byte	.LCFI3-.Ltext0
 947 017f 0200     		.2byte	0x2
 948 0181 7D       		.byte	0x7d
 949 0182 24       		.sleb128 36
 950 0183 EC030000 		.4byte	.LCFI3-.Ltext0
 951 0187 F0070000 		.4byte	.LFE27-.Ltext0
 952 018b 0200     		.2byte	0x2
ARM GAS  /tmp/ccV38c0o.s 			page 27


 953 018d 7D       		.byte	0x7d
 954 018e 28       		.sleb128 40
 955 018f 00000000 		.4byte	0x0
 956 0193 00000000 		.4byte	0x0
 957              	.LLST9:
 958 0197 E0030000 		.4byte	.LVL22-.Ltext0
 959 019b 00040000 		.4byte	.LVL23-.Ltext0
 960 019f 0100     		.2byte	0x1
 961 01a1 50       		.byte	0x50
 962 01a2 00040000 		.4byte	.LVL23-.Ltext0
 963 01a6 3C040000 		.4byte	.LVL27-.Ltext0
 964 01aa 0100     		.2byte	0x1
 965 01ac 5A       		.byte	0x5a
 966 01ad 3C040000 		.4byte	.LVL27-.Ltext0
 967 01b1 44040000 		.4byte	.LVL28-.Ltext0
 968 01b5 0100     		.2byte	0x1
 969 01b7 50       		.byte	0x50
 970 01b8 44040000 		.4byte	.LVL28-.Ltext0
 971 01bc AC040000 		.4byte	.LVL32-.Ltext0
 972 01c0 0100     		.2byte	0x1
 973 01c2 5A       		.byte	0x5a
 974 01c3 40060000 		.4byte	.LVL42-.Ltext0
 975 01c7 4C060000 		.4byte	.LVL43-.Ltext0
 976 01cb 0100     		.2byte	0x1
 977 01cd 5A       		.byte	0x5a
 978 01ce D8070000 		.4byte	.LVL53-.Ltext0
 979 01d2 F0070000 		.4byte	.LFE27-.Ltext0
 980 01d6 0100     		.2byte	0x1
 981 01d8 5A       		.byte	0x5a
 982 01d9 00000000 		.4byte	0x0
 983 01dd 00000000 		.4byte	0x0
 984              	.LLST10:
 985 01e1 E0030000 		.4byte	.LVL22-.Ltext0
 986 01e5 00040000 		.4byte	.LVL23-.Ltext0
 987 01e9 0100     		.2byte	0x1
 988 01eb 51       		.byte	0x51
 989 01ec 00040000 		.4byte	.LVL23-.Ltext0
 990 01f0 98040000 		.4byte	.LVL31-.Ltext0
 991 01f4 0200     		.2byte	0x2
 992 01f6 91       		.byte	0x91
 993 01f7 74       		.sleb128 -12
 994 01f8 98040000 		.4byte	.LVL31-.Ltext0
 995 01fc E0040000 		.4byte	.LVL37-.Ltext0
 996 0200 0100     		.2byte	0x1
 997 0202 51       		.byte	0x51
 998 0203 88050000 		.4byte	.LVL39-.Ltext0
 999 0207 98050000 		.4byte	.LVL40-.Ltext0
 1000 020b 0100     		.2byte	0x1
 1001 020d 51       		.byte	0x51
 1002 020e 40060000 		.4byte	.LVL42-.Ltext0
 1003 0212 7C060000 		.4byte	.LVL48-.Ltext0
 1004 0216 0100     		.2byte	0x1
 1005 0218 51       		.byte	0x51
 1006 0219 24070000 		.4byte	.LVL50-.Ltext0
 1007 021d 34070000 		.4byte	.LVL51-.Ltext0
 1008 0221 0100     		.2byte	0x1
 1009 0223 51       		.byte	0x51
ARM GAS  /tmp/ccV38c0o.s 			page 28


 1010 0224 D8070000 		.4byte	.LVL53-.Ltext0
 1011 0228 F0070000 		.4byte	.LFE27-.Ltext0
 1012 022c 0200     		.2byte	0x2
 1013 022e 91       		.byte	0x91
 1014 022f 74       		.sleb128 -12
 1015 0230 00000000 		.4byte	0x0
 1016 0234 00000000 		.4byte	0x0
 1017              	.LLST11:
 1018 0238 E0030000 		.4byte	.LVL22-.Ltext0
 1019 023c 00040000 		.4byte	.LVL23-.Ltext0
 1020 0240 0100     		.2byte	0x1
 1021 0242 52       		.byte	0x52
 1022 0243 00040000 		.4byte	.LVL23-.Ltext0
 1023 0247 84050000 		.4byte	.LVL38-.Ltext0
 1024 024b 0100     		.2byte	0x1
 1025 024d 59       		.byte	0x59
 1026 024e 88050000 		.4byte	.LVL39-.Ltext0
 1027 0252 3C060000 		.4byte	.LVL41-.Ltext0
 1028 0256 0100     		.2byte	0x1
 1029 0258 59       		.byte	0x59
 1030 0259 40060000 		.4byte	.LVL42-.Ltext0
 1031 025d 20070000 		.4byte	.LVL49-.Ltext0
 1032 0261 0100     		.2byte	0x1
 1033 0263 59       		.byte	0x59
 1034 0264 24070000 		.4byte	.LVL50-.Ltext0
 1035 0268 D8070000 		.4byte	.LVL52-.Ltext0
 1036 026c 0100     		.2byte	0x1
 1037 026e 59       		.byte	0x59
 1038 026f D8070000 		.4byte	.LVL53-.Ltext0
 1039 0273 F0070000 		.4byte	.LFE27-.Ltext0
 1040 0277 0100     		.2byte	0x1
 1041 0279 59       		.byte	0x59
 1042 027a 00000000 		.4byte	0x0
 1043 027e 00000000 		.4byte	0x0
 1044              	.LLST12:
 1045 0282 E0030000 		.4byte	.LVL22-.Ltext0
 1046 0286 00040000 		.4byte	.LVL23-.Ltext0
 1047 028a 0100     		.2byte	0x1
 1048 028c 53       		.byte	0x53
 1049 028d 00040000 		.4byte	.LVL23-.Ltext0
 1050 0291 F0070000 		.4byte	.LFE27-.Ltext0
 1051 0295 0100     		.2byte	0x1
 1052 0297 5B       		.byte	0x5b
 1053 0298 00000000 		.4byte	0x0
 1054 029c 00000000 		.4byte	0x0
 1055              	.LLST13:
 1056 02a0 E0030000 		.4byte	.LVL22-.Ltext0
 1057 02a4 D0040000 		.4byte	.LVL36-.Ltext0
 1058 02a8 0200     		.2byte	0x2
 1059 02aa 91       		.byte	0x91
 1060 02ab 00       		.sleb128 0
 1061 02ac D0040000 		.4byte	.LVL36-.Ltext0
 1062 02b0 40060000 		.4byte	.LVL42-.Ltext0
 1063 02b4 0200     		.2byte	0x2
 1064 02b6 91       		.byte	0x91
 1065 02b7 1C       		.sleb128 28
 1066 02b8 40060000 		.4byte	.LVL42-.Ltext0
ARM GAS  /tmp/ccV38c0o.s 			page 29


 1067 02bc 70060000 		.4byte	.LVL47-.Ltext0
 1068 02c0 0200     		.2byte	0x2
 1069 02c2 91       		.byte	0x91
 1070 02c3 00       		.sleb128 0
 1071 02c4 70060000 		.4byte	.LVL47-.Ltext0
 1072 02c8 D8070000 		.4byte	.LVL53-.Ltext0
 1073 02cc 0200     		.2byte	0x2
 1074 02ce 91       		.byte	0x91
 1075 02cf 1C       		.sleb128 28
 1076 02d0 D8070000 		.4byte	.LVL53-.Ltext0
 1077 02d4 F0070000 		.4byte	.LFE27-.Ltext0
 1078 02d8 0200     		.2byte	0x2
 1079 02da 91       		.byte	0x91
 1080 02db 00       		.sleb128 0
 1081 02dc 00000000 		.4byte	0x0
 1082 02e0 00000000 		.4byte	0x0
 1083              	.LLST14:
 1084 02e4 E0030000 		.4byte	.LVL22-.Ltext0
 1085 02e8 00040000 		.4byte	.LVL23-.Ltext0
 1086 02ec 0200     		.2byte	0x2
 1087 02ee 91       		.byte	0x91
 1088 02ef 04       		.sleb128 4
 1089 02f0 00040000 		.4byte	.LVL23-.Ltext0
 1090 02f4 F0070000 		.4byte	.LFE27-.Ltext0
 1091 02f8 0100     		.2byte	0x1
 1092 02fa 57       		.byte	0x57
 1093 02fb 00000000 		.4byte	0x0
 1094 02ff 00000000 		.4byte	0x0
 1095              	.LLST15:
 1096 0303 38040000 		.4byte	.LVL26-.Ltext0
 1097 0307 B8040000 		.4byte	.LVL33-.Ltext0
 1098 030b 0100     		.2byte	0x1
 1099 030d 54       		.byte	0x54
 1100 030e 40060000 		.4byte	.LVL42-.Ltext0
 1101 0312 58060000 		.4byte	.LVL44-.Ltext0
 1102 0316 0100     		.2byte	0x1
 1103 0318 54       		.byte	0x54
 1104 0319 D8070000 		.4byte	.LVL53-.Ltext0
 1105 031d F0070000 		.4byte	.LFE27-.Ltext0
 1106 0321 0100     		.2byte	0x1
 1107 0323 54       		.byte	0x54
 1108 0324 00000000 		.4byte	0x0
 1109 0328 00000000 		.4byte	0x0
 1110              	.LLST16:
 1111 032c 1C040000 		.4byte	.LVL24-.Ltext0
 1112 0330 50040000 		.4byte	.LVL29-.Ltext0
 1113 0334 0100     		.2byte	0x1
 1114 0336 5C       		.byte	0x5c
 1115 0337 54040000 		.4byte	.LVL30-.Ltext0
 1116 033b C4040000 		.4byte	.LVL34-.Ltext0
 1117 033f 0100     		.2byte	0x1
 1118 0341 5C       		.byte	0x5c
 1119 0342 40060000 		.4byte	.LVL42-.Ltext0
 1120 0346 64060000 		.4byte	.LVL45-.Ltext0
 1121 034a 0100     		.2byte	0x1
 1122 034c 5C       		.byte	0x5c
 1123 034d D8070000 		.4byte	.LVL53-.Ltext0
ARM GAS  /tmp/ccV38c0o.s 			page 30


 1124 0351 F0070000 		.4byte	.LFE27-.Ltext0
 1125 0355 0100     		.2byte	0x1
 1126 0357 5C       		.byte	0x5c
 1127 0358 00000000 		.4byte	0x0
 1128 035c 00000000 		.4byte	0x0
 1129              	.LLST17:
 1130 0360 28040000 		.4byte	.LVL25-.Ltext0
 1131 0364 C8040000 		.4byte	.LVL35-.Ltext0
 1132 0368 0100     		.2byte	0x1
 1133 036a 58       		.byte	0x58
 1134 036b 40060000 		.4byte	.LVL42-.Ltext0
 1135 036f 68060000 		.4byte	.LVL46-.Ltext0
 1136 0373 0100     		.2byte	0x1
 1137 0375 58       		.byte	0x58
 1138 0376 D8070000 		.4byte	.LVL53-.Ltext0
 1139 037a F0070000 		.4byte	.LFE27-.Ltext0
 1140 037e 0100     		.2byte	0x1
 1141 0380 58       		.byte	0x58
 1142 0381 00000000 		.4byte	0x0
 1143 0385 00000000 		.4byte	0x0
 1144              		.section	.debug_info
 1145 0000 C5210000 		.4byte	0x21c5
 1146 0004 0200     		.2byte	0x2
 1147 0006 00000000 		.4byte	.Ldebug_abbrev0
 1148 000a 04       		.byte	0x4
 1149 000b 01       		.uleb128 0x1
 1150 000c 00000000 		.4byte	.Ldebug_line0
 1151 0010 F0070000 		.4byte	.Letext0
 1152 0014 00000000 		.4byte	.Ltext0
 1153 0018 DB070000 		.4byte	.LASF487
 1154 001c 04       		.byte	0x4
 1155 001d 200F0000 		.4byte	.LASF488
 1156 0021 E40D0000 		.4byte	.LASF489
 1157 0025 02       		.uleb128 0x2
 1158 0026 5C000000 		.4byte	0x5c
 1159 002a 2E5F3000 		.ascii	"._0\000"
 1160 002e 08       		.byte	0x8
 1161 002f 04       		.byte	0x4
 1162 0030 7C       		.byte	0x7c
 1163 0031 03       		.uleb128 0x3
 1164 0032 85060000 		.4byte	.LASF0
 1165 0036 04       		.byte	0x4
 1166 0037 7D       		.byte	0x7d
 1167 0038 5C000000 		.4byte	0x5c
 1168 003c 02       		.byte	0x2
 1169 003d 23       		.byte	0x23
 1170 003e 00       		.uleb128 0x0
 1171 003f 04       		.uleb128 0x4
 1172 0040 726F7000 		.ascii	"rop\000"
 1173 0044 04       		.byte	0x4
 1174 0045 7E       		.byte	0x7e
 1175 0046 5C000000 		.4byte	0x5c
 1176 004a 02       		.byte	0x2
 1177 004b 23       		.byte	0x23
 1178 004c 01       		.uleb128 0x1
 1179 004d 03       		.uleb128 0x3
 1180 004e E5050000 		.4byte	.LASF1
ARM GAS  /tmp/ccV38c0o.s 			page 31


 1181 0052 04       		.byte	0x4
 1182 0053 7F       		.byte	0x7f
 1183 0054 63000000 		.4byte	0x63
 1184 0058 02       		.byte	0x2
 1185 0059 23       		.byte	0x23
 1186 005a 04       		.uleb128 0x4
 1187 005b 00       		.byte	0x0
 1188 005c 05       		.uleb128 0x5
 1189 005d 44050000 		.4byte	.LASF2
 1190 0061 01       		.byte	0x1
 1191 0062 08       		.byte	0x8
 1192 0063 05       		.uleb128 0x5
 1193 0064 570D0000 		.4byte	.LASF3
 1194 0068 04       		.byte	0x4
 1195 0069 07       		.byte	0x7
 1196 006a 05       		.uleb128 0x5
 1197 006b 20040000 		.4byte	.LASF4
 1198 006f 02       		.byte	0x2
 1199 0070 07       		.byte	0x7
 1200 0071 05       		.uleb128 0x5
 1201 0072 5B090000 		.4byte	.LASF5
 1202 0076 04       		.byte	0x4
 1203 0077 07       		.byte	0x7
 1204 0078 05       		.uleb128 0x5
 1205 0079 DC040000 		.4byte	.LASF6
 1206 007d 01       		.byte	0x1
 1207 007e 06       		.byte	0x6
 1208 007f 05       		.uleb128 0x5
 1209 0080 14130000 		.4byte	.LASF7
 1210 0084 02       		.byte	0x2
 1211 0085 05       		.byte	0x5
 1212 0086 06       		.uleb128 0x6
 1213 0087 696E7400 		.ascii	"int\000"
 1214 008b 04       		.byte	0x4
 1215 008c 05       		.byte	0x5
 1216 008d 05       		.uleb128 0x5
 1217 008e A70B0000 		.4byte	.LASF8
 1218 0092 08       		.byte	0x8
 1219 0093 05       		.byte	0x5
 1220 0094 05       		.uleb128 0x5
 1221 0095 4F100000 		.4byte	.LASF9
 1222 0099 08       		.byte	0x8
 1223 009a 07       		.byte	0x7
 1224 009b 05       		.uleb128 0x5
 1225 009c 6E030000 		.4byte	.LASF10
 1226 00a0 04       		.byte	0x4
 1227 00a1 05       		.byte	0x5
 1228 00a2 07       		.uleb128 0x7
 1229 00a3 B2000000 		.4byte	0xb2
 1230 00a7 86000000 		.4byte	0x86
 1231 00ab 08       		.uleb128 0x8
 1232 00ac B2000000 		.4byte	0xb2
 1233 00b0 01       		.byte	0x1
 1234 00b1 00       		.byte	0x0
 1235 00b2 05       		.uleb128 0x5
 1236 00b3 570D0000 		.4byte	.LASF3
 1237 00b7 04       		.byte	0x4
ARM GAS  /tmp/ccV38c0o.s 			page 32


 1238 00b8 07       		.byte	0x7
 1239 00b9 09       		.uleb128 0x9
 1240 00ba 04       		.byte	0x4
 1241 00bb BF000000 		.4byte	0xbf
 1242 00bf 05       		.uleb128 0x5
 1243 00c0 29060000 		.4byte	.LASF11
 1244 00c4 01       		.byte	0x1
 1245 00c5 08       		.byte	0x8
 1246 00c6 0A       		.uleb128 0xa
 1247 00c7 04       		.byte	0x4
 1248 00c8 09       		.uleb128 0x9
 1249 00c9 04       		.byte	0x4
 1250 00ca CE000000 		.4byte	0xce
 1251 00ce 0B       		.uleb128 0xb
 1252 00cf BF000000 		.4byte	0xbf
 1253 00d3 0C       		.uleb128 0xc
 1254 00d4 05090000 		.4byte	.LASF12
 1255 00d8 02       		.byte	0x2
 1256 00d9 B0       		.byte	0xb0
 1257 00da 5C000000 		.4byte	0x5c
 1258 00de 0C       		.uleb128 0xc
 1259 00df E3120000 		.4byte	.LASF13
 1260 00e3 02       		.byte	0x2
 1261 00e4 B1       		.byte	0xb1
 1262 00e5 5C000000 		.4byte	0x5c
 1263 00e9 0C       		.uleb128 0xc
 1264 00ea FD170000 		.4byte	.LASF14
 1265 00ee 02       		.byte	0x2
 1266 00ef B2       		.byte	0xb2
 1267 00f0 6A000000 		.4byte	0x6a
 1268 00f4 0C       		.uleb128 0xc
 1269 00f5 5B080000 		.4byte	.LASF15
 1270 00f9 02       		.byte	0x2
 1271 00fa B3       		.byte	0xb3
 1272 00fb 63000000 		.4byte	0x63
 1273 00ff 0C       		.uleb128 0xc
 1274 0100 02010000 		.4byte	.LASF16
 1275 0104 02       		.byte	0x2
 1276 0105 B4       		.byte	0xb4
 1277 0106 63000000 		.4byte	0x63
 1278 010a 0C       		.uleb128 0xc
 1279 010b 70170000 		.4byte	.LASF17
 1280 010f 02       		.byte	0x2
 1281 0110 B7       		.byte	0xb7
 1282 0111 86000000 		.4byte	0x86
 1283 0115 0C       		.uleb128 0xc
 1284 0116 EA080000 		.4byte	.LASF18
 1285 011a 02       		.byte	0x2
 1286 011b C3       		.byte	0xc3
 1287 011c 5C000000 		.4byte	0x5c
 1288 0120 0D       		.uleb128 0xd
 1289 0121 64010000 		.4byte	0x164
 1290 0125 9F0E0000 		.4byte	.LASF490
 1291 0129 02       		.byte	0x2
 1292 012a 06       		.byte	0x6
 1293 012b 63       		.byte	0x63
 1294 012c 0E       		.uleb128 0xe
ARM GAS  /tmp/ccV38c0o.s 			page 33


 1295 012d 51010000 		.4byte	0x151
 1296 0131 82020000 		.4byte	.LASF19
 1297 0135 02       		.byte	0x2
 1298 0136 06       		.byte	0x6
 1299 0137 65       		.byte	0x65
 1300 0138 04       		.uleb128 0x4
 1301 0139 6C00     		.ascii	"l\000"
 1302 013b 06       		.byte	0x6
 1303 013c 65       		.byte	0x65
 1304 013d DE000000 		.4byte	0xde
 1305 0141 02       		.byte	0x2
 1306 0142 23       		.byte	0x23
 1307 0143 00       		.uleb128 0x0
 1308 0144 04       		.uleb128 0x4
 1309 0145 6800     		.ascii	"h\000"
 1310 0147 06       		.byte	0x6
 1311 0148 65       		.byte	0x65
 1312 0149 DE000000 		.4byte	0xde
 1313 014d 02       		.byte	0x2
 1314 014e 23       		.byte	0x23
 1315 014f 01       		.uleb128 0x1
 1316 0150 00       		.byte	0x0
 1317 0151 0F       		.uleb128 0xf
 1318 0152 4200     		.ascii	"B\000"
 1319 0154 06       		.byte	0x6
 1320 0155 65       		.byte	0x65
 1321 0156 2C010000 		.4byte	0x12c
 1322 015a 0F       		.uleb128 0xf
 1323 015b 5700     		.ascii	"W\000"
 1324 015d 06       		.byte	0x6
 1325 015e 69       		.byte	0x69
 1326 015f E9000000 		.4byte	0xe9
 1327 0163 00       		.byte	0x0
 1328 0164 0E       		.uleb128 0xe
 1329 0165 E0010000 		.4byte	0x1e0
 1330 0169 7C0F0000 		.4byte	.LASF20
 1331 016d 10       		.byte	0x10
 1332 016e 06       		.byte	0x6
 1333 016f 6C       		.byte	0x6c
 1334 0170 04       		.uleb128 0x4
 1335 0171 504200   		.ascii	"PB\000"
 1336 0174 06       		.byte	0x6
 1337 0175 6D       		.byte	0x6d
 1338 0176 DE000000 		.4byte	0xde
 1339 017a 02       		.byte	0x2
 1340 017b 23       		.byte	0x23
 1341 017c 00       		.uleb128 0x0
 1342 017d 04       		.uleb128 0x4
 1343 017e 444200   		.ascii	"DB\000"
 1344 0181 06       		.byte	0x6
 1345 0182 6E       		.byte	0x6e
 1346 0183 DE000000 		.4byte	0xde
 1347 0187 02       		.byte	0x2
 1348 0188 23       		.byte	0x23
 1349 0189 01       		.uleb128 0x1
 1350 018a 04       		.uleb128 0x4
 1351 018b 5000     		.ascii	"P\000"
ARM GAS  /tmp/ccV38c0o.s 			page 34


 1352 018d 06       		.byte	0x6
 1353 018e 6F       		.byte	0x6f
 1354 018f 20010000 		.4byte	0x120
 1355 0193 02       		.byte	0x2
 1356 0194 23       		.byte	0x23
 1357 0195 02       		.uleb128 0x2
 1358 0196 04       		.uleb128 0x4
 1359 0197 4100     		.ascii	"A\000"
 1360 0199 06       		.byte	0x6
 1361 019a 70       		.byte	0x70
 1362 019b 20010000 		.4byte	0x120
 1363 019f 02       		.byte	0x2
 1364 01a0 23       		.byte	0x23
 1365 01a1 04       		.uleb128 0x4
 1366 01a2 04       		.uleb128 0x4
 1367 01a3 4400     		.ascii	"D\000"
 1368 01a5 06       		.byte	0x6
 1369 01a6 71       		.byte	0x71
 1370 01a7 20010000 		.4byte	0x120
 1371 01ab 02       		.byte	0x2
 1372 01ac 23       		.byte	0x23
 1373 01ad 06       		.uleb128 0x6
 1374 01ae 04       		.uleb128 0x4
 1375 01af 5800     		.ascii	"X\000"
 1376 01b1 06       		.byte	0x6
 1377 01b2 72       		.byte	0x72
 1378 01b3 20010000 		.4byte	0x120
 1379 01b7 02       		.byte	0x2
 1380 01b8 23       		.byte	0x23
 1381 01b9 08       		.uleb128 0x8
 1382 01ba 04       		.uleb128 0x4
 1383 01bb 5300     		.ascii	"S\000"
 1384 01bd 06       		.byte	0x6
 1385 01be 73       		.byte	0x73
 1386 01bf 20010000 		.4byte	0x120
 1387 01c3 02       		.byte	0x2
 1388 01c4 23       		.byte	0x23
 1389 01c5 0A       		.uleb128 0xa
 1390 01c6 04       		.uleb128 0x4
 1391 01c7 5900     		.ascii	"Y\000"
 1392 01c9 06       		.byte	0x6
 1393 01ca 74       		.byte	0x74
 1394 01cb 20010000 		.4byte	0x120
 1395 01cf 02       		.byte	0x2
 1396 01d0 23       		.byte	0x23
 1397 01d1 0C       		.uleb128 0xc
 1398 01d2 04       		.uleb128 0x4
 1399 01d3 504300   		.ascii	"PC\000"
 1400 01d6 06       		.byte	0x6
 1401 01d7 75       		.byte	0x75
 1402 01d8 E9000000 		.4byte	0xe9
 1403 01dc 02       		.byte	0x2
 1404 01dd 23       		.byte	0x23
 1405 01de 0E       		.uleb128 0xe
 1406 01df 00       		.byte	0x0
 1407 01e0 0E       		.uleb128 0xe
 1408 01e1 4D040000 		.4byte	0x44d
ARM GAS  /tmp/ccV38c0o.s 			page 35


 1409 01e5 67110000 		.4byte	.LASF21
 1410 01e9 9C       		.byte	0x9c
 1411 01ea 05       		.byte	0x5
 1412 01eb C6       		.byte	0xc6
 1413 01ec 03       		.uleb128 0x3
 1414 01ed 8F150000 		.4byte	.LASF22
 1415 01f1 05       		.byte	0x5
 1416 01f2 C7       		.byte	0xc7
 1417 01f3 FF000000 		.4byte	0xff
 1418 01f7 02       		.byte	0x2
 1419 01f8 23       		.byte	0x23
 1420 01f9 00       		.uleb128 0x0
 1421 01fa 03       		.uleb128 0x3
 1422 01fb F30C0000 		.4byte	.LASF23
 1423 01ff 05       		.byte	0x5
 1424 0200 C8       		.byte	0xc8
 1425 0201 D3000000 		.4byte	0xd3
 1426 0205 02       		.byte	0x2
 1427 0206 23       		.byte	0x23
 1428 0207 04       		.uleb128 0x4
 1429 0208 03       		.uleb128 0x3
 1430 0209 B90F0000 		.4byte	.LASF24
 1431 020d 05       		.byte	0x5
 1432 020e C9       		.byte	0xc9
 1433 020f D3000000 		.4byte	0xd3
 1434 0213 02       		.byte	0x2
 1435 0214 23       		.byte	0x23
 1436 0215 05       		.uleb128 0x5
 1437 0216 03       		.uleb128 0x3
 1438 0217 C2100000 		.4byte	.LASF25
 1439 021b 05       		.byte	0x5
 1440 021c CA       		.byte	0xca
 1441 021d D3000000 		.4byte	0xd3
 1442 0221 02       		.byte	0x2
 1443 0222 23       		.byte	0x23
 1444 0223 06       		.uleb128 0x6
 1445 0224 03       		.uleb128 0x3
 1446 0225 D3030000 		.4byte	.LASF26
 1447 0229 05       		.byte	0x5
 1448 022a CB       		.byte	0xcb
 1449 022b D3000000 		.4byte	0xd3
 1450 022f 02       		.byte	0x2
 1451 0230 23       		.byte	0x23
 1452 0231 07       		.uleb128 0x7
 1453 0232 03       		.uleb128 0x3
 1454 0233 0A180000 		.4byte	.LASF27
 1455 0237 05       		.byte	0x5
 1456 0238 CC       		.byte	0xcc
 1457 0239 64010000 		.4byte	0x164
 1458 023d 02       		.byte	0x2
 1459 023e 23       		.byte	0x23
 1460 023f 08       		.uleb128 0x8
 1461 0240 04       		.uleb128 0x4
 1462 0241 504300   		.ascii	"PC\000"
 1463 0244 05       		.byte	0x5
 1464 0245 D6       		.byte	0xd6
 1465 0246 4D040000 		.4byte	0x44d
ARM GAS  /tmp/ccV38c0o.s 			page 36


 1466 024a 02       		.byte	0x2
 1467 024b 23       		.byte	0x23
 1468 024c 18       		.uleb128 0x18
 1469 024d 03       		.uleb128 0x3
 1470 024e D4070000 		.4byte	.LASF28
 1471 0252 05       		.byte	0x5
 1472 0253 D7       		.byte	0xd7
 1473 0254 0A010000 		.4byte	0x10a
 1474 0258 02       		.byte	0x2
 1475 0259 23       		.byte	0x23
 1476 025a 1C       		.uleb128 0x1c
 1477 025b 03       		.uleb128 0x3
 1478 025c F9110000 		.4byte	.LASF29
 1479 0260 05       		.byte	0x5
 1480 0261 D8       		.byte	0xd8
 1481 0262 4D040000 		.4byte	0x44d
 1482 0266 02       		.byte	0x2
 1483 0267 23       		.byte	0x23
 1484 0268 20       		.uleb128 0x20
 1485 0269 03       		.uleb128 0x3
 1486 026a C00E0000 		.4byte	.LASF30
 1487 026e 05       		.byte	0x5
 1488 026f D9       		.byte	0xd9
 1489 0270 4D040000 		.4byte	0x44d
 1490 0274 02       		.byte	0x2
 1491 0275 23       		.byte	0x23
 1492 0276 24       		.uleb128 0x24
 1493 0277 03       		.uleb128 0x3
 1494 0278 8A120000 		.4byte	.LASF31
 1495 027c 05       		.byte	0x5
 1496 027d DA       		.byte	0xda
 1497 027e 4D040000 		.4byte	0x44d
 1498 0282 02       		.byte	0x2
 1499 0283 23       		.byte	0x23
 1500 0284 28       		.uleb128 0x28
 1501 0285 03       		.uleb128 0x3
 1502 0286 51140000 		.4byte	.LASF32
 1503 028a 05       		.byte	0x5
 1504 028b DB       		.byte	0xdb
 1505 028c FF000000 		.4byte	0xff
 1506 0290 02       		.byte	0x2
 1507 0291 23       		.byte	0x23
 1508 0292 2C       		.uleb128 0x2c
 1509 0293 03       		.uleb128 0x3
 1510 0294 45100000 		.4byte	.LASF33
 1511 0298 05       		.byte	0x5
 1512 0299 DC       		.byte	0xdc
 1513 029a 53040000 		.4byte	0x453
 1514 029e 02       		.byte	0x2
 1515 029f 23       		.byte	0x23
 1516 02a0 30       		.uleb128 0x30
 1517 02a1 03       		.uleb128 0x3
 1518 02a2 64040000 		.4byte	.LASF34
 1519 02a6 05       		.byte	0x5
 1520 02a7 DD       		.byte	0xdd
 1521 02a8 0A010000 		.4byte	0x10a
 1522 02ac 02       		.byte	0x2
ARM GAS  /tmp/ccV38c0o.s 			page 37


 1523 02ad 23       		.byte	0x23
 1524 02ae 34       		.uleb128 0x34
 1525 02af 03       		.uleb128 0x3
 1526 02b0 54020000 		.4byte	.LASF35
 1527 02b4 05       		.byte	0x5
 1528 02b5 DE       		.byte	0xde
 1529 02b6 0A010000 		.4byte	0x10a
 1530 02ba 02       		.byte	0x2
 1531 02bb 23       		.byte	0x23
 1532 02bc 38       		.uleb128 0x38
 1533 02bd 03       		.uleb128 0x3
 1534 02be 380D0000 		.4byte	.LASF36
 1535 02c2 05       		.byte	0x5
 1536 02c3 DF       		.byte	0xdf
 1537 02c4 0A010000 		.4byte	0x10a
 1538 02c8 02       		.byte	0x2
 1539 02c9 23       		.byte	0x23
 1540 02ca 3C       		.uleb128 0x3c
 1541 02cb 03       		.uleb128 0x3
 1542 02cc C7050000 		.4byte	.LASF37
 1543 02d0 05       		.byte	0x5
 1544 02d1 E0       		.byte	0xe0
 1545 02d2 0A010000 		.4byte	0x10a
 1546 02d6 02       		.byte	0x2
 1547 02d7 23       		.byte	0x23
 1548 02d8 40       		.uleb128 0x40
 1549 02d9 03       		.uleb128 0x3
 1550 02da 68000000 		.4byte	.LASF38
 1551 02de 05       		.byte	0x5
 1552 02df E1       		.byte	0xe1
 1553 02e0 FF000000 		.4byte	0xff
 1554 02e4 02       		.byte	0x2
 1555 02e5 23       		.byte	0x23
 1556 02e6 44       		.uleb128 0x44
 1557 02e7 03       		.uleb128 0x3
 1558 02e8 8F080000 		.4byte	.LASF39
 1559 02ec 05       		.byte	0x5
 1560 02ed E2       		.byte	0xe2
 1561 02ee FF000000 		.4byte	0xff
 1562 02f2 02       		.byte	0x2
 1563 02f3 23       		.byte	0x23
 1564 02f4 48       		.uleb128 0x48
 1565 02f5 03       		.uleb128 0x3
 1566 02f6 F60B0000 		.4byte	.LASF40
 1567 02fa 05       		.byte	0x5
 1568 02fb E3       		.byte	0xe3
 1569 02fc FF000000 		.4byte	0xff
 1570 0300 02       		.byte	0x2
 1571 0301 23       		.byte	0x23
 1572 0302 4C       		.uleb128 0x4c
 1573 0303 03       		.uleb128 0x3
 1574 0304 0B090000 		.4byte	.LASF41
 1575 0308 05       		.byte	0x5
 1576 0309 E4       		.byte	0xe4
 1577 030a FF000000 		.4byte	0xff
 1578 030e 02       		.byte	0x2
 1579 030f 23       		.byte	0x23
ARM GAS  /tmp/ccV38c0o.s 			page 38


 1580 0310 50       		.uleb128 0x50
 1581 0311 03       		.uleb128 0x3
 1582 0312 27020000 		.4byte	.LASF42
 1583 0316 05       		.byte	0x5
 1584 0317 E6       		.byte	0xe6
 1585 0318 D3000000 		.4byte	0xd3
 1586 031c 02       		.byte	0x2
 1587 031d 23       		.byte	0x23
 1588 031e 54       		.uleb128 0x54
 1589 031f 03       		.uleb128 0x3
 1590 0320 DC170000 		.4byte	.LASF43
 1591 0324 05       		.byte	0x5
 1592 0325 E7       		.byte	0xe7
 1593 0326 DE000000 		.4byte	0xde
 1594 032a 02       		.byte	0x2
 1595 032b 23       		.byte	0x23
 1596 032c 55       		.uleb128 0x55
 1597 032d 03       		.uleb128 0x3
 1598 032e F0090000 		.4byte	.LASF44
 1599 0332 05       		.byte	0x5
 1600 0333 E8       		.byte	0xe8
 1601 0334 D3000000 		.4byte	0xd3
 1602 0338 02       		.byte	0x2
 1603 0339 23       		.byte	0x23
 1604 033a 56       		.uleb128 0x56
 1605 033b 03       		.uleb128 0x3
 1606 033c BE140000 		.4byte	.LASF45
 1607 0340 05       		.byte	0x5
 1608 0341 E9       		.byte	0xe9
 1609 0342 D3000000 		.4byte	0xd3
 1610 0346 02       		.byte	0x2
 1611 0347 23       		.byte	0x23
 1612 0348 57       		.uleb128 0x57
 1613 0349 03       		.uleb128 0x3
 1614 034a CD060000 		.4byte	.LASF46
 1615 034e 05       		.byte	0x5
 1616 034f EA       		.byte	0xea
 1617 0350 FF000000 		.4byte	0xff
 1618 0354 02       		.byte	0x2
 1619 0355 23       		.byte	0x23
 1620 0356 58       		.uleb128 0x58
 1621 0357 03       		.uleb128 0x3
 1622 0358 B4030000 		.4byte	.LASF47
 1623 035c 05       		.byte	0x5
 1624 035d EB       		.byte	0xeb
 1625 035e D3000000 		.4byte	0xd3
 1626 0362 02       		.byte	0x2
 1627 0363 23       		.byte	0x23
 1628 0364 5C       		.uleb128 0x5c
 1629 0365 03       		.uleb128 0x3
 1630 0366 83010000 		.4byte	.LASF48
 1631 036a 05       		.byte	0x5
 1632 036b EC       		.byte	0xec
 1633 036c 58040000 		.4byte	0x458
 1634 0370 02       		.byte	0x2
 1635 0371 23       		.byte	0x23
 1636 0372 5D       		.uleb128 0x5d
ARM GAS  /tmp/ccV38c0o.s 			page 39


 1637 0373 03       		.uleb128 0x3
 1638 0374 4D0C0000 		.4byte	.LASF49
 1639 0378 05       		.byte	0x5
 1640 0379 EE       		.byte	0xee
 1641 037a 4D040000 		.4byte	0x44d
 1642 037e 02       		.byte	0x2
 1643 037f 23       		.byte	0x23
 1644 0380 60       		.uleb128 0x60
 1645 0381 03       		.uleb128 0x3
 1646 0382 AE110000 		.4byte	.LASF50
 1647 0386 05       		.byte	0x5
 1648 0387 EF       		.byte	0xef
 1649 0388 4D040000 		.4byte	0x44d
 1650 038c 02       		.byte	0x2
 1651 038d 23       		.byte	0x23
 1652 038e 64       		.uleb128 0x64
 1653 038f 03       		.uleb128 0x3
 1654 0390 45180000 		.4byte	.LASF51
 1655 0394 05       		.byte	0x5
 1656 0395 F0       		.byte	0xf0
 1657 0396 68040000 		.4byte	0x468
 1658 039a 02       		.byte	0x2
 1659 039b 23       		.byte	0x23
 1660 039c 68       		.uleb128 0x68
 1661 039d 03       		.uleb128 0x3
 1662 039e 4F110000 		.4byte	.LASF52
 1663 03a2 05       		.byte	0x5
 1664 03a3 F1       		.byte	0xf1
 1665 03a4 4D040000 		.4byte	0x44d
 1666 03a8 02       		.byte	0x2
 1667 03a9 23       		.byte	0x23
 1668 03aa 6C       		.uleb128 0x6c
 1669 03ab 03       		.uleb128 0x3
 1670 03ac 000B0000 		.4byte	.LASF53
 1671 03b0 05       		.byte	0x5
 1672 03b1 F2       		.byte	0xf2
 1673 03b2 4D040000 		.4byte	0x44d
 1674 03b6 02       		.byte	0x2
 1675 03b7 23       		.byte	0x23
 1676 03b8 70       		.uleb128 0x70
 1677 03b9 03       		.uleb128 0x3
 1678 03ba AF100000 		.4byte	.LASF54
 1679 03be 05       		.byte	0x5
 1680 03bf F3       		.byte	0xf3
 1681 03c0 4D040000 		.4byte	0x44d
 1682 03c4 02       		.byte	0x2
 1683 03c5 23       		.byte	0x23
 1684 03c6 74       		.uleb128 0x74
 1685 03c7 03       		.uleb128 0x3
 1686 03c8 15180000 		.4byte	.LASF55
 1687 03cc 05       		.byte	0x5
 1688 03cd F4       		.byte	0xf4
 1689 03ce FF000000 		.4byte	0xff
 1690 03d2 02       		.byte	0x2
 1691 03d3 23       		.byte	0x23
 1692 03d4 78       		.uleb128 0x78
 1693 03d5 03       		.uleb128 0x3
ARM GAS  /tmp/ccV38c0o.s 			page 40


 1694 03d6 31090000 		.4byte	.LASF56
 1695 03da 05       		.byte	0x5
 1696 03db F5       		.byte	0xf5
 1697 03dc F4000000 		.4byte	0xf4
 1698 03e0 02       		.byte	0x2
 1699 03e1 23       		.byte	0x23
 1700 03e2 7C       		.uleb128 0x7c
 1701 03e3 03       		.uleb128 0x3
 1702 03e4 14120000 		.4byte	.LASF57
 1703 03e8 05       		.byte	0x5
 1704 03e9 F6       		.byte	0xf6
 1705 03ea F4000000 		.4byte	0xf4
 1706 03ee 03       		.byte	0x3
 1707 03ef 23       		.byte	0x23
 1708 03f0 8001     		.uleb128 0x80
 1709 03f2 03       		.uleb128 0x3
 1710 03f3 58040000 		.4byte	.LASF58
 1711 03f7 05       		.byte	0x5
 1712 03f8 F7       		.byte	0xf7
 1713 03f9 FF000000 		.4byte	0xff
 1714 03fd 03       		.byte	0x3
 1715 03fe 23       		.byte	0x23
 1716 03ff 8401     		.uleb128 0x84
 1717 0401 03       		.uleb128 0x3
 1718 0402 D80B0000 		.4byte	.LASF59
 1719 0406 05       		.byte	0x5
 1720 0407 F8       		.byte	0xf8
 1721 0408 FF000000 		.4byte	0xff
 1722 040c 03       		.byte	0x3
 1723 040d 23       		.byte	0x23
 1724 040e 8801     		.uleb128 0x88
 1725 0410 03       		.uleb128 0x3
 1726 0411 6F010000 		.4byte	.LASF60
 1727 0415 05       		.byte	0x5
 1728 0416 F9       		.byte	0xf9
 1729 0417 53040000 		.4byte	0x453
 1730 041b 03       		.byte	0x3
 1731 041c 23       		.byte	0x23
 1732 041d 8C01     		.uleb128 0x8c
 1733 041f 03       		.uleb128 0x3
 1734 0420 640D0000 		.4byte	.LASF61
 1735 0424 05       		.byte	0x5
 1736 0425 FA       		.byte	0xfa
 1737 0426 C6000000 		.4byte	0xc6
 1738 042a 03       		.byte	0x3
 1739 042b 23       		.byte	0x23
 1740 042c 9001     		.uleb128 0x90
 1741 042e 03       		.uleb128 0x3
 1742 042f 0D100000 		.4byte	.LASF62
 1743 0433 05       		.byte	0x5
 1744 0434 FB       		.byte	0xfb
 1745 0435 C6000000 		.4byte	0xc6
 1746 0439 03       		.byte	0x3
 1747 043a 23       		.byte	0x23
 1748 043b 9401     		.uleb128 0x94
 1749 043d 03       		.uleb128 0x3
 1750 043e 41130000 		.4byte	.LASF63
ARM GAS  /tmp/ccV38c0o.s 			page 41


 1751 0442 05       		.byte	0x5
 1752 0443 FC       		.byte	0xfc
 1753 0444 0A010000 		.4byte	0x10a
 1754 0448 03       		.byte	0x3
 1755 0449 23       		.byte	0x23
 1756 044a 9801     		.uleb128 0x98
 1757 044c 00       		.byte	0x0
 1758 044d 09       		.uleb128 0x9
 1759 044e 04       		.byte	0x4
 1760 044f DE000000 		.4byte	0xde
 1761 0453 10       		.uleb128 0x10
 1762 0454 0A010000 		.4byte	0x10a
 1763 0458 07       		.uleb128 0x7
 1764 0459 68040000 		.4byte	0x468
 1765 045d D3000000 		.4byte	0xd3
 1766 0461 08       		.uleb128 0x8
 1767 0462 B2000000 		.4byte	0xb2
 1768 0466 02       		.byte	0x2
 1769 0467 00       		.byte	0x0
 1770 0468 09       		.uleb128 0x9
 1771 0469 04       		.byte	0x4
 1772 046a FF000000 		.4byte	0xff
 1773 046e 11       		.uleb128 0x11
 1774 046f C60A0000 		.4byte	0xac6
 1775 0473 80120000 		.4byte	.LASF64
 1776 0477 2C01     		.2byte	0x12c
 1777 0479 05       		.byte	0x5
 1778 047a 0601     		.2byte	0x106
 1779 047c 12       		.uleb128 0x12
 1780 047d 5D000000 		.4byte	.LASF65
 1781 0481 05       		.byte	0x5
 1782 0482 0801     		.2byte	0x108
 1783 0484 D3000000 		.4byte	0xd3
 1784 0488 02       		.byte	0x2
 1785 0489 23       		.byte	0x23
 1786 048a 00       		.uleb128 0x0
 1787 048b 12       		.uleb128 0x12
 1788 048c 7A010000 		.4byte	.LASF66
 1789 0490 05       		.byte	0x5
 1790 0491 0901     		.2byte	0x109
 1791 0493 D3000000 		.4byte	0xd3
 1792 0497 02       		.byte	0x2
 1793 0498 23       		.byte	0x23
 1794 0499 01       		.uleb128 0x1
 1795 049a 12       		.uleb128 0x12
 1796 049b 1E160000 		.4byte	.LASF67
 1797 049f 05       		.byte	0x5
 1798 04a0 0B01     		.2byte	0x10b
 1799 04a2 DE000000 		.4byte	0xde
 1800 04a6 02       		.byte	0x2
 1801 04a7 23       		.byte	0x23
 1802 04a8 02       		.uleb128 0x2
 1803 04a9 12       		.uleb128 0x12
 1804 04aa 26170000 		.4byte	.LASF68
 1805 04ae 05       		.byte	0x5
 1806 04af 0C01     		.2byte	0x10c
 1807 04b1 9B000000 		.4byte	0x9b
ARM GAS  /tmp/ccV38c0o.s 			page 42


 1808 04b5 02       		.byte	0x2
 1809 04b6 23       		.byte	0x23
 1810 04b7 04       		.uleb128 0x4
 1811 04b8 12       		.uleb128 0x12
 1812 04b9 0D170000 		.4byte	.LASF69
 1813 04bd 05       		.byte	0x5
 1814 04be 0D01     		.2byte	0x10d
 1815 04c0 9B000000 		.4byte	0x9b
 1816 04c4 02       		.byte	0x2
 1817 04c5 23       		.byte	0x23
 1818 04c6 08       		.uleb128 0x8
 1819 04c7 12       		.uleb128 0x12
 1820 04c8 4F030000 		.4byte	.LASF70
 1821 04cc 05       		.byte	0x5
 1822 04cd 0E01     		.2byte	0x10e
 1823 04cf 9B000000 		.4byte	0x9b
 1824 04d3 02       		.byte	0x2
 1825 04d4 23       		.byte	0x23
 1826 04d5 0C       		.uleb128 0xc
 1827 04d6 12       		.uleb128 0x12
 1828 04d7 530F0000 		.4byte	.LASF71
 1829 04db 05       		.byte	0x5
 1830 04dc 0F01     		.2byte	0x10f
 1831 04de D3000000 		.4byte	0xd3
 1832 04e2 02       		.byte	0x2
 1833 04e3 23       		.byte	0x23
 1834 04e4 10       		.uleb128 0x10
 1835 04e5 12       		.uleb128 0x12
 1836 04e6 D00E0000 		.4byte	.LASF72
 1837 04ea 05       		.byte	0x5
 1838 04eb 1001     		.2byte	0x110
 1839 04ed D3000000 		.4byte	0xd3
 1840 04f1 02       		.byte	0x2
 1841 04f2 23       		.byte	0x23
 1842 04f3 11       		.uleb128 0x11
 1843 04f4 12       		.uleb128 0x12
 1844 04f5 C1060000 		.4byte	.LASF73
 1845 04f9 05       		.byte	0x5
 1846 04fa 1101     		.2byte	0x111
 1847 04fc D3000000 		.4byte	0xd3
 1848 0500 02       		.byte	0x2
 1849 0501 23       		.byte	0x23
 1850 0502 12       		.uleb128 0x12
 1851 0503 12       		.uleb128 0x12
 1852 0504 580E0000 		.4byte	.LASF74
 1853 0508 05       		.byte	0x5
 1854 0509 1201     		.2byte	0x112
 1855 050b D3000000 		.4byte	0xd3
 1856 050f 02       		.byte	0x2
 1857 0510 23       		.byte	0x23
 1858 0511 13       		.uleb128 0x13
 1859 0512 12       		.uleb128 0x12
 1860 0513 870F0000 		.4byte	.LASF75
 1861 0517 05       		.byte	0x5
 1862 0518 1501     		.2byte	0x115
 1863 051a D3000000 		.4byte	0xd3
 1864 051e 02       		.byte	0x2
ARM GAS  /tmp/ccV38c0o.s 			page 43


 1865 051f 23       		.byte	0x23
 1866 0520 14       		.uleb128 0x14
 1867 0521 12       		.uleb128 0x12
 1868 0522 93110000 		.4byte	.LASF76
 1869 0526 05       		.byte	0x5
 1870 0527 1601     		.2byte	0x116
 1871 0529 D3000000 		.4byte	0xd3
 1872 052d 02       		.byte	0x2
 1873 052e 23       		.byte	0x23
 1874 052f 15       		.uleb128 0x15
 1875 0530 12       		.uleb128 0x12
 1876 0531 DF000000 		.4byte	.LASF77
 1877 0535 05       		.byte	0x5
 1878 0536 1701     		.2byte	0x117
 1879 0538 D3000000 		.4byte	0xd3
 1880 053c 02       		.byte	0x2
 1881 053d 23       		.byte	0x23
 1882 053e 16       		.uleb128 0x16
 1883 053f 12       		.uleb128 0x12
 1884 0540 25180000 		.4byte	.LASF78
 1885 0544 05       		.byte	0x5
 1886 0545 1801     		.2byte	0x118
 1887 0547 D3000000 		.4byte	0xd3
 1888 054b 02       		.byte	0x2
 1889 054c 23       		.byte	0x23
 1890 054d 17       		.uleb128 0x17
 1891 054e 12       		.uleb128 0x12
 1892 054f 5D140000 		.4byte	.LASF79
 1893 0553 05       		.byte	0x5
 1894 0554 1901     		.2byte	0x119
 1895 0556 D3000000 		.4byte	0xd3
 1896 055a 02       		.byte	0x2
 1897 055b 23       		.byte	0x23
 1898 055c 18       		.uleb128 0x18
 1899 055d 12       		.uleb128 0x12
 1900 055e 64170000 		.4byte	.LASF80
 1901 0562 05       		.byte	0x5
 1902 0563 1C01     		.2byte	0x11c
 1903 0565 D3000000 		.4byte	0xd3
 1904 0569 02       		.byte	0x2
 1905 056a 23       		.byte	0x23
 1906 056b 19       		.uleb128 0x19
 1907 056c 12       		.uleb128 0x12
 1908 056d A9160000 		.4byte	.LASF81
 1909 0571 05       		.byte	0x5
 1910 0572 1D01     		.2byte	0x11d
 1911 0574 D3000000 		.4byte	0xd3
 1912 0578 02       		.byte	0x2
 1913 0579 23       		.byte	0x23
 1914 057a 1A       		.uleb128 0x1a
 1915 057b 12       		.uleb128 0x12
 1916 057c 2C070000 		.4byte	.LASF82
 1917 0580 05       		.byte	0x5
 1918 0581 2001     		.2byte	0x120
 1919 0583 D3000000 		.4byte	0xd3
 1920 0587 02       		.byte	0x2
 1921 0588 23       		.byte	0x23
ARM GAS  /tmp/ccV38c0o.s 			page 44


 1922 0589 1B       		.uleb128 0x1b
 1923 058a 12       		.uleb128 0x12
 1924 058b 17050000 		.4byte	.LASF83
 1925 058f 05       		.byte	0x5
 1926 0590 2101     		.2byte	0x121
 1927 0592 D3000000 		.4byte	0xd3
 1928 0596 02       		.byte	0x2
 1929 0597 23       		.byte	0x23
 1930 0598 1C       		.uleb128 0x1c
 1931 0599 13       		.uleb128 0x13
 1932 059a 50414C00 		.ascii	"PAL\000"
 1933 059e 05       		.byte	0x5
 1934 059f 2201     		.2byte	0x122
 1935 05a1 D3000000 		.4byte	0xd3
 1936 05a5 02       		.byte	0x2
 1937 05a6 23       		.byte	0x23
 1938 05a7 1D       		.uleb128 0x1d
 1939 05a8 12       		.uleb128 0x12
 1940 05a9 7A140000 		.4byte	.LASF84
 1941 05ad 05       		.byte	0x5
 1942 05ae 2301     		.2byte	0x123
 1943 05b0 FF000000 		.4byte	0xff
 1944 05b4 02       		.byte	0x2
 1945 05b5 23       		.byte	0x23
 1946 05b6 20       		.uleb128 0x20
 1947 05b7 12       		.uleb128 0x12
 1948 05b8 660A0000 		.4byte	.LASF85
 1949 05bc 05       		.byte	0x5
 1950 05bd 2401     		.2byte	0x124
 1951 05bf FF000000 		.4byte	0xff
 1952 05c3 02       		.byte	0x2
 1953 05c4 23       		.byte	0x23
 1954 05c5 24       		.uleb128 0x24
 1955 05c6 12       		.uleb128 0x12
 1956 05c7 A4020000 		.4byte	.LASF86
 1957 05cb 05       		.byte	0x5
 1958 05cc 2501     		.2byte	0x125
 1959 05ce FF000000 		.4byte	0xff
 1960 05d2 02       		.byte	0x2
 1961 05d3 23       		.byte	0x23
 1962 05d4 28       		.uleb128 0x28
 1963 05d5 12       		.uleb128 0x12
 1964 05d6 44030000 		.4byte	.LASF87
 1965 05da 05       		.byte	0x5
 1966 05db 2601     		.2byte	0x126
 1967 05dd FF000000 		.4byte	0xff
 1968 05e1 02       		.byte	0x2
 1969 05e2 23       		.byte	0x23
 1970 05e3 2C       		.uleb128 0x2c
 1971 05e4 12       		.uleb128 0x12
 1972 05e5 AE090000 		.4byte	.LASF88
 1973 05e9 05       		.byte	0x5
 1974 05ea 2901     		.2byte	0x129
 1975 05ec D3000000 		.4byte	0xd3
 1976 05f0 02       		.byte	0x2
 1977 05f1 23       		.byte	0x23
 1978 05f2 30       		.uleb128 0x30
ARM GAS  /tmp/ccV38c0o.s 			page 45


 1979 05f3 12       		.uleb128 0x12
 1980 05f4 39030000 		.4byte	.LASF89
 1981 05f8 05       		.byte	0x5
 1982 05f9 2A01     		.2byte	0x12a
 1983 05fb D3000000 		.4byte	0xd3
 1984 05ff 02       		.byte	0x2
 1985 0600 23       		.byte	0x23
 1986 0601 31       		.uleb128 0x31
 1987 0602 12       		.uleb128 0x12
 1988 0603 1B020000 		.4byte	.LASF90
 1989 0607 05       		.byte	0x5
 1990 0608 2B01     		.2byte	0x12b
 1991 060a D3000000 		.4byte	0xd3
 1992 060e 02       		.byte	0x2
 1993 060f 23       		.byte	0x23
 1994 0610 32       		.uleb128 0x32
 1995 0611 12       		.uleb128 0x12
 1996 0612 FB030000 		.4byte	.LASF91
 1997 0616 05       		.byte	0x5
 1998 0617 2C01     		.2byte	0x12c
 1999 0619 D3000000 		.4byte	0xd3
 2000 061d 02       		.byte	0x2
 2001 061e 23       		.byte	0x23
 2002 061f 33       		.uleb128 0x33
 2003 0620 12       		.uleb128 0x12
 2004 0621 FD090000 		.4byte	.LASF92
 2005 0625 05       		.byte	0x5
 2006 0626 2D01     		.2byte	0x12d
 2007 0628 D3000000 		.4byte	0xd3
 2008 062c 02       		.byte	0x2
 2009 062d 23       		.byte	0x23
 2010 062e 34       		.uleb128 0x34
 2011 062f 12       		.uleb128 0x12
 2012 0630 970C0000 		.4byte	.LASF93
 2013 0634 05       		.byte	0x5
 2014 0635 2E01     		.2byte	0x12e
 2015 0637 D3000000 		.4byte	0xd3
 2016 063b 02       		.byte	0x2
 2017 063c 23       		.byte	0x23
 2018 063d 35       		.uleb128 0x35
 2019 063e 12       		.uleb128 0x12
 2020 063f 1E130000 		.4byte	.LASF94
 2021 0643 05       		.byte	0x5
 2022 0644 2F01     		.2byte	0x12f
 2023 0646 D3000000 		.4byte	0xd3
 2024 064a 02       		.byte	0x2
 2025 064b 23       		.byte	0x23
 2026 064c 36       		.uleb128 0x36
 2027 064d 12       		.uleb128 0x12
 2028 064e 3D070000 		.4byte	.LASF95
 2029 0652 05       		.byte	0x5
 2030 0653 3201     		.2byte	0x132
 2031 0655 D3000000 		.4byte	0xd3
 2032 0659 02       		.byte	0x2
 2033 065a 23       		.byte	0x23
 2034 065b 37       		.uleb128 0x37
 2035 065c 12       		.uleb128 0x12
ARM GAS  /tmp/ccV38c0o.s 			page 46


 2036 065d 3C0F0000 		.4byte	.LASF96
 2037 0661 05       		.byte	0x5
 2038 0662 3301     		.2byte	0x133
 2039 0664 D3000000 		.4byte	0xd3
 2040 0668 02       		.byte	0x2
 2041 0669 23       		.byte	0x23
 2042 066a 38       		.uleb128 0x38
 2043 066b 12       		.uleb128 0x12
 2044 066c 6C180000 		.4byte	.LASF97
 2045 0670 05       		.byte	0x5
 2046 0671 3401     		.2byte	0x134
 2047 0673 D3000000 		.4byte	0xd3
 2048 0677 02       		.byte	0x2
 2049 0678 23       		.byte	0x23
 2050 0679 39       		.uleb128 0x39
 2051 067a 12       		.uleb128 0x12
 2052 067b 02020000 		.4byte	.LASF98
 2053 067f 05       		.byte	0x5
 2054 0680 3501     		.2byte	0x135
 2055 0682 D3000000 		.4byte	0xd3
 2056 0686 02       		.byte	0x2
 2057 0687 23       		.byte	0x23
 2058 0688 3A       		.uleb128 0x3a
 2059 0689 12       		.uleb128 0x12
 2060 068a B00F0000 		.4byte	.LASF99
 2061 068e 05       		.byte	0x5
 2062 068f 3601     		.2byte	0x136
 2063 0691 D3000000 		.4byte	0xd3
 2064 0695 02       		.byte	0x2
 2065 0696 23       		.byte	0x23
 2066 0697 3B       		.uleb128 0x3b
 2067 0698 12       		.uleb128 0x12
 2068 0699 76170000 		.4byte	.LASF100
 2069 069d 05       		.byte	0x5
 2070 069e 3701     		.2byte	0x137
 2071 06a0 D3000000 		.4byte	0xd3
 2072 06a4 02       		.byte	0x2
 2073 06a5 23       		.byte	0x23
 2074 06a6 3C       		.uleb128 0x3c
 2075 06a7 12       		.uleb128 0x12
 2076 06a8 040D0000 		.4byte	.LASF101
 2077 06ac 05       		.byte	0x5
 2078 06ad 3801     		.2byte	0x138
 2079 06af D3000000 		.4byte	0xd3
 2080 06b3 02       		.byte	0x2
 2081 06b4 23       		.byte	0x23
 2082 06b5 3D       		.uleb128 0x3d
 2083 06b6 12       		.uleb128 0x12
 2084 06b7 09060000 		.4byte	.LASF102
 2085 06bb 05       		.byte	0x5
 2086 06bc 3901     		.2byte	0x139
 2087 06be D3000000 		.4byte	0xd3
 2088 06c2 02       		.byte	0x2
 2089 06c3 23       		.byte	0x23
 2090 06c4 3E       		.uleb128 0x3e
 2091 06c5 12       		.uleb128 0x12
 2092 06c6 A5030000 		.4byte	.LASF103
ARM GAS  /tmp/ccV38c0o.s 			page 47


 2093 06ca 05       		.byte	0x5
 2094 06cb 3A01     		.2byte	0x13a
 2095 06cd D3000000 		.4byte	0xd3
 2096 06d1 02       		.byte	0x2
 2097 06d2 23       		.byte	0x23
 2098 06d3 3F       		.uleb128 0x3f
 2099 06d4 12       		.uleb128 0x12
 2100 06d5 98050000 		.4byte	.LASF104
 2101 06d9 05       		.byte	0x5
 2102 06da 3B01     		.2byte	0x13b
 2103 06dc D3000000 		.4byte	0xd3
 2104 06e0 02       		.byte	0x2
 2105 06e1 23       		.byte	0x23
 2106 06e2 40       		.uleb128 0x40
 2107 06e3 12       		.uleb128 0x12
 2108 06e4 3B0C0000 		.4byte	.LASF105
 2109 06e8 05       		.byte	0x5
 2110 06e9 3C01     		.2byte	0x13c
 2111 06eb D3000000 		.4byte	0xd3
 2112 06ef 02       		.byte	0x2
 2113 06f0 23       		.byte	0x23
 2114 06f1 41       		.uleb128 0x41
 2115 06f2 12       		.uleb128 0x12
 2116 06f3 87020000 		.4byte	.LASF106
 2117 06f7 05       		.byte	0x5
 2118 06f8 3D01     		.2byte	0x13d
 2119 06fa D3000000 		.4byte	0xd3
 2120 06fe 02       		.byte	0x2
 2121 06ff 23       		.byte	0x23
 2122 0700 42       		.uleb128 0x42
 2123 0701 12       		.uleb128 0x12
 2124 0702 D70E0000 		.4byte	.LASF107
 2125 0706 05       		.byte	0x5
 2126 0707 3E01     		.2byte	0x13e
 2127 0709 D3000000 		.4byte	0xd3
 2128 070d 02       		.byte	0x2
 2129 070e 23       		.byte	0x23
 2130 070f 43       		.uleb128 0x43
 2131 0710 12       		.uleb128 0x12
 2132 0711 E1060000 		.4byte	.LASF108
 2133 0715 05       		.byte	0x5
 2134 0716 3F01     		.2byte	0x13f
 2135 0718 D3000000 		.4byte	0xd3
 2136 071c 02       		.byte	0x2
 2137 071d 23       		.byte	0x23
 2138 071e 44       		.uleb128 0x44
 2139 071f 12       		.uleb128 0x12
 2140 0720 DF090000 		.4byte	.LASF109
 2141 0724 05       		.byte	0x5
 2142 0725 4001     		.2byte	0x140
 2143 0727 FF000000 		.4byte	0xff
 2144 072b 02       		.byte	0x2
 2145 072c 23       		.byte	0x23
 2146 072d 48       		.uleb128 0x48
 2147 072e 12       		.uleb128 0x12
 2148 072f 5E0F0000 		.4byte	.LASF110
 2149 0733 05       		.byte	0x5
ARM GAS  /tmp/ccV38c0o.s 			page 48


 2150 0734 4201     		.2byte	0x142
 2151 0736 D3000000 		.4byte	0xd3
 2152 073a 02       		.byte	0x2
 2153 073b 23       		.byte	0x23
 2154 073c 4C       		.uleb128 0x4c
 2155 073d 12       		.uleb128 0x12
 2156 073e 87140000 		.4byte	.LASF111
 2157 0742 05       		.byte	0x5
 2158 0743 4301     		.2byte	0x143
 2159 0745 D3000000 		.4byte	0xd3
 2160 0749 02       		.byte	0x2
 2161 074a 23       		.byte	0x23
 2162 074b 4D       		.uleb128 0x4d
 2163 074c 12       		.uleb128 0x12
 2164 074d 75160000 		.4byte	.LASF112
 2165 0751 05       		.byte	0x5
 2166 0752 4401     		.2byte	0x144
 2167 0754 D3000000 		.4byte	0xd3
 2168 0758 02       		.byte	0x2
 2169 0759 23       		.byte	0x23
 2170 075a 4E       		.uleb128 0x4e
 2171 075b 12       		.uleb128 0x12
 2172 075c A7080000 		.4byte	.LASF113
 2173 0760 05       		.byte	0x5
 2174 0761 4501     		.2byte	0x145
 2175 0763 D3000000 		.4byte	0xd3
 2176 0767 02       		.byte	0x2
 2177 0768 23       		.byte	0x23
 2178 0769 4F       		.uleb128 0x4f
 2179 076a 12       		.uleb128 0x12
 2180 076b 330C0000 		.4byte	.LASF114
 2181 076f 05       		.byte	0x5
 2182 0770 4601     		.2byte	0x146
 2183 0772 D3000000 		.4byte	0xd3
 2184 0776 02       		.byte	0x2
 2185 0777 23       		.byte	0x23
 2186 0778 50       		.uleb128 0x50
 2187 0779 12       		.uleb128 0x12
 2188 077a 75120000 		.4byte	.LASF115
 2189 077e 05       		.byte	0x5
 2190 077f 4701     		.2byte	0x147
 2191 0781 D3000000 		.4byte	0xd3
 2192 0785 02       		.byte	0x2
 2193 0786 23       		.byte	0x23
 2194 0787 51       		.uleb128 0x51
 2195 0788 13       		.uleb128 0x13
 2196 0789 53413100 		.ascii	"SA1\000"
 2197 078d 05       		.byte	0x5
 2198 078e 4801     		.2byte	0x148
 2199 0790 D3000000 		.4byte	0xd3
 2200 0794 02       		.byte	0x2
 2201 0795 23       		.byte	0x23
 2202 0796 52       		.uleb128 0x52
 2203 0797 13       		.uleb128 0x13
 2204 0798 433400   		.ascii	"C4\000"
 2205 079b 05       		.byte	0x5
 2206 079c 4901     		.2byte	0x149
ARM GAS  /tmp/ccV38c0o.s 			page 49


 2207 079e D3000000 		.4byte	0xd3
 2208 07a2 02       		.byte	0x2
 2209 07a3 23       		.byte	0x23
 2210 07a4 53       		.uleb128 0x53
 2211 07a5 12       		.uleb128 0x12
 2212 07a6 08170000 		.4byte	.LASF116
 2213 07aa 05       		.byte	0x5
 2214 07ab 4A01     		.2byte	0x14a
 2215 07ad D3000000 		.4byte	0xd3
 2216 07b1 02       		.byte	0x2
 2217 07b2 23       		.byte	0x23
 2218 07b3 54       		.uleb128 0x54
 2219 07b4 12       		.uleb128 0x12
 2220 07b5 64060000 		.4byte	.LASF117
 2221 07b9 05       		.byte	0x5
 2222 07ba 4D01     		.2byte	0x14d
 2223 07bc FF000000 		.4byte	0xff
 2224 07c0 02       		.byte	0x2
 2225 07c1 23       		.byte	0x23
 2226 07c2 58       		.uleb128 0x58
 2227 07c3 12       		.uleb128 0x12
 2228 07c4 62050000 		.4byte	.LASF118
 2229 07c8 05       		.byte	0x5
 2230 07c9 4E01     		.2byte	0x14e
 2231 07cb D3000000 		.4byte	0xd3
 2232 07cf 02       		.byte	0x2
 2233 07d0 23       		.byte	0x23
 2234 07d1 5C       		.uleb128 0x5c
 2235 07d2 12       		.uleb128 0x12
 2236 07d3 76000000 		.4byte	.LASF119
 2237 07d7 05       		.byte	0x5
 2238 07d8 4F01     		.2byte	0x14f
 2239 07da D3000000 		.4byte	0xd3
 2240 07de 02       		.byte	0x2
 2241 07df 23       		.byte	0x23
 2242 07e0 5D       		.uleb128 0x5d
 2243 07e1 12       		.uleb128 0x12
 2244 07e2 500A0000 		.4byte	.LASF120
 2245 07e6 05       		.byte	0x5
 2246 07e7 5001     		.2byte	0x150
 2247 07e9 D3000000 		.4byte	0xd3
 2248 07ed 02       		.byte	0x2
 2249 07ee 23       		.byte	0x23
 2250 07ef 5E       		.uleb128 0x5e
 2251 07f0 12       		.uleb128 0x12
 2252 07f1 970B0000 		.4byte	.LASF121
 2253 07f5 05       		.byte	0x5
 2254 07f6 5101     		.2byte	0x151
 2255 07f8 D3000000 		.4byte	0xd3
 2256 07fc 02       		.byte	0x2
 2257 07fd 23       		.byte	0x23
 2258 07fe 5F       		.uleb128 0x5f
 2259 07ff 12       		.uleb128 0x12
 2260 0800 21150000 		.4byte	.LASF122
 2261 0804 05       		.byte	0x5
 2262 0805 5201     		.2byte	0x152
 2263 0807 86000000 		.4byte	0x86
ARM GAS  /tmp/ccV38c0o.s 			page 50


 2264 080b 02       		.byte	0x2
 2265 080c 23       		.byte	0x23
 2266 080d 60       		.uleb128 0x60
 2267 080e 12       		.uleb128 0x12
 2268 080f E50B0000 		.4byte	.LASF123
 2269 0813 05       		.byte	0x5
 2270 0814 5301     		.2byte	0x153
 2271 0816 86000000 		.4byte	0x86
 2272 081a 02       		.byte	0x2
 2273 081b 23       		.byte	0x23
 2274 081c 64       		.uleb128 0x64
 2275 081d 12       		.uleb128 0x12
 2276 081e EE070000 		.4byte	.LASF124
 2277 0822 05       		.byte	0x5
 2278 0823 5401     		.2byte	0x154
 2279 0825 D3000000 		.4byte	0xd3
 2280 0829 02       		.byte	0x2
 2281 082a 23       		.byte	0x23
 2282 082b 68       		.uleb128 0x68
 2283 082c 12       		.uleb128 0x12
 2284 082d E1140000 		.4byte	.LASF125
 2285 0831 05       		.byte	0x5
 2286 0832 5501     		.2byte	0x155
 2287 0834 D3000000 		.4byte	0xd3
 2288 0838 02       		.byte	0x2
 2289 0839 23       		.byte	0x23
 2290 083a 69       		.uleb128 0x69
 2291 083b 12       		.uleb128 0x12
 2292 083c A90C0000 		.4byte	.LASF126
 2293 0840 05       		.byte	0x5
 2294 0841 5601     		.2byte	0x156
 2295 0843 D3000000 		.4byte	0xd3
 2296 0847 02       		.byte	0x2
 2297 0848 23       		.byte	0x23
 2298 0849 6A       		.uleb128 0x6a
 2299 084a 12       		.uleb128 0x12
 2300 084b 16030000 		.4byte	.LASF127
 2301 084f 05       		.byte	0x5
 2302 0850 5701     		.2byte	0x157
 2303 0852 D3000000 		.4byte	0xd3
 2304 0856 02       		.byte	0x2
 2305 0857 23       		.byte	0x23
 2306 0858 6B       		.uleb128 0x6b
 2307 0859 12       		.uleb128 0x12
 2308 085a 5C0B0000 		.4byte	.LASF128
 2309 085e 05       		.byte	0x5
 2310 085f 5801     		.2byte	0x158
 2311 0861 D3000000 		.4byte	0xd3
 2312 0865 02       		.byte	0x2
 2313 0866 23       		.byte	0x23
 2314 0867 6C       		.uleb128 0x6c
 2315 0868 12       		.uleb128 0x12
 2316 0869 47160000 		.4byte	.LASF129
 2317 086d 05       		.byte	0x5
 2318 086e 5901     		.2byte	0x159
 2319 0870 D3000000 		.4byte	0xd3
 2320 0874 02       		.byte	0x2
ARM GAS  /tmp/ccV38c0o.s 			page 51


 2321 0875 23       		.byte	0x23
 2322 0876 6D       		.uleb128 0x6d
 2323 0877 12       		.uleb128 0x12
 2324 0878 3A0B0000 		.4byte	.LASF130
 2325 087c 05       		.byte	0x5
 2326 087d 5A01     		.2byte	0x15a
 2327 087f D3000000 		.4byte	0xd3
 2328 0883 02       		.byte	0x2
 2329 0884 23       		.byte	0x23
 2330 0885 6E       		.uleb128 0x6e
 2331 0886 12       		.uleb128 0x12
 2332 0887 DB010000 		.4byte	.LASF131
 2333 088b 05       		.byte	0x5
 2334 088c 5B01     		.2byte	0x15b
 2335 088e D3000000 		.4byte	0xd3
 2336 0892 02       		.byte	0x2
 2337 0893 23       		.byte	0x23
 2338 0894 6F       		.uleb128 0x6f
 2339 0895 12       		.uleb128 0x12
 2340 0896 8A060000 		.4byte	.LASF132
 2341 089a 05       		.byte	0x5
 2342 089b 5D01     		.2byte	0x15d
 2343 089d DE000000 		.4byte	0xde
 2344 08a1 02       		.byte	0x2
 2345 08a2 23       		.byte	0x23
 2346 08a3 70       		.uleb128 0x70
 2347 08a4 12       		.uleb128 0x12
 2348 08a5 30110000 		.4byte	.LASF133
 2349 08a9 05       		.byte	0x5
 2350 08aa 5E01     		.2byte	0x15e
 2351 08ac D3000000 		.4byte	0xd3
 2352 08b0 02       		.byte	0x2
 2353 08b1 23       		.byte	0x23
 2354 08b2 71       		.uleb128 0x71
 2355 08b3 12       		.uleb128 0x12
 2356 08b4 640C0000 		.4byte	.LASF134
 2357 08b8 05       		.byte	0x5
 2358 08b9 6101     		.2byte	0x161
 2359 08bb D3000000 		.4byte	0xd3
 2360 08bf 02       		.byte	0x2
 2361 08c0 23       		.byte	0x23
 2362 08c1 72       		.uleb128 0x72
 2363 08c2 12       		.uleb128 0x12
 2364 08c3 4E090000 		.4byte	.LASF135
 2365 08c7 05       		.byte	0x5
 2366 08c8 6201     		.2byte	0x162
 2367 08ca D3000000 		.4byte	0xd3
 2368 08ce 02       		.byte	0x2
 2369 08cf 23       		.byte	0x23
 2370 08d0 73       		.uleb128 0x73
 2371 08d1 12       		.uleb128 0x12
 2372 08d2 DD0F0000 		.4byte	.LASF136
 2373 08d6 05       		.byte	0x5
 2374 08d7 6301     		.2byte	0x163
 2375 08d9 D3000000 		.4byte	0xd3
 2376 08dd 02       		.byte	0x2
 2377 08de 23       		.byte	0x23
ARM GAS  /tmp/ccV38c0o.s 			page 52


 2378 08df 74       		.uleb128 0x74
 2379 08e0 12       		.uleb128 0x12
 2380 08e1 5D020000 		.4byte	.LASF137
 2381 08e5 05       		.byte	0x5
 2382 08e6 6401     		.2byte	0x164
 2383 08e8 D3000000 		.4byte	0xd3
 2384 08ec 02       		.byte	0x2
 2385 08ed 23       		.byte	0x23
 2386 08ee 75       		.uleb128 0x75
 2387 08ef 12       		.uleb128 0x12
 2388 08f0 AD0D0000 		.4byte	.LASF138
 2389 08f4 05       		.byte	0x5
 2390 08f5 6701     		.2byte	0x167
 2391 08f7 D3000000 		.4byte	0xd3
 2392 08fb 02       		.byte	0x2
 2393 08fc 23       		.byte	0x23
 2394 08fd 76       		.uleb128 0x76
 2395 08fe 12       		.uleb128 0x12
 2396 08ff E7130000 		.4byte	.LASF139
 2397 0903 05       		.byte	0x5
 2398 0904 6801     		.2byte	0x168
 2399 0906 D3000000 		.4byte	0xd3
 2400 090a 02       		.byte	0x2
 2401 090b 23       		.byte	0x23
 2402 090c 77       		.uleb128 0x77
 2403 090d 12       		.uleb128 0x12
 2404 090e C00D0000 		.4byte	.LASF140
 2405 0912 05       		.byte	0x5
 2406 0913 6901     		.2byte	0x169
 2407 0915 D3000000 		.4byte	0xd3
 2408 0919 02       		.byte	0x2
 2409 091a 23       		.byte	0x23
 2410 091b 78       		.uleb128 0x78
 2411 091c 12       		.uleb128 0x12
 2412 091d 430D0000 		.4byte	.LASF141
 2413 0921 05       		.byte	0x5
 2414 0922 6A01     		.2byte	0x16a
 2415 0924 D3000000 		.4byte	0xd3
 2416 0928 02       		.byte	0x2
 2417 0929 23       		.byte	0x23
 2418 092a 79       		.uleb128 0x79
 2419 092b 12       		.uleb128 0x12
 2420 092c 09010000 		.4byte	.LASF142
 2421 0930 05       		.byte	0x5
 2422 0931 6B01     		.2byte	0x16b
 2423 0933 D3000000 		.4byte	0xd3
 2424 0937 02       		.byte	0x2
 2425 0938 23       		.byte	0x23
 2426 0939 7A       		.uleb128 0x7a
 2427 093a 12       		.uleb128 0x12
 2428 093b F4120000 		.4byte	.LASF143
 2429 093f 05       		.byte	0x5
 2430 0940 6C01     		.2byte	0x16c
 2431 0942 D3000000 		.4byte	0xd3
 2432 0946 02       		.byte	0x2
 2433 0947 23       		.byte	0x23
 2434 0948 7B       		.uleb128 0x7b
ARM GAS  /tmp/ccV38c0o.s 			page 53


 2435 0949 12       		.uleb128 0x12
 2436 094a DD050000 		.4byte	.LASF144
 2437 094e 05       		.byte	0x5
 2438 094f 6F01     		.2byte	0x16f
 2439 0951 D3000000 		.4byte	0xd3
 2440 0955 02       		.byte	0x2
 2441 0956 23       		.byte	0x23
 2442 0957 7C       		.uleb128 0x7c
 2443 0958 12       		.uleb128 0x12
 2444 0959 66140000 		.4byte	.LASF145
 2445 095d 05       		.byte	0x5
 2446 095e 7001     		.2byte	0x170
 2447 0960 D3000000 		.4byte	0xd3
 2448 0964 02       		.byte	0x2
 2449 0965 23       		.byte	0x23
 2450 0966 7D       		.uleb128 0x7d
 2451 0967 12       		.uleb128 0x12
 2452 0968 CD0B0000 		.4byte	.LASF146
 2453 096c 05       		.byte	0x5
 2454 096d 7101     		.2byte	0x171
 2455 096f C60A0000 		.4byte	0xac6
 2456 0973 02       		.byte	0x2
 2457 0974 23       		.byte	0x23
 2458 0975 7E       		.uleb128 0x7e
 2459 0976 12       		.uleb128 0x12
 2460 0977 1B0F0000 		.4byte	.LASF147
 2461 097b 05       		.byte	0x5
 2462 097c 7201     		.2byte	0x172
 2463 097e 86000000 		.4byte	0x86
 2464 0982 03       		.byte	0x3
 2465 0983 23       		.byte	0x23
 2466 0984 8002     		.uleb128 0x100
 2467 0986 12       		.uleb128 0x12
 2468 0987 69130000 		.4byte	.LASF148
 2469 098b 05       		.byte	0x5
 2470 098c 7301     		.2byte	0x173
 2471 098e D3000000 		.4byte	0xd3
 2472 0992 03       		.byte	0x3
 2473 0993 23       		.byte	0x23
 2474 0994 8402     		.uleb128 0x104
 2475 0996 12       		.uleb128 0x12
 2476 0997 54130000 		.4byte	.LASF149
 2477 099b 05       		.byte	0x5
 2478 099c 7401     		.2byte	0x174
 2479 099e D3000000 		.4byte	0xd3
 2480 09a2 03       		.byte	0x3
 2481 09a3 23       		.byte	0x23
 2482 09a4 8502     		.uleb128 0x105
 2483 09a6 12       		.uleb128 0x12
 2484 09a7 33170000 		.4byte	.LASF150
 2485 09ab 05       		.byte	0x5
 2486 09ac 7501     		.2byte	0x175
 2487 09ae 0A010000 		.4byte	0x10a
 2488 09b2 03       		.byte	0x3
 2489 09b3 23       		.byte	0x23
 2490 09b4 8802     		.uleb128 0x108
 2491 09b6 12       		.uleb128 0x12
ARM GAS  /tmp/ccV38c0o.s 			page 54


 2492 09b7 67070000 		.4byte	.LASF151
 2493 09bb 05       		.byte	0x5
 2494 09bc 7601     		.2byte	0x176
 2495 09be D3000000 		.4byte	0xd3
 2496 09c2 03       		.byte	0x3
 2497 09c3 23       		.byte	0x23
 2498 09c4 8C02     		.uleb128 0x10c
 2499 09c6 12       		.uleb128 0x12
 2500 09c7 950E0000 		.4byte	.LASF152
 2501 09cb 05       		.byte	0x5
 2502 09cc 7701     		.2byte	0x177
 2503 09ce D3000000 		.4byte	0xd3
 2504 09d2 03       		.byte	0x3
 2505 09d3 23       		.byte	0x23
 2506 09d4 8D02     		.uleb128 0x10d
 2507 09d6 12       		.uleb128 0x12
 2508 09d7 4C0B0000 		.4byte	.LASF153
 2509 09db 05       		.byte	0x5
 2510 09dc 7801     		.2byte	0x178
 2511 09de FF000000 		.4byte	0xff
 2512 09e2 03       		.byte	0x3
 2513 09e3 23       		.byte	0x23
 2514 09e4 9002     		.uleb128 0x110
 2515 09e6 12       		.uleb128 0x12
 2516 09e7 1D080000 		.4byte	.LASF154
 2517 09eb 05       		.byte	0x5
 2518 09ec 7901     		.2byte	0x179
 2519 09ee FF000000 		.4byte	0xff
 2520 09f2 03       		.byte	0x3
 2521 09f3 23       		.byte	0x23
 2522 09f4 9402     		.uleb128 0x114
 2523 09f6 12       		.uleb128 0x12
 2524 09f7 B0070000 		.4byte	.LASF155
 2525 09fb 05       		.byte	0x5
 2526 09fc 7A01     		.2byte	0x17a
 2527 09fe FF000000 		.4byte	0xff
 2528 0a02 03       		.byte	0x3
 2529 0a03 23       		.byte	0x23
 2530 0a04 9802     		.uleb128 0x118
 2531 0a06 12       		.uleb128 0x12
 2532 0a07 B2040000 		.4byte	.LASF156
 2533 0a0b 05       		.byte	0x5
 2534 0a0c 7D01     		.2byte	0x17d
 2535 0a0e FF000000 		.4byte	0xff
 2536 0a12 03       		.byte	0x3
 2537 0a13 23       		.byte	0x23
 2538 0a14 9C02     		.uleb128 0x11c
 2539 0a16 12       		.uleb128 0x12
 2540 0a17 2F030000 		.4byte	.LASF157
 2541 0a1b 05       		.byte	0x5
 2542 0a1c 7E01     		.2byte	0x17e
 2543 0a1e D3000000 		.4byte	0xd3
 2544 0a22 03       		.byte	0x3
 2545 0a23 23       		.byte	0x23
 2546 0a24 A002     		.uleb128 0x120
 2547 0a26 12       		.uleb128 0x12
 2548 0a27 A4070000 		.4byte	.LASF158
ARM GAS  /tmp/ccV38c0o.s 			page 55


 2549 0a2b 05       		.byte	0x5
 2550 0a2c 7F01     		.2byte	0x17f
 2551 0a2e D3000000 		.4byte	0xd3
 2552 0a32 03       		.byte	0x3
 2553 0a33 23       		.byte	0x23
 2554 0a34 A102     		.uleb128 0x121
 2555 0a36 12       		.uleb128 0x12
 2556 0a37 FE050000 		.4byte	.LASF159
 2557 0a3b 05       		.byte	0x5
 2558 0a3c 8001     		.2byte	0x180
 2559 0a3e D3000000 		.4byte	0xd3
 2560 0a42 03       		.byte	0x3
 2561 0a43 23       		.byte	0x23
 2562 0a44 A202     		.uleb128 0x122
 2563 0a46 12       		.uleb128 0x12
 2564 0a47 2E060000 		.4byte	.LASF160
 2565 0a4b 05       		.byte	0x5
 2566 0a4c 8101     		.2byte	0x181
 2567 0a4e D3000000 		.4byte	0xd3
 2568 0a52 03       		.byte	0x3
 2569 0a53 23       		.byte	0x23
 2570 0a54 A302     		.uleb128 0x123
 2571 0a56 12       		.uleb128 0x12
 2572 0a57 C9040000 		.4byte	.LASF161
 2573 0a5b 05       		.byte	0x5
 2574 0a5c 8201     		.2byte	0x182
 2575 0a5e D3000000 		.4byte	0xd3
 2576 0a62 03       		.byte	0x3
 2577 0a63 23       		.byte	0x23
 2578 0a64 A402     		.uleb128 0x124
 2579 0a66 13       		.uleb128 0x13
 2580 0a67 425300   		.ascii	"BS\000"
 2581 0a6a 05       		.byte	0x5
 2582 0a6b 8301     		.2byte	0x183
 2583 0a6d D3000000 		.4byte	0xd3
 2584 0a71 03       		.byte	0x3
 2585 0a72 23       		.byte	0x23
 2586 0a73 A502     		.uleb128 0x125
 2587 0a75 12       		.uleb128 0x12
 2588 0a76 8D170000 		.4byte	.LASF162
 2589 0a7a 05       		.byte	0x5
 2590 0a7b 8401     		.2byte	0x184
 2591 0a7d D3000000 		.4byte	0xd3
 2592 0a81 03       		.byte	0x3
 2593 0a82 23       		.byte	0x23
 2594 0a83 A602     		.uleb128 0x126
 2595 0a85 12       		.uleb128 0x12
 2596 0a86 F2150000 		.4byte	.LASF163
 2597 0a8a 05       		.byte	0x5
 2598 0a8b 8501     		.2byte	0x185
 2599 0a8d DE000000 		.4byte	0xde
 2600 0a91 03       		.byte	0x3
 2601 0a92 23       		.byte	0x23
 2602 0a93 A702     		.uleb128 0x127
 2603 0a95 12       		.uleb128 0x12
 2604 0a96 20000000 		.4byte	.LASF164
 2605 0a9a 05       		.byte	0x5
ARM GAS  /tmp/ccV38c0o.s 			page 56


 2606 0a9b 8601     		.2byte	0x186
 2607 0a9d D3000000 		.4byte	0xd3
 2608 0aa1 03       		.byte	0x3
 2609 0aa2 23       		.byte	0x23
 2610 0aa3 A802     		.uleb128 0x128
 2611 0aa5 12       		.uleb128 0x12
 2612 0aa6 3B180000 		.4byte	.LASF165
 2613 0aaa 05       		.byte	0x5
 2614 0aab 8801     		.2byte	0x188
 2615 0aad D3000000 		.4byte	0xd3
 2616 0ab1 03       		.byte	0x3
 2617 0ab2 23       		.byte	0x23
 2618 0ab3 A902     		.uleb128 0x129
 2619 0ab5 12       		.uleb128 0x12
 2620 0ab6 B3150000 		.4byte	.LASF166
 2621 0aba 05       		.byte	0x5
 2622 0abb 8901     		.2byte	0x189
 2623 0abd D3000000 		.4byte	0xd3
 2624 0ac1 03       		.byte	0x3
 2625 0ac2 23       		.byte	0x23
 2626 0ac3 AA02     		.uleb128 0x12a
 2627 0ac5 00       		.byte	0x0
 2628 0ac6 07       		.uleb128 0x7
 2629 0ac7 D60A0000 		.4byte	0xad6
 2630 0acb BF000000 		.4byte	0xbf
 2631 0acf 08       		.uleb128 0x8
 2632 0ad0 B2000000 		.4byte	0xb2
 2633 0ad4 7F       		.byte	0x7f
 2634 0ad5 00       		.byte	0x0
 2635 0ad6 14       		.uleb128 0x14
 2636 0ad7 3E110000 		.4byte	0x113e
 2637 0adb B80D0000 		.4byte	.LASF167
 2638 0adf 74040100 		.4byte	0x10474
 2639 0ae3 07       		.byte	0x7
 2640 0ae4 5A       		.byte	0x5a
 2641 0ae5 04       		.uleb128 0x4
 2642 0ae6 52414D00 		.ascii	"RAM\000"
 2643 0aea 07       		.byte	0x7
 2644 0aeb 8F       		.byte	0x8f
 2645 0aec 4D040000 		.4byte	0x44d
 2646 0af0 02       		.byte	0x2
 2647 0af1 23       		.byte	0x23
 2648 0af2 00       		.uleb128 0x0
 2649 0af3 04       		.uleb128 0x4
 2650 0af4 524F4D00 		.ascii	"ROM\000"
 2651 0af8 07       		.byte	0x7
 2652 0af9 90       		.byte	0x90
 2653 0afa 4D040000 		.4byte	0x44d
 2654 0afe 02       		.byte	0x2
 2655 0aff 23       		.byte	0x23
 2656 0b00 04       		.uleb128 0x4
 2657 0b01 03       		.uleb128 0x3
 2658 0b02 A3040000 		.4byte	.LASF168
 2659 0b06 07       		.byte	0x7
 2660 0b07 91       		.byte	0x91
 2661 0b08 4D040000 		.4byte	0x44d
 2662 0b0c 02       		.byte	0x2
ARM GAS  /tmp/ccV38c0o.s 			page 57


 2663 0b0d 23       		.byte	0x23
 2664 0b0e 08       		.uleb128 0x8
 2665 0b0f 03       		.uleb128 0x3
 2666 0b10 FD0F0000 		.4byte	.LASF169
 2667 0b14 07       		.byte	0x7
 2668 0b15 92       		.byte	0x92
 2669 0b16 4D040000 		.4byte	0x44d
 2670 0b1a 02       		.byte	0x2
 2671 0b1b 23       		.byte	0x23
 2672 0b1c 0C       		.uleb128 0xc
 2673 0b1d 03       		.uleb128 0x3
 2674 0b1e 04180000 		.4byte	.LASF170
 2675 0b22 07       		.byte	0x7
 2676 0b23 93       		.byte	0x93
 2677 0b24 4D040000 		.4byte	0x44d
 2678 0b28 02       		.byte	0x2
 2679 0b29 23       		.byte	0x23
 2680 0b2a 10       		.uleb128 0x10
 2681 0b2b 03       		.uleb128 0x3
 2682 0b2c FD080000 		.4byte	.LASF171
 2683 0b30 07       		.byte	0x7
 2684 0b31 94       		.byte	0x94
 2685 0b32 4D040000 		.4byte	0x44d
 2686 0b36 02       		.byte	0x2
 2687 0b37 23       		.byte	0x23
 2688 0b38 14       		.uleb128 0x14
 2689 0b39 03       		.uleb128 0x3
 2690 0b3a 77030000 		.4byte	.LASF172
 2691 0b3e 07       		.byte	0x7
 2692 0b3f 95       		.byte	0x95
 2693 0b40 4D040000 		.4byte	0x44d
 2694 0b44 02       		.byte	0x2
 2695 0b45 23       		.byte	0x23
 2696 0b46 18       		.uleb128 0x18
 2697 0b47 03       		.uleb128 0x3
 2698 0b48 66180000 		.4byte	.LASF173
 2699 0b4c 07       		.byte	0x7
 2700 0b4d 96       		.byte	0x96
 2701 0b4e 15010000 		.4byte	0x115
 2702 0b52 02       		.byte	0x2
 2703 0b53 23       		.byte	0x23
 2704 0b54 1C       		.uleb128 0x1c
 2705 0b55 03       		.uleb128 0x3
 2706 0b56 DE0D0000 		.4byte	.LASF174
 2707 0b5a 07       		.byte	0x7
 2708 0b5b 97       		.byte	0x97
 2709 0b5c 15010000 		.4byte	0x115
 2710 0b60 02       		.byte	0x2
 2711 0b61 23       		.byte	0x23
 2712 0b62 1D       		.uleb128 0x1d
 2713 0b63 03       		.uleb128 0x3
 2714 0b64 A7000000 		.4byte	.LASF175
 2715 0b68 07       		.byte	0x7
 2716 0b69 98       		.byte	0x98
 2717 0b6a E9000000 		.4byte	0xe9
 2718 0b6e 02       		.byte	0x2
 2719 0b6f 23       		.byte	0x23
ARM GAS  /tmp/ccV38c0o.s 			page 58


 2720 0b70 1E       		.uleb128 0x1e
 2721 0b71 03       		.uleb128 0x3
 2722 0b72 9B020000 		.4byte	.LASF176
 2723 0b76 07       		.byte	0x7
 2724 0b77 99       		.byte	0x99
 2725 0b78 DE000000 		.4byte	0xde
 2726 0b7c 02       		.byte	0x2
 2727 0b7d 23       		.byte	0x23
 2728 0b7e 20       		.uleb128 0x20
 2729 0b7f 04       		.uleb128 0x4
 2730 0b80 4D617000 		.ascii	"Map\000"
 2731 0b84 07       		.byte	0x7
 2732 0b85 9A       		.byte	0x9a
 2733 0b86 3E110000 		.4byte	0x113e
 2734 0b8a 02       		.byte	0x2
 2735 0b8b 23       		.byte	0x23
 2736 0b8c 24       		.uleb128 0x24
 2737 0b8d 03       		.uleb128 0x3
 2738 0b8e 0A0C0000 		.4byte	.LASF177
 2739 0b92 07       		.byte	0x7
 2740 0b93 9B       		.byte	0x9b
 2741 0b94 3E110000 		.4byte	0x113e
 2742 0b98 04       		.byte	0x4
 2743 0b99 23       		.byte	0x23
 2744 0b9a A48001   		.uleb128 0x4024
 2745 0b9d 03       		.uleb128 0x3
 2746 0b9e 740A0000 		.4byte	.LASF178
 2747 0ba2 07       		.byte	0x7
 2748 0ba3 9C       		.byte	0x9c
 2749 0ba4 4F110000 		.4byte	0x114f
 2750 0ba8 04       		.byte	0x4
 2751 0ba9 23       		.byte	0x23
 2752 0baa A48002   		.uleb128 0x8024
 2753 0bad 03       		.uleb128 0x3
 2754 0bae 2E160000 		.4byte	.LASF179
 2755 0bb2 07       		.byte	0x7
 2756 0bb3 9D       		.byte	0x9d
 2757 0bb4 60110000 		.4byte	0x1160
 2758 0bb8 04       		.byte	0x4
 2759 0bb9 23       		.byte	0x23
 2760 0bba A48003   		.uleb128 0xc024
 2761 0bbd 03       		.uleb128 0x3
 2762 0bbe EB160000 		.4byte	.LASF180
 2763 0bc2 07       		.byte	0x7
 2764 0bc3 9E       		.byte	0x9e
 2765 0bc4 60110000 		.4byte	0x1160
 2766 0bc8 04       		.byte	0x4
 2767 0bc9 23       		.byte	0x23
 2768 0bca A4A003   		.uleb128 0xd024
 2769 0bcd 03       		.uleb128 0x3
 2770 0bce BD130000 		.4byte	.LASF181
 2771 0bd2 07       		.byte	0x7
 2772 0bd3 9F       		.byte	0x9f
 2773 0bd4 71110000 		.4byte	0x1171
 2774 0bd8 04       		.byte	0x4
 2775 0bd9 23       		.byte	0x23
 2776 0bda A4C003   		.uleb128 0xe024
ARM GAS  /tmp/ccV38c0o.s 			page 59


 2777 0bdd 03       		.uleb128 0x3
 2778 0bde 61110000 		.4byte	.LASF182
 2779 0be2 07       		.byte	0x7
 2780 0be3 A0       		.byte	0xa0
 2781 0be4 81110000 		.4byte	0x1181
 2782 0be8 04       		.byte	0x4
 2783 0be9 23       		.byte	0x23
 2784 0bea BBC003   		.uleb128 0xe03b
 2785 0bed 03       		.uleb128 0x3
 2786 0bee CD0F0000 		.4byte	.LASF183
 2787 0bf2 07       		.byte	0x7
 2788 0bf3 A1       		.byte	0xa1
 2789 0bf4 91110000 		.4byte	0x1191
 2790 0bf8 04       		.byte	0x4
 2791 0bf9 23       		.byte	0x23
 2792 0bfa C0C003   		.uleb128 0xe040
 2793 0bfd 03       		.uleb128 0x3
 2794 0bfe 15160000 		.4byte	.LASF184
 2795 0c02 07       		.byte	0x7
 2796 0c03 A2       		.byte	0xa2
 2797 0c04 DE000000 		.4byte	0xde
 2798 0c08 04       		.byte	0x4
 2799 0c09 23       		.byte	0x23
 2800 0c0a C3C003   		.uleb128 0xe043
 2801 0c0d 03       		.uleb128 0x3
 2802 0c0e 0B000000 		.4byte	.LASF185
 2803 0c12 07       		.byte	0x7
 2804 0c13 A3       		.byte	0xa3
 2805 0c14 DE000000 		.4byte	0xde
 2806 0c18 04       		.byte	0x4
 2807 0c19 23       		.byte	0x23
 2808 0c1a C4C003   		.uleb128 0xe044
 2809 0c1d 03       		.uleb128 0x3
 2810 0c1e 6D090000 		.4byte	.LASF186
 2811 0c22 07       		.byte	0x7
 2812 0c23 A4       		.byte	0xa4
 2813 0c24 DE000000 		.4byte	0xde
 2814 0c28 04       		.byte	0x4
 2815 0c29 23       		.byte	0x23
 2816 0c2a C5C003   		.uleb128 0xe045
 2817 0c2d 03       		.uleb128 0x3
 2818 0c2e 90040000 		.4byte	.LASF187
 2819 0c32 07       		.byte	0x7
 2820 0c33 A5       		.byte	0xa5
 2821 0c34 0A010000 		.4byte	0x10a
 2822 0c38 04       		.byte	0x4
 2823 0c39 23       		.byte	0x23
 2824 0c3a C8C003   		.uleb128 0xe048
 2825 0c3d 03       		.uleb128 0x3
 2826 0c3e 1D060000 		.4byte	.LASF188
 2827 0c42 07       		.byte	0x7
 2828 0c43 A6       		.byte	0xa6
 2829 0c44 0A010000 		.4byte	0x10a
 2830 0c48 04       		.byte	0x4
 2831 0c49 23       		.byte	0x23
 2832 0c4a CCC003   		.uleb128 0xe04c
 2833 0c4d 03       		.uleb128 0x3
ARM GAS  /tmp/ccV38c0o.s 			page 60


 2834 0c4e 76060000 		.4byte	.LASF189
 2835 0c52 07       		.byte	0x7
 2836 0c53 A7       		.byte	0xa7
 2837 0c54 FF000000 		.4byte	0xff
 2838 0c58 04       		.byte	0x4
 2839 0c59 23       		.byte	0x23
 2840 0c5a D0C003   		.uleb128 0xe050
 2841 0c5d 03       		.uleb128 0x3
 2842 0c5e EA0F0000 		.4byte	.LASF190
 2843 0c62 07       		.byte	0x7
 2844 0c63 A8       		.byte	0xa8
 2845 0c64 FF000000 		.4byte	0xff
 2846 0c68 04       		.byte	0x4
 2847 0c69 23       		.byte	0x23
 2848 0c6a D4C003   		.uleb128 0xe054
 2849 0c6d 03       		.uleb128 0x3
 2850 0c6e 240E0000 		.4byte	.LASF191
 2851 0c72 07       		.byte	0x7
 2852 0c73 A9       		.byte	0xa9
 2853 0c74 FF000000 		.4byte	0xff
 2854 0c78 04       		.byte	0x4
 2855 0c79 23       		.byte	0x23
 2856 0c7a D8C003   		.uleb128 0xe058
 2857 0c7d 03       		.uleb128 0x3
 2858 0c7e 7E100000 		.4byte	.LASF192
 2859 0c82 07       		.byte	0x7
 2860 0c83 AA       		.byte	0xaa
 2861 0c84 FF000000 		.4byte	0xff
 2862 0c88 04       		.byte	0x4
 2863 0c89 23       		.byte	0x23
 2864 0c8a DCC003   		.uleb128 0xe05c
 2865 0c8d 03       		.uleb128 0x3
 2866 0c8e 51080000 		.4byte	.LASF193
 2867 0c92 07       		.byte	0x7
 2868 0c93 AB       		.byte	0xab
 2869 0c94 4D040000 		.4byte	0x44d
 2870 0c98 04       		.byte	0x4
 2871 0c99 23       		.byte	0x23
 2872 0c9a E0C003   		.uleb128 0xe060
 2873 0c9d 03       		.uleb128 0x3
 2874 0c9e D4050000 		.4byte	.LASF194
 2875 0ca2 07       		.byte	0x7
 2876 0ca3 AC       		.byte	0xac
 2877 0ca4 4D040000 		.4byte	0x44d
 2878 0ca8 04       		.byte	0x4
 2879 0ca9 23       		.byte	0x23
 2880 0caa E4C003   		.uleb128 0xe064
 2881 0cad 03       		.uleb128 0x3
 2882 0cae D90C0000 		.4byte	.LASF195
 2883 0cb2 07       		.byte	0x7
 2884 0cb3 AD       		.byte	0xad
 2885 0cb4 FF000000 		.4byte	0xff
 2886 0cb8 04       		.byte	0x4
 2887 0cb9 23       		.byte	0x23
 2888 0cba E8C003   		.uleb128 0xe068
 2889 0cbd 03       		.uleb128 0x3
 2890 0cbe AA010000 		.4byte	.LASF196
ARM GAS  /tmp/ccV38c0o.s 			page 61


 2891 0cc2 07       		.byte	0x7
 2892 0cc3 AE       		.byte	0xae
 2893 0cc4 FF000000 		.4byte	0xff
 2894 0cc8 04       		.byte	0x4
 2895 0cc9 23       		.byte	0x23
 2896 0cca ECC003   		.uleb128 0xe06c
 2897 0ccd 03       		.uleb128 0x3
 2898 0cce 50060000 		.4byte	.LASF197
 2899 0cd2 07       		.byte	0x7
 2900 0cd3 AF       		.byte	0xaf
 2901 0cd4 FF000000 		.4byte	0xff
 2902 0cd8 04       		.byte	0x4
 2903 0cd9 23       		.byte	0x23
 2904 0cda F0C003   		.uleb128 0xe070
 2905 0cdd 03       		.uleb128 0x3
 2906 0cde 150A0000 		.4byte	.LASF198
 2907 0ce2 07       		.byte	0x7
 2908 0ce3 B0       		.byte	0xb0
 2909 0ce4 A1110000 		.4byte	0x11a1
 2910 0ce8 04       		.byte	0x4
 2911 0ce9 23       		.byte	0x23
 2912 0cea F4C003   		.uleb128 0xe074
 2913 0ced 03       		.uleb128 0x3
 2914 0cee 42090000 		.4byte	.LASF199
 2915 0cf2 07       		.byte	0x7
 2916 0cf3 B2       		.byte	0xb2
 2917 0cf4 B2110000 		.4byte	0x11b2
 2918 0cf8 04       		.byte	0x4
 2919 0cf9 23       		.byte	0x23
 2920 0cfa F48004   		.uleb128 0x10074
 2921 0cfd 15       		.uleb128 0x15
 2922 0cfe 1E0D0000 		.4byte	0xd1e
 2923 0d02 01       		.byte	0x1
 2924 0d03 290B0000 		.4byte	.LASF200
 2925 0d07 07       		.byte	0x7
 2926 0d08 5C       		.byte	0x5c
 2927 0d09 EA010000 		.4byte	.LASF202
 2928 0d0d 15010000 		.4byte	0x115
 2929 0d11 01       		.byte	0x1
 2930 0d12 16       		.uleb128 0x16
 2931 0d13 C3110000 		.4byte	0x11c3
 2932 0d17 01       		.byte	0x1
 2933 0d18 17       		.uleb128 0x17
 2934 0d19 C8000000 		.4byte	0xc8
 2935 0d1d 00       		.byte	0x0
 2936 0d1e 18       		.uleb128 0x18
 2937 0d1f 3B0D0000 		.4byte	0xd3b
 2938 0d23 01       		.byte	0x1
 2939 0d24 70050000 		.4byte	.LASF201
 2940 0d28 07       		.byte	0x7
 2941 0d29 5D       		.byte	0x5d
 2942 0d2a E7170000 		.4byte	.LASF203
 2943 0d2e 01       		.byte	0x1
 2944 0d2f 16       		.uleb128 0x16
 2945 0d30 C3110000 		.4byte	0x11c3
 2946 0d34 01       		.byte	0x1
 2947 0d35 17       		.uleb128 0x17
ARM GAS  /tmp/ccV38c0o.s 			page 62


 2948 0d36 15010000 		.4byte	0x115
 2949 0d3a 00       		.byte	0x0
 2950 0d3b 15       		.uleb128 0x15
 2951 0d3c 5C0D0000 		.4byte	0xd5c
 2952 0d40 01       		.byte	0x1
 2953 0d41 26120000 		.4byte	.LASF204
 2954 0d45 07       		.byte	0x7
 2955 0d46 5E       		.byte	0x5e
 2956 0d47 D9150000 		.4byte	.LASF205
 2957 0d4b 15010000 		.4byte	0x115
 2958 0d4f 01       		.byte	0x1
 2959 0d50 16       		.uleb128 0x16
 2960 0d51 C3110000 		.4byte	0x11c3
 2961 0d55 01       		.byte	0x1
 2962 0d56 17       		.uleb128 0x17
 2963 0d57 C8000000 		.4byte	0xc8
 2964 0d5b 00       		.byte	0x0
 2965 0d5c 15       		.uleb128 0x15
 2966 0d5d 7D0D0000 		.4byte	0xd7d
 2967 0d61 01       		.byte	0x1
 2968 0d62 0B120000 		.4byte	.LASF206
 2969 0d66 07       		.byte	0x7
 2970 0d67 5F       		.byte	0x5f
 2971 0d68 C2010000 		.4byte	.LASF207
 2972 0d6c 15010000 		.4byte	0x115
 2973 0d70 01       		.byte	0x1
 2974 0d71 16       		.uleb128 0x16
 2975 0d72 C3110000 		.4byte	0x11c3
 2976 0d76 01       		.byte	0x1
 2977 0d77 17       		.uleb128 0x17
 2978 0d78 C8000000 		.4byte	0xc8
 2979 0d7c 00       		.byte	0x0
 2980 0d7d 15       		.uleb128 0x15
 2981 0d7e 990D0000 		.4byte	0xd99
 2982 0d82 01       		.byte	0x1
 2983 0d83 480C0000 		.4byte	.LASF208
 2984 0d87 07       		.byte	0x7
 2985 0d88 60       		.byte	0x60
 2986 0d89 6B100000 		.4byte	.LASF209
 2987 0d8d 15010000 		.4byte	0x115
 2988 0d91 01       		.byte	0x1
 2989 0d92 16       		.uleb128 0x16
 2990 0d93 C3110000 		.4byte	0x11c3
 2991 0d97 01       		.byte	0x1
 2992 0d98 00       		.byte	0x0
 2993 0d99 18       		.uleb128 0x18
 2994 0d9a B10D0000 		.4byte	0xdb1
 2995 0d9e 01       		.byte	0x1
 2996 0d9f F8060000 		.4byte	.LASF210
 2997 0da3 07       		.byte	0x7
 2998 0da4 61       		.byte	0x61
 2999 0da5 99090000 		.4byte	.LASF211
 3000 0da9 01       		.byte	0x1
 3001 0daa 16       		.uleb128 0x16
 3002 0dab C3110000 		.4byte	0x11c3
 3003 0daf 01       		.byte	0x1
 3004 0db0 00       		.byte	0x0
ARM GAS  /tmp/ccV38c0o.s 			page 63


 3005 0db1 18       		.uleb128 0x18
 3006 0db2 C90D0000 		.4byte	0xdc9
 3007 0db6 01       		.byte	0x1
 3008 0db7 2F080000 		.4byte	.LASF212
 3009 0dbb 07       		.byte	0x7
 3010 0dbc 62       		.byte	0x62
 3011 0dbd CE080000 		.4byte	.LASF213
 3012 0dc1 01       		.byte	0x1
 3013 0dc2 16       		.uleb128 0x16
 3014 0dc3 C3110000 		.4byte	0x11c3
 3015 0dc7 01       		.byte	0x1
 3016 0dc8 00       		.byte	0x0
 3017 0dc9 18       		.uleb128 0x18
 3018 0dca E10D0000 		.4byte	0xde1
 3019 0dce 01       		.byte	0x1
 3020 0dcf 20140000 		.4byte	.LASF214
 3021 0dd3 07       		.byte	0x7
 3022 0dd4 64       		.byte	0x64
 3023 0dd5 50010000 		.4byte	.LASF215
 3024 0dd9 01       		.byte	0x1
 3025 0dda 16       		.uleb128 0x16
 3026 0ddb C3110000 		.4byte	0x11c3
 3027 0ddf 01       		.byte	0x1
 3028 0de0 00       		.byte	0x0
 3029 0de1 18       		.uleb128 0x18
 3030 0de2 F90D0000 		.4byte	0xdf9
 3031 0de6 01       		.byte	0x1
 3032 0de7 37150000 		.4byte	.LASF216
 3033 0deb 07       		.byte	0x7
 3034 0dec 65       		.byte	0x65
 3035 0ded CF020000 		.4byte	.LASF217
 3036 0df1 01       		.byte	0x1
 3037 0df2 16       		.uleb128 0x16
 3038 0df3 C3110000 		.4byte	0x11c3
 3039 0df7 01       		.byte	0x1
 3040 0df8 00       		.byte	0x0
 3041 0df9 18       		.uleb128 0x18
 3042 0dfa 110E0000 		.4byte	0xe11
 3043 0dfe 01       		.byte	0x1
 3044 0dff 14020000 		.4byte	.LASF218
 3045 0e03 07       		.byte	0x7
 3046 0e04 66       		.byte	0x66
 3047 0e05 3C080000 		.4byte	.LASF219
 3048 0e09 01       		.byte	0x1
 3049 0e0a 16       		.uleb128 0x16
 3050 0e0b C3110000 		.4byte	0x11c3
 3051 0e0f 01       		.byte	0x1
 3052 0e10 00       		.byte	0x0
 3053 0e11 18       		.uleb128 0x18
 3054 0e12 290E0000 		.4byte	0xe29
 3055 0e16 01       		.byte	0x1
 3056 0e17 F2140000 		.4byte	.LASF220
 3057 0e1b 07       		.byte	0x7
 3058 0e1c 67       		.byte	0x67
 3059 0e1d 7D050000 		.4byte	.LASF221
 3060 0e21 01       		.byte	0x1
 3061 0e22 16       		.uleb128 0x16
ARM GAS  /tmp/ccV38c0o.s 			page 64


 3062 0e23 C3110000 		.4byte	0x11c3
 3063 0e27 01       		.byte	0x1
 3064 0e28 00       		.byte	0x0
 3065 0e29 15       		.uleb128 0x15
 3066 0e2a 4A0E0000 		.4byte	0xe4a
 3067 0e2e 01       		.byte	0x1
 3068 0e2f FC0E0000 		.4byte	.LASF222
 3069 0e33 07       		.byte	0x7
 3070 0e34 68       		.byte	0x68
 3071 0e35 880D0000 		.4byte	.LASF223
 3072 0e39 B9000000 		.4byte	0xb9
 3073 0e3d 01       		.byte	0x1
 3074 0e3e 16       		.uleb128 0x16
 3075 0e3f C3110000 		.4byte	0x11c3
 3076 0e43 01       		.byte	0x1
 3077 0e44 17       		.uleb128 0x17
 3078 0e45 C8000000 		.4byte	0xc8
 3079 0e49 00       		.byte	0x0
 3080 0e4a 18       		.uleb128 0x18
 3081 0e4b 620E0000 		.4byte	0xe62
 3082 0e4f 01       		.byte	0x1
 3083 0e50 12040000 		.4byte	.LASF224
 3084 0e54 07       		.byte	0x7
 3085 0e55 6A       		.byte	0x6a
 3086 0e56 0D0E0000 		.4byte	.LASF225
 3087 0e5a 01       		.byte	0x1
 3088 0e5b 16       		.uleb128 0x16
 3089 0e5c C3110000 		.4byte	0x11c3
 3090 0e60 01       		.byte	0x1
 3091 0e61 00       		.byte	0x0
 3092 0e62 18       		.uleb128 0x18
 3093 0e63 7A0E0000 		.4byte	0xe7a
 3094 0e67 01       		.byte	0x1
 3095 0e68 4A0E0000 		.4byte	.LASF226
 3096 0e6c 07       		.byte	0x7
 3097 0e6d 6B       		.byte	0x6b
 3098 0e6e 800A0000 		.4byte	.LASF227
 3099 0e72 01       		.byte	0x1
 3100 0e73 16       		.uleb128 0x16
 3101 0e74 C3110000 		.4byte	0x11c3
 3102 0e78 01       		.byte	0x1
 3103 0e79 00       		.byte	0x0
 3104 0e7a 18       		.uleb128 0x18
 3105 0e7b 920E0000 		.4byte	0xe92
 3106 0e7f 01       		.byte	0x1
 3107 0e80 7B070000 		.4byte	.LASF228
 3108 0e84 07       		.byte	0x7
 3109 0e85 6C       		.byte	0x6c
 3110 0e86 900F0000 		.4byte	.LASF229
 3111 0e8a 01       		.byte	0x1
 3112 0e8b 16       		.uleb128 0x16
 3113 0e8c C3110000 		.4byte	0x11c3
 3114 0e90 01       		.byte	0x1
 3115 0e91 00       		.byte	0x0
 3116 0e92 18       		.uleb128 0x18
 3117 0e93 AA0E0000 		.4byte	0xeaa
 3118 0e97 01       		.byte	0x1
ARM GAS  /tmp/ccV38c0o.s 			page 65


 3119 0e98 7D030000 		.4byte	.LASF230
 3120 0e9c 07       		.byte	0x7
 3121 0e9d 6D       		.byte	0x6d
 3122 0e9e 0C0D0000 		.4byte	.LASF231
 3123 0ea2 01       		.byte	0x1
 3124 0ea3 16       		.uleb128 0x16
 3125 0ea4 C3110000 		.4byte	0x11c3
 3126 0ea8 01       		.byte	0x1
 3127 0ea9 00       		.byte	0x0
 3128 0eaa 18       		.uleb128 0x18
 3129 0eab C20E0000 		.4byte	0xec2
 3130 0eaf 01       		.byte	0x1
 3131 0eb0 77040000 		.4byte	.LASF232
 3132 0eb4 07       		.byte	0x7
 3133 0eb5 6E       		.byte	0x6e
 3134 0eb6 60150000 		.4byte	.LASF233
 3135 0eba 01       		.byte	0x1
 3136 0ebb 16       		.uleb128 0x16
 3137 0ebc C3110000 		.4byte	0x11c3
 3138 0ec0 01       		.byte	0x1
 3139 0ec1 00       		.byte	0x0
 3140 0ec2 18       		.uleb128 0x18
 3141 0ec3 DA0E0000 		.4byte	0xeda
 3142 0ec7 01       		.byte	0x1
 3143 0ec8 27110000 		.4byte	.LASF234
 3144 0ecc 07       		.byte	0x7
 3145 0ecd 6F       		.byte	0x6f
 3146 0ece 0C0B0000 		.4byte	.LASF235
 3147 0ed2 01       		.byte	0x1
 3148 0ed3 16       		.uleb128 0x16
 3149 0ed4 C3110000 		.4byte	0x11c3
 3150 0ed8 01       		.byte	0x1
 3151 0ed9 00       		.byte	0x0
 3152 0eda 18       		.uleb128 0x18
 3153 0edb F20E0000 		.4byte	0xef2
 3154 0edf 01       		.byte	0x1
 3155 0ee0 4A070000 		.4byte	.LASF236
 3156 0ee4 07       		.byte	0x7
 3157 0ee5 70       		.byte	0x70
 3158 0ee6 37020000 		.4byte	.LASF237
 3159 0eea 01       		.byte	0x1
 3160 0eeb 16       		.uleb128 0x16
 3161 0eec C3110000 		.4byte	0x11c3
 3162 0ef0 01       		.byte	0x1
 3163 0ef1 00       		.byte	0x0
 3164 0ef2 18       		.uleb128 0x18
 3165 0ef3 0F0F0000 		.4byte	0xf0f
 3166 0ef7 01       		.byte	0x1
 3167 0ef8 B9160000 		.4byte	.LASF238
 3168 0efc 07       		.byte	0x7
 3169 0efd 71       		.byte	0x71
 3170 0efe FB020000 		.4byte	.LASF239
 3171 0f02 01       		.byte	0x1
 3172 0f03 16       		.uleb128 0x16
 3173 0f04 C3110000 		.4byte	0x11c3
 3174 0f08 01       		.byte	0x1
 3175 0f09 17       		.uleb128 0x17
ARM GAS  /tmp/ccV38c0o.s 			page 66


 3176 0f0a 15010000 		.4byte	0x115
 3177 0f0e 00       		.byte	0x0
 3178 0f0f 18       		.uleb128 0x18
 3179 0f10 270F0000 		.4byte	0xf27
 3180 0f14 01       		.byte	0x1
 3181 0f15 F2050000 		.4byte	.LASF240
 3182 0f19 07       		.byte	0x7
 3183 0f1a 72       		.byte	0x72
 3184 0f1b BE0A0000 		.4byte	.LASF241
 3185 0f1f 01       		.byte	0x1
 3186 0f20 16       		.uleb128 0x16
 3187 0f21 C3110000 		.4byte	0x11c3
 3188 0f25 01       		.byte	0x1
 3189 0f26 00       		.byte	0x0
 3190 0f27 18       		.uleb128 0x18
 3191 0f28 3F0F0000 		.4byte	0xf3f
 3192 0f2c 01       		.byte	0x1
 3193 0f2d 41170000 		.4byte	.LASF242
 3194 0f31 07       		.byte	0x7
 3195 0f32 73       		.byte	0x73
 3196 0f33 3A000000 		.4byte	.LASF243
 3197 0f37 01       		.byte	0x1
 3198 0f38 16       		.uleb128 0x16
 3199 0f39 C3110000 		.4byte	0x11c3
 3200 0f3d 01       		.byte	0x1
 3201 0f3e 00       		.byte	0x0
 3202 0f3f 18       		.uleb128 0x18
 3203 0f40 570F0000 		.4byte	0xf57
 3204 0f44 01       		.byte	0x1
 3205 0f45 02100000 		.4byte	.LASF244
 3206 0f49 07       		.byte	0x7
 3207 0f4a 74       		.byte	0x74
 3208 0f4b 8F160000 		.4byte	.LASF245
 3209 0f4f 01       		.byte	0x1
 3210 0f50 16       		.uleb128 0x16
 3211 0f51 C3110000 		.4byte	0x11c3
 3212 0f55 01       		.byte	0x1
 3213 0f56 00       		.byte	0x0
 3214 0f57 15       		.uleb128 0x15
 3215 0f58 7D0F0000 		.4byte	0xf7d
 3216 0f5c 01       		.byte	0x1
 3217 0f5d F30E0000 		.4byte	.LASF246
 3218 0f61 07       		.byte	0x7
 3219 0f62 75       		.byte	0x75
 3220 0f63 38040000 		.4byte	.LASF247
 3221 0f67 15010000 		.4byte	0x115
 3222 0f6b 01       		.byte	0x1
 3223 0f6c 16       		.uleb128 0x16
 3224 0f6d C3110000 		.4byte	0x11c3
 3225 0f71 01       		.byte	0x1
 3226 0f72 17       		.uleb128 0x17
 3227 0f73 4D040000 		.4byte	0x44d
 3228 0f77 17       		.uleb128 0x17
 3229 0f78 86000000 		.4byte	0x86
 3230 0f7c 00       		.byte	0x0
 3231 0f7d 15       		.uleb128 0x15
 3232 0f7e 9E0F0000 		.4byte	0xf9e
ARM GAS  /tmp/ccV38c0o.s 			page 67


 3233 0f82 01       		.byte	0x1
 3234 0f83 2D0D0000 		.4byte	.LASF248
 3235 0f87 07       		.byte	0x7
 3236 0f88 76       		.byte	0x76
 3237 0f89 A4140000 		.4byte	.LASF249
 3238 0f8d 86000000 		.4byte	0x86
 3239 0f91 01       		.byte	0x1
 3240 0f92 16       		.uleb128 0x16
 3241 0f93 C3110000 		.4byte	0x11c3
 3242 0f97 01       		.byte	0x1
 3243 0f98 17       		.uleb128 0x17
 3244 0f99 15010000 		.4byte	0x115
 3245 0f9d 00       		.byte	0x0
 3246 0f9e 15       		.uleb128 0x15
 3247 0f9f BF0F0000 		.4byte	0xfbf
 3248 0fa3 01       		.byte	0x1
 3249 0fa4 31010000 		.4byte	.LASF250
 3250 0fa8 07       		.byte	0x7
 3251 0fa9 77       		.byte	0x77
 3252 0faa 7F090000 		.4byte	.LASF251
 3253 0fae 86000000 		.4byte	0x86
 3254 0fb2 01       		.byte	0x1
 3255 0fb3 16       		.uleb128 0x16
 3256 0fb4 C3110000 		.4byte	0x11c3
 3257 0fb8 01       		.byte	0x1
 3258 0fb9 17       		.uleb128 0x17
 3259 0fba 15010000 		.4byte	0x115
 3260 0fbe 00       		.byte	0x0
 3261 0fbf 18       		.uleb128 0x18
 3262 0fc0 D70F0000 		.4byte	0xfd7
 3263 0fc4 01       		.byte	0x1
 3264 0fc5 39160000 		.4byte	.LASF252
 3265 0fc9 07       		.byte	0x7
 3266 0fca 78       		.byte	0x78
 3267 0fcb 04150000 		.4byte	.LASF253
 3268 0fcf 01       		.byte	0x1
 3269 0fd0 16       		.uleb128 0x16
 3270 0fd1 C3110000 		.4byte	0x11c3
 3271 0fd5 01       		.byte	0x1
 3272 0fd6 00       		.byte	0x0
 3273 0fd7 18       		.uleb128 0x18
 3274 0fd8 FE0F0000 		.4byte	0xffe
 3275 0fdc 01       		.byte	0x1
 3276 0fdd 9D110000 		.4byte	.LASF254
 3277 0fe1 07       		.byte	0x7
 3278 0fe2 7A       		.byte	0x7a
 3279 0fe3 6A080000 		.4byte	.LASF255
 3280 0fe7 01       		.byte	0x1
 3281 0fe8 16       		.uleb128 0x16
 3282 0fe9 C3110000 		.4byte	0x11c3
 3283 0fed 01       		.byte	0x1
 3284 0fee 17       		.uleb128 0x17
 3285 0fef C8000000 		.4byte	0xc8
 3286 0ff3 17       		.uleb128 0x17
 3287 0ff4 15010000 		.4byte	0x115
 3288 0ff8 17       		.uleb128 0x17
 3289 0ff9 C9110000 		.4byte	0x11c9
ARM GAS  /tmp/ccV38c0o.s 			page 68


 3290 0ffd 00       		.byte	0x0
 3291 0ffe 15       		.uleb128 0x15
 3292 0fff 1A100000 		.4byte	0x101a
 3293 1003 01       		.byte	0x1
 3294 1004 21090000 		.4byte	.LASF256
 3295 1008 07       		.byte	0x7
 3296 1009 7C       		.byte	0x7c
 3297 100a 19100000 		.4byte	.LASF257
 3298 100e C8000000 		.4byte	0xc8
 3299 1012 01       		.byte	0x1
 3300 1013 16       		.uleb128 0x16
 3301 1014 C3110000 		.4byte	0x11c3
 3302 1018 01       		.byte	0x1
 3303 1019 00       		.byte	0x0
 3304 101a 15       		.uleb128 0x15
 3305 101b 36100000 		.4byte	0x1036
 3306 101f 01       		.byte	0x1
 3307 1020 FE140000 		.4byte	.LASF258
 3308 1024 07       		.byte	0x7
 3309 1025 7D       		.byte	0x7d
 3310 1026 C5090000 		.4byte	.LASF259
 3311 102a C8000000 		.4byte	0xc8
 3312 102e 01       		.byte	0x1
 3313 102f 16       		.uleb128 0x16
 3314 1030 C3110000 		.4byte	0x11c3
 3315 1034 01       		.byte	0x1
 3316 1035 00       		.byte	0x0
 3317 1036 15       		.uleb128 0x15
 3318 1037 52100000 		.4byte	0x1052
 3319 103b 01       		.byte	0x1
 3320 103c 8D020000 		.4byte	.LASF260
 3321 1040 07       		.byte	0x7
 3322 1041 7E       		.byte	0x7e
 3323 1042 B1120000 		.4byte	.LASF261
 3324 1046 C8000000 		.4byte	0xc8
 3325 104a 01       		.byte	0x1
 3326 104b 16       		.uleb128 0x16
 3327 104c C3110000 		.4byte	0x11c3
 3328 1050 01       		.byte	0x1
 3329 1051 00       		.byte	0x0
 3330 1052 15       		.uleb128 0x15
 3331 1053 6E100000 		.4byte	0x106e
 3332 1057 01       		.byte	0x1
 3333 1058 9F080000 		.4byte	.LASF262
 3334 105c 07       		.byte	0x7
 3335 105d 7F       		.byte	0x7f
 3336 105e CB140000 		.4byte	.LASF263
 3337 1062 C8000000 		.4byte	0xc8
 3338 1066 01       		.byte	0x1
 3339 1067 16       		.uleb128 0x16
 3340 1068 C3110000 		.4byte	0x11c3
 3341 106c 01       		.byte	0x1
 3342 106d 00       		.byte	0x0
 3343 106e 15       		.uleb128 0x15
 3344 106f 8A100000 		.4byte	0x108a
 3345 1073 01       		.byte	0x1
 3346 1074 5E0A0000 		.4byte	.LASF264
ARM GAS  /tmp/ccV38c0o.s 			page 69


 3347 1078 07       		.byte	0x7
 3348 1079 80       		.byte	0x80
 3349 107a 9A130000 		.4byte	.LASF265
 3350 107e C8000000 		.4byte	0xc8
 3351 1082 01       		.byte	0x1
 3352 1083 16       		.uleb128 0x16
 3353 1084 C3110000 		.4byte	0x11c3
 3354 1088 01       		.byte	0x1
 3355 1089 00       		.byte	0x0
 3356 108a 15       		.uleb128 0x15
 3357 108b A6100000 		.4byte	0x10a6
 3358 108f 01       		.byte	0x1
 3359 1090 B0130000 		.4byte	.LASF266
 3360 1094 07       		.byte	0x7
 3361 1095 81       		.byte	0x81
 3362 1096 7D000000 		.4byte	.LASF267
 3363 109a C8000000 		.4byte	0xc8
 3364 109e 01       		.byte	0x1
 3365 109f 16       		.uleb128 0x16
 3366 10a0 C3110000 		.4byte	0x11c3
 3367 10a4 01       		.byte	0x1
 3368 10a5 00       		.byte	0x0
 3369 10a6 15       		.uleb128 0x15
 3370 10a7 C2100000 		.4byte	0x10c2
 3371 10ab 01       		.byte	0x1
 3372 10ac 8B040000 		.4byte	.LASF268
 3373 10b0 07       		.byte	0x7
 3374 10b1 82       		.byte	0x82
 3375 10b2 240A0000 		.4byte	.LASF269
 3376 10b6 C8000000 		.4byte	0xc8
 3377 10ba 01       		.byte	0x1
 3378 10bb 16       		.uleb128 0x16
 3379 10bc C3110000 		.4byte	0x11c3
 3380 10c0 01       		.byte	0x1
 3381 10c1 00       		.byte	0x0
 3382 10c2 15       		.uleb128 0x15
 3383 10c3 DE100000 		.4byte	0x10de
 3384 10c7 01       		.byte	0x1
 3385 10c8 52050000 		.4byte	.LASF270
 3386 10cc 07       		.byte	0x7
 3387 10cd 83       		.byte	0x83
 3388 10ce 97170000 		.4byte	.LASF271
 3389 10d2 C8000000 		.4byte	0xc8
 3390 10d6 01       		.byte	0x1
 3391 10d7 16       		.uleb128 0x16
 3392 10d8 C3110000 		.4byte	0x11c3
 3393 10dc 01       		.byte	0x1
 3394 10dd 00       		.byte	0x0
 3395 10de 15       		.uleb128 0x15
 3396 10df FA100000 		.4byte	0x10fa
 3397 10e3 01       		.byte	0x1
 3398 10e4 2F120000 		.4byte	.LASF272
 3399 10e8 07       		.byte	0x7
 3400 10e9 84       		.byte	0x84
 3401 10ea 09080000 		.4byte	.LASF273
 3402 10ee C8000000 		.4byte	0xc8
 3403 10f2 01       		.byte	0x1
ARM GAS  /tmp/ccV38c0o.s 			page 70


 3404 10f3 16       		.uleb128 0x16
 3405 10f4 C3110000 		.4byte	0x11c3
 3406 10f8 01       		.byte	0x1
 3407 10f9 00       		.byte	0x0
 3408 10fa 15       		.uleb128 0x15
 3409 10fb 16110000 		.4byte	0x1116
 3410 10ff 01       		.byte	0x1
 3411 1100 13060000 		.4byte	.LASF274
 3412 1104 07       		.byte	0x7
 3413 1105 85       		.byte	0x85
 3414 1106 B50B0000 		.4byte	.LASF275
 3415 110a C8000000 		.4byte	0xc8
 3416 110e 01       		.byte	0x1
 3417 110f 16       		.uleb128 0x16
 3418 1110 C3110000 		.4byte	0x11c3
 3419 1114 01       		.byte	0x1
 3420 1115 00       		.byte	0x0
 3421 1116 19       		.uleb128 0x19
 3422 1117 01       		.byte	0x1
 3423 1118 19070000 		.4byte	.LASF491
 3424 111c 07       		.byte	0x7
 3425 111d 86       		.byte	0x86
 3426 111e CE130000 		.4byte	.LASF492
 3427 1122 FF000000 		.4byte	0xff
 3428 1126 01       		.byte	0x1
 3429 1127 16       		.uleb128 0x16
 3430 1128 C3110000 		.4byte	0x11c3
 3431 112c 01       		.byte	0x1
 3432 112d 17       		.uleb128 0x17
 3433 112e 4D040000 		.4byte	0x44d
 3434 1132 17       		.uleb128 0x17
 3435 1133 FF000000 		.4byte	0xff
 3436 1137 17       		.uleb128 0x17
 3437 1138 FF000000 		.4byte	0xff
 3438 113c 00       		.byte	0x0
 3439 113d 00       		.byte	0x0
 3440 113e 07       		.uleb128 0x7
 3441 113f 4F110000 		.4byte	0x114f
 3442 1143 4D040000 		.4byte	0x44d
 3443 1147 1A       		.uleb128 0x1a
 3444 1148 B2000000 		.4byte	0xb2
 3445 114c FF0F     		.2byte	0xfff
 3446 114e 00       		.byte	0x0
 3447 114f 07       		.uleb128 0x7
 3448 1150 60110000 		.4byte	0x1160
 3449 1154 FF000000 		.4byte	0xff
 3450 1158 1A       		.uleb128 0x1a
 3451 1159 B2000000 		.4byte	0xb2
 3452 115d FF0F     		.2byte	0xfff
 3453 115f 00       		.byte	0x0
 3454 1160 07       		.uleb128 0x7
 3455 1161 71110000 		.4byte	0x1171
 3456 1165 DE000000 		.4byte	0xde
 3457 1169 1A       		.uleb128 0x1a
 3458 116a B2000000 		.4byte	0xb2
 3459 116e FF0F     		.2byte	0xfff
 3460 1170 00       		.byte	0x0
ARM GAS  /tmp/ccV38c0o.s 			page 71


 3461 1171 07       		.uleb128 0x7
 3462 1172 81110000 		.4byte	0x1181
 3463 1176 BF000000 		.4byte	0xbf
 3464 117a 08       		.uleb128 0x8
 3465 117b B2000000 		.4byte	0xb2
 3466 117f 16       		.byte	0x16
 3467 1180 00       		.byte	0x0
 3468 1181 07       		.uleb128 0x7
 3469 1182 91110000 		.4byte	0x1191
 3470 1186 BF000000 		.4byte	0xbf
 3471 118a 08       		.uleb128 0x8
 3472 118b B2000000 		.4byte	0xb2
 3473 118f 04       		.byte	0x4
 3474 1190 00       		.byte	0x0
 3475 1191 07       		.uleb128 0x7
 3476 1192 A1110000 		.4byte	0x11a1
 3477 1196 BF000000 		.4byte	0xbf
 3478 119a 08       		.uleb128 0x8
 3479 119b B2000000 		.4byte	0xb2
 3480 119f 02       		.byte	0x2
 3481 11a0 00       		.byte	0x0
 3482 11a1 07       		.uleb128 0x7
 3483 11a2 B2110000 		.4byte	0x11b2
 3484 11a6 DE000000 		.4byte	0xde
 3485 11aa 1A       		.uleb128 0x1a
 3486 11ab B2000000 		.4byte	0xb2
 3487 11af FF1F     		.2byte	0x1fff
 3488 11b1 00       		.byte	0x0
 3489 11b2 07       		.uleb128 0x7
 3490 11b3 C3110000 		.4byte	0x11c3
 3491 11b7 BF000000 		.4byte	0xbf
 3492 11bb 1A       		.uleb128 0x1a
 3493 11bc B2000000 		.4byte	0xb2
 3494 11c0 FF03     		.2byte	0x3ff
 3495 11c2 00       		.byte	0x0
 3496 11c3 09       		.uleb128 0x9
 3497 11c4 04       		.byte	0x4
 3498 11c5 D60A0000 		.4byte	0xad6
 3499 11c9 1B       		.uleb128 0x1b
 3500 11ca 04       		.byte	0x4
 3501 11cb 0A010000 		.4byte	0x10a
 3502 11cf 1C       		.uleb128 0x1c
 3503 11d0 08120000 		.4byte	0x1208
 3504 11d4 86160000 		.4byte	.LASF276
 3505 11d8 3801     		.2byte	0x138
 3506 11da 08       		.byte	0x8
 3507 11db 42       		.byte	0x42
 3508 11dc 03       		.uleb128 0x3
 3509 11dd 040C0000 		.4byte	.LASF277
 3510 11e1 08       		.byte	0x8
 3511 11e2 43       		.byte	0x43
 3512 11e3 08120000 		.4byte	0x1208
 3513 11e7 02       		.byte	0x2
 3514 11e8 23       		.byte	0x23
 3515 11e9 00       		.uleb128 0x0
 3516 11ea 03       		.uleb128 0x3
 3517 11eb F0040000 		.4byte	.LASF278
ARM GAS  /tmp/ccV38c0o.s 			page 72


 3518 11ef 08       		.byte	0x8
 3519 11f0 44       		.byte	0x44
 3520 11f1 18120000 		.4byte	0x1218
 3521 11f5 02       		.byte	0x2
 3522 11f6 23       		.byte	0x23
 3523 11f7 18       		.uleb128 0x18
 3524 11f8 03       		.uleb128 0x3
 3525 11f9 D9090000 		.4byte	.LASF279
 3526 11fd 08       		.byte	0x8
 3527 11fe 45       		.byte	0x45
 3528 11ff 18120000 		.4byte	0x1218
 3529 1203 03       		.byte	0x3
 3530 1204 23       		.byte	0x23
 3531 1205 A801     		.uleb128 0xa8
 3532 1207 00       		.byte	0x0
 3533 1208 07       		.uleb128 0x7
 3534 1209 18120000 		.4byte	0x1218
 3535 120d FF000000 		.4byte	0xff
 3536 1211 08       		.uleb128 0x8
 3537 1212 B2000000 		.4byte	0xb2
 3538 1216 05       		.byte	0x5
 3539 1217 00       		.byte	0x0
 3540 1218 07       		.uleb128 0x7
 3541 1219 2E120000 		.4byte	0x122e
 3542 121d FF000000 		.4byte	0xff
 3543 1221 08       		.uleb128 0x8
 3544 1222 B2000000 		.4byte	0xb2
 3545 1226 05       		.byte	0x5
 3546 1227 08       		.uleb128 0x8
 3547 1228 B2000000 		.4byte	0xb2
 3548 122c 05       		.byte	0x5
 3549 122d 00       		.byte	0x0
 3550 122e 1C       		.uleb128 0x1c
 3551 122f 24140000 		.4byte	0x1424
 3552 1233 D2160000 		.4byte	.LASF280
 3553 1237 F012     		.2byte	0x12f0
 3554 1239 08       		.byte	0x8
 3555 123a 48       		.byte	0x48
 3556 123b 03       		.uleb128 0x3
 3557 123c 2E0F0000 		.4byte	.LASF281
 3558 1240 08       		.byte	0x8
 3559 1241 49       		.byte	0x49
 3560 1242 D3000000 		.4byte	0xd3
 3561 1246 02       		.byte	0x2
 3562 1247 23       		.byte	0x23
 3563 1248 00       		.uleb128 0x0
 3564 1249 03       		.uleb128 0x3
 3565 124a 66100000 		.4byte	.LASF282
 3566 124e 08       		.byte	0x8
 3567 124f 4A       		.byte	0x4a
 3568 1250 DE000000 		.4byte	0xde
 3569 1254 02       		.byte	0x2
 3570 1255 23       		.byte	0x23
 3571 1256 01       		.uleb128 0x1
 3572 1257 03       		.uleb128 0x3
 3573 1258 81170000 		.4byte	.LASF283
 3574 125c 08       		.byte	0x8
ARM GAS  /tmp/ccV38c0o.s 			page 73


 3575 125d 4B       		.byte	0x4b
 3576 125e D3000000 		.4byte	0xd3
 3577 1262 02       		.byte	0x2
 3578 1263 23       		.byte	0x23
 3579 1264 02       		.uleb128 0x2
 3580 1265 03       		.uleb128 0x3
 3581 1266 E50C0000 		.4byte	.LASF284
 3582 126a 08       		.byte	0x8
 3583 126b 4C       		.byte	0x4c
 3584 126c DE000000 		.4byte	0xde
 3585 1270 02       		.byte	0x2
 3586 1271 23       		.byte	0x23
 3587 1272 03       		.uleb128 0x3
 3588 1273 03       		.uleb128 0x3
 3589 1274 80130000 		.4byte	.LASF285
 3590 1278 08       		.byte	0x8
 3591 1279 4D       		.byte	0x4d
 3592 127a D3000000 		.4byte	0xd3
 3593 127e 02       		.byte	0x2
 3594 127f 23       		.byte	0x23
 3595 1280 04       		.uleb128 0x4
 3596 1281 03       		.uleb128 0x3
 3597 1282 05160000 		.4byte	.LASF286
 3598 1286 08       		.byte	0x8
 3599 1287 4E       		.byte	0x4e
 3600 1288 D3000000 		.4byte	0xd3
 3601 128c 02       		.byte	0x2
 3602 128d 23       		.byte	0x23
 3603 128e 05       		.uleb128 0x5
 3604 128f 03       		.uleb128 0x3
 3605 1290 B0000000 		.4byte	.LASF287
 3606 1294 08       		.byte	0x8
 3607 1295 4F       		.byte	0x4f
 3608 1296 D3000000 		.4byte	0xd3
 3609 129a 02       		.byte	0x2
 3610 129b 23       		.byte	0x23
 3611 129c 06       		.uleb128 0x6
 3612 129d 03       		.uleb128 0x3
 3613 129e 7B0B0000 		.4byte	.LASF288
 3614 12a2 08       		.byte	0x8
 3615 12a3 50       		.byte	0x50
 3616 12a4 D3000000 		.4byte	0xd3
 3617 12a8 02       		.byte	0x2
 3618 12a9 23       		.byte	0x23
 3619 12aa 07       		.uleb128 0x7
 3620 12ab 03       		.uleb128 0x3
 3621 12ac 37060000 		.4byte	.LASF289
 3622 12b0 08       		.byte	0x8
 3623 12b1 51       		.byte	0x51
 3624 12b2 FF000000 		.4byte	0xff
 3625 12b6 02       		.byte	0x2
 3626 12b7 23       		.byte	0x23
 3627 12b8 08       		.uleb128 0x8
 3628 12b9 03       		.uleb128 0x3
 3629 12ba 35120000 		.4byte	.LASF290
 3630 12be 08       		.byte	0x8
 3631 12bf 52       		.byte	0x52
ARM GAS  /tmp/ccV38c0o.s 			page 74


 3632 12c0 FF000000 		.4byte	0xff
 3633 12c4 02       		.byte	0x2
 3634 12c5 23       		.byte	0x23
 3635 12c6 0C       		.uleb128 0xc
 3636 12c7 03       		.uleb128 0x3
 3637 12c8 59160000 		.4byte	.LASF291
 3638 12cc 08       		.byte	0x8
 3639 12cd 53       		.byte	0x53
 3640 12ce FF000000 		.4byte	0xff
 3641 12d2 02       		.byte	0x2
 3642 12d3 23       		.byte	0x23
 3643 12d4 10       		.uleb128 0x10
 3644 12d5 03       		.uleb128 0x3
 3645 12d6 71110000 		.4byte	.LASF292
 3646 12da 08       		.byte	0x8
 3647 12db 54       		.byte	0x54
 3648 12dc FF000000 		.4byte	0xff
 3649 12e0 02       		.byte	0x2
 3650 12e1 23       		.byte	0x23
 3651 12e2 14       		.uleb128 0x14
 3652 12e3 03       		.uleb128 0x3
 3653 12e4 EA020000 		.4byte	.LASF293
 3654 12e8 08       		.byte	0x8
 3655 12e9 55       		.byte	0x55
 3656 12ea FF000000 		.4byte	0xff
 3657 12ee 02       		.byte	0x2
 3658 12ef 23       		.byte	0x23
 3659 12f0 18       		.uleb128 0x18
 3660 12f1 03       		.uleb128 0x3
 3661 12f2 90130000 		.4byte	.LASF294
 3662 12f6 08       		.byte	0x8
 3663 12f7 56       		.byte	0x56
 3664 12f8 24140000 		.4byte	0x1424
 3665 12fc 02       		.byte	0x2
 3666 12fd 23       		.byte	0x23
 3667 12fe 1C       		.uleb128 0x1c
 3668 12ff 03       		.uleb128 0x3
 3669 1300 52000000 		.4byte	.LASF295
 3670 1304 08       		.byte	0x8
 3671 1305 57       		.byte	0x57
 3672 1306 24140000 		.4byte	0x1424
 3673 130a 02       		.byte	0x2
 3674 130b 23       		.byte	0x23
 3675 130c 28       		.uleb128 0x28
 3676 130d 03       		.uleb128 0x3
 3677 130e CB0C0000 		.4byte	.LASF296
 3678 1312 08       		.byte	0x8
 3679 1313 58       		.byte	0x58
 3680 1314 D3000000 		.4byte	0xd3
 3681 1318 02       		.byte	0x2
 3682 1319 23       		.byte	0x23
 3683 131a 34       		.uleb128 0x34
 3684 131b 03       		.uleb128 0x3
 3685 131c E8110000 		.4byte	.LASF297
 3686 1320 08       		.byte	0x8
 3687 1321 59       		.byte	0x59
 3688 1322 D3000000 		.4byte	0xd3
ARM GAS  /tmp/ccV38c0o.s 			page 75


 3689 1326 02       		.byte	0x2
 3690 1327 23       		.byte	0x23
 3691 1328 35       		.uleb128 0x35
 3692 1329 03       		.uleb128 0x3
 3693 132a 33100000 		.4byte	.LASF298
 3694 132e 08       		.byte	0x8
 3695 132f 5A       		.byte	0x5a
 3696 1330 D3000000 		.4byte	0xd3
 3697 1334 02       		.byte	0x2
 3698 1335 23       		.byte	0x23
 3699 1336 36       		.uleb128 0x36
 3700 1337 03       		.uleb128 0x3
 3701 1338 95010000 		.4byte	.LASF299
 3702 133c 08       		.byte	0x8
 3703 133d 5B       		.byte	0x5b
 3704 133e 86000000 		.4byte	0x86
 3705 1342 02       		.byte	0x2
 3706 1343 23       		.byte	0x23
 3707 1344 38       		.uleb128 0x38
 3708 1345 03       		.uleb128 0x3
 3709 1346 A40E0000 		.4byte	.LASF300
 3710 134a 08       		.byte	0x8
 3711 134b 5C       		.byte	0x5c
 3712 134c 86000000 		.4byte	0x86
 3713 1350 02       		.byte	0x2
 3714 1351 23       		.byte	0x23
 3715 1352 3C       		.uleb128 0x3c
 3716 1353 04       		.uleb128 0x4
 3717 1354 52656400 		.ascii	"Red\000"
 3718 1358 08       		.byte	0x8
 3719 1359 5D       		.byte	0x5d
 3720 135a 34140000 		.4byte	0x1434
 3721 135e 02       		.byte	0x2
 3722 135f 23       		.byte	0x23
 3723 1360 40       		.uleb128 0x40
 3724 1361 03       		.uleb128 0x3
 3725 1362 460B0000 		.4byte	.LASF301
 3726 1366 08       		.byte	0x8
 3727 1367 5E       		.byte	0x5e
 3728 1368 34140000 		.4byte	0x1434
 3729 136c 03       		.byte	0x3
 3730 136d 23       		.byte	0x23
 3731 136e C008     		.uleb128 0x440
 3732 1370 03       		.uleb128 0x3
 3733 1371 3C010000 		.4byte	.LASF302
 3734 1375 08       		.byte	0x8
 3735 1376 5F       		.byte	0x5f
 3736 1377 34140000 		.4byte	0x1434
 3737 137b 03       		.byte	0x3
 3738 137c 23       		.byte	0x23
 3739 137d C010     		.uleb128 0x840
 3740 137f 04       		.uleb128 0x4
 3741 1380 584200   		.ascii	"XB\000"
 3742 1383 08       		.byte	0x8
 3743 1384 60       		.byte	0x60
 3744 1385 4D040000 		.4byte	0x44d
 3745 1389 03       		.byte	0x3
ARM GAS  /tmp/ccV38c0o.s 			page 76


 3746 138a 23       		.byte	0x23
 3747 138b C018     		.uleb128 0xc40
 3748 138d 03       		.uleb128 0x3
 3749 138e F6160000 		.4byte	.LASF303
 3750 1392 08       		.byte	0x8
 3751 1393 61       		.byte	0x61
 3752 1394 34140000 		.4byte	0x1434
 3753 1398 03       		.byte	0x3
 3754 1399 23       		.byte	0x23
 3755 139a C418     		.uleb128 0xc44
 3756 139c 03       		.uleb128 0x3
 3757 139d 13000000 		.4byte	.LASF304
 3758 13a1 08       		.byte	0x8
 3759 13a2 62       		.byte	0x62
 3760 13a3 86000000 		.4byte	0x86
 3761 13a7 03       		.byte	0x3
 3762 13a8 23       		.byte	0x23
 3763 13a9 C420     		.uleb128 0x1044
 3764 13ab 03       		.uleb128 0x3
 3765 13ac D20D0000 		.4byte	.LASF305
 3766 13b0 08       		.byte	0x8
 3767 13b1 63       		.byte	0x63
 3768 13b2 86000000 		.4byte	0x86
 3769 13b6 03       		.byte	0x3
 3770 13b7 23       		.byte	0x23
 3771 13b8 C820     		.uleb128 0x1048
 3772 13ba 03       		.uleb128 0x3
 3773 13bb C3080000 		.4byte	.LASF306
 3774 13bf 08       		.byte	0x8
 3775 13c0 64       		.byte	0x64
 3776 13c1 86000000 		.4byte	0x86
 3777 13c5 03       		.byte	0x3
 3778 13c6 23       		.byte	0x23
 3779 13c7 CC20     		.uleb128 0x104c
 3780 13c9 03       		.uleb128 0x3
 3781 13ca A90A0000 		.4byte	.LASF307
 3782 13ce 08       		.byte	0x8
 3783 13cf 65       		.byte	0x65
 3784 13d0 44140000 		.4byte	0x1444
 3785 13d4 03       		.byte	0x3
 3786 13d5 23       		.byte	0x23
 3787 13d6 D020     		.uleb128 0x1050
 3788 13d8 03       		.uleb128 0x3
 3789 13d9 D70E0000 		.4byte	.LASF107
 3790 13dd 08       		.byte	0x8
 3791 13de 66       		.byte	0x66
 3792 13df FF000000 		.4byte	0xff
 3793 13e3 03       		.byte	0x3
 3794 13e4 23       		.byte	0x23
 3795 13e5 E420     		.uleb128 0x1064
 3796 13e7 03       		.uleb128 0x3
 3797 13e8 87020000 		.4byte	.LASF106
 3798 13ec 08       		.byte	0x8
 3799 13ed 67       		.byte	0x67
 3800 13ee 54140000 		.4byte	0x1454
 3801 13f2 03       		.byte	0x3
 3802 13f3 23       		.byte	0x23
ARM GAS  /tmp/ccV38c0o.s 			page 77


 3803 13f4 E820     		.uleb128 0x1068
 3804 13f6 03       		.uleb128 0x3
 3805 13f7 6E0E0000 		.4byte	.LASF308
 3806 13fb 08       		.byte	0x8
 3807 13fc 68       		.byte	0x68
 3808 13fd A2000000 		.4byte	0xa2
 3809 1401 03       		.byte	0x3
 3810 1402 23       		.byte	0x23
 3811 1403 F020     		.uleb128 0x1070
 3812 1405 03       		.uleb128 0x3
 3813 1406 21070000 		.4byte	.LASF309
 3814 140a 08       		.byte	0x8
 3815 140b 69       		.byte	0x69
 3816 140c A2000000 		.4byte	0xa2
 3817 1410 03       		.byte	0x3
 3818 1411 23       		.byte	0x23
 3819 1412 F820     		.uleb128 0x1078
 3820 1414 03       		.uleb128 0x3
 3821 1415 1B040000 		.4byte	.LASF310
 3822 1419 08       		.byte	0x8
 3823 141a 6A       		.byte	0x6a
 3824 141b 64140000 		.4byte	0x1464
 3825 141f 03       		.byte	0x3
 3826 1420 23       		.byte	0x23
 3827 1421 8021     		.uleb128 0x1080
 3828 1423 00       		.byte	0x0
 3829 1424 07       		.uleb128 0x7
 3830 1425 34140000 		.4byte	0x1434
 3831 1429 4D040000 		.4byte	0x44d
 3832 142d 08       		.uleb128 0x8
 3833 142e B2000000 		.4byte	0xb2
 3834 1432 02       		.byte	0x2
 3835 1433 00       		.byte	0x0
 3836 1434 07       		.uleb128 0x7
 3837 1435 44140000 		.4byte	0x1444
 3838 1439 FF000000 		.4byte	0xff
 3839 143d 08       		.uleb128 0x8
 3840 143e B2000000 		.4byte	0xb2
 3841 1442 FF       		.byte	0xff
 3842 1443 00       		.byte	0x0
 3843 1444 07       		.uleb128 0x7
 3844 1445 54140000 		.4byte	0x1454
 3845 1449 FF000000 		.4byte	0xff
 3846 144d 08       		.uleb128 0x8
 3847 144e B2000000 		.4byte	0xb2
 3848 1452 04       		.byte	0x4
 3849 1453 00       		.byte	0x0
 3850 1454 07       		.uleb128 0x7
 3851 1455 64140000 		.4byte	0x1464
 3852 1459 FF000000 		.4byte	0xff
 3853 145d 08       		.uleb128 0x8
 3854 145e B2000000 		.4byte	0xb2
 3855 1462 01       		.byte	0x1
 3856 1463 00       		.byte	0x0
 3857 1464 07       		.uleb128 0x7
 3858 1465 74140000 		.4byte	0x1474
 3859 1469 CF110000 		.4byte	0x11cf
ARM GAS  /tmp/ccV38c0o.s 			page 78


 3860 146d 08       		.uleb128 0x8
 3861 146e B2000000 		.4byte	0xb2
 3862 1472 01       		.byte	0x1
 3863 1473 00       		.byte	0x0
 3864 1474 0E       		.uleb128 0xe
 3865 1475 F1140000 		.4byte	0x14f1
 3866 1479 03170000 		.4byte	.LASF311
 3867 147d 0C       		.byte	0xc
 3868 147e 08       		.byte	0x8
 3869 147f 6E       		.byte	0x6e
 3870 1480 03       		.uleb128 0x3
 3871 1481 EF120000 		.4byte	.LASF312
 3872 1485 08       		.byte	0x8
 3873 1486 6F       		.byte	0x6f
 3874 1487 7F000000 		.4byte	0x7f
 3875 148b 02       		.byte	0x2
 3876 148c 23       		.byte	0x23
 3877 148d 00       		.uleb128 0x0
 3878 148e 03       		.uleb128 0x3
 3879 148f E6060000 		.4byte	.LASF313
 3880 1493 08       		.byte	0x8
 3881 1494 70       		.byte	0x70
 3882 1495 E9000000 		.4byte	0xe9
 3883 1499 02       		.byte	0x2
 3884 149a 23       		.byte	0x23
 3885 149b 02       		.uleb128 0x2
 3886 149c 03       		.uleb128 0x3
 3887 149d E9070000 		.4byte	.LASF314
 3888 14a1 08       		.byte	0x8
 3889 14a2 71       		.byte	0x71
 3890 14a3 E9000000 		.4byte	0xe9
 3891 14a7 02       		.byte	0x2
 3892 14a8 23       		.byte	0x23
 3893 14a9 04       		.uleb128 0x4
 3894 14aa 03       		.uleb128 0x3
 3895 14ab 74140000 		.4byte	.LASF315
 3896 14af 08       		.byte	0x8
 3897 14b0 72       		.byte	0x72
 3898 14b1 DE000000 		.4byte	0xde
 3899 14b5 02       		.byte	0x2
 3900 14b6 23       		.byte	0x23
 3901 14b7 06       		.uleb128 0x6
 3902 14b8 03       		.uleb128 0x3
 3903 14b9 20170000 		.4byte	.LASF316
 3904 14bd 08       		.byte	0x8
 3905 14be 73       		.byte	0x73
 3906 14bf DE000000 		.4byte	0xde
 3907 14c3 02       		.byte	0x2
 3908 14c4 23       		.byte	0x23
 3909 14c5 07       		.uleb128 0x7
 3910 14c6 03       		.uleb128 0x3
 3911 14c7 09040000 		.4byte	.LASF317
 3912 14cb 08       		.byte	0x8
 3913 14cc 74       		.byte	0x74
 3914 14cd DE000000 		.4byte	0xde
 3915 14d1 02       		.byte	0x2
 3916 14d2 23       		.byte	0x23
ARM GAS  /tmp/ccV38c0o.s 			page 79


 3917 14d3 08       		.uleb128 0x8
 3918 14d4 03       		.uleb128 0x3
 3919 14d5 35070000 		.4byte	.LASF318
 3920 14d9 08       		.byte	0x8
 3921 14da 75       		.byte	0x75
 3922 14db DE000000 		.4byte	0xde
 3923 14df 02       		.byte	0x2
 3924 14e0 23       		.byte	0x23
 3925 14e1 09       		.uleb128 0x9
 3926 14e2 03       		.uleb128 0x3
 3927 14e3 8B040000 		.4byte	.LASF268
 3928 14e7 08       		.byte	0x8
 3929 14e8 76       		.byte	0x76
 3930 14e9 DE000000 		.4byte	0xde
 3931 14ed 02       		.byte	0x2
 3932 14ee 23       		.byte	0x23
 3933 14ef 0A       		.uleb128 0xa
 3934 14f0 00       		.byte	0x0
 3935 14f1 1C       		.uleb128 0x1c
 3936 14f2 FF190000 		.4byte	0x19ff
 3937 14f6 54120000 		.4byte	.LASF319
 3938 14fa F00A     		.2byte	0xaf0
 3939 14fc 08       		.byte	0x8
 3940 14fd 79       		.byte	0x79
 3941 14fe 0E       		.uleb128 0xe
 3942 14ff 5F150000 		.4byte	0x155f
 3943 1503 14100000 		.4byte	.LASF320
 3944 1507 0C       		.byte	0xc
 3945 1508 08       		.byte	0x8
 3946 1509 7E       		.byte	0x7e
 3947 150a 03       		.uleb128 0x3
 3948 150b 78050000 		.4byte	.LASF321
 3949 150f 08       		.byte	0x8
 3950 1510 7F       		.byte	0x7f
 3951 1511 D3000000 		.4byte	0xd3
 3952 1515 02       		.byte	0x2
 3953 1516 23       		.byte	0x23
 3954 1517 00       		.uleb128 0x0
 3955 1518 03       		.uleb128 0x3
 3956 1519 E7030000 		.4byte	.LASF322
 3957 151d 08       		.byte	0x8
 3958 151e 80       		.byte	0x80
 3959 151f DE000000 		.4byte	0xde
 3960 1523 02       		.byte	0x2
 3961 1524 23       		.byte	0x23
 3962 1525 01       		.uleb128 0x1
 3963 1526 03       		.uleb128 0x3
 3964 1527 19090000 		.4byte	.LASF323
 3965 152b 08       		.byte	0x8
 3966 152c 81       		.byte	0x81
 3967 152d E9000000 		.4byte	0xe9
 3968 1531 02       		.byte	0x2
 3969 1532 23       		.byte	0x23
 3970 1533 02       		.uleb128 0x2
 3971 1534 03       		.uleb128 0x3
 3972 1535 0E020000 		.4byte	.LASF324
 3973 1539 08       		.byte	0x8
ARM GAS  /tmp/ccV38c0o.s 			page 80


 3974 153a 82       		.byte	0x82
 3975 153b E9000000 		.4byte	0xe9
 3976 153f 02       		.byte	0x2
 3977 1540 23       		.byte	0x23
 3978 1541 04       		.uleb128 0x4
 3979 1542 03       		.uleb128 0x3
 3980 1543 C3070000 		.4byte	.LASF325
 3981 1547 08       		.byte	0x8
 3982 1548 83       		.byte	0x83
 3983 1549 E9000000 		.4byte	0xe9
 3984 154d 02       		.byte	0x2
 3985 154e 23       		.byte	0x23
 3986 154f 06       		.uleb128 0x6
 3987 1550 03       		.uleb128 0x3
 3988 1551 E9120000 		.4byte	.LASF326
 3989 1555 08       		.byte	0x8
 3990 1556 84       		.byte	0x84
 3991 1557 E9000000 		.4byte	0xe9
 3992 155b 02       		.byte	0x2
 3993 155c 23       		.byte	0x23
 3994 155d 08       		.uleb128 0x8
 3995 155e 00       		.byte	0x0
 3996 155f 0E       		.uleb128 0xe
 3997 1560 CE150000 		.4byte	0x15ce
 3998 1564 2A030000 		.4byte	.LASF327
 3999 1568 10       		.byte	0x10
 4000 1569 08       		.byte	0x8
 4001 156a 87       		.byte	0x87
 4002 156b 03       		.uleb128 0x3
 4003 156c 8E0E0000 		.4byte	.LASF328
 4004 1570 08       		.byte	0x8
 4005 1571 88       		.byte	0x88
 4006 1572 E9000000 		.4byte	0xe9
 4007 1576 02       		.byte	0x2
 4008 1577 23       		.byte	0x23
 4009 1578 00       		.uleb128 0x0
 4010 1579 03       		.uleb128 0x3
 4011 157a E8040000 		.4byte	.LASF329
 4012 157e 08       		.byte	0x8
 4013 157f 89       		.byte	0x89
 4014 1580 E9000000 		.4byte	0xe9
 4015 1584 02       		.byte	0x2
 4016 1585 23       		.byte	0x23
 4017 1586 02       		.uleb128 0x2
 4018 1587 03       		.uleb128 0x3
 4019 1588 4B0F0000 		.4byte	.LASF330
 4020 158c 08       		.byte	0x8
 4021 158d 8A       		.byte	0x8a
 4022 158e E9000000 		.4byte	0xe9
 4023 1592 02       		.byte	0x2
 4024 1593 23       		.byte	0x23
 4025 1594 04       		.uleb128 0x4
 4026 1595 03       		.uleb128 0x3
 4027 1596 76180000 		.4byte	.LASF331
 4028 159a 08       		.byte	0x8
 4029 159b 8B       		.byte	0x8b
 4030 159c DE000000 		.4byte	0xde
ARM GAS  /tmp/ccV38c0o.s 			page 81


 4031 15a0 02       		.byte	0x2
 4032 15a1 23       		.byte	0x23
 4033 15a2 06       		.uleb128 0x6
 4034 15a3 03       		.uleb128 0x3
 4035 15a4 CA030000 		.4byte	.LASF332
 4036 15a8 08       		.byte	0x8
 4037 15a9 8C       		.byte	0x8c
 4038 15aa E9000000 		.4byte	0xe9
 4039 15ae 02       		.byte	0x2
 4040 15af 23       		.byte	0x23
 4041 15b0 08       		.uleb128 0x8
 4042 15b1 03       		.uleb128 0x3
 4043 15b2 19170000 		.4byte	.LASF333
 4044 15b6 08       		.byte	0x8
 4045 15b7 8D       		.byte	0x8d
 4046 15b8 E9000000 		.4byte	0xe9
 4047 15bc 02       		.byte	0x2
 4048 15bd 23       		.byte	0x23
 4049 15be 0A       		.uleb128 0xa
 4050 15bf 03       		.uleb128 0x3
 4051 15c0 CD170000 		.4byte	.LASF334
 4052 15c4 08       		.byte	0x8
 4053 15c5 8E       		.byte	0x8e
 4054 15c6 D3000000 		.4byte	0xd3
 4055 15ca 02       		.byte	0x2
 4056 15cb 23       		.byte	0x23
 4057 15cc 0C       		.uleb128 0xc
 4058 15cd 00       		.byte	0x0
 4059 15ce 03       		.uleb128 0x3
 4060 15cf 2A010000 		.4byte	.LASF335
 4061 15d3 08       		.byte	0x8
 4062 15d4 7A       		.byte	0x7a
 4063 15d5 DE000000 		.4byte	0xde
 4064 15d9 02       		.byte	0x2
 4065 15da 23       		.byte	0x23
 4066 15db 00       		.uleb128 0x0
 4067 15dc 03       		.uleb128 0x3
 4068 15dd B9090000 		.4byte	.LASF336
 4069 15e1 08       		.byte	0x8
 4070 15e2 7B       		.byte	0x7b
 4071 15e3 DE000000 		.4byte	0xde
 4072 15e7 02       		.byte	0x2
 4073 15e8 23       		.byte	0x23
 4074 15e9 01       		.uleb128 0x1
 4075 15ea 03       		.uleb128 0x3
 4076 15eb BE150000 		.4byte	.LASF337
 4077 15ef 08       		.byte	0x8
 4078 15f0 7C       		.byte	0x7c
 4079 15f1 DE000000 		.4byte	0xde
 4080 15f5 02       		.byte	0x2
 4081 15f6 23       		.byte	0x23
 4082 15f7 02       		.uleb128 0x2
 4083 15f8 04       		.uleb128 0x4
 4084 15f9 564D4100 		.ascii	"VMA\000"
 4085 15fd 08       		.byte	0x8
 4086 15fe 85       		.byte	0x85
 4087 15ff FE140000 		.4byte	0x14fe
ARM GAS  /tmp/ccV38c0o.s 			page 82


 4088 1603 02       		.byte	0x2
 4089 1604 23       		.byte	0x23
 4090 1605 04       		.uleb128 0x4
 4091 1606 04       		.uleb128 0x4
 4092 1607 424700   		.ascii	"BG\000"
 4093 160a 08       		.byte	0x8
 4094 160b 8F       		.byte	0x8f
 4095 160c FF190000 		.4byte	0x19ff
 4096 1610 02       		.byte	0x2
 4097 1611 23       		.byte	0x23
 4098 1612 10       		.uleb128 0x10
 4099 1613 03       		.uleb128 0x3
 4100 1614 3A130000 		.4byte	.LASF338
 4101 1618 08       		.byte	0x8
 4102 1619 91       		.byte	0x91
 4103 161a D3000000 		.4byte	0xd3
 4104 161e 02       		.byte	0x2
 4105 161f 23       		.byte	0x23
 4106 1620 50       		.uleb128 0x50
 4107 1621 03       		.uleb128 0x3
 4108 1622 2C170000 		.4byte	.LASF339
 4109 1626 08       		.byte	0x8
 4110 1627 92       		.byte	0x92
 4111 1628 0F1A0000 		.4byte	0x1a0f
 4112 162c 02       		.byte	0x2
 4113 162d 23       		.byte	0x23
 4114 162e 52       		.uleb128 0x52
 4115 162f 03       		.uleb128 0x3
 4116 1630 130C0000 		.4byte	.LASF340
 4117 1634 08       		.byte	0x8
 4118 1635 93       		.byte	0x93
 4119 1636 DE000000 		.4byte	0xde
 4120 163a 03       		.byte	0x3
 4121 163b 23       		.byte	0x23
 4122 163c D204     		.uleb128 0x252
 4123 163e 03       		.uleb128 0x3
 4124 163f 9A060000 		.4byte	.LASF341
 4125 1643 08       		.byte	0x8
 4126 1644 94       		.byte	0x94
 4127 1645 DE000000 		.4byte	0xde
 4128 1649 03       		.byte	0x3
 4129 164a 23       		.byte	0x23
 4130 164b D304     		.uleb128 0x253
 4131 164d 04       		.uleb128 0x4
 4132 164e 4F424A00 		.ascii	"OBJ\000"
 4133 1652 08       		.byte	0x8
 4134 1653 95       		.byte	0x95
 4135 1654 1F1A0000 		.4byte	0x1a1f
 4136 1658 03       		.byte	0x3
 4137 1659 23       		.byte	0x23
 4138 165a D404     		.uleb128 0x254
 4139 165c 03       		.uleb128 0x3
 4140 165d E40A0000 		.4byte	.LASF342
 4141 1661 08       		.byte	0x8
 4142 1662 96       		.byte	0x96
 4143 1663 DE000000 		.4byte	0xde
 4144 1667 03       		.byte	0x3
ARM GAS  /tmp/ccV38c0o.s 			page 83


 4145 1668 23       		.byte	0x23
 4146 1669 D410     		.uleb128 0x854
 4147 166b 03       		.uleb128 0x3
 4148 166c 03050000 		.4byte	.LASF343
 4149 1670 08       		.byte	0x8
 4150 1671 97       		.byte	0x97
 4151 1672 E9000000 		.4byte	0xe9
 4152 1676 03       		.byte	0x3
 4153 1677 23       		.byte	0x23
 4154 1678 D610     		.uleb128 0x856
 4155 167a 03       		.uleb128 0x3
 4156 167b BF050000 		.4byte	.LASF344
 4157 167f 08       		.byte	0x8
 4158 1680 99       		.byte	0x99
 4159 1681 DE000000 		.4byte	0xde
 4160 1685 03       		.byte	0x3
 4161 1686 23       		.byte	0x23
 4162 1687 D810     		.uleb128 0x858
 4163 1689 03       		.uleb128 0x3
 4164 168a 05130000 		.4byte	.LASF345
 4165 168e 08       		.byte	0x8
 4166 168f 9A       		.byte	0x9a
 4167 1690 E9000000 		.4byte	0xe9
 4168 1694 03       		.byte	0x3
 4169 1695 23       		.byte	0x23
 4170 1696 DA10     		.uleb128 0x85a
 4171 1698 03       		.uleb128 0x3
 4172 1699 54150000 		.4byte	.LASF346
 4173 169d 08       		.byte	0x8
 4174 169e 9B       		.byte	0x9b
 4175 169f E9000000 		.4byte	0xe9
 4176 16a3 03       		.byte	0x3
 4177 16a4 23       		.byte	0x23
 4178 16a5 DC10     		.uleb128 0x85c
 4179 16a7 03       		.uleb128 0x3
 4180 16a8 8C070000 		.4byte	.LASF347
 4181 16ac 08       		.byte	0x8
 4182 16ad 9C       		.byte	0x9c
 4183 16ae E9000000 		.4byte	0xe9
 4184 16b2 03       		.byte	0x3
 4185 16b3 23       		.byte	0x23
 4186 16b4 DE10     		.uleb128 0x85e
 4187 16b6 03       		.uleb128 0x3
 4188 16b7 9F100000 		.4byte	.LASF348
 4189 16bb 08       		.byte	0x8
 4190 16bc 9D       		.byte	0x9d
 4191 16bd E9000000 		.4byte	0xe9
 4192 16c1 03       		.byte	0x3
 4193 16c2 23       		.byte	0x23
 4194 16c3 E010     		.uleb128 0x860
 4195 16c5 03       		.uleb128 0x3
 4196 16c6 C9150000 		.4byte	.LASF349
 4197 16ca 08       		.byte	0x8
 4198 16cb 9E       		.byte	0x9e
 4199 16cc E9000000 		.4byte	0xe9
 4200 16d0 03       		.byte	0x3
 4201 16d1 23       		.byte	0x23
ARM GAS  /tmp/ccV38c0o.s 			page 84


 4202 16d2 E210     		.uleb128 0x862
 4203 16d4 03       		.uleb128 0x3
 4204 16d5 0E140000 		.4byte	.LASF350
 4205 16d9 08       		.byte	0x8
 4206 16da A0       		.byte	0xa0
 4207 16db DE000000 		.4byte	0xde
 4208 16df 03       		.byte	0x3
 4209 16e0 23       		.byte	0x23
 4210 16e1 E410     		.uleb128 0x864
 4211 16e3 03       		.uleb128 0x3
 4212 16e4 75090000 		.4byte	.LASF351
 4213 16e8 08       		.byte	0x8
 4214 16e9 A1       		.byte	0xa1
 4215 16ea DE000000 		.4byte	0xde
 4216 16ee 03       		.byte	0x3
 4217 16ef 23       		.byte	0x23
 4218 16f0 E510     		.uleb128 0x865
 4219 16f2 03       		.uleb128 0x3
 4220 16f3 790E0000 		.4byte	.LASF352
 4221 16f7 08       		.byte	0x8
 4222 16f8 A2       		.byte	0xa2
 4223 16f9 DE000000 		.4byte	0xde
 4224 16fd 03       		.byte	0x3
 4225 16fe 23       		.byte	0x23
 4226 16ff E610     		.uleb128 0x866
 4227 1701 03       		.uleb128 0x3
 4228 1702 5A050000 		.4byte	.LASF353
 4229 1706 08       		.byte	0x8
 4230 1707 A4       		.byte	0xa4
 4231 1708 7F000000 		.4byte	0x7f
 4232 170c 03       		.byte	0x3
 4233 170d 23       		.byte	0x23
 4234 170e E810     		.uleb128 0x868
 4235 1710 03       		.uleb128 0x3
 4236 1711 660E0000 		.4byte	.LASF354
 4237 1715 08       		.byte	0x8
 4238 1716 A5       		.byte	0xa5
 4239 1717 7F000000 		.4byte	0x7f
 4240 171b 03       		.byte	0x3
 4241 171c 23       		.byte	0x23
 4242 171d EA10     		.uleb128 0x86a
 4243 171f 03       		.uleb128 0x3
 4244 1720 32130000 		.4byte	.LASF355
 4245 1724 08       		.byte	0x8
 4246 1725 A6       		.byte	0xa6
 4247 1726 7F000000 		.4byte	0x7f
 4248 172a 03       		.byte	0x3
 4249 172b 23       		.byte	0x23
 4250 172c EC10     		.uleb128 0x86c
 4251 172e 03       		.uleb128 0x3
 4252 172f 740F0000 		.4byte	.LASF356
 4253 1733 08       		.byte	0x8
 4254 1734 A7       		.byte	0xa7
 4255 1735 7F000000 		.4byte	0x7f
 4256 1739 03       		.byte	0x3
 4257 173a 23       		.byte	0x23
 4258 173b EE10     		.uleb128 0x86e
ARM GAS  /tmp/ccV38c0o.s 			page 85


 4259 173d 03       		.uleb128 0x3
 4260 173e 61130000 		.4byte	.LASF357
 4261 1742 08       		.byte	0x8
 4262 1743 A8       		.byte	0xa8
 4263 1744 7F000000 		.4byte	0x7f
 4264 1748 03       		.byte	0x3
 4265 1749 23       		.byte	0x23
 4266 174a F010     		.uleb128 0x870
 4267 174c 03       		.uleb128 0x3
 4268 174d 73070000 		.4byte	.LASF358
 4269 1751 08       		.byte	0x8
 4270 1752 A9       		.byte	0xa9
 4271 1753 7F000000 		.4byte	0x7f
 4272 1757 03       		.byte	0x3
 4273 1758 23       		.byte	0x23
 4274 1759 F210     		.uleb128 0x872
 4275 175b 03       		.uleb128 0x3
 4276 175c CE120000 		.4byte	.LASF359
 4277 1760 08       		.byte	0x8
 4278 1761 AA       		.byte	0xaa
 4279 1762 DE000000 		.4byte	0xde
 4280 1766 03       		.byte	0x3
 4281 1767 23       		.byte	0x23
 4282 1768 F410     		.uleb128 0x874
 4283 176a 03       		.uleb128 0x3
 4284 176b CC100000 		.4byte	.LASF360
 4285 176f 08       		.byte	0x8
 4286 1770 AB       		.byte	0xab
 4287 1771 DE000000 		.4byte	0xde
 4288 1775 03       		.byte	0x3
 4289 1776 23       		.byte	0x23
 4290 1777 F510     		.uleb128 0x875
 4291 1779 03       		.uleb128 0x3
 4292 177a B80A0000 		.4byte	.LASF361
 4293 177e 08       		.byte	0x8
 4294 177f AD       		.byte	0xad
 4295 1780 DE000000 		.4byte	0xde
 4296 1784 03       		.byte	0x3
 4297 1785 23       		.byte	0x23
 4298 1786 F610     		.uleb128 0x876
 4299 1788 03       		.uleb128 0x3
 4300 1789 41010000 		.4byte	.LASF362
 4301 178d 08       		.byte	0x8
 4302 178e AE       		.byte	0xae
 4303 178f DE000000 		.4byte	0xde
 4304 1793 03       		.byte	0x3
 4305 1794 23       		.byte	0x23
 4306 1795 F710     		.uleb128 0x877
 4307 1797 03       		.uleb128 0x3
 4308 1798 FD130000 		.4byte	.LASF363
 4309 179c 08       		.byte	0x8
 4310 179d AF       		.byte	0xaf
 4311 179e DE000000 		.4byte	0xde
 4312 17a2 03       		.byte	0x3
 4313 17a3 23       		.byte	0x23
 4314 17a4 F810     		.uleb128 0x878
 4315 17a6 03       		.uleb128 0x3
ARM GAS  /tmp/ccV38c0o.s 			page 86


 4316 17a7 B3080000 		.4byte	.LASF364
 4317 17ab 08       		.byte	0x8
 4318 17ac B0       		.byte	0xb0
 4319 17ad DE000000 		.4byte	0xde
 4320 17b1 03       		.byte	0x3
 4321 17b2 23       		.byte	0x23
 4322 17b3 F910     		.uleb128 0x879
 4323 17b5 03       		.uleb128 0x3
 4324 17b6 C5160000 		.4byte	.LASF365
 4325 17ba 08       		.byte	0x8
 4326 17bb B1       		.byte	0xb1
 4327 17bc E9000000 		.4byte	0xe9
 4328 17c0 03       		.byte	0x3
 4329 17c1 23       		.byte	0x23
 4330 17c2 FA10     		.uleb128 0x87a
 4331 17c4 03       		.uleb128 0x3
 4332 17c5 42110000 		.4byte	.LASF366
 4333 17c9 08       		.byte	0x8
 4334 17ca B2       		.byte	0xb2
 4335 17cb E9000000 		.4byte	0xe9
 4336 17cf 03       		.byte	0x3
 4337 17d0 23       		.byte	0x23
 4338 17d1 FC10     		.uleb128 0x87c
 4339 17d3 03       		.uleb128 0x3
 4340 17d4 EC100000 		.4byte	.LASF367
 4341 17d8 08       		.byte	0x8
 4342 17d9 B3       		.byte	0xb3
 4343 17da FF000000 		.4byte	0xff
 4344 17de 03       		.byte	0x3
 4345 17df 23       		.byte	0x23
 4346 17e0 8011     		.uleb128 0x880
 4347 17e2 03       		.uleb128 0x3
 4348 17e3 C0000000 		.4byte	.LASF368
 4349 17e7 08       		.byte	0x8
 4350 17e8 B4       		.byte	0xb4
 4351 17e9 DE000000 		.4byte	0xde
 4352 17ed 03       		.byte	0x3
 4353 17ee 23       		.byte	0x23
 4354 17ef 8411     		.uleb128 0x884
 4355 17f1 03       		.uleb128 0x3
 4356 17f2 30140000 		.4byte	.LASF369
 4357 17f6 08       		.byte	0x8
 4358 17f7 B5       		.byte	0xb5
 4359 17f8 D3000000 		.4byte	0xd3
 4360 17fc 03       		.byte	0x3
 4361 17fd 23       		.byte	0x23
 4362 17fe 8511     		.uleb128 0x885
 4363 1800 03       		.uleb128 0x3
 4364 1801 58070000 		.4byte	.LASF370
 4365 1805 08       		.byte	0x8
 4366 1806 B6       		.byte	0xb6
 4367 1807 D3000000 		.4byte	0xd3
 4368 180b 03       		.byte	0x3
 4369 180c 23       		.byte	0x23
 4370 180d 8611     		.uleb128 0x886
 4371 180f 03       		.uleb128 0x3
 4372 1810 56170000 		.4byte	.LASF371
ARM GAS  /tmp/ccV38c0o.s 			page 87


 4373 1814 08       		.byte	0x8
 4374 1815 B7       		.byte	0xb7
 4375 1816 D3000000 		.4byte	0xd3
 4376 181a 03       		.byte	0x3
 4377 181b 23       		.byte	0x23
 4378 181c 8711     		.uleb128 0x887
 4379 181e 03       		.uleb128 0x3
 4380 181f 60030000 		.4byte	.LASF372
 4381 1823 08       		.byte	0x8
 4382 1824 B8       		.byte	0xb8
 4383 1825 DE000000 		.4byte	0xde
 4384 1829 03       		.byte	0x3
 4385 182a 23       		.byte	0x23
 4386 182b 8811     		.uleb128 0x888
 4387 182d 03       		.uleb128 0x3
 4388 182e 1B110000 		.4byte	.LASF373
 4389 1832 08       		.byte	0x8
 4390 1833 B9       		.byte	0xb9
 4391 1834 E9000000 		.4byte	0xe9
 4392 1838 03       		.byte	0x3
 4393 1839 23       		.byte	0x23
 4394 183a 8A11     		.uleb128 0x88a
 4395 183c 03       		.uleb128 0x3
 4396 183d 98070000 		.4byte	.LASF374
 4397 1841 08       		.byte	0x8
 4398 1842 BA       		.byte	0xba
 4399 1843 D3000000 		.4byte	0xd3
 4400 1847 03       		.byte	0x3
 4401 1848 23       		.byte	0x23
 4402 1849 8C11     		.uleb128 0x88c
 4403 184b 03       		.uleb128 0x3
 4404 184c 15010000 		.4byte	.LASF375
 4405 1850 08       		.byte	0x8
 4406 1851 BB       		.byte	0xbb
 4407 1852 DE000000 		.4byte	0xde
 4408 1856 03       		.byte	0x3
 4409 1857 23       		.byte	0x23
 4410 1858 8D11     		.uleb128 0x88d
 4411 185a 03       		.uleb128 0x3
 4412 185b 130F0000 		.4byte	.LASF376
 4413 185f 08       		.byte	0x8
 4414 1860 BC       		.byte	0xbc
 4415 1861 2F1A0000 		.4byte	0x1a2f
 4416 1865 03       		.byte	0x3
 4417 1866 23       		.byte	0x23
 4418 1867 8E11     		.uleb128 0x88e
 4419 1869 03       		.uleb128 0x3
 4420 186a 3C0E0000 		.4byte	.LASF377
 4421 186e 08       		.byte	0x8
 4422 186f BD       		.byte	0xbd
 4423 1870 D3000000 		.4byte	0xd3
 4424 1874 03       		.byte	0x3
 4425 1875 23       		.byte	0x23
 4426 1876 AE15     		.uleb128 0xaae
 4427 1878 03       		.uleb128 0x3
 4428 1879 A3120000 		.4byte	.LASF378
 4429 187d 08       		.byte	0x8
ARM GAS  /tmp/ccV38c0o.s 			page 88


 4430 187e BE       		.byte	0xbe
 4431 187f D3000000 		.4byte	0xd3
 4432 1883 03       		.byte	0x3
 4433 1884 23       		.byte	0x23
 4434 1885 AF15     		.uleb128 0xaaf
 4435 1887 03       		.uleb128 0x3
 4436 1888 B9170000 		.4byte	.LASF379
 4437 188c 08       		.byte	0x8
 4438 188d BF       		.byte	0xbf
 4439 188e 7F000000 		.4byte	0x7f
 4440 1892 03       		.byte	0x3
 4441 1893 23       		.byte	0x23
 4442 1894 B015     		.uleb128 0xab0
 4443 1896 03       		.uleb128 0x3
 4444 1897 6D0F0000 		.4byte	.LASF380
 4445 189b 08       		.byte	0x8
 4446 189c C0       		.byte	0xc0
 4447 189d DE000000 		.4byte	0xde
 4448 18a1 03       		.byte	0x3
 4449 18a2 23       		.byte	0x23
 4450 18a3 B215     		.uleb128 0xab2
 4451 18a5 03       		.uleb128 0x3
 4452 18a6 6E040000 		.4byte	.LASF381
 4453 18aa 08       		.byte	0x8
 4454 18ab C1       		.byte	0xc1
 4455 18ac 401A0000 		.4byte	0x1a40
 4456 18b0 03       		.byte	0x3
 4457 18b1 23       		.byte	0x23
 4458 18b2 B315     		.uleb128 0xab3
 4459 18b4 03       		.uleb128 0x3
 4460 18b5 00000000 		.4byte	.LASF382
 4461 18b9 08       		.byte	0x8
 4462 18ba C2       		.byte	0xc2
 4463 18bb D3000000 		.4byte	0xd3
 4464 18bf 03       		.byte	0x3
 4465 18c0 23       		.byte	0x23
 4466 18c1 B715     		.uleb128 0xab7
 4467 18c3 03       		.uleb128 0x3
 4468 18c4 75130000 		.4byte	.LASF383
 4469 18c8 08       		.byte	0x8
 4470 18c9 C3       		.byte	0xc3
 4471 18ca D3000000 		.4byte	0xd3
 4472 18ce 03       		.byte	0x3
 4473 18cf 23       		.byte	0x23
 4474 18d0 B815     		.uleb128 0xab8
 4475 18d2 03       		.uleb128 0x3
 4476 18d3 300E0000 		.4byte	.LASF384
 4477 18d7 08       		.byte	0x8
 4478 18d8 C4       		.byte	0xc4
 4479 18d9 DE000000 		.4byte	0xde
 4480 18dd 03       		.byte	0x3
 4481 18de 23       		.byte	0x23
 4482 18df B915     		.uleb128 0xab9
 4483 18e1 03       		.uleb128 0x3
 4484 18e2 83150000 		.4byte	.LASF385
 4485 18e6 08       		.byte	0x8
 4486 18e7 C5       		.byte	0xc5
ARM GAS  /tmp/ccV38c0o.s 			page 89


 4487 18e8 DE000000 		.4byte	0xde
 4488 18ec 03       		.byte	0x3
 4489 18ed 23       		.byte	0x23
 4490 18ee BA15     		.uleb128 0xaba
 4491 18f0 03       		.uleb128 0x3
 4492 18f1 BE0C0000 		.4byte	.LASF386
 4493 18f5 08       		.byte	0x8
 4494 18f6 C6       		.byte	0xc6
 4495 18f7 DE000000 		.4byte	0xde
 4496 18fb 03       		.byte	0x3
 4497 18fc 23       		.byte	0x23
 4498 18fd BB15     		.uleb128 0xabb
 4499 18ff 03       		.uleb128 0x3
 4500 1900 0B050000 		.4byte	.LASF387
 4501 1904 08       		.byte	0x8
 4502 1905 C7       		.byte	0xc7
 4503 1906 DE000000 		.4byte	0xde
 4504 190a 03       		.byte	0x3
 4505 190b 23       		.byte	0x23
 4506 190c BC15     		.uleb128 0xabc
 4507 190e 03       		.uleb128 0x3
 4508 190f 68120000 		.4byte	.LASF388
 4509 1913 08       		.byte	0x8
 4510 1914 C8       		.byte	0xc8
 4511 1915 DE000000 		.4byte	0xde
 4512 1919 03       		.byte	0x3
 4513 191a 23       		.byte	0x23
 4514 191b BD15     		.uleb128 0xabd
 4515 191d 03       		.uleb128 0x3
 4516 191e BA020000 		.4byte	.LASF389
 4517 1922 08       		.byte	0x8
 4518 1923 C9       		.byte	0xc9
 4519 1924 501A0000 		.4byte	0x1a50
 4520 1928 03       		.byte	0x3
 4521 1929 23       		.byte	0x23
 4522 192a BE15     		.uleb128 0xabe
 4523 192c 03       		.uleb128 0x3
 4524 192d 04110000 		.4byte	.LASF390
 4525 1931 08       		.byte	0x8
 4526 1932 CA       		.byte	0xca
 4527 1933 501A0000 		.4byte	0x1a50
 4528 1937 03       		.byte	0x3
 4529 1938 23       		.byte	0x23
 4530 1939 C415     		.uleb128 0xac4
 4531 193b 03       		.uleb128 0x3
 4532 193c 3F140000 		.4byte	.LASF391
 4533 1940 08       		.byte	0x8
 4534 1941 CB       		.byte	0xcb
 4535 1942 501A0000 		.4byte	0x1a50
 4536 1946 03       		.byte	0x3
 4537 1947 23       		.byte	0x23
 4538 1948 CA15     		.uleb128 0xaca
 4539 194a 03       		.uleb128 0x3
 4540 194b C8110000 		.4byte	.LASF392
 4541 194f 08       		.byte	0x8
 4542 1950 CC       		.byte	0xcc
 4543 1951 501A0000 		.4byte	0x1a50
ARM GAS  /tmp/ccV38c0o.s 			page 90


 4544 1955 03       		.byte	0x3
 4545 1956 23       		.byte	0x23
 4546 1957 D015     		.uleb128 0xad0
 4547 1959 03       		.uleb128 0x3
 4548 195a FF060000 		.4byte	.LASF393
 4549 195e 08       		.byte	0x8
 4550 195f CD       		.byte	0xcd
 4551 1960 601A0000 		.4byte	0x1a60
 4552 1964 03       		.byte	0x3
 4553 1965 23       		.byte	0x23
 4554 1966 D615     		.uleb128 0xad6
 4555 1968 03       		.uleb128 0x3
 4556 1969 6B0D0000 		.4byte	.LASF394
 4557 196d 08       		.byte	0x8
 4558 196e CE       		.byte	0xce
 4559 196f 601A0000 		.4byte	0x1a60
 4560 1973 03       		.byte	0x3
 4561 1974 23       		.byte	0x23
 4562 1975 DC15     		.uleb128 0xadc
 4563 1977 03       		.uleb128 0x3
 4564 1978 CA000000 		.4byte	.LASF395
 4565 197c 08       		.byte	0x8
 4566 197d CF       		.byte	0xcf
 4567 197e D3000000 		.4byte	0xd3
 4568 1982 03       		.byte	0x3
 4569 1983 23       		.byte	0x23
 4570 1984 E215     		.uleb128 0xae2
 4571 1986 03       		.uleb128 0x3
 4572 1987 E1100000 		.4byte	.LASF396
 4573 198b 08       		.byte	0x8
 4574 198c D0       		.byte	0xd0
 4575 198d DE000000 		.4byte	0xde
 4576 1991 03       		.byte	0x3
 4577 1992 23       		.byte	0x23
 4578 1993 E315     		.uleb128 0xae3
 4579 1995 03       		.uleb128 0x3
 4580 1996 F5040000 		.4byte	.LASF397
 4581 199a 08       		.byte	0x8
 4582 199b D1       		.byte	0xd1
 4583 199c E9000000 		.4byte	0xe9
 4584 19a0 03       		.byte	0x3
 4585 19a1 23       		.byte	0x23
 4586 19a2 E415     		.uleb128 0xae4
 4587 19a4 03       		.uleb128 0x3
 4588 19a5 29000000 		.4byte	.LASF398
 4589 19a9 08       		.byte	0x8
 4590 19aa D2       		.byte	0xd2
 4591 19ab D3000000 		.4byte	0xd3
 4592 19af 03       		.byte	0x3
 4593 19b0 23       		.byte	0x23
 4594 19b1 E615     		.uleb128 0xae6
 4595 19b3 03       		.uleb128 0x3
 4596 19b4 A5060000 		.4byte	.LASF399
 4597 19b8 08       		.byte	0x8
 4598 19b9 D3       		.byte	0xd3
 4599 19ba DE000000 		.4byte	0xde
 4600 19be 03       		.byte	0x3
ARM GAS  /tmp/ccV38c0o.s 			page 91


 4601 19bf 23       		.byte	0x23
 4602 19c0 E715     		.uleb128 0xae7
 4603 19c2 03       		.uleb128 0x3
 4604 19c3 F9100000 		.4byte	.LASF400
 4605 19c7 08       		.byte	0x8
 4606 19c8 D4       		.byte	0xd4
 4607 19c9 701A0000 		.4byte	0x1a70
 4608 19cd 03       		.byte	0x3
 4609 19ce 23       		.byte	0x23
 4610 19cf E815     		.uleb128 0xae8
 4611 19d1 03       		.uleb128 0x3
 4612 19d2 42060000 		.4byte	.LASF401
 4613 19d6 08       		.byte	0x8
 4614 19d7 D5       		.byte	0xd5
 4615 19d8 E9000000 		.4byte	0xe9
 4616 19dc 03       		.byte	0x3
 4617 19dd 23       		.byte	0x23
 4618 19de EA15     		.uleb128 0xaea
 4619 19e0 03       		.uleb128 0x3
 4620 19e1 E20E0000 		.4byte	.LASF402
 4621 19e5 08       		.byte	0x8
 4622 19e6 D6       		.byte	0xd6
 4623 19e7 E9000000 		.4byte	0xe9
 4624 19eb 03       		.byte	0x3
 4625 19ec 23       		.byte	0x23
 4626 19ed EC15     		.uleb128 0xaec
 4627 19ef 03       		.uleb128 0x3
 4628 19f0 AD170000 		.4byte	.LASF403
 4629 19f4 08       		.byte	0x8
 4630 19f5 D7       		.byte	0xd7
 4631 19f6 DE000000 		.4byte	0xde
 4632 19fa 03       		.byte	0x3
 4633 19fb 23       		.byte	0x23
 4634 19fc EE15     		.uleb128 0xaee
 4635 19fe 00       		.byte	0x0
 4636 19ff 07       		.uleb128 0x7
 4637 1a00 0F1A0000 		.4byte	0x1a0f
 4638 1a04 5F150000 		.4byte	0x155f
 4639 1a08 08       		.uleb128 0x8
 4640 1a09 B2000000 		.4byte	0xb2
 4641 1a0d 03       		.byte	0x3
 4642 1a0e 00       		.byte	0x0
 4643 1a0f 07       		.uleb128 0x7
 4644 1a10 1F1A0000 		.4byte	0x1a1f
 4645 1a14 E9000000 		.4byte	0xe9
 4646 1a18 08       		.uleb128 0x8
 4647 1a19 B2000000 		.4byte	0xb2
 4648 1a1d FF       		.byte	0xff
 4649 1a1e 00       		.byte	0x0
 4650 1a1f 07       		.uleb128 0x7
 4651 1a20 2F1A0000 		.4byte	0x1a2f
 4652 1a24 74140000 		.4byte	0x1474
 4653 1a28 08       		.uleb128 0x8
 4654 1a29 B2000000 		.4byte	0xb2
 4655 1a2d 7F       		.byte	0x7f
 4656 1a2e 00       		.byte	0x0
 4657 1a2f 07       		.uleb128 0x7
ARM GAS  /tmp/ccV38c0o.s 			page 92


 4658 1a30 401A0000 		.4byte	0x1a40
 4659 1a34 DE000000 		.4byte	0xde
 4660 1a38 1A       		.uleb128 0x1a
 4661 1a39 B2000000 		.4byte	0xb2
 4662 1a3d 1F02     		.2byte	0x21f
 4663 1a3f 00       		.byte	0x0
 4664 1a40 07       		.uleb128 0x7
 4665 1a41 501A0000 		.4byte	0x1a50
 4666 1a45 D3000000 		.4byte	0xd3
 4667 1a49 08       		.uleb128 0x8
 4668 1a4a B2000000 		.4byte	0xb2
 4669 1a4e 03       		.byte	0x3
 4670 1a4f 00       		.byte	0x0
 4671 1a50 07       		.uleb128 0x7
 4672 1a51 601A0000 		.4byte	0x1a60
 4673 1a55 DE000000 		.4byte	0xde
 4674 1a59 08       		.uleb128 0x8
 4675 1a5a B2000000 		.4byte	0xb2
 4676 1a5e 05       		.byte	0x5
 4677 1a5f 00       		.byte	0x0
 4678 1a60 07       		.uleb128 0x7
 4679 1a61 701A0000 		.4byte	0x1a70
 4680 1a65 D3000000 		.4byte	0xd3
 4681 1a69 08       		.uleb128 0x8
 4682 1a6a B2000000 		.4byte	0xb2
 4683 1a6e 05       		.byte	0x5
 4684 1a6f 00       		.byte	0x0
 4685 1a70 07       		.uleb128 0x7
 4686 1a71 801A0000 		.4byte	0x1a80
 4687 1a75 DE000000 		.4byte	0xde
 4688 1a79 08       		.uleb128 0x8
 4689 1a7a B2000000 		.4byte	0xb2
 4690 1a7e 01       		.byte	0x1
 4691 1a7f 00       		.byte	0x0
 4692 1a80 1C       		.uleb128 0x1c
 4693 1a81 9E1C0000 		.4byte	0x1c9e
 4694 1a85 C8170000 		.4byte	.LASF404
 4695 1a89 7406     		.2byte	0x674
 4696 1a8b 09       		.byte	0x9
 4697 1a8c 33       		.byte	0x33
 4698 1a8d 03       		.uleb128 0x3
 4699 1a8e 51040000 		.4byte	.LASF405
 4700 1a92 09       		.byte	0x9
 4701 1a93 35       		.byte	0x35
 4702 1a94 4D040000 		.4byte	0x44d
 4703 1a98 02       		.byte	0x2
 4704 1a99 23       		.byte	0x23
 4705 1a9a 00       		.uleb128 0x0
 4706 1a9b 03       		.uleb128 0x3
 4707 1a9c F3080000 		.4byte	.LASF406
 4708 1aa0 09       		.byte	0x9
 4709 1aa1 36       		.byte	0x36
 4710 1aa2 4D040000 		.4byte	0x44d
 4711 1aa6 02       		.byte	0x2
 4712 1aa7 23       		.byte	0x23
 4713 1aa8 04       		.uleb128 0x4
 4714 1aa9 03       		.uleb128 0x3
ARM GAS  /tmp/ccV38c0o.s 			page 93


 4715 1aaa 11070000 		.4byte	.LASF407
 4716 1aae 09       		.byte	0x9
 4717 1aaf 37       		.byte	0x37
 4718 1ab0 4D040000 		.4byte	0x44d
 4719 1ab4 02       		.byte	0x2
 4720 1ab5 23       		.byte	0x23
 4721 1ab6 08       		.uleb128 0x8
 4722 1ab7 03       		.uleb128 0x3
 4723 1ab8 6E020000 		.4byte	.LASF408
 4724 1abc 09       		.byte	0x9
 4725 1abd 38       		.byte	0x38
 4726 1abe 4D040000 		.4byte	0x44d
 4727 1ac2 02       		.byte	0x2
 4728 1ac3 23       		.byte	0x23
 4729 1ac4 0C       		.uleb128 0xc
 4730 1ac5 03       		.uleb128 0x3
 4731 1ac6 31150000 		.4byte	.LASF409
 4732 1aca 09       		.byte	0x9
 4733 1acb 39       		.byte	0x39
 4734 1acc FF000000 		.4byte	0xff
 4735 1ad0 02       		.byte	0x2
 4736 1ad1 23       		.byte	0x23
 4737 1ad2 10       		.uleb128 0x10
 4738 1ad3 03       		.uleb128 0x3
 4739 1ad4 D70F0000 		.4byte	.LASF410
 4740 1ad8 09       		.byte	0x9
 4741 1ad9 3C       		.byte	0x3c
 4742 1ada 86000000 		.4byte	0x86
 4743 1ade 02       		.byte	0x2
 4744 1adf 23       		.byte	0x23
 4745 1ae0 14       		.uleb128 0x14
 4746 1ae1 04       		.uleb128 0x4
 4747 1ae2 583200   		.ascii	"X2\000"
 4748 1ae5 09       		.byte	0x9
 4749 1ae6 3D       		.byte	0x3d
 4750 1ae7 9E1C0000 		.4byte	0x1c9e
 4751 1aeb 02       		.byte	0x2
 4752 1aec 23       		.byte	0x23
 4753 1aed 18       		.uleb128 0x18
 4754 1aee 03       		.uleb128 0x3
 4755 1aef 49130000 		.4byte	.LASF411
 4756 1af3 09       		.byte	0x9
 4757 1af4 3E       		.byte	0x3e
 4758 1af5 9E1C0000 		.4byte	0x1c9e
 4759 1af9 02       		.byte	0x2
 4760 1afa 23       		.byte	0x23
 4761 1afb 1C       		.uleb128 0x1c
 4762 1afc 03       		.uleb128 0x3
 4763 1afd AF030000 		.4byte	.LASF412
 4764 1b01 09       		.byte	0x9
 4765 1b02 3F       		.byte	0x3f
 4766 1b03 9E1C0000 		.4byte	0x1c9e
 4767 1b07 02       		.byte	0x2
 4768 1b08 23       		.byte	0x23
 4769 1b09 20       		.uleb128 0x20
 4770 1b0a 04       		.uleb128 0x4
 4771 1b0b 5300     		.ascii	"S\000"
ARM GAS  /tmp/ccV38c0o.s 			page 94


 4772 1b0d 09       		.byte	0x9
 4773 1b0e 40       		.byte	0x40
 4774 1b0f 4D040000 		.4byte	0x44d
 4775 1b13 02       		.byte	0x2
 4776 1b14 23       		.byte	0x23
 4777 1b15 24       		.uleb128 0x24
 4778 1b16 04       		.uleb128 0x4
 4779 1b17 444200   		.ascii	"DB\000"
 4780 1b1a 09       		.byte	0x9
 4781 1b1b 41       		.byte	0x41
 4782 1b1c 4D040000 		.4byte	0x44d
 4783 1b20 02       		.byte	0x2
 4784 1b21 23       		.byte	0x23
 4785 1b22 28       		.uleb128 0x28
 4786 1b23 03       		.uleb128 0x3
 4787 1b24 F6160000 		.4byte	.LASF303
 4788 1b28 09       		.byte	0x9
 4789 1b29 42       		.byte	0x42
 4790 1b2a 68040000 		.4byte	0x468
 4791 1b2e 02       		.byte	0x2
 4792 1b2f 23       		.byte	0x23
 4793 1b30 2C       		.uleb128 0x2c
 4794 1b31 03       		.uleb128 0x3
 4795 1b32 9D0D0000 		.4byte	.LASF413
 4796 1b36 09       		.byte	0x9
 4797 1b37 43       		.byte	0x43
 4798 1b38 68040000 		.4byte	0x468
 4799 1b3c 02       		.byte	0x2
 4800 1b3d 23       		.byte	0x23
 4801 1b3e 30       		.uleb128 0x30
 4802 1b3f 03       		.uleb128 0x3
 4803 1b40 AE020000 		.4byte	.LASF414
 4804 1b44 09       		.byte	0x9
 4805 1b45 44       		.byte	0x44
 4806 1b46 FF000000 		.4byte	0xff
 4807 1b4a 02       		.byte	0x2
 4808 1b4b 23       		.byte	0x23
 4809 1b4c 34       		.uleb128 0x34
 4810 1b4d 03       		.uleb128 0x3
 4811 1b4e DE160000 		.4byte	.LASF415
 4812 1b52 09       		.byte	0x9
 4813 1b53 45       		.byte	0x45
 4814 1b54 FF000000 		.4byte	0xff
 4815 1b58 02       		.byte	0x2
 4816 1b59 23       		.byte	0x23
 4817 1b5a 38       		.uleb128 0x38
 4818 1b5b 03       		.uleb128 0x3
 4819 1b5c 49120000 		.4byte	.LASF416
 4820 1b60 09       		.byte	0x9
 4821 1b61 46       		.byte	0x46
 4822 1b62 FF000000 		.4byte	0xff
 4823 1b66 02       		.byte	0x2
 4824 1b67 23       		.byte	0x23
 4825 1b68 3C       		.uleb128 0x3c
 4826 1b69 04       		.uleb128 0x4
 4827 1b6a 5A3100   		.ascii	"Z1\000"
 4828 1b6d 09       		.byte	0x9
ARM GAS  /tmp/ccV38c0o.s 			page 95


 4829 1b6e 47       		.byte	0x47
 4830 1b6f DE000000 		.4byte	0xde
 4831 1b73 02       		.byte	0x2
 4832 1b74 23       		.byte	0x23
 4833 1b75 40       		.uleb128 0x40
 4834 1b76 04       		.uleb128 0x4
 4835 1b77 5A3200   		.ascii	"Z2\000"
 4836 1b7a 09       		.byte	0x9
 4837 1b7b 48       		.byte	0x48
 4838 1b7c DE000000 		.4byte	0xde
 4839 1b80 02       		.byte	0x2
 4840 1b81 23       		.byte	0x23
 4841 1b82 41       		.uleb128 0x41
 4842 1b83 03       		.uleb128 0x3
 4843 1b84 A4050000 		.4byte	.LASF417
 4844 1b88 09       		.byte	0x9
 4845 1b89 49       		.byte	0x49
 4846 1b8a FF000000 		.4byte	0xff
 4847 1b8e 02       		.byte	0x2
 4848 1b8f 23       		.byte	0x23
 4849 1b90 44       		.uleb128 0x44
 4850 1b91 03       		.uleb128 0x3
 4851 1b92 B0050000 		.4byte	.LASF418
 4852 1b96 09       		.byte	0x9
 4853 1b97 4A       		.byte	0x4a
 4854 1b98 FF000000 		.4byte	0xff
 4855 1b9c 02       		.byte	0x2
 4856 1b9d 23       		.byte	0x23
 4857 1b9e 48       		.uleb128 0x48
 4858 1b9f 03       		.uleb128 0x3
 4859 1ba0 2C090000 		.4byte	.LASF419
 4860 1ba4 09       		.byte	0x9
 4861 1ba5 4B       		.byte	0x4b
 4862 1ba6 FF000000 		.4byte	0xff
 4863 1baa 02       		.byte	0x2
 4864 1bab 23       		.byte	0x23
 4865 1bac 4C       		.uleb128 0x4c
 4866 1bad 03       		.uleb128 0x3
 4867 1bae F5000000 		.4byte	.LASF420
 4868 1bb2 09       		.byte	0x9
 4869 1bb3 4C       		.byte	0x4c
 4870 1bb4 A41C0000 		.4byte	0x1ca4
 4871 1bb8 02       		.byte	0x2
 4872 1bb9 23       		.byte	0x23
 4873 1bba 50       		.uleb128 0x50
 4874 1bbb 03       		.uleb128 0x3
 4875 1bbc BE110000 		.4byte	.LASF421
 4876 1bc0 09       		.byte	0x9
 4877 1bc1 4D       		.byte	0x4d
 4878 1bc2 FF000000 		.4byte	0xff
 4879 1bc6 02       		.byte	0x2
 4880 1bc7 23       		.byte	0x23
 4881 1bc8 54       		.uleb128 0x54
 4882 1bc9 03       		.uleb128 0x3
 4883 1bca 21050000 		.4byte	.LASF422
 4884 1bce 09       		.byte	0x9
 4885 1bcf 4E       		.byte	0x4e
ARM GAS  /tmp/ccV38c0o.s 			page 96


 4886 1bd0 FF000000 		.4byte	0xff
 4887 1bd4 02       		.byte	0x2
 4888 1bd5 23       		.byte	0x23
 4889 1bd6 58       		.uleb128 0x58
 4890 1bd7 03       		.uleb128 0x3
 4891 1bd8 E9000000 		.4byte	.LASF423
 4892 1bdc 09       		.byte	0x9
 4893 1bdd 50       		.byte	0x50
 4894 1bde DE000000 		.4byte	0xde
 4895 1be2 02       		.byte	0x2
 4896 1be3 23       		.byte	0x23
 4897 1be4 5C       		.uleb128 0x5c
 4898 1be5 03       		.uleb128 0x3
 4899 1be6 B80E0000 		.4byte	.LASF424
 4900 1bea 09       		.byte	0x9
 4901 1beb 51       		.byte	0x51
 4902 1bec DE000000 		.4byte	0xde
 4903 1bf0 02       		.byte	0x2
 4904 1bf1 23       		.byte	0x23
 4905 1bf2 5D       		.uleb128 0x5d
 4906 1bf3 03       		.uleb128 0x3
 4907 1bf4 EF000000 		.4byte	.LASF425
 4908 1bf8 09       		.byte	0x9
 4909 1bf9 52       		.byte	0x52
 4910 1bfa DE000000 		.4byte	0xde
 4911 1bfe 02       		.byte	0x2
 4912 1bff 23       		.byte	0x23
 4913 1c00 5E       		.uleb128 0x5e
 4914 1c01 03       		.uleb128 0x3
 4915 1c02 99000000 		.4byte	.LASF426
 4916 1c06 09       		.byte	0x9
 4917 1c07 53       		.byte	0x53
 4918 1c08 DE000000 		.4byte	0xde
 4919 1c0c 02       		.byte	0x2
 4920 1c0d 23       		.byte	0x23
 4921 1c0e 5F       		.uleb128 0x5f
 4922 1c0f 03       		.uleb128 0x3
 4923 1c10 F80A0000 		.4byte	.LASF427
 4924 1c14 09       		.byte	0x9
 4925 1c15 54       		.byte	0x54
 4926 1c16 DE000000 		.4byte	0xde
 4927 1c1a 02       		.byte	0x2
 4928 1c1b 23       		.byte	0x23
 4929 1c1c 60       		.uleb128 0x60
 4930 1c1d 03       		.uleb128 0x3
 4931 1c1e E0110000 		.4byte	.LASF428
 4932 1c22 09       		.byte	0x9
 4933 1c23 55       		.byte	0x55
 4934 1c24 DE000000 		.4byte	0xde
 4935 1c28 02       		.byte	0x2
 4936 1c29 23       		.byte	0x23
 4937 1c2a 61       		.uleb128 0x61
 4938 1c2b 03       		.uleb128 0x3
 4939 1c2c 230B0000 		.4byte	.LASF429
 4940 1c30 09       		.byte	0x9
 4941 1c31 56       		.byte	0x56
 4942 1c32 DE000000 		.4byte	0xde
ARM GAS  /tmp/ccV38c0o.s 			page 97


 4943 1c36 02       		.byte	0x2
 4944 1c37 23       		.byte	0x23
 4945 1c38 62       		.uleb128 0x62
 4946 1c39 03       		.uleb128 0x3
 4947 1c3a 62080000 		.4byte	.LASF430
 4948 1c3e 09       		.byte	0x9
 4949 1c3f 57       		.byte	0x57
 4950 1c40 DE000000 		.4byte	0xde
 4951 1c44 02       		.byte	0x2
 4952 1c45 23       		.byte	0x23
 4953 1c46 63       		.uleb128 0x63
 4954 1c47 03       		.uleb128 0x3
 4955 1c48 FE0C0000 		.4byte	.LASF431
 4956 1c4c 09       		.byte	0x9
 4957 1c4d 58       		.byte	0x58
 4958 1c4e DE000000 		.4byte	0xde
 4959 1c52 02       		.byte	0x2
 4960 1c53 23       		.byte	0x23
 4961 1c54 64       		.uleb128 0x64
 4962 1c55 03       		.uleb128 0x3
 4963 1c56 B7050000 		.4byte	.LASF432
 4964 1c5a 09       		.byte	0x9
 4965 1c5b 59       		.byte	0x59
 4966 1c5c DE000000 		.4byte	0xde
 4967 1c60 02       		.byte	0x2
 4968 1c61 23       		.byte	0x23
 4969 1c62 65       		.uleb128 0x65
 4970 1c63 03       		.uleb128 0x3
 4971 1c64 F4020000 		.4byte	.LASF433
 4972 1c68 09       		.byte	0x9
 4973 1c69 5A       		.byte	0x5a
 4974 1c6a D3000000 		.4byte	0xd3
 4975 1c6e 02       		.byte	0x2
 4976 1c6f 23       		.byte	0x23
 4977 1c70 66       		.uleb128 0x66
 4978 1c71 03       		.uleb128 0x3
 4979 1c72 18140000 		.4byte	.LASF434
 4980 1c76 09       		.byte	0x9
 4981 1c77 5C       		.byte	0x5c
 4982 1c78 AA1C0000 		.4byte	0x1caa
 4983 1c7c 02       		.byte	0x2
 4984 1c7d 23       		.byte	0x23
 4985 1c7e 68       		.uleb128 0x68
 4986 1c7f 03       		.uleb128 0x3
 4987 1c80 BC100000 		.4byte	.LASF435
 4988 1c84 09       		.byte	0x9
 4989 1c85 5D       		.byte	0x5d
 4990 1c86 BA1C0000 		.4byte	0x1cba
 4991 1c8a 03       		.byte	0x3
 4992 1c8b 23       		.byte	0x23
 4993 1c8c EC04     		.uleb128 0x26c
 4994 1c8e 03       		.uleb128 0x3
 4995 1c8f D90A0000 		.4byte	.LASF436
 4996 1c93 09       		.byte	0x9
 4997 1c94 5E       		.byte	0x5e
 4998 1c95 AA1C0000 		.4byte	0x1caa
 4999 1c99 03       		.byte	0x3
ARM GAS  /tmp/ccV38c0o.s 			page 98


 5000 1c9a 23       		.byte	0x23
 5001 1c9b F008     		.uleb128 0x470
 5002 1c9d 00       		.byte	0x0
 5003 1c9e 09       		.uleb128 0x9
 5004 1c9f 04       		.byte	0x4
 5005 1ca0 E9000000 		.4byte	0xe9
 5006 1ca4 09       		.uleb128 0x9
 5007 1ca5 04       		.byte	0x4
 5008 1ca6 CF110000 		.4byte	0x11cf
 5009 1caa 07       		.uleb128 0x7
 5010 1cab BA1C0000 		.4byte	0x1cba
 5011 1caf 86000000 		.4byte	0x86
 5012 1cb3 08       		.uleb128 0x8
 5013 1cb4 B2000000 		.4byte	0xb2
 5014 1cb8 80       		.byte	0x80
 5015 1cb9 00       		.byte	0x0
 5016 1cba 07       		.uleb128 0x7
 5017 1cbb CA1C0000 		.4byte	0x1cca
 5018 1cbf FF000000 		.4byte	0xff
 5019 1cc3 08       		.uleb128 0x8
 5020 1cc4 B2000000 		.4byte	0xb2
 5021 1cc8 80       		.byte	0x80
 5022 1cc9 00       		.byte	0x0
 5023 1cca 02       		.uleb128 0x2
 5024 1ccb 7F1D0000 		.4byte	0x1d7f
 5025 1ccf 53424700 		.ascii	"SBG\000"
 5026 1cd3 30       		.byte	0x30
 5027 1cd4 09       		.byte	0x9
 5028 1cd5 74       		.byte	0x74
 5029 1cd6 03       		.uleb128 0x3
 5030 1cd7 1F0C0000 		.4byte	.LASF437
 5031 1cdb 09       		.byte	0x9
 5032 1cdc 75       		.byte	0x75
 5033 1cdd FF000000 		.4byte	0xff
 5034 1ce1 02       		.byte	0x2
 5035 1ce2 23       		.byte	0x23
 5036 1ce3 00       		.uleb128 0x0
 5037 1ce4 03       		.uleb128 0x3
 5038 1ce5 7F110000 		.4byte	.LASF438
 5039 1ce9 09       		.byte	0x9
 5040 1cea 76       		.byte	0x76
 5041 1ceb FF000000 		.4byte	0xff
 5042 1cef 02       		.byte	0x2
 5043 1cf0 23       		.byte	0x23
 5044 1cf1 04       		.uleb128 0x4
 5045 1cf2 03       		.uleb128 0x3
 5046 1cf3 2D020000 		.4byte	.LASF439
 5047 1cf7 09       		.byte	0x9
 5048 1cf8 77       		.byte	0x77
 5049 1cf9 FF000000 		.4byte	0xff
 5050 1cfd 02       		.byte	0x2
 5051 1cfe 23       		.byte	0x23
 5052 1cff 08       		.uleb128 0x8
 5053 1d00 03       		.uleb128 0x3
 5054 1d01 580C0000 		.4byte	.LASF440
 5055 1d05 09       		.byte	0x9
 5056 1d06 78       		.byte	0x78
ARM GAS  /tmp/ccV38c0o.s 			page 99


 5057 1d07 FF000000 		.4byte	0xff
 5058 1d0b 02       		.byte	0x2
 5059 1d0c 23       		.byte	0x23
 5060 1d0d 0C       		.uleb128 0xc
 5061 1d0e 03       		.uleb128 0x3
 5062 1d0f 94100000 		.4byte	.LASF441
 5063 1d13 09       		.byte	0x9
 5064 1d14 79       		.byte	0x79
 5065 1d15 FF000000 		.4byte	0xff
 5066 1d19 02       		.byte	0x2
 5067 1d1a 23       		.byte	0x23
 5068 1d1b 10       		.uleb128 0x10
 5069 1d1c 03       		.uleb128 0x3
 5070 1d1d 8E0E0000 		.4byte	.LASF328
 5071 1d21 09       		.byte	0x9
 5072 1d22 7A       		.byte	0x7a
 5073 1d23 FF000000 		.4byte	0xff
 5074 1d27 02       		.byte	0x2
 5075 1d28 23       		.byte	0x23
 5076 1d29 14       		.uleb128 0x14
 5077 1d2a 03       		.uleb128 0x3
 5078 1d2b EB060000 		.4byte	.LASF442
 5079 1d2f 09       		.byte	0x9
 5080 1d30 7C       		.byte	0x7c
 5081 1d31 FF000000 		.4byte	0xff
 5082 1d35 02       		.byte	0x2
 5083 1d36 23       		.byte	0x23
 5084 1d37 18       		.uleb128 0x18
 5085 1d38 03       		.uleb128 0x3
 5086 1d39 DE160000 		.4byte	.LASF415
 5087 1d3d 09       		.byte	0x9
 5088 1d3e 7D       		.byte	0x7d
 5089 1d3f FF000000 		.4byte	0xff
 5090 1d43 02       		.byte	0x2
 5091 1d44 23       		.byte	0x23
 5092 1d45 1C       		.uleb128 0x1c
 5093 1d46 03       		.uleb128 0x3
 5094 1d47 AE020000 		.4byte	.LASF414
 5095 1d4b 09       		.byte	0x9
 5096 1d4c 7E       		.byte	0x7e
 5097 1d4d FF000000 		.4byte	0xff
 5098 1d51 02       		.byte	0x2
 5099 1d52 23       		.byte	0x23
 5100 1d53 20       		.uleb128 0x20
 5101 1d54 03       		.uleb128 0x3
 5102 1d55 B10A0000 		.4byte	.LASF443
 5103 1d59 09       		.byte	0x9
 5104 1d5a 80       		.byte	0x80
 5105 1d5b 4D040000 		.4byte	0x44d
 5106 1d5f 02       		.byte	0x2
 5107 1d60 23       		.byte	0x23
 5108 1d61 24       		.uleb128 0x24
 5109 1d62 03       		.uleb128 0x3
 5110 1d63 21010000 		.4byte	.LASF444
 5111 1d67 09       		.byte	0x9
 5112 1d68 81       		.byte	0x81
 5113 1d69 4D040000 		.4byte	0x44d
ARM GAS  /tmp/ccV38c0o.s 			page 100


 5114 1d6d 02       		.byte	0x2
 5115 1d6e 23       		.byte	0x23
 5116 1d6f 28       		.uleb128 0x28
 5117 1d70 03       		.uleb128 0x3
 5118 1d71 33050000 		.4byte	.LASF445
 5119 1d75 09       		.byte	0x9
 5120 1d76 82       		.byte	0x82
 5121 1d77 D3000000 		.4byte	0xd3
 5122 1d7b 02       		.byte	0x2
 5123 1d7c 23       		.byte	0x23
 5124 1d7d 2C       		.uleb128 0x2c
 5125 1d7e 00       		.byte	0x0
 5126 1d7f 0E       		.uleb128 0xe
 5127 1d80 9A1D0000 		.4byte	0x1d9a
 5128 1d84 310B0000 		.4byte	.LASF446
 5129 1d88 04       		.byte	0x4
 5130 1d89 0A       		.byte	0xa
 5131 1d8a 33       		.byte	0x33
 5132 1d8b 03       		.uleb128 0x3
 5133 1d8c C30F0000 		.4byte	.LASF447
 5134 1d90 0A       		.byte	0xa
 5135 1d91 37       		.byte	0x37
 5136 1d92 9B1D0000 		.4byte	0x1d9b
 5137 1d96 02       		.byte	0x2
 5138 1d97 23       		.byte	0x23
 5139 1d98 00       		.uleb128 0x0
 5140 1d99 00       		.byte	0x0
 5141 1d9a 1D       		.uleb128 0x1d
 5142 1d9b 09       		.uleb128 0x9
 5143 1d9c 04       		.byte	0x4
 5144 1d9d 9A1D0000 		.4byte	0x1d9a
 5145 1da1 0E       		.uleb128 0xe
 5146 1da2 561E0000 		.4byte	0x1e56
 5147 1da6 DA110000 		.4byte	.LASF448
 5148 1daa 24       		.byte	0x24
 5149 1dab 0A       		.byte	0xa
 5150 1dac 3C       		.byte	0x3c
 5151 1dad 03       		.uleb128 0x3
 5152 1dae FE140000 		.4byte	.LASF258
 5153 1db2 0A       		.byte	0xa
 5154 1db3 3D       		.byte	0x3d
 5155 1db4 4D040000 		.4byte	0x44d
 5156 1db8 02       		.byte	0x2
 5157 1db9 23       		.byte	0x23
 5158 1dba 00       		.uleb128 0x0
 5159 1dbb 03       		.uleb128 0x3
 5160 1dbc 280C0000 		.4byte	.LASF449
 5161 1dc0 0A       		.byte	0xa
 5162 1dc1 3E       		.byte	0x3e
 5163 1dc2 561E0000 		.4byte	0x1e56
 5164 1dc6 02       		.byte	0x2
 5165 1dc7 23       		.byte	0x23
 5166 1dc8 04       		.uleb128 0x4
 5167 1dc9 03       		.uleb128 0x3
 5168 1dca EB050000 		.4byte	.LASF450
 5169 1dce 0A       		.byte	0xa
 5170 1dcf 3F       		.byte	0x3f
ARM GAS  /tmp/ccV38c0o.s 			page 101


 5171 1dd0 DE000000 		.4byte	0xde
 5172 1dd4 02       		.byte	0x2
 5173 1dd5 23       		.byte	0x23
 5174 1dd6 08       		.uleb128 0x8
 5175 1dd7 03       		.uleb128 0x3
 5176 1dd8 A1000000 		.4byte	.LASF451
 5177 1ddc 0A       		.byte	0xa
 5178 1ddd 40       		.byte	0x40
 5179 1dde DE000000 		.4byte	0xde
 5180 1de2 02       		.byte	0x2
 5181 1de3 23       		.byte	0x23
 5182 1de4 09       		.uleb128 0x9
 5183 1de5 03       		.uleb128 0x3
 5184 1de6 370A0000 		.4byte	.LASF452
 5185 1dea 0A       		.byte	0xa
 5186 1deb 41       		.byte	0x41
 5187 1dec DE000000 		.4byte	0xde
 5188 1df0 02       		.byte	0x2
 5189 1df1 23       		.byte	0x23
 5190 1df2 0A       		.uleb128 0xa
 5191 1df3 03       		.uleb128 0x3
 5192 1df4 9A140000 		.4byte	.LASF453
 5193 1df8 0A       		.byte	0xa
 5194 1df9 42       		.byte	0x42
 5195 1dfa DE000000 		.4byte	0xde
 5196 1dfe 02       		.byte	0x2
 5197 1dff 23       		.byte	0x23
 5198 1e00 0B       		.uleb128 0xb
 5199 1e01 03       		.uleb128 0x3
 5200 1e02 96120000 		.4byte	.LASF454
 5201 1e06 0A       		.byte	0xa
 5202 1e07 43       		.byte	0x43
 5203 1e08 D3000000 		.4byte	0xd3
 5204 1e0c 02       		.byte	0x2
 5205 1e0d 23       		.byte	0x23
 5206 1e0e 0C       		.uleb128 0xc
 5207 1e0f 03       		.uleb128 0x3
 5208 1e10 F1030000 		.4byte	.LASF455
 5209 1e14 0A       		.byte	0xa
 5210 1e15 44       		.byte	0x44
 5211 1e16 FF000000 		.4byte	0xff
 5212 1e1a 02       		.byte	0x2
 5213 1e1b 23       		.byte	0x23
 5214 1e1c 10       		.uleb128 0x10
 5215 1e1d 03       		.uleb128 0x3
 5216 1e1e A8040000 		.4byte	.LASF456
 5217 1e22 0A       		.byte	0xa
 5218 1e23 45       		.byte	0x45
 5219 1e24 FF000000 		.4byte	0xff
 5220 1e28 02       		.byte	0x2
 5221 1e29 23       		.byte	0x23
 5222 1e2a 14       		.uleb128 0x14
 5223 1e2b 03       		.uleb128 0x3
 5224 1e2c 0F180000 		.4byte	.LASF457
 5225 1e30 0A       		.byte	0xa
 5226 1e31 46       		.byte	0x46
 5227 1e32 FF000000 		.4byte	0xff
ARM GAS  /tmp/ccV38c0o.s 			page 102


 5228 1e36 02       		.byte	0x2
 5229 1e37 23       		.byte	0x23
 5230 1e38 18       		.uleb128 0x18
 5231 1e39 03       		.uleb128 0x3
 5232 1e3a BA070000 		.4byte	.LASF458
 5233 1e3e 0A       		.byte	0xa
 5234 1e3f 47       		.byte	0x47
 5235 1e40 FF000000 		.4byte	0xff
 5236 1e44 02       		.byte	0x2
 5237 1e45 23       		.byte	0x23
 5238 1e46 1C       		.uleb128 0x1c
 5239 1e47 03       		.uleb128 0x3
 5240 1e48 010F0000 		.4byte	.LASF459
 5241 1e4c 0A       		.byte	0xa
 5242 1e4d 48       		.byte	0x48
 5243 1e4e FF000000 		.4byte	0xff
 5244 1e52 02       		.byte	0x2
 5245 1e53 23       		.byte	0x23
 5246 1e54 20       		.uleb128 0x20
 5247 1e55 00       		.byte	0x0
 5248 1e56 09       		.uleb128 0x9
 5249 1e57 04       		.byte	0x4
 5250 1e58 7F1D0000 		.4byte	0x1d7f
 5251 1e5c 1E       		.uleb128 0x1e
 5252 1e5d EA1E0000 		.4byte	0x1eea
 5253 1e61 01       		.byte	0x1
 5254 1e62 58180000 		.4byte	.LASF460
 5255 1e66 01       		.byte	0x1
 5256 1e67 0701     		.2byte	0x107
 5257 1e69 8F030000 		.4byte	.LASF469
 5258 1e6d 00000000 		.4byte	.LFB26
 5259 1e71 C4030000 		.4byte	.LFE26
 5260 1e75 00000000 		.4byte	.LLST0
 5261 1e79 1F       		.uleb128 0x1f
 5262 1e7a 51170000 		.4byte	.LASF461
 5263 1e7e 01       		.byte	0x1
 5264 1e7f 0701     		.2byte	0x107
 5265 1e81 FF000000 		.4byte	0xff
 5266 1e85 2B000000 		.4byte	.LLST1
 5267 1e89 1F       		.uleb128 0x1f
 5268 1e8a 0E0A0000 		.4byte	.LASF462
 5269 1e8e 01       		.byte	0x1
 5270 1e8f 0701     		.2byte	0x107
 5271 1e91 FF000000 		.4byte	0xff
 5272 1e95 6A000000 		.4byte	.LLST2
 5273 1e99 1F       		.uleb128 0x1f
 5274 1e9a 43150000 		.4byte	.LASF463
 5275 1e9e 01       		.byte	0x1
 5276 1e9f 0701     		.2byte	0x107
 5277 1ea1 FF000000 		.4byte	0xff
 5278 1ea5 B4000000 		.4byte	.LLST3
 5279 1ea9 1F       		.uleb128 0x1f
 5280 1eaa E0010000 		.4byte	.LASF464
 5281 1eae 01       		.byte	0x1
 5282 1eaf 0701     		.2byte	0x107
 5283 1eb1 FF000000 		.4byte	0xff
 5284 1eb5 D3000000 		.4byte	.LLST4
ARM GAS  /tmp/ccV38c0o.s 			page 103


 5285 1eb9 20       		.uleb128 0x20
 5286 1eba BA060000 		.4byte	.LASF465
 5287 1ebe 01       		.byte	0x1
 5288 1ebf 0901     		.2byte	0x109
 5289 1ec1 4D040000 		.4byte	0x44d
 5290 1ec5 F1000000 		.4byte	.LLST5
 5291 1ec9 20       		.uleb128 0x20
 5292 1eca C5130000 		.4byte	.LASF466
 5293 1ece 01       		.byte	0x1
 5294 1ecf 0901     		.2byte	0x109
 5295 1ed1 FF000000 		.4byte	0xff
 5296 1ed5 1A010000 		.4byte	.LLST6
 5297 1ed9 20       		.uleb128 0x20
 5298 1eda 00120000 		.4byte	.LASF467
 5299 1ede 01       		.byte	0x1
 5300 1edf 0901     		.2byte	0x109
 5301 1ee1 FF000000 		.4byte	0xff
 5302 1ee5 43010000 		.4byte	.LLST7
 5303 1ee9 00       		.byte	0x0
 5304 1eea 1E       		.uleb128 0x1e
 5305 1eeb 981F0000 		.4byte	0x1f98
 5306 1eef 01       		.byte	0x1
 5307 1ef0 660B0000 		.4byte	.LASF468
 5308 1ef4 01       		.byte	0x1
 5309 1ef5 7801     		.2byte	0x178
 5310 1ef7 6F0C0000 		.4byte	.LASF470
 5311 1efb E0030000 		.4byte	.LFB27
 5312 1eff F0070000 		.4byte	.LFE27
 5313 1f03 6C010000 		.4byte	.LLST8
 5314 1f07 1F       		.uleb128 0x1f
 5315 1f08 51170000 		.4byte	.LASF461
 5316 1f0c 01       		.byte	0x1
 5317 1f0d 7801     		.2byte	0x178
 5318 1f0f FF000000 		.4byte	0xff
 5319 1f13 97010000 		.4byte	.LLST9
 5320 1f17 1F       		.uleb128 0x1f
 5321 1f18 0E0A0000 		.4byte	.LASF462
 5322 1f1c 01       		.byte	0x1
 5323 1f1d 7801     		.2byte	0x178
 5324 1f1f FF000000 		.4byte	0xff
 5325 1f23 E1010000 		.4byte	.LLST10
 5326 1f27 1F       		.uleb128 0x1f
 5327 1f28 7D0D0000 		.4byte	.LASF471
 5328 1f2c 01       		.byte	0x1
 5329 1f2d 7801     		.2byte	0x178
 5330 1f2f FF000000 		.4byte	0xff
 5331 1f33 38020000 		.4byte	.LLST11
 5332 1f37 1F       		.uleb128 0x1f
 5333 1f38 4B170000 		.4byte	.LASF472
 5334 1f3c 01       		.byte	0x1
 5335 1f3d 7801     		.2byte	0x178
 5336 1f3f FF000000 		.4byte	0xff
 5337 1f43 82020000 		.4byte	.LLST12
 5338 1f47 1F       		.uleb128 0x1f
 5339 1f48 43150000 		.4byte	.LASF463
 5340 1f4c 01       		.byte	0x1
 5341 1f4d 7801     		.2byte	0x178
ARM GAS  /tmp/ccV38c0o.s 			page 104


 5342 1f4f FF000000 		.4byte	0xff
 5343 1f53 A0020000 		.4byte	.LLST13
 5344 1f57 1F       		.uleb128 0x1f
 5345 1f58 E0010000 		.4byte	.LASF464
 5346 1f5c 01       		.byte	0x1
 5347 1f5d 7801     		.2byte	0x178
 5348 1f5f FF000000 		.4byte	0xff
 5349 1f63 E4020000 		.4byte	.LLST14
 5350 1f67 20       		.uleb128 0x20
 5351 1f68 BA060000 		.4byte	.LASF465
 5352 1f6c 01       		.byte	0x1
 5353 1f6d 7C01     		.2byte	0x17c
 5354 1f6f 4D040000 		.4byte	0x44d
 5355 1f73 03030000 		.4byte	.LLST15
 5356 1f77 20       		.uleb128 0x20
 5357 1f78 C5130000 		.4byte	.LASF466
 5358 1f7c 01       		.byte	0x1
 5359 1f7d 7C01     		.2byte	0x17c
 5360 1f7f FF000000 		.4byte	0xff
 5361 1f83 2C030000 		.4byte	.LLST16
 5362 1f87 20       		.uleb128 0x20
 5363 1f88 00120000 		.4byte	.LASF467
 5364 1f8c 01       		.byte	0x1
 5365 1f8d 7C01     		.2byte	0x17c
 5366 1f8f FF000000 		.4byte	0xff
 5367 1f93 60030000 		.4byte	.LLST17
 5368 1f97 00       		.byte	0x0
 5369 1f98 07       		.uleb128 0x7
 5370 1f99 A91F0000 		.4byte	0x1fa9
 5371 1f9d 25000000 		.4byte	0x25
 5372 1fa1 1A       		.uleb128 0x1a
 5373 1fa2 B2000000 		.4byte	0xb2
 5374 1fa6 FFFF     		.2byte	0xffff
 5375 1fa8 00       		.byte	0x0
 5376 1fa9 21       		.uleb128 0x21
 5377 1faa A1200000 		.4byte	0x20a1
 5378 1fae 3A3A00   		.ascii	"::\000"
 5379 1fb1 03       		.byte	0x3
 5380 1fb2 00       		.byte	0x0
 5381 1fb3 22       		.uleb128 0x22
 5382 1fb4 10160000 		.4byte	.LASF473
 5383 1fb8 04       		.byte	0x4
 5384 1fb9 83       		.byte	0x83
 5385 1fba 981F0000 		.4byte	0x1f98
 5386 1fbe 01       		.byte	0x1
 5387 1fbf 01       		.byte	0x1
 5388 1fc0 22       		.uleb128 0x22
 5389 1fc1 8E0C0000 		.4byte	.LASF474
 5390 1fc5 04       		.byte	0x4
 5391 1fc6 84       		.byte	0x84
 5392 1fc7 63000000 		.4byte	0x63
 5393 1fcb 01       		.byte	0x1
 5394 1fcc 01       		.byte	0x1
 5395 1fcd 23       		.uleb128 0x23
 5396 1fce 79020000 		.4byte	.LASF475
 5397 1fd2 05       		.byte	0x5
 5398 1fd3 A001     		.2byte	0x1a0
ARM GAS  /tmp/ccV38c0o.s 			page 105


 5399 1fd5 6E040000 		.4byte	0x46e
 5400 1fd9 01       		.byte	0x1
 5401 1fda 01       		.byte	0x1
 5402 1fdb 24       		.uleb128 0x24
 5403 1fdc 43505500 		.ascii	"CPU\000"
 5404 1fe0 05       		.byte	0x5
 5405 1fe1 A101     		.2byte	0x1a1
 5406 1fe3 E0010000 		.4byte	0x1e0
 5407 1fe7 01       		.byte	0x1
 5408 1fe8 01       		.byte	0x1
 5409 1fe9 22       		.uleb128 0x22
 5410 1fea 4D150000 		.4byte	.LASF476
 5411 1fee 07       		.byte	0x7
 5412 1fef B9       		.byte	0xb9
 5413 1ff0 D60A0000 		.4byte	0xad6
 5414 1ff4 01       		.byte	0x1
 5415 1ff5 01       		.byte	0x1
 5416 1ff6 22       		.uleb128 0x22
 5417 1ff7 F1100000 		.4byte	.LASF477
 5418 1ffb 08       		.byte	0x8
 5419 1ffc 31       		.byte	0x31
 5420 1ffd DE000000 		.4byte	0xde
 5421 2001 01       		.byte	0x1
 5422 2002 01       		.byte	0x1
 5423 2003 22       		.uleb128 0x22
 5424 2004 88110000 		.4byte	.LASF478
 5425 2008 08       		.byte	0x8
 5426 2009 32       		.byte	0x32
 5427 200a F1200000 		.4byte	0x20f1
 5428 200e 01       		.byte	0x1
 5429 200f 01       		.byte	0x1
 5430 2010 24       		.uleb128 0x24
 5431 2011 50505500 		.ascii	"PPU\000"
 5432 2015 08       		.byte	0x8
 5433 2016 0901     		.2byte	0x109
 5434 2018 F1140000 		.4byte	0x14f1
 5435 201c 01       		.byte	0x1
 5436 201d 01       		.byte	0x1
 5437 201e 23       		.uleb128 0x23
 5438 201f 3D110000 		.4byte	.LASF479
 5439 2023 08       		.byte	0x8
 5440 2024 0B01     		.2byte	0x10b
 5441 2026 2E120000 		.4byte	0x122e
 5442 202a 01       		.byte	0x1
 5443 202b 01       		.byte	0x1
 5444 202c 25       		.uleb128 0x25
 5445 202d 424700   		.ascii	"BG\000"
 5446 2030 09       		.byte	0x9
 5447 2031 93       		.byte	0x93
 5448 2032 CA1C0000 		.4byte	0x1cca
 5449 2036 01       		.byte	0x1
 5450 2037 01       		.byte	0x1
 5451 2038 25       		.uleb128 0x25
 5452 2039 47465800 		.ascii	"GFX\000"
 5453 203d 09       		.byte	0x9
 5454 203e FF       		.byte	0xff
 5455 203f 801A0000 		.4byte	0x1a80
ARM GAS  /tmp/ccV38c0o.s 			page 106


 5456 2043 01       		.byte	0x1
 5457 2044 01       		.byte	0x1
 5458 2045 22       		.uleb128 0x22
 5459 2046 A4150000 		.4byte	.LASF480
 5460 204a 0A       		.byte	0xa
 5461 204b 52       		.byte	0x52
 5462 204c 43210000 		.4byte	0x2143
 5463 2050 01       		.byte	0x1
 5464 2051 01       		.byte	0x1
 5465 2052 22       		.uleb128 0x22
 5466 2053 95150000 		.4byte	.LASF481
 5467 2057 0A       		.byte	0xa
 5468 2058 53       		.byte	0x53
 5469 2059 43210000 		.4byte	0x2143
 5470 205d 01       		.byte	0x1
 5471 205e 01       		.byte	0x1
 5472 205f 22       		.uleb128 0x22
 5473 2060 410A0000 		.4byte	.LASF482
 5474 2064 0A       		.byte	0xa
 5475 2065 54       		.byte	0x54
 5476 2066 43210000 		.4byte	0x2143
 5477 206a 01       		.byte	0x1
 5478 206b 01       		.byte	0x1
 5479 206c 22       		.uleb128 0x22
 5480 206d 59120000 		.4byte	.LASF483
 5481 2071 0A       		.byte	0xa
 5482 2072 55       		.byte	0x55
 5483 2073 43210000 		.4byte	0x2143
 5484 2077 01       		.byte	0x1
 5485 2078 01       		.byte	0x1
 5486 2079 22       		.uleb128 0x22
 5487 207a 33040000 		.4byte	.LASF484
 5488 207e 0A       		.byte	0xa
 5489 207f 5F       		.byte	0x5f
 5490 2080 A11D0000 		.4byte	0x1da1
 5491 2084 01       		.byte	0x1
 5492 2085 01       		.byte	0x1
 5493 2086 22       		.uleb128 0x22
 5494 2087 9D0A0000 		.4byte	.LASF485
 5495 208b 0B       		.byte	0xb
 5496 208c 2F       		.byte	0x2f
 5497 208d A8210000 		.4byte	0x21a8
 5498 2091 01       		.byte	0x1
 5499 2092 01       		.byte	0x1
 5500 2093 22       		.uleb128 0x22
 5501 2094 C5020000 		.4byte	.LASF486
 5502 2098 0B       		.byte	0xb
 5503 2099 31       		.byte	0x31
 5504 209a FF000000 		.4byte	0xff
 5505 209e 01       		.byte	0x1
 5506 209f 01       		.byte	0x1
 5507 20a0 00       		.byte	0x0
 5508 20a1 22       		.uleb128 0x22
 5509 20a2 10160000 		.4byte	.LASF473
 5510 20a6 04       		.byte	0x4
 5511 20a7 83       		.byte	0x83
 5512 20a8 981F0000 		.4byte	0x1f98
ARM GAS  /tmp/ccV38c0o.s 			page 107


 5513 20ac 01       		.byte	0x1
 5514 20ad 01       		.byte	0x1
 5515 20ae 22       		.uleb128 0x22
 5516 20af 8E0C0000 		.4byte	.LASF474
 5517 20b3 04       		.byte	0x4
 5518 20b4 84       		.byte	0x84
 5519 20b5 63000000 		.4byte	0x63
 5520 20b9 01       		.byte	0x1
 5521 20ba 01       		.byte	0x1
 5522 20bb 23       		.uleb128 0x23
 5523 20bc 79020000 		.4byte	.LASF475
 5524 20c0 05       		.byte	0x5
 5525 20c1 A001     		.2byte	0x1a0
 5526 20c3 6E040000 		.4byte	0x46e
 5527 20c7 01       		.byte	0x1
 5528 20c8 01       		.byte	0x1
 5529 20c9 24       		.uleb128 0x24
 5530 20ca 43505500 		.ascii	"CPU\000"
 5531 20ce 05       		.byte	0x5
 5532 20cf A101     		.2byte	0x1a1
 5533 20d1 E0010000 		.4byte	0x1e0
 5534 20d5 01       		.byte	0x1
 5535 20d6 01       		.byte	0x1
 5536 20d7 22       		.uleb128 0x22
 5537 20d8 4D150000 		.4byte	.LASF476
 5538 20dc 07       		.byte	0x7
 5539 20dd B9       		.byte	0xb9
 5540 20de D60A0000 		.4byte	0xad6
 5541 20e2 01       		.byte	0x1
 5542 20e3 01       		.byte	0x1
 5543 20e4 22       		.uleb128 0x22
 5544 20e5 F1100000 		.4byte	.LASF477
 5545 20e9 08       		.byte	0x8
 5546 20ea 31       		.byte	0x31
 5547 20eb DE000000 		.4byte	0xde
 5548 20ef 01       		.byte	0x1
 5549 20f0 01       		.byte	0x1
 5550 20f1 07       		.uleb128 0x7
 5551 20f2 01210000 		.4byte	0x2101
 5552 20f6 E9000000 		.4byte	0xe9
 5553 20fa 08       		.uleb128 0x8
 5554 20fb B2000000 		.4byte	0xb2
 5555 20ff 01       		.byte	0x1
 5556 2100 00       		.byte	0x0
 5557 2101 22       		.uleb128 0x22
 5558 2102 88110000 		.4byte	.LASF478
 5559 2106 08       		.byte	0x8
 5560 2107 32       		.byte	0x32
 5561 2108 F1200000 		.4byte	0x20f1
 5562 210c 01       		.byte	0x1
 5563 210d 01       		.byte	0x1
 5564 210e 24       		.uleb128 0x24
 5565 210f 50505500 		.ascii	"PPU\000"
 5566 2113 08       		.byte	0x8
 5567 2114 0901     		.2byte	0x109
 5568 2116 F1140000 		.4byte	0x14f1
 5569 211a 01       		.byte	0x1
ARM GAS  /tmp/ccV38c0o.s 			page 108


 5570 211b 01       		.byte	0x1
 5571 211c 23       		.uleb128 0x23
 5572 211d 3D110000 		.4byte	.LASF479
 5573 2121 08       		.byte	0x8
 5574 2122 0B01     		.2byte	0x10b
 5575 2124 2E120000 		.4byte	0x122e
 5576 2128 01       		.byte	0x1
 5577 2129 01       		.byte	0x1
 5578 212a 25       		.uleb128 0x25
 5579 212b 424700   		.ascii	"BG\000"
 5580 212e 09       		.byte	0x9
 5581 212f 93       		.byte	0x93
 5582 2130 CA1C0000 		.4byte	0x1cca
 5583 2134 01       		.byte	0x1
 5584 2135 01       		.byte	0x1
 5585 2136 25       		.uleb128 0x25
 5586 2137 47465800 		.ascii	"GFX\000"
 5587 213b 09       		.byte	0x9
 5588 213c FF       		.byte	0xff
 5589 213d 801A0000 		.4byte	0x1a80
 5590 2141 01       		.byte	0x1
 5591 2142 01       		.byte	0x1
 5592 2143 07       		.uleb128 0x7
 5593 2144 53210000 		.4byte	0x2153
 5594 2148 7F1D0000 		.4byte	0x1d7f
 5595 214c 08       		.uleb128 0x8
 5596 214d B2000000 		.4byte	0xb2
 5597 2151 FF       		.byte	0xff
 5598 2152 00       		.byte	0x0
 5599 2153 22       		.uleb128 0x22
 5600 2154 A4150000 		.4byte	.LASF480
 5601 2158 0A       		.byte	0xa
 5602 2159 52       		.byte	0x52
 5603 215a 43210000 		.4byte	0x2143
 5604 215e 01       		.byte	0x1
 5605 215f 01       		.byte	0x1
 5606 2160 22       		.uleb128 0x22
 5607 2161 95150000 		.4byte	.LASF481
 5608 2165 0A       		.byte	0xa
 5609 2166 53       		.byte	0x53
 5610 2167 43210000 		.4byte	0x2143
 5611 216b 01       		.byte	0x1
 5612 216c 01       		.byte	0x1
 5613 216d 22       		.uleb128 0x22
 5614 216e 410A0000 		.4byte	.LASF482
 5615 2172 0A       		.byte	0xa
 5616 2173 54       		.byte	0x54
 5617 2174 43210000 		.4byte	0x2143
 5618 2178 01       		.byte	0x1
 5619 2179 01       		.byte	0x1
 5620 217a 22       		.uleb128 0x22
 5621 217b 59120000 		.4byte	.LASF483
 5622 217f 0A       		.byte	0xa
 5623 2180 55       		.byte	0x55
 5624 2181 43210000 		.4byte	0x2143
 5625 2185 01       		.byte	0x1
 5626 2186 01       		.byte	0x1
ARM GAS  /tmp/ccV38c0o.s 			page 109


 5627 2187 22       		.uleb128 0x22
 5628 2188 33040000 		.4byte	.LASF484
 5629 218c 0A       		.byte	0xa
 5630 218d 5F       		.byte	0x5f
 5631 218e A11D0000 		.4byte	0x1da1
 5632 2192 01       		.byte	0x1
 5633 2193 01       		.byte	0x1
 5634 2194 26       		.uleb128 0x26
 5635 2195 A8210000 		.4byte	0x21a8
 5636 2199 DE000000 		.4byte	0xde
 5637 219d 17       		.uleb128 0x17
 5638 219e 4D040000 		.4byte	0x44d
 5639 21a2 17       		.uleb128 0x17
 5640 21a3 FF000000 		.4byte	0xff
 5641 21a7 00       		.byte	0x0
 5642 21a8 09       		.uleb128 0x9
 5643 21a9 04       		.byte	0x4
 5644 21aa 94210000 		.4byte	0x2194
 5645 21ae 22       		.uleb128 0x22
 5646 21af 9D0A0000 		.4byte	.LASF485
 5647 21b3 0B       		.byte	0xb
 5648 21b4 2F       		.byte	0x2f
 5649 21b5 A8210000 		.4byte	0x21a8
 5650 21b9 01       		.byte	0x1
 5651 21ba 01       		.byte	0x1
 5652 21bb 22       		.uleb128 0x22
 5653 21bc C5020000 		.4byte	.LASF486
 5654 21c0 0B       		.byte	0xb
 5655 21c1 31       		.byte	0x31
 5656 21c2 FF000000 		.4byte	0xff
 5657 21c6 01       		.byte	0x1
 5658 21c7 01       		.byte	0x1
 5659 21c8 00       		.byte	0x0
 5660              		.section	.debug_abbrev
 5661 0000 01       		.uleb128 0x1
 5662 0001 11       		.uleb128 0x11
 5663 0002 01       		.byte	0x1
 5664 0003 10       		.uleb128 0x10
 5665 0004 06       		.uleb128 0x6
 5666 0005 12       		.uleb128 0x12
 5667 0006 01       		.uleb128 0x1
 5668 0007 11       		.uleb128 0x11
 5669 0008 01       		.uleb128 0x1
 5670 0009 25       		.uleb128 0x25
 5671 000a 0E       		.uleb128 0xe
 5672 000b 13       		.uleb128 0x13
 5673 000c 0B       		.uleb128 0xb
 5674 000d 03       		.uleb128 0x3
 5675 000e 0E       		.uleb128 0xe
 5676 000f 1B       		.uleb128 0x1b
 5677 0010 0E       		.uleb128 0xe
 5678 0011 00       		.byte	0x0
 5679 0012 00       		.byte	0x0
 5680 0013 02       		.uleb128 0x2
 5681 0014 13       		.uleb128 0x13
 5682 0015 01       		.byte	0x1
 5683 0016 01       		.uleb128 0x1
ARM GAS  /tmp/ccV38c0o.s 			page 110


 5684 0017 13       		.uleb128 0x13
 5685 0018 03       		.uleb128 0x3
 5686 0019 08       		.uleb128 0x8
 5687 001a 0B       		.uleb128 0xb
 5688 001b 0B       		.uleb128 0xb
 5689 001c 3A       		.uleb128 0x3a
 5690 001d 0B       		.uleb128 0xb
 5691 001e 3B       		.uleb128 0x3b
 5692 001f 0B       		.uleb128 0xb
 5693 0020 00       		.byte	0x0
 5694 0021 00       		.byte	0x0
 5695 0022 03       		.uleb128 0x3
 5696 0023 0D       		.uleb128 0xd
 5697 0024 00       		.byte	0x0
 5698 0025 03       		.uleb128 0x3
 5699 0026 0E       		.uleb128 0xe
 5700 0027 3A       		.uleb128 0x3a
 5701 0028 0B       		.uleb128 0xb
 5702 0029 3B       		.uleb128 0x3b
 5703 002a 0B       		.uleb128 0xb
 5704 002b 49       		.uleb128 0x49
 5705 002c 13       		.uleb128 0x13
 5706 002d 38       		.uleb128 0x38
 5707 002e 0A       		.uleb128 0xa
 5708 002f 00       		.byte	0x0
 5709 0030 00       		.byte	0x0
 5710 0031 04       		.uleb128 0x4
 5711 0032 0D       		.uleb128 0xd
 5712 0033 00       		.byte	0x0
 5713 0034 03       		.uleb128 0x3
 5714 0035 08       		.uleb128 0x8
 5715 0036 3A       		.uleb128 0x3a
 5716 0037 0B       		.uleb128 0xb
 5717 0038 3B       		.uleb128 0x3b
 5718 0039 0B       		.uleb128 0xb
 5719 003a 49       		.uleb128 0x49
 5720 003b 13       		.uleb128 0x13
 5721 003c 38       		.uleb128 0x38
 5722 003d 0A       		.uleb128 0xa
 5723 003e 00       		.byte	0x0
 5724 003f 00       		.byte	0x0
 5725 0040 05       		.uleb128 0x5
 5726 0041 24       		.uleb128 0x24
 5727 0042 00       		.byte	0x0
 5728 0043 03       		.uleb128 0x3
 5729 0044 0E       		.uleb128 0xe
 5730 0045 0B       		.uleb128 0xb
 5731 0046 0B       		.uleb128 0xb
 5732 0047 3E       		.uleb128 0x3e
 5733 0048 0B       		.uleb128 0xb
 5734 0049 00       		.byte	0x0
 5735 004a 00       		.byte	0x0
 5736 004b 06       		.uleb128 0x6
 5737 004c 24       		.uleb128 0x24
 5738 004d 00       		.byte	0x0
 5739 004e 03       		.uleb128 0x3
 5740 004f 08       		.uleb128 0x8
ARM GAS  /tmp/ccV38c0o.s 			page 111


 5741 0050 0B       		.uleb128 0xb
 5742 0051 0B       		.uleb128 0xb
 5743 0052 3E       		.uleb128 0x3e
 5744 0053 0B       		.uleb128 0xb
 5745 0054 00       		.byte	0x0
 5746 0055 00       		.byte	0x0
 5747 0056 07       		.uleb128 0x7
 5748 0057 01       		.uleb128 0x1
 5749 0058 01       		.byte	0x1
 5750 0059 01       		.uleb128 0x1
 5751 005a 13       		.uleb128 0x13
 5752 005b 49       		.uleb128 0x49
 5753 005c 13       		.uleb128 0x13
 5754 005d 00       		.byte	0x0
 5755 005e 00       		.byte	0x0
 5756 005f 08       		.uleb128 0x8
 5757 0060 21       		.uleb128 0x21
 5758 0061 00       		.byte	0x0
 5759 0062 49       		.uleb128 0x49
 5760 0063 13       		.uleb128 0x13
 5761 0064 2F       		.uleb128 0x2f
 5762 0065 0B       		.uleb128 0xb
 5763 0066 00       		.byte	0x0
 5764 0067 00       		.byte	0x0
 5765 0068 09       		.uleb128 0x9
 5766 0069 0F       		.uleb128 0xf
 5767 006a 00       		.byte	0x0
 5768 006b 0B       		.uleb128 0xb
 5769 006c 0B       		.uleb128 0xb
 5770 006d 49       		.uleb128 0x49
 5771 006e 13       		.uleb128 0x13
 5772 006f 00       		.byte	0x0
 5773 0070 00       		.byte	0x0
 5774 0071 0A       		.uleb128 0xa
 5775 0072 0F       		.uleb128 0xf
 5776 0073 00       		.byte	0x0
 5777 0074 0B       		.uleb128 0xb
 5778 0075 0B       		.uleb128 0xb
 5779 0076 00       		.byte	0x0
 5780 0077 00       		.byte	0x0
 5781 0078 0B       		.uleb128 0xb
 5782 0079 26       		.uleb128 0x26
 5783 007a 00       		.byte	0x0
 5784 007b 49       		.uleb128 0x49
 5785 007c 13       		.uleb128 0x13
 5786 007d 00       		.byte	0x0
 5787 007e 00       		.byte	0x0
 5788 007f 0C       		.uleb128 0xc
 5789 0080 16       		.uleb128 0x16
 5790 0081 00       		.byte	0x0
 5791 0082 03       		.uleb128 0x3
 5792 0083 0E       		.uleb128 0xe
 5793 0084 3A       		.uleb128 0x3a
 5794 0085 0B       		.uleb128 0xb
 5795 0086 3B       		.uleb128 0x3b
 5796 0087 0B       		.uleb128 0xb
 5797 0088 49       		.uleb128 0x49
ARM GAS  /tmp/ccV38c0o.s 			page 112


 5798 0089 13       		.uleb128 0x13
 5799 008a 00       		.byte	0x0
 5800 008b 00       		.byte	0x0
 5801 008c 0D       		.uleb128 0xd
 5802 008d 17       		.uleb128 0x17
 5803 008e 01       		.byte	0x1
 5804 008f 01       		.uleb128 0x1
 5805 0090 13       		.uleb128 0x13
 5806 0091 03       		.uleb128 0x3
 5807 0092 0E       		.uleb128 0xe
 5808 0093 0B       		.uleb128 0xb
 5809 0094 0B       		.uleb128 0xb
 5810 0095 3A       		.uleb128 0x3a
 5811 0096 0B       		.uleb128 0xb
 5812 0097 3B       		.uleb128 0x3b
 5813 0098 0B       		.uleb128 0xb
 5814 0099 00       		.byte	0x0
 5815 009a 00       		.byte	0x0
 5816 009b 0E       		.uleb128 0xe
 5817 009c 13       		.uleb128 0x13
 5818 009d 01       		.byte	0x1
 5819 009e 01       		.uleb128 0x1
 5820 009f 13       		.uleb128 0x13
 5821 00a0 03       		.uleb128 0x3
 5822 00a1 0E       		.uleb128 0xe
 5823 00a2 0B       		.uleb128 0xb
 5824 00a3 0B       		.uleb128 0xb
 5825 00a4 3A       		.uleb128 0x3a
 5826 00a5 0B       		.uleb128 0xb
 5827 00a6 3B       		.uleb128 0x3b
 5828 00a7 0B       		.uleb128 0xb
 5829 00a8 00       		.byte	0x0
 5830 00a9 00       		.byte	0x0
 5831 00aa 0F       		.uleb128 0xf
 5832 00ab 0D       		.uleb128 0xd
 5833 00ac 00       		.byte	0x0
 5834 00ad 03       		.uleb128 0x3
 5835 00ae 08       		.uleb128 0x8
 5836 00af 3A       		.uleb128 0x3a
 5837 00b0 0B       		.uleb128 0xb
 5838 00b1 3B       		.uleb128 0x3b
 5839 00b2 0B       		.uleb128 0xb
 5840 00b3 49       		.uleb128 0x49
 5841 00b4 13       		.uleb128 0x13
 5842 00b5 00       		.byte	0x0
 5843 00b6 00       		.byte	0x0
 5844 00b7 10       		.uleb128 0x10
 5845 00b8 35       		.uleb128 0x35
 5846 00b9 00       		.byte	0x0
 5847 00ba 49       		.uleb128 0x49
 5848 00bb 13       		.uleb128 0x13
 5849 00bc 00       		.byte	0x0
 5850 00bd 00       		.byte	0x0
 5851 00be 11       		.uleb128 0x11
 5852 00bf 13       		.uleb128 0x13
 5853 00c0 01       		.byte	0x1
 5854 00c1 01       		.uleb128 0x1
ARM GAS  /tmp/ccV38c0o.s 			page 113


 5855 00c2 13       		.uleb128 0x13
 5856 00c3 03       		.uleb128 0x3
 5857 00c4 0E       		.uleb128 0xe
 5858 00c5 0B       		.uleb128 0xb
 5859 00c6 05       		.uleb128 0x5
 5860 00c7 3A       		.uleb128 0x3a
 5861 00c8 0B       		.uleb128 0xb
 5862 00c9 3B       		.uleb128 0x3b
 5863 00ca 05       		.uleb128 0x5
 5864 00cb 00       		.byte	0x0
 5865 00cc 00       		.byte	0x0
 5866 00cd 12       		.uleb128 0x12
 5867 00ce 0D       		.uleb128 0xd
 5868 00cf 00       		.byte	0x0
 5869 00d0 03       		.uleb128 0x3
 5870 00d1 0E       		.uleb128 0xe
 5871 00d2 3A       		.uleb128 0x3a
 5872 00d3 0B       		.uleb128 0xb
 5873 00d4 3B       		.uleb128 0x3b
 5874 00d5 05       		.uleb128 0x5
 5875 00d6 49       		.uleb128 0x49
 5876 00d7 13       		.uleb128 0x13
 5877 00d8 38       		.uleb128 0x38
 5878 00d9 0A       		.uleb128 0xa
 5879 00da 00       		.byte	0x0
 5880 00db 00       		.byte	0x0
 5881 00dc 13       		.uleb128 0x13
 5882 00dd 0D       		.uleb128 0xd
 5883 00de 00       		.byte	0x0
 5884 00df 03       		.uleb128 0x3
 5885 00e0 08       		.uleb128 0x8
 5886 00e1 3A       		.uleb128 0x3a
 5887 00e2 0B       		.uleb128 0xb
 5888 00e3 3B       		.uleb128 0x3b
 5889 00e4 05       		.uleb128 0x5
 5890 00e5 49       		.uleb128 0x49
 5891 00e6 13       		.uleb128 0x13
 5892 00e7 38       		.uleb128 0x38
 5893 00e8 0A       		.uleb128 0xa
 5894 00e9 00       		.byte	0x0
 5895 00ea 00       		.byte	0x0
 5896 00eb 14       		.uleb128 0x14
 5897 00ec 13       		.uleb128 0x13
 5898 00ed 01       		.byte	0x1
 5899 00ee 01       		.uleb128 0x1
 5900 00ef 13       		.uleb128 0x13
 5901 00f0 03       		.uleb128 0x3
 5902 00f1 0E       		.uleb128 0xe
 5903 00f2 0B       		.uleb128 0xb
 5904 00f3 06       		.uleb128 0x6
 5905 00f4 3A       		.uleb128 0x3a
 5906 00f5 0B       		.uleb128 0xb
 5907 00f6 3B       		.uleb128 0x3b
 5908 00f7 0B       		.uleb128 0xb
 5909 00f8 00       		.byte	0x0
 5910 00f9 00       		.byte	0x0
 5911 00fa 15       		.uleb128 0x15
ARM GAS  /tmp/ccV38c0o.s 			page 114


 5912 00fb 2E       		.uleb128 0x2e
 5913 00fc 01       		.byte	0x1
 5914 00fd 01       		.uleb128 0x1
 5915 00fe 13       		.uleb128 0x13
 5916 00ff 3F       		.uleb128 0x3f
 5917 0100 0C       		.uleb128 0xc
 5918 0101 03       		.uleb128 0x3
 5919 0102 0E       		.uleb128 0xe
 5920 0103 3A       		.uleb128 0x3a
 5921 0104 0B       		.uleb128 0xb
 5922 0105 3B       		.uleb128 0x3b
 5923 0106 0B       		.uleb128 0xb
 5924 0107 8740     		.uleb128 0x2007
 5925 0109 0E       		.uleb128 0xe
 5926 010a 49       		.uleb128 0x49
 5927 010b 13       		.uleb128 0x13
 5928 010c 3C       		.uleb128 0x3c
 5929 010d 0C       		.uleb128 0xc
 5930 010e 00       		.byte	0x0
 5931 010f 00       		.byte	0x0
 5932 0110 16       		.uleb128 0x16
 5933 0111 05       		.uleb128 0x5
 5934 0112 00       		.byte	0x0
 5935 0113 49       		.uleb128 0x49
 5936 0114 13       		.uleb128 0x13
 5937 0115 34       		.uleb128 0x34
 5938 0116 0C       		.uleb128 0xc
 5939 0117 00       		.byte	0x0
 5940 0118 00       		.byte	0x0
 5941 0119 17       		.uleb128 0x17
 5942 011a 05       		.uleb128 0x5
 5943 011b 00       		.byte	0x0
 5944 011c 49       		.uleb128 0x49
 5945 011d 13       		.uleb128 0x13
 5946 011e 00       		.byte	0x0
 5947 011f 00       		.byte	0x0
 5948 0120 18       		.uleb128 0x18
 5949 0121 2E       		.uleb128 0x2e
 5950 0122 01       		.byte	0x1
 5951 0123 01       		.uleb128 0x1
 5952 0124 13       		.uleb128 0x13
 5953 0125 3F       		.uleb128 0x3f
 5954 0126 0C       		.uleb128 0xc
 5955 0127 03       		.uleb128 0x3
 5956 0128 0E       		.uleb128 0xe
 5957 0129 3A       		.uleb128 0x3a
 5958 012a 0B       		.uleb128 0xb
 5959 012b 3B       		.uleb128 0x3b
 5960 012c 0B       		.uleb128 0xb
 5961 012d 8740     		.uleb128 0x2007
 5962 012f 0E       		.uleb128 0xe
 5963 0130 3C       		.uleb128 0x3c
 5964 0131 0C       		.uleb128 0xc
 5965 0132 00       		.byte	0x0
 5966 0133 00       		.byte	0x0
 5967 0134 19       		.uleb128 0x19
 5968 0135 2E       		.uleb128 0x2e
ARM GAS  /tmp/ccV38c0o.s 			page 115


 5969 0136 01       		.byte	0x1
 5970 0137 3F       		.uleb128 0x3f
 5971 0138 0C       		.uleb128 0xc
 5972 0139 03       		.uleb128 0x3
 5973 013a 0E       		.uleb128 0xe
 5974 013b 3A       		.uleb128 0x3a
 5975 013c 0B       		.uleb128 0xb
 5976 013d 3B       		.uleb128 0x3b
 5977 013e 0B       		.uleb128 0xb
 5978 013f 8740     		.uleb128 0x2007
 5979 0141 0E       		.uleb128 0xe
 5980 0142 49       		.uleb128 0x49
 5981 0143 13       		.uleb128 0x13
 5982 0144 3C       		.uleb128 0x3c
 5983 0145 0C       		.uleb128 0xc
 5984 0146 00       		.byte	0x0
 5985 0147 00       		.byte	0x0
 5986 0148 1A       		.uleb128 0x1a
 5987 0149 21       		.uleb128 0x21
 5988 014a 00       		.byte	0x0
 5989 014b 49       		.uleb128 0x49
 5990 014c 13       		.uleb128 0x13
 5991 014d 2F       		.uleb128 0x2f
 5992 014e 05       		.uleb128 0x5
 5993 014f 00       		.byte	0x0
 5994 0150 00       		.byte	0x0
 5995 0151 1B       		.uleb128 0x1b
 5996 0152 10       		.uleb128 0x10
 5997 0153 00       		.byte	0x0
 5998 0154 0B       		.uleb128 0xb
 5999 0155 0B       		.uleb128 0xb
 6000 0156 49       		.uleb128 0x49
 6001 0157 13       		.uleb128 0x13
 6002 0158 00       		.byte	0x0
 6003 0159 00       		.byte	0x0
 6004 015a 1C       		.uleb128 0x1c
 6005 015b 13       		.uleb128 0x13
 6006 015c 01       		.byte	0x1
 6007 015d 01       		.uleb128 0x1
 6008 015e 13       		.uleb128 0x13
 6009 015f 03       		.uleb128 0x3
 6010 0160 0E       		.uleb128 0xe
 6011 0161 0B       		.uleb128 0xb
 6012 0162 05       		.uleb128 0x5
 6013 0163 3A       		.uleb128 0x3a
 6014 0164 0B       		.uleb128 0xb
 6015 0165 3B       		.uleb128 0x3b
 6016 0166 0B       		.uleb128 0xb
 6017 0167 00       		.byte	0x0
 6018 0168 00       		.byte	0x0
 6019 0169 1D       		.uleb128 0x1d
 6020 016a 15       		.uleb128 0x15
 6021 016b 00       		.byte	0x0
 6022 016c 00       		.byte	0x0
 6023 016d 00       		.byte	0x0
 6024 016e 1E       		.uleb128 0x1e
 6025 016f 2E       		.uleb128 0x2e
ARM GAS  /tmp/ccV38c0o.s 			page 116


 6026 0170 01       		.byte	0x1
 6027 0171 01       		.uleb128 0x1
 6028 0172 13       		.uleb128 0x13
 6029 0173 3F       		.uleb128 0x3f
 6030 0174 0C       		.uleb128 0xc
 6031 0175 03       		.uleb128 0x3
 6032 0176 0E       		.uleb128 0xe
 6033 0177 3A       		.uleb128 0x3a
 6034 0178 0B       		.uleb128 0xb
 6035 0179 3B       		.uleb128 0x3b
 6036 017a 05       		.uleb128 0x5
 6037 017b 8740     		.uleb128 0x2007
 6038 017d 0E       		.uleb128 0xe
 6039 017e 11       		.uleb128 0x11
 6040 017f 01       		.uleb128 0x1
 6041 0180 12       		.uleb128 0x12
 6042 0181 01       		.uleb128 0x1
 6043 0182 40       		.uleb128 0x40
 6044 0183 06       		.uleb128 0x6
 6045 0184 00       		.byte	0x0
 6046 0185 00       		.byte	0x0
 6047 0186 1F       		.uleb128 0x1f
 6048 0187 05       		.uleb128 0x5
 6049 0188 00       		.byte	0x0
 6050 0189 03       		.uleb128 0x3
 6051 018a 0E       		.uleb128 0xe
 6052 018b 3A       		.uleb128 0x3a
 6053 018c 0B       		.uleb128 0xb
 6054 018d 3B       		.uleb128 0x3b
 6055 018e 05       		.uleb128 0x5
 6056 018f 49       		.uleb128 0x49
 6057 0190 13       		.uleb128 0x13
 6058 0191 02       		.uleb128 0x2
 6059 0192 06       		.uleb128 0x6
 6060 0193 00       		.byte	0x0
 6061 0194 00       		.byte	0x0
 6062 0195 20       		.uleb128 0x20
 6063 0196 34       		.uleb128 0x34
 6064 0197 00       		.byte	0x0
 6065 0198 03       		.uleb128 0x3
 6066 0199 0E       		.uleb128 0xe
 6067 019a 3A       		.uleb128 0x3a
 6068 019b 0B       		.uleb128 0xb
 6069 019c 3B       		.uleb128 0x3b
 6070 019d 05       		.uleb128 0x5
 6071 019e 49       		.uleb128 0x49
 6072 019f 13       		.uleb128 0x13
 6073 01a0 02       		.uleb128 0x2
 6074 01a1 06       		.uleb128 0x6
 6075 01a2 00       		.byte	0x0
 6076 01a3 00       		.byte	0x0
 6077 01a4 21       		.uleb128 0x21
 6078 01a5 39       		.uleb128 0x39
 6079 01a6 01       		.byte	0x1
 6080 01a7 01       		.uleb128 0x1
 6081 01a8 13       		.uleb128 0x13
 6082 01a9 03       		.uleb128 0x3
ARM GAS  /tmp/ccV38c0o.s 			page 117


 6083 01aa 08       		.uleb128 0x8
 6084 01ab 3A       		.uleb128 0x3a
 6085 01ac 0B       		.uleb128 0xb
 6086 01ad 3B       		.uleb128 0x3b
 6087 01ae 0B       		.uleb128 0xb
 6088 01af 00       		.byte	0x0
 6089 01b0 00       		.byte	0x0
 6090 01b1 22       		.uleb128 0x22
 6091 01b2 34       		.uleb128 0x34
 6092 01b3 00       		.byte	0x0
 6093 01b4 03       		.uleb128 0x3
 6094 01b5 0E       		.uleb128 0xe
 6095 01b6 3A       		.uleb128 0x3a
 6096 01b7 0B       		.uleb128 0xb
 6097 01b8 3B       		.uleb128 0x3b
 6098 01b9 0B       		.uleb128 0xb
 6099 01ba 49       		.uleb128 0x49
 6100 01bb 13       		.uleb128 0x13
 6101 01bc 3F       		.uleb128 0x3f
 6102 01bd 0C       		.uleb128 0xc
 6103 01be 3C       		.uleb128 0x3c
 6104 01bf 0C       		.uleb128 0xc
 6105 01c0 00       		.byte	0x0
 6106 01c1 00       		.byte	0x0
 6107 01c2 23       		.uleb128 0x23
 6108 01c3 34       		.uleb128 0x34
 6109 01c4 00       		.byte	0x0
 6110 01c5 03       		.uleb128 0x3
 6111 01c6 0E       		.uleb128 0xe
 6112 01c7 3A       		.uleb128 0x3a
 6113 01c8 0B       		.uleb128 0xb
 6114 01c9 3B       		.uleb128 0x3b
 6115 01ca 05       		.uleb128 0x5
 6116 01cb 49       		.uleb128 0x49
 6117 01cc 13       		.uleb128 0x13
 6118 01cd 3F       		.uleb128 0x3f
 6119 01ce 0C       		.uleb128 0xc
 6120 01cf 3C       		.uleb128 0x3c
 6121 01d0 0C       		.uleb128 0xc
 6122 01d1 00       		.byte	0x0
 6123 01d2 00       		.byte	0x0
 6124 01d3 24       		.uleb128 0x24
 6125 01d4 34       		.uleb128 0x34
 6126 01d5 00       		.byte	0x0
 6127 01d6 03       		.uleb128 0x3
 6128 01d7 08       		.uleb128 0x8
 6129 01d8 3A       		.uleb128 0x3a
 6130 01d9 0B       		.uleb128 0xb
 6131 01da 3B       		.uleb128 0x3b
 6132 01db 05       		.uleb128 0x5
 6133 01dc 49       		.uleb128 0x49
 6134 01dd 13       		.uleb128 0x13
 6135 01de 3F       		.uleb128 0x3f
 6136 01df 0C       		.uleb128 0xc
 6137 01e0 3C       		.uleb128 0x3c
 6138 01e1 0C       		.uleb128 0xc
 6139 01e2 00       		.byte	0x0
ARM GAS  /tmp/ccV38c0o.s 			page 118


 6140 01e3 00       		.byte	0x0
 6141 01e4 25       		.uleb128 0x25
 6142 01e5 34       		.uleb128 0x34
 6143 01e6 00       		.byte	0x0
 6144 01e7 03       		.uleb128 0x3
 6145 01e8 08       		.uleb128 0x8
 6146 01e9 3A       		.uleb128 0x3a
 6147 01ea 0B       		.uleb128 0xb
 6148 01eb 3B       		.uleb128 0x3b
 6149 01ec 0B       		.uleb128 0xb
 6150 01ed 49       		.uleb128 0x49
 6151 01ee 13       		.uleb128 0x13
 6152 01ef 3F       		.uleb128 0x3f
 6153 01f0 0C       		.uleb128 0xc
 6154 01f1 3C       		.uleb128 0x3c
 6155 01f2 0C       		.uleb128 0xc
 6156 01f3 00       		.byte	0x0
 6157 01f4 00       		.byte	0x0
 6158 01f5 26       		.uleb128 0x26
 6159 01f6 15       		.uleb128 0x15
 6160 01f7 01       		.byte	0x1
 6161 01f8 01       		.uleb128 0x1
 6162 01f9 13       		.uleb128 0x13
 6163 01fa 49       		.uleb128 0x49
 6164 01fb 13       		.uleb128 0x13
 6165 01fc 00       		.byte	0x0
 6166 01fd 00       		.byte	0x0
 6167 01fe 00       		.byte	0x0
 6168              		.section	.debug_pubnames,"",%progbits
 6169 0000 39000000 		.4byte	0x39
 6170 0004 0200     		.2byte	0x2
 6171 0006 00000000 		.4byte	.Ldebug_info0
 6172 000a C9210000 		.4byte	0x21c9
 6173 000e 5C1E0000 		.4byte	0x1e5c
 6174 0012 44726177 		.ascii	"DrawTile16Add\000"
 6174      54696C65 
 6174      31364164 
 6174      6400
 6175 0020 EA1E0000 		.4byte	0x1eea
 6176 0024 44726177 		.ascii	"DrawClippedTile16Add\000"
 6176      436C6970 
 6176      70656454 
 6176      696C6531 
 6176      36416464 
 6177 0039 00000000 		.4byte	0x0
 6178              		.section	.debug_aranges,"",%progbits
 6179 0000 1C000000 		.4byte	0x1c
 6180 0004 0200     		.2byte	0x2
 6181 0006 00000000 		.4byte	.Ldebug_info0
 6182 000a 04       		.byte	0x4
 6183 000b 00       		.byte	0x0
 6184 000c 0000     		.2byte	0x0
 6185 000e 0000     		.2byte	0x0
 6186 0010 00000000 		.4byte	.Ltext0
 6187 0014 F0070000 		.4byte	.Letext0-.Ltext0
 6188 0018 00000000 		.4byte	0x0
 6189 001c 00000000 		.4byte	0x0
ARM GAS  /tmp/ccV38c0o.s 			page 119


 6190              		.section	.debug_str,"MS",%progbits,1
 6191              	.LASF382:
 6192 0000 4D6F6465 		.ascii	"Mode7HFlip\000"
 6192      3748466C 
 6192      697000
 6193              	.LASF185:
 6194 000b 524F4D54 		.ascii	"ROMType\000"
 6194      79706500 
 6195              	.LASF304:
 6196 0013 50726576 		.ascii	"PreviousLine\000"
 6196      696F7573 
 6196      4C696E65 
 6196      00
 6197              	.LASF164:
 6198 0020 53444431 		.ascii	"SDD1Pack\000"
 6198      5061636B 
 6198      00
 6199              	.LASF398:
 6200 0029 4E656564 		.ascii	"Need16x8Mulitply\000"
 6200      31367838 
 6200      4D756C69 
 6200      74706C79 
 6200      00
 6201              	.LASF243:
 6202 003a 5F5A4E37 		.ascii	"_ZN7CMemory9SA1ROMMapEv\000"
 6202      434D656D 
 6202      6F727939 
 6202      53413152 
 6202      4F4D4D61 
 6203              	.LASF295:
 6204 0052 54696C65 		.ascii	"TileCached\000"
 6204      43616368 
 6204      656400
 6205              	.LASF65:
 6206 005d 41505545 		.ascii	"APUEnabled\000"
 6206      6E61626C 
 6206      656400
 6207              	.LASF38:
 6208 0068 4175746F 		.ascii	"AutoSaveTimer\000"
 6208      53617665 
 6208      54696D65 
 6208      7200
 6209              	.LASF119:
 6210 0076 53746572 		.ascii	"Stereo\000"
 6210      656F00
 6211              	.LASF267:
 6212 007d 5F5A4E37 		.ascii	"_ZN7CMemory12KartContentsEv\000"
 6212      434D656D 
 6212      6F727931 
 6212      324B6172 
 6212      74436F6E 
 6213              	.LASF426:
 6214 0099 72323132 		.ascii	"r212d_s\000"
 6214      645F7300 
 6215              	.LASF451:
 6216 00a1 5F5A6572 		.ascii	"_Zero\000"
 6216      6F00
ARM GAS  /tmp/ccV38c0o.s 			page 120


 6217              	.LASF175:
 6218 00a7 5352414D 		.ascii	"SRAMMask\000"
 6218      4D61736B 
 6218      00
 6219              	.LASF287:
 6220 00b0 52656E64 		.ascii	"RenderThisFrame\000"
 6220      65725468 
 6220      69734672 
 6220      616D6500 
 6221              	.LASF368:
 6222 00c0 42475F46 		.ascii	"BG_Forced\000"
 6222      6F726365 
 6222      6400
 6223              	.LASF395:
 6224 00ca 5265636F 		.ascii	"RecomputeClipWindows\000"
 6224      6D707574 
 6224      65436C69 
 6224      7057696E 
 6224      646F7773 
 6225              	.LASF77:
 6226 00df 54726163 		.ascii	"TraceVRAM\000"
 6226      65565241 
 6226      4D00
 6227              	.LASF423:
 6228 00e9 72323132 		.ascii	"r212c\000"
 6228      6300
 6229              	.LASF425:
 6230 00ef 72323132 		.ascii	"r212d\000"
 6230      6400
 6231              	.LASF420:
 6232 00f5 70437572 		.ascii	"pCurrentClip\000"
 6232      72656E74 
 6232      436C6970 
 6232      00
 6233              	.LASF16:
 6234 0102 75696E74 		.ascii	"uint32\000"
 6234      333200
 6235              	.LASF142:
 6236 0109 44697361 		.ascii	"DisableHDMA\000"
 6236      626C6548 
 6236      444D4100 
 6237              	.LASF375:
 6238 0115 4F414D52 		.ascii	"OAMReadFlip\000"
 6238      65616446 
 6238      6C697000 
 6239              	.LASF444:
 6240 0121 42756666 		.ascii	"Buffered\000"
 6240      65726564 
 6240      00
 6241              	.LASF335:
 6242 012a 42474D6F 		.ascii	"BGMode\000"
 6242      646500
 6243              	.LASF250:
 6244 0131 53636F72 		.ascii	"ScoreLoROM\000"
 6244      654C6F52 
 6244      4F4D00
 6245              	.LASF302:
ARM GAS  /tmp/ccV38c0o.s 			page 121


 6246 013c 426C7565 		.ascii	"Blue\000"
 6246      00
 6247              	.LASF362:
 6248 0141 46697865 		.ascii	"FixedColourRed\000"
 6248      64436F6C 
 6248      6F757252 
 6248      656400
 6249              	.LASF215:
 6250 0150 5F5A4E37 		.ascii	"_ZN7CMemory15WriteProtectROMEv\000"
 6250      434D656D 
 6250      6F727931 
 6250      35577269 
 6250      74655072 
 6251              	.LASF60:
 6252 016f 4150555F 		.ascii	"APU_Cycles\000"
 6252      4379636C 
 6252      657300
 6253              	.LASF66:
 6254 017a 53687574 		.ascii	"Shutdown\000"
 6254      646F776E 
 6254      00
 6255              	.LASF48:
 6256 0183 5F41524D 		.ascii	"_ARM_asm_padding1\000"
 6256      5F61736D 
 6256      5F706164 
 6256      64696E67 
 6256      3100
 6257              	.LASF299:
 6258 0195 52656E64 		.ascii	"RenderedScreenHeight\000"
 6258      65726564 
 6258      53637265 
 6258      656E4865 
 6258      69676874 
 6259              	.LASF196:
 6260 01aa 53444431 		.ascii	"SDD1LoggedDataCountPrev\000"
 6260      4C6F6767 
 6260      65644461 
 6260      7461436F 
 6260      756E7450 
 6261              	.LASF207:
 6262 01c2 5F5A4E37 		.ascii	"_ZN7CMemory8SaveSRAMEPKc\000"
 6262      434D656D 
 6262      6F727938 
 6262      53617665 
 6262      5352414D 
 6263              	.LASF131:
 6264 01db 4D757465 		.ascii	"Mute\000"
 6264      00
 6265              	.LASF464:
 6266 01e0 4C696E65 		.ascii	"LineCount\000"
 6266      436F756E 
 6266      7400
 6267              	.LASF202:
 6268 01ea 5F5A4E37 		.ascii	"_ZN7CMemory7LoadROMEPKc\000"
 6268      434D656D 
 6268      6F727937 
 6268      4C6F6164 
ARM GAS  /tmp/ccV38c0o.s 			page 122


 6268      524F4D45 
 6269              	.LASF98:
 6270 0202 466F7263 		.ascii	"ForceNoDSP1\000"
 6270      654E6F44 
 6270      53503100 
 6271              	.LASF324:
 6272 020e 4D61736B 		.ascii	"Mask1\000"
 6272      3100
 6273              	.LASF218:
 6274 0214 4D617052 		.ascii	"MapRAM\000"
 6274      414D00
 6275              	.LASF90:
 6276 021b 466F7263 		.ascii	"ForceHeader\000"
 6276      65486561 
 6276      64657200 
 6277              	.LASF42:
 6278 0227 496E444D 		.ascii	"InDMA\000"
 6278      4100
 6279              	.LASF439:
 6280 022d 54696C65 		.ascii	"TileShift\000"
 6280      53686966 
 6280      7400
 6281              	.LASF237:
 6282 0237 5F5A4E37 		.ascii	"_ZN7CMemory13SuperFXROMMapEv\000"
 6282      434D656D 
 6282      6F727931 
 6282      33537570 
 6282      65724658 
 6283              	.LASF35:
 6284 0254 4D656D53 		.ascii	"MemSpeed\000"
 6284      70656564 
 6284      00
 6285              	.LASF137:
 6286 025d 4D6F6465 		.ascii	"Mode7Interpolate\000"
 6286      37496E74 
 6286      6572706F 
 6286      6C617465 
 6286      00
 6287              	.LASF408:
 6288 026e 5375625A 		.ascii	"SubZBuffer\000"
 6288      42756666 
 6288      657200
 6289              	.LASF475:
 6290 0279 53657474 		.ascii	"Settings\000"
 6290      696E6773 
 6290      00
 6291              	.LASF19:
 6292 0282 2E5F3239 		.ascii	"._29\000"
 6292      00
 6293              	.LASF106:
 6294 0287 4D6F7573 		.ascii	"Mouse\000"
 6294      6500
 6295              	.LASF260:
 6296 028d 53746174 		.ascii	"StaticRAMSize\000"
 6296      69635241 
 6296      4D53697A 
 6296      6500
ARM GAS  /tmp/ccV38c0o.s 			page 123


 6297              	.LASF176:
 6298 029b 5352414D 		.ascii	"SRAMSize\000"
 6298      53697A65 
 6298      00
 6299              	.LASF86:
 6300 02a4 4672616D 		.ascii	"FrameTime\000"
 6300      6554696D 
 6300      6500
 6301              	.LASF414:
 6302 02ae 50616C65 		.ascii	"PaletteMask\000"
 6302      7474654D 
 6302      61736B00 
 6303              	.LASF389:
 6304 02ba 436C6970 		.ascii	"ClipCounts\000"
 6304      436F756E 
 6304      747300
 6305              	.LASF486:
 6306 02c5 54696C65 		.ascii	"TileBlank\000"
 6306      426C616E 
 6306      6B00
 6307              	.LASF217:
 6308 02cf 5F5A4E37 		.ascii	"_ZN7CMemory11FixROMSpeedEv\000"
 6308      434D656D 
 6308      6F727931 
 6308      31466978 
 6308      524F4D53 
 6309              	.LASF293:
 6310 02ea 4672616D 		.ascii	"FrameSkip\000"
 6310      65536B69 
 6310      7000
 6311              	.LASF433:
 6312 02f4 50736575 		.ascii	"Pseudo\000"
 6312      646F00
 6313              	.LASF239:
 6314 02fb 5F5A4E37 		.ascii	"_ZN7CMemory11TalesROMMapEh\000"
 6314      434D656D 
 6314      6F727931 
 6314      3154616C 
 6314      6573524F 
 6315              	.LASF127:
 6316 0316 44697361 		.ascii	"DisableMasterVolume\000"
 6316      626C654D 
 6316      61737465 
 6316      72566F6C 
 6316      756D6500 
 6317              	.LASF327:
 6318 032a 2E5F3339 		.ascii	"._39\000"
 6318      00
 6319              	.LASF157:
 6320 032f 43687563 		.ascii	"ChuckRock\000"
 6320      6B526F63 
 6320      6B00
 6321              	.LASF89:
 6322 0339 466F7263 		.ascii	"ForceHiROM\000"
 6322      65486952 
 6322      4F4D00
 6323              	.LASF87:
ARM GAS  /tmp/ccV38c0o.s 			page 124


 6324 0344 536B6970 		.ascii	"SkipFrames\000"
 6324      4672616D 
 6324      657300
 6325              	.LASF70:
 6326 034f 4379636C 		.ascii	"CyclesPercentage\000"
 6326      65735065 
 6326      7263656E 
 6326      74616765 
 6326      00
 6327              	.LASF372:
 6328 0360 4F424A53 		.ascii	"OBJSizeSelect\000"
 6328      697A6553 
 6328      656C6563 
 6328      7400
 6329              	.LASF10:
 6330 036e 6C6F6E67 		.ascii	"long int\000"
 6330      20696E74 
 6330      00
 6331              	.LASF172:
 6332 0377 43345241 		.ascii	"C4RAM\000"
 6332      4D00
 6333              	.LASF230:
 6334 037d 5352414D 		.ascii	"SRAM1024KLoROMMap\000"
 6334      31303234 
 6334      4B4C6F52 
 6334      4F4D4D61 
 6334      7000
 6335              	.LASF469:
 6336 038f 5F5A3133 		.ascii	"_Z13DrawTile16Addjjjj\000"
 6336      44726177 
 6336      54696C65 
 6336      31364164 
 6336      646A6A6A 
 6337              	.LASF103:
 6338 03a5 466F7263 		.ascii	"ForceSDD1\000"
 6338      65534444 
 6338      3100
 6339              	.LASF412:
 6340 03af 5A45524F 		.ascii	"ZERO\000"
 6340      00
 6341              	.LASF47:
 6342 03b4 54726965 		.ascii	"TriedInterleavedMode2\000"
 6342      64496E74 
 6342      65726C65 
 6342      61766564 
 6342      4D6F6465 
 6343              	.LASF332:
 6344 03ca 4E616D65 		.ascii	"NameBase\000"
 6344      42617365 
 6344      00
 6345              	.LASF26:
 6346 03d3 57616974 		.ascii	"WaitingForInterrupt\000"
 6346      696E6746 
 6346      6F72496E 
 6346      74657272 
 6346      75707400 
 6347              	.LASF322:
ARM GAS  /tmp/ccV38c0o.s 			page 125


 6348 03e7 496E6372 		.ascii	"Increment\000"
 6348      656D656E 
 6348      7400
 6349              	.LASF455:
 6350 03f1 53686966 		.ascii	"ShiftedPB\000"
 6350      74656450 
 6350      4200
 6351              	.LASF91:
 6352 03fb 466F7263 		.ascii	"ForceNoHeader\000"
 6352      654E6F48 
 6352      65616465 
 6352      7200
 6353              	.LASF317:
 6354 0409 5072696F 		.ascii	"Priority\000"
 6354      72697479 
 6354      00
 6355              	.LASF224:
 6356 0412 4C6F524F 		.ascii	"LoROMMap\000"
 6356      4D4D6170 
 6356      00
 6357              	.LASF310:
 6358 041b 436C6970 		.ascii	"Clip\000"
 6358      00
 6359              	.LASF4:
 6360 0420 73686F72 		.ascii	"short unsigned int\000"
 6360      7420756E 
 6360      7369676E 
 6360      65642069 
 6360      6E7400
 6361              	.LASF484:
 6362 0433 49435055 		.ascii	"ICPU\000"
 6362      00
 6363              	.LASF247:
 6364 0438 5F5A4E37 		.ascii	"_ZN7CMemory8AllASCIIEPhi\000"
 6364      434D656D 
 6364      6F727938 
 6364      416C6C41 
 6364      53434949 
 6365              	.LASF405:
 6366 0451 53637265 		.ascii	"Screen\000"
 6366      656E00
 6367              	.LASF58:
 6368 0458 5F50414C 		.ascii	"_PALMSOS_R9\000"
 6368      4D534F53 
 6368      5F523900 
 6369              	.LASF34:
 6370 0464 565F436F 		.ascii	"V_Counter\000"
 6370      756E7465 
 6370      7200
 6371              	.LASF381:
 6372 046e 42474D6F 		.ascii	"BGMosaic\000"
 6372      73616963 
 6372      00
 6373              	.LASF232:
 6374 0477 53756661 		.ascii	"SufamiTurboLoROMMap\000"
 6374      6D695475 
 6374      72626F4C 
ARM GAS  /tmp/ccV38c0o.s 			page 126


 6374      6F524F4D 
 6374      4D617000 
 6375              	.LASF268:
 6376 048b 53697A65 		.ascii	"Size\000"
 6376      00
 6377              	.LASF187:
 6378 0490 524F4D46 		.ascii	"ROMFramesPerSecond\000"
 6378      72616D65 
 6378      73506572 
 6378      5365636F 
 6378      6E6400
 6379              	.LASF168:
 6380 04a3 5652414D 		.ascii	"VRAM\000"
 6380      00
 6381              	.LASF456:
 6382 04a8 53686966 		.ascii	"ShiftedDB\000"
 6382      74656444 
 6382      4200
 6383              	.LASF156:
 6384 04b2 53747269 		.ascii	"StrikeGunnerOffsetHack\000"
 6384      6B654775 
 6384      6E6E6572 
 6384      4F666673 
 6384      65744861 
 6385              	.LASF161:
 6386 04c9 57726573 		.ascii	"WrestlemaniaArcade\000"
 6386      746C656D 
 6386      616E6961 
 6386      41726361 
 6386      646500
 6387              	.LASF6:
 6388 04dc 7369676E 		.ascii	"signed char\000"
 6388      65642063 
 6388      68617200 
 6389              	.LASF329:
 6390 04e8 564F6666 		.ascii	"VOffset\000"
 6390      73657400 
 6391              	.LASF278:
 6392 04f0 4C656674 		.ascii	"Left\000"
 6392      00
 6393              	.LASF397:
 6394 04f5 4F424A4E 		.ascii	"OBJNameSelect\000"
 6394      616D6553 
 6394      656C6563 
 6394      7400
 6395              	.LASF343:
 6396 0503 4F414D41 		.ascii	"OAMAddr\000"
 6396      64647200 
 6397              	.LASF387:
 6398 050b 57696E64 		.ascii	"Window2Left\000"
 6398      6F77324C 
 6398      65667400 
 6399              	.LASF83:
 6400 0517 466F7263 		.ascii	"ForceNTSC\000"
 6400      654E5453 
 6400      4300
 6401              	.LASF422:
ARM GAS  /tmp/ccV38c0o.s 			page 127


 6402 0521 4D6F6465 		.ascii	"Mode7PriorityMask\000"
 6402      37507269 
 6402      6F726974 
 6402      794D6173 
 6402      6B00
 6403              	.LASF445:
 6404 0533 44697265 		.ascii	"DirectColourMode\000"
 6404      6374436F 
 6404      6C6F7572 
 6404      4D6F6465 
 6404      00
 6405              	.LASF2:
 6406 0544 756E7369 		.ascii	"unsigned char\000"
 6406      676E6564 
 6406      20636861 
 6406      7200
 6407              	.LASF270:
 6408 0552 48656164 		.ascii	"Headers\000"
 6408      65727300 
 6409              	.LASF353:
 6410 055a 4D617472 		.ascii	"MatrixA\000"
 6410      69784100 
 6411              	.LASF118:
 6412 0562 54726163 		.ascii	"TraceSoundDSP\000"
 6412      65536F75 
 6412      6E644453 
 6412      5000
 6413              	.LASF201:
 6414 0570 496E6974 		.ascii	"InitROM\000"
 6414      524F4D00 
 6415              	.LASF321:
 6416 0578 48696768 		.ascii	"High\000"
 6416      00
 6417              	.LASF221:
 6418 057d 5F5A4E37 		.ascii	"_ZN7CMemory11MapExtraRAMEv\000"
 6418      434D656D 
 6418      6F727931 
 6418      314D6170 
 6418      45787472 
 6419              	.LASF104:
 6420 0598 466F7263 		.ascii	"ForceNoSDD1\000"
 6420      654E6F53 
 6420      44443100 
 6421              	.LASF417:
 6422 05a4 46697865 		.ascii	"FixedColour\000"
 6422      64436F6C 
 6422      6F757200 
 6423              	.LASF418:
 6424 05b0 53746172 		.ascii	"StartY\000"
 6424      745900
 6425              	.LASF432:
 6426 05b7 72323133 		.ascii	"r2131_s\000"
 6426      315F7300 
 6427              	.LASF344:
 6428 05bf 4F414D46 		.ascii	"OAMFlip\000"
 6428      6C697000 
 6429              	.LASF37:
ARM GAS  /tmp/ccV38c0o.s 			page 128


 6430 05c7 46617374 		.ascii	"FastROMSpeed\000"
 6430      524F4D53 
 6430      70656564 
 6430      00
 6431              	.LASF194:
 6432 05d4 53444431 		.ascii	"SDD1Data\000"
 6432      44617461 
 6432      00
 6433              	.LASF144:
 6434 05dd 4E657450 		.ascii	"NetPlay\000"
 6434      6C617900 
 6435              	.LASF1:
 6436 05e5 76616C75 		.ascii	"value\000"
 6436      6500
 6437              	.LASF450:
 6438 05eb 5F436172 		.ascii	"_Carry\000"
 6438      727900
 6439              	.LASF240:
 6440 05f2 416C7068 		.ascii	"AlphaROMMap\000"
 6440      61524F4D 
 6440      4D617000 
 6441              	.LASF159:
 6442 05fe 57696E74 		.ascii	"WinterGold\000"
 6442      6572476F 
 6442      6C6400
 6443              	.LASF102:
 6444 0609 466F7263 		.ascii	"ForceNoC4\000"
 6444      654E6F43 
 6444      3400
 6445              	.LASF274:
 6446 0613 436F6D70 		.ascii	"CompanyID\000"
 6446      616E7949 
 6446      4400
 6447              	.LASF188:
 6448 061d 48656164 		.ascii	"HeaderCount\000"
 6448      6572436F 
 6448      756E7400 
 6449              	.LASF11:
 6450 0629 63686172 		.ascii	"char\000"
 6450      00
 6451              	.LASF160:
 6452 062e 44657A61 		.ascii	"Dezaemon\000"
 6452      656D6F6E 
 6452      00
 6453              	.LASF289:
 6454 0637 4672616D 		.ascii	"FrameCount\000"
 6454      65436F75 
 6454      6E7400
 6455              	.LASF401:
 6456 0642 53617665 		.ascii	"SavedOAMAddr2\000"
 6456      644F414D 
 6456      41646472 
 6456      3200
 6457              	.LASF197:
 6458 0650 53444431 		.ascii	"SDD1LoggedDataCount\000"
 6458      4C6F6767 
 6458      65644461 
ARM GAS  /tmp/ccV38c0o.s 			page 129


 6458      7461436F 
 6458      756E7400 
 6459              	.LASF117:
 6460 0664 536F756E 		.ascii	"SoundPlaybackRate\000"
 6460      64506C61 
 6460      79626163 
 6460      6B526174 
 6460      6500
 6461              	.LASF189:
 6462 0676 43616C63 		.ascii	"CalculatedSize\000"
 6462      756C6174 
 6462      65645369 
 6462      7A6500
 6463              	.LASF0:
 6464 0685 6C696E65 		.ascii	"line\000"
 6464      00
 6465              	.LASF132:
 6466 068a 416C7453 		.ascii	"AltSampleDecode\000"
 6466      616D706C 
 6466      65446563 
 6466      6F646500 
 6467              	.LASF341:
 6468 069a 4C617374 		.ascii	"LastSprite\000"
 6468      53707269 
 6468      746500
 6469              	.LASF399:
 6470 06a5 4A6F7970 		.ascii	"Joypad3ButtonReadPos\000"
 6470      61643342 
 6470      7574746F 
 6470      6E526561 
 6470      64506F73 
 6471              	.LASF465:
 6472 06ba 70436163 		.ascii	"pCache\000"
 6472      686500
 6473              	.LASF73:
 6474 06c1 466F7263 		.ascii	"ForcedPause\000"
 6474      65645061 
 6474      75736500 
 6475              	.LASF46:
 6476 06cd 5F41524D 		.ascii	"_ARM_asm_reserved_1\000"
 6476      5F61736D 
 6476      5F726573 
 6476      65727665 
 6476      645F3100 
 6477              	.LASF108:
 6478 06e1 53525443 		.ascii	"SRTC\000"
 6478      00
 6479              	.LASF313:
 6480 06e6 56506F73 		.ascii	"VPos\000"
 6480      00
 6481              	.LASF442:
 6482 06eb 53746172 		.ascii	"StartPalette\000"
 6482      7450616C 
 6482      65747465 
 6482      00
 6483              	.LASF210:
 6484 06f8 4465696E 		.ascii	"Deinit\000"
ARM GAS  /tmp/ccV38c0o.s 			page 130


 6484      697400
 6485              	.LASF393:
 6486 06ff 436C6970 		.ascii	"ClipWindow1Inside\000"
 6486      57696E64 
 6486      6F773149 
 6486      6E736964 
 6486      6500
 6487              	.LASF407:
 6488 0711 5A427566 		.ascii	"ZBuffer\000"
 6488      66657200 
 6489              	.LASF491:
 6490 0719 63614352 		.ascii	"caCRC32\000"
 6490      43333200 
 6491              	.LASF309:
 6492 0721 50726576 		.ascii	"PrevMouseY\000"
 6492      4D6F7573 
 6492      655900
 6493              	.LASF82:
 6494 072c 466F7263 		.ascii	"ForcePAL\000"
 6494      6550414C 
 6494      00
 6495              	.LASF318:
 6496 0735 50616C65 		.ascii	"Palette\000"
 6496      74746500 
 6497              	.LASF95:
 6498 073d 466F7263 		.ascii	"ForceSuperFX\000"
 6498      65537570 
 6498      65724658 
 6498      00
 6499              	.LASF236:
 6500 074a 53757065 		.ascii	"SuperFXROMMap\000"
 6500      72465852 
 6500      4F4D4D61 
 6500      7000
 6501              	.LASF370:
 6502 0758 4F424A54 		.ascii	"OBJThroughMain\000"
 6502      68726F75 
 6502      67684D61 
 6502      696E00
 6503              	.LASF151:
 6504 0767 4170706C 		.ascii	"ApplyCheats\000"
 6504      79436865 
 6504      61747300 
 6505              	.LASF358:
 6506 0773 43656E74 		.ascii	"CentreY\000"
 6506      72655900 
 6507              	.LASF228:
 6508 077b 5352414D 		.ascii	"SRAM512KLoROMMap\000"
 6508      3531324B 
 6508      4C6F524F 
 6508      4D4D6170 
 6508      00
 6509              	.LASF347:
 6510 078c 49525148 		.ascii	"IRQHBeamPos\000"
 6510      4265616D 
 6510      506F7300 
 6511              	.LASF374:
ARM GAS  /tmp/ccV38c0o.s 			page 131


 6512 0798 4F424A41 		.ascii	"OBJAddition\000"
 6512      64646974 
 6512      696F6E00 
 6513              	.LASF158:
 6514 07a4 53746172 		.ascii	"StarfoxHack\000"
 6514      666F7848 
 6514      61636B00 
 6515              	.LASF155:
 6516 07b0 6F733978 		.ascii	"os9x_hack\000"
 6516      5F686163 
 6516      6B00
 6517              	.LASF458:
 6518 07ba 5363616E 		.ascii	"Scanline\000"
 6518      6C696E65 
 6518      00
 6519              	.LASF325:
 6520 07c3 46756C6C 		.ascii	"FullGraphicCount\000"
 6520      47726170 
 6520      68696343 
 6520      6F756E74 
 6520      00
 6521              	.LASF28:
 6522 07d4 4379636C 		.ascii	"Cycles\000"
 6522      657300
 6523              	.LASF487:
 6524 07db 474E5520 		.ascii	"GNU C++ 4.1.1\000"
 6524      432B2B20 
 6524      342E312E 
 6524      3100
 6525              	.LASF314:
 6526 07e9 4E616D65 		.ascii	"Name\000"
 6526      00
 6527              	.LASF124:
 6528 07ee 536F756E 		.ascii	"SoundEnvelopeHeightReading\000"
 6528      64456E76 
 6528      656C6F70 
 6528      65486569 
 6528      67687452 
 6529              	.LASF273:
 6530 0809 5F5A4E37 		.ascii	"_ZN7CMemory5ROMIDEv\000"
 6530      434D656D 
 6530      6F727935 
 6530      524F4D49 
 6530      44457600 
 6531              	.LASF154:
 6532 081d 4175746F 		.ascii	"AutoMaxSkipFrames\000"
 6532      4D617853 
 6532      6B697046 
 6532      72616D65 
 6532      7300
 6533              	.LASF212:
 6534 082f 46726565 		.ascii	"FreeSDD1Data\000"
 6534      53444431 
 6534      44617461 
 6534      00
 6535              	.LASF219:
 6536 083c 5F5A4E37 		.ascii	"_ZN7CMemory6MapRAMEv\000"
ARM GAS  /tmp/ccV38c0o.s 			page 132


 6536      434D656D 
 6536      6F727936 
 6536      4D617052 
 6536      414D4576 
 6537              	.LASF193:
 6538 0851 53444431 		.ascii	"SDD1Index\000"
 6538      496E6465 
 6538      7800
 6539              	.LASF15:
 6540 085b 626F6F6C 		.ascii	"bool32\000"
 6540      333200
 6541              	.LASF430:
 6542 0862 72323133 		.ascii	"r2130_s\000"
 6542      305F7300 
 6543              	.LASF255:
 6544 086a 5F5A4E37 		.ascii	"_ZN7CMemory16CheckForIPSPatchEPKchRi\000"
 6544      434D656D 
 6544      6F727931 
 6544      36436865 
 6544      636B466F 
 6545              	.LASF39:
 6546 088f 4E4D4954 		.ascii	"NMITriggerPoint\000"
 6546      72696767 
 6546      6572506F 
 6546      696E7400 
 6547              	.LASF262:
 6548 089f 4D617054 		.ascii	"MapType\000"
 6548      79706500 
 6549              	.LASF113:
 6550 08a7 4D6F7573 		.ascii	"MouseMaster\000"
 6550      654D6173 
 6550      74657200 
 6551              	.LASF364:
 6552 08b3 46697865 		.ascii	"FixedColourBlue\000"
 6552      64436F6C 
 6552      6F757242 
 6552      6C756500 
 6553              	.LASF306:
 6554 08c3 436F6E74 		.ascii	"Controller\000"
 6554      726F6C6C 
 6554      657200
 6555              	.LASF213:
 6556 08ce 5F5A4E37 		.ascii	"_ZN7CMemory12FreeSDD1DataEv\000"
 6556      434D656D 
 6556      6F727931 
 6556      32467265 
 6556      65534444 
 6557              	.LASF18:
 6558 08ea 626F6F6C 		.ascii	"bool8_32\000"
 6558      385F3332 
 6558      00
 6559              	.LASF406:
 6560 08f3 53756253 		.ascii	"SubScreen\000"
 6560      63726565 
 6560      6E00
 6561              	.LASF171:
 6562 08fd 46696C6C 		.ascii	"FillRAM\000"
ARM GAS  /tmp/ccV38c0o.s 			page 133


 6562      52414D00 
 6563              	.LASF12:
 6564 0905 626F6F6C 		.ascii	"bool8\000"
 6564      3800
 6565              	.LASF41:
 6566 090b 49525143 		.ascii	"IRQCycleCount\000"
 6566      79636C65 
 6566      436F756E 
 6566      7400
 6567              	.LASF323:
 6568 0919 41646472 		.ascii	"Address\000"
 6568      65737300 
 6569              	.LASF256:
 6570 0921 54565374 		.ascii	"TVStandard\000"
 6570      616E6461 
 6570      726400
 6571              	.LASF419:
 6572 092c 456E6459 		.ascii	"EndY\000"
 6572      00
 6573              	.LASF56:
 6574 0931 4150555F 		.ascii	"APU_APUExecuting\000"
 6574      41505545 
 6574      78656375 
 6574      74696E67 
 6574      00
 6575              	.LASF199:
 6576 0942 524F4D46 		.ascii	"ROMFilename\000"
 6576      696C656E 
 6576      616D6500 
 6577              	.LASF135:
 6578 094e 5472616E 		.ascii	"Transparency\000"
 6578      73706172 
 6578      656E6379 
 6578      00
 6579              	.LASF5:
 6580 095b 6C6F6E67 		.ascii	"long unsigned int\000"
 6580      20756E73 
 6580      69676E65 
 6580      6420696E 
 6580      7400
 6581              	.LASF186:
 6582 096d 524F4D53 		.ascii	"ROMSize\000"
 6582      697A6500 
 6583              	.LASF351:
 6584 0975 56426561 		.ascii	"VBeamFlip\000"
 6584      6D466C69 
 6584      7000
 6585              	.LASF251:
 6586 097f 5F5A4E37 		.ascii	"_ZN7CMemory10ScoreLoROMEh\000"
 6586      434D656D 
 6586      6F727931 
 6586      3053636F 
 6586      72654C6F 
 6587              	.LASF211:
 6588 0999 5F5A4E37 		.ascii	"_ZN7CMemory6DeinitEv\000"
 6588      434D656D 
 6588      6F727936 
ARM GAS  /tmp/ccV38c0o.s 			page 134


 6588      4465696E 
 6588      69744576 
 6589              	.LASF88:
 6590 09ae 466F7263 		.ascii	"ForceLoROM\000"
 6590      654C6F52 
 6590      4F4D00
 6591              	.LASF336:
 6592 09b9 42473350 		.ascii	"BG3Priority\000"
 6592      72696F72 
 6592      69747900 
 6593              	.LASF259:
 6594 09c5 5F5A4E37 		.ascii	"_ZN7CMemory5SpeedEv\000"
 6594      434D656D 
 6594      6F727935 
 6594      53706565 
 6594      64457600 
 6595              	.LASF279:
 6596 09d9 52696768 		.ascii	"Right\000"
 6596      7400
 6597              	.LASF109:
 6598 09df 436F6E74 		.ascii	"ControllerOption\000"
 6598      726F6C6C 
 6598      65724F70 
 6598      74696F6E 
 6598      00
 6599              	.LASF44:
 6600 09f0 5352414D 		.ascii	"SRAMModified\000"
 6600      4D6F6469 
 6600      66696564 
 6600      00
 6601              	.LASF92:
 6602 09fd 466F7263 		.ascii	"ForceInterleaved\000"
 6602      65496E74 
 6602      65726C65 
 6602      61766564 
 6602      00
 6603              	.LASF462:
 6604 0a0e 4F666673 		.ascii	"Offset\000"
 6604      657400
 6605              	.LASF198:
 6606 0a15 53444431 		.ascii	"SDD1LoggedData\000"
 6606      4C6F6767 
 6606      65644461 
 6606      746100
 6607              	.LASF269:
 6608 0a24 5F5A4E37 		.ascii	"_ZN7CMemory4SizeEv\000"
 6608      434D656D 
 6608      6F727934 
 6608      53697A65 
 6608      457600
 6609              	.LASF452:
 6610 0a37 5F4E6567 		.ascii	"_Negative\000"
 6610      61746976 
 6610      6500
 6611              	.LASF482:
 6612 0a41 5339784F 		.ascii	"S9xOpcodesM0X1\000"
 6612      70636F64 
ARM GAS  /tmp/ccV38c0o.s 			page 135


 6612      65734D30 
 6612      583100
 6613              	.LASF120:
 6614 0a50 52657665 		.ascii	"ReverseStereo\000"
 6614      72736553 
 6614      74657265 
 6614      6F00
 6615              	.LASF264:
 6616 0a5e 4D61704D 		.ascii	"MapMode\000"
 6616      6F646500 
 6617              	.LASF85:
 6618 0a66 4672616D 		.ascii	"FrameTimeNTSC\000"
 6618      6554696D 
 6618      654E5453 
 6618      4300
 6619              	.LASF178:
 6620 0a74 4D656D6F 		.ascii	"MemorySpeed\000"
 6620      72795370 
 6620      65656400 
 6621              	.LASF227:
 6622 0a80 5F5A4E37 		.ascii	"_ZN7CMemory13LoROM24MBSMapEv\000"
 6622      434D656D 
 6622      6F727931 
 6622      334C6F52 
 6622      4F4D3234 
 6623              	.LASF485:
 6624 0a9d 436F6E76 		.ascii	"ConvertTile\000"
 6624      65727454 
 6624      696C6500 
 6625              	.LASF307:
 6626 0aa9 4A6F7970 		.ascii	"Joypads\000"
 6626      61647300 
 6627              	.LASF443:
 6628 0ab1 42756666 		.ascii	"Buffer\000"
 6628      657200
 6629              	.LASF361:
 6630 0ab8 43474144 		.ascii	"CGADD\000"
 6630      4400
 6631              	.LASF241:
 6632 0abe 5F5A4E37 		.ascii	"_ZN7CMemory11AlphaROMMapEv\000"
 6632      434D656D 
 6632      6F727931 
 6632      31416C70 
 6632      6861524F 
 6633              	.LASF436:
 6634 0ad9 56506F73 		.ascii	"VPositions\000"
 6634      6974696F 
 6634      6E7300
 6635              	.LASF342:
 6636 0ae4 4F414D50 		.ascii	"OAMPriorityRotation\000"
 6636      72696F72 
 6636      69747952 
 6636      6F746174 
 6636      696F6E00 
 6637              	.LASF427:
 6638 0af8 72323132 		.ascii	"r212e_s\000"
 6638      655F7300 
ARM GAS  /tmp/ccV38c0o.s 			page 136


 6639              	.LASF53:
 6640 0b00 4D656D6F 		.ascii	"Memory_SRAM\000"
 6640      72795F53 
 6640      52414D00 
 6641              	.LASF235:
 6642 0b0c 5F5A4E37 		.ascii	"_ZN7CMemory8HiROMMapEv\000"
 6642      434D656D 
 6642      6F727938 
 6642      4869524F 
 6642      4D4D6170 
 6643              	.LASF429:
 6644 0b23 72323133 		.ascii	"r2130\000"
 6644      3000
 6645              	.LASF200:
 6646 0b29 4C6F6164 		.ascii	"LoadROM\000"
 6646      524F4D00 
 6647              	.LASF446:
 6648 0b31 534F7063 		.ascii	"SOpcodes\000"
 6648      6F646573 
 6648      00
 6649              	.LASF130:
 6650 0b3a 54687265 		.ascii	"ThreadSound\000"
 6650      6164536F 
 6650      756E6400 
 6651              	.LASF301:
 6652 0b46 47726565 		.ascii	"Green\000"
 6652      6E00
 6653              	.LASF153:
 6654 0b4c 54757262 		.ascii	"TurboSkipFrames\000"
 6654      6F536B69 
 6654      70467261 
 6654      6D657300 
 6655              	.LASF128:
 6656 0b5c 536F756E 		.ascii	"SoundSync\000"
 6656      6453796E 
 6656      6300
 6657              	.LASF468:
 6658 0b66 44726177 		.ascii	"DrawClippedTile16Add\000"
 6658      436C6970 
 6658      70656454 
 6658      696C6531 
 6658      36416464 
 6659              	.LASF288:
 6660 0b7b 44697265 		.ascii	"DirectColourMapsNeedRebuild\000"
 6660      6374436F 
 6660      6C6F7572 
 6660      4D617073 
 6660      4E656564 
 6661              	.LASF121:
 6662 0b97 53697874 		.ascii	"SixteenBitSound\000"
 6662      65656E42 
 6662      6974536F 
 6662      756E6400 
 6663              	.LASF8:
 6664 0ba7 6C6F6E67 		.ascii	"long long int\000"
 6664      206C6F6E 
 6664      6720696E 
ARM GAS  /tmp/ccV38c0o.s 			page 137


 6664      7400
 6665              	.LASF275:
 6666 0bb5 5F5A4E37 		.ascii	"_ZN7CMemory9CompanyIDEv\000"
 6666      434D656D 
 6666      6F727939 
 6666      436F6D70 
 6666      616E7949 
 6667              	.LASF146:
 6668 0bcd 53657276 		.ascii	"ServerName\000"
 6668      65724E61 
 6668      6D6500
 6669              	.LASF59:
 6670 0bd8 5F50414C 		.ascii	"_PALMSOS_R10\000"
 6670      4D534F53 
 6670      5F523130 
 6670      00
 6671              	.LASF123:
 6672 0be5 536F756E 		.ascii	"SoundMixInterval\000"
 6672      644D6978 
 6672      496E7465 
 6672      7276616C 
 6672      00
 6673              	.LASF40:
 6674 0bf6 4E4D4943 		.ascii	"NMICycleCount\000"
 6674      79636C65 
 6674      436F756E 
 6674      7400
 6675              	.LASF277:
 6676 0c04 436F756E 		.ascii	"Count\000"
 6676      7400
 6677              	.LASF177:
 6678 0c0a 57726974 		.ascii	"WriteMap\000"
 6678      654D6170 
 6678      00
 6679              	.LASF340:
 6680 0c13 46697273 		.ascii	"FirstSprite\000"
 6680      74537072 
 6680      69746500 
 6681              	.LASF437:
 6682 0c1f 54696C65 		.ascii	"TileSize\000"
 6682      53697A65 
 6682      00
 6683              	.LASF449:
 6684 0c28 5339784F 		.ascii	"S9xOpcodes\000"
 6684      70636F64 
 6684      657300
 6685              	.LASF114:
 6686 0c33 53757065 		.ascii	"SuperFX\000"
 6686      72465800 
 6687              	.LASF105:
 6688 0c3b 4D756C74 		.ascii	"MultiPlayer5\000"
 6688      69506C61 
 6688      79657235 
 6688      00
 6689              	.LASF208:
 6690 0c48 496E6974 		.ascii	"Init\000"
 6690      00
ARM GAS  /tmp/ccV38c0o.s 			page 138


 6691              	.LASF49:
 6692 0c4d 4D656D6F 		.ascii	"Memory_Map\000"
 6692      72795F4D 
 6692      617000
 6693              	.LASF440:
 6694 0c58 54696C65 		.ascii	"TileAddress\000"
 6694      41646472 
 6694      65737300 
 6695              	.LASF134:
 6696 0c64 53697874 		.ascii	"SixteenBit\000"
 6696      65656E42 
 6696      697400
 6697              	.LASF470:
 6698 0c6f 5F5A3230 		.ascii	"_Z20DrawClippedTile16Addjjjjjj\000"
 6698      44726177 
 6698      436C6970 
 6698      70656454 
 6698      696C6531 
 6699              	.LASF474:
 6700 0c8e 524F7043 		.ascii	"ROpCount\000"
 6700      6F756E74 
 6700      00
 6701              	.LASF93:
 6702 0c97 466F7263 		.ascii	"ForceInterleaved2\000"
 6702      65496E74 
 6702      65726C65 
 6702      61766564 
 6702      3200
 6703              	.LASF126:
 6704 0ca9 44697361 		.ascii	"DisableSampleCaching\000"
 6704      626C6553 
 6704      616D706C 
 6704      65436163 
 6704      68696E67 
 6705              	.LASF386:
 6706 0cbe 57696E64 		.ascii	"Window1Right\000"
 6706      6F773152 
 6706      69676874 
 6706      00
 6707              	.LASF296:
 6708 0ccb 46697273 		.ascii	"FirstVRAMRead\000"
 6708      74565241 
 6708      4D526561 
 6708      6400
 6709              	.LASF195:
 6710 0cd9 53444431 		.ascii	"SDD1Entries\000"
 6710      456E7472 
 6710      69657300 
 6711              	.LASF284:
 6712 0ce5 4D617842 		.ascii	"MaxBrightness\000"
 6712      72696768 
 6712      746E6573 
 6712      7300
 6713              	.LASF23:
 6714 0cf3 4272616E 		.ascii	"BranchSkip\000"
 6714      6368536B 
 6714      697000
ARM GAS  /tmp/ccV38c0o.s 			page 139


 6715              	.LASF431:
 6716 0cfe 72323133 		.ascii	"r2131\000"
 6716      3100
 6717              	.LASF101:
 6718 0d04 466F7263 		.ascii	"ForceC4\000"
 6718      65433400 
 6719              	.LASF231:
 6720 0d0c 5F5A4E37 		.ascii	"_ZN7CMemory17SRAM1024KLoROMMapEv\000"
 6720      434D656D 
 6720      6F727931 
 6720      37535241 
 6720      4D313032 
 6721              	.LASF248:
 6722 0d2d 53636F72 		.ascii	"ScoreHiROM\000"
 6722      65486952 
 6722      4F4D00
 6723              	.LASF36:
 6724 0d38 4D656D53 		.ascii	"MemSpeedx2\000"
 6724      70656564 
 6724      783200
 6725              	.LASF141:
 6726 0d43 466F7263 		.ascii	"ForceNoTransparency\000"
 6726      654E6F54 
 6726      72616E73 
 6726      70617265 
 6726      6E637900 
 6727              	.LASF3:
 6728 0d57 756E7369 		.ascii	"unsigned int\000"
 6728      676E6564 
 6728      20696E74 
 6728      00
 6729              	.LASF61:
 6730 0d64 44535047 		.ascii	"DSPGet\000"
 6730      657400
 6731              	.LASF394:
 6732 0d6b 436C6970 		.ascii	"ClipWindow2Inside\000"
 6732      57696E64 
 6732      6F773249 
 6732      6E736964 
 6732      6500
 6733              	.LASF471:
 6734 0d7d 53746172 		.ascii	"StartPixel\000"
 6734      74506978 
 6734      656C00
 6735              	.LASF223:
 6736 0d88 5F5A4E37 		.ascii	"_ZN7CMemory4SafeEPKc\000"
 6736      434D656D 
 6736      6F727934 
 6736      53616665 
 6736      45504B63 
 6737              	.LASF413:
 6738 0d9d 53637265 		.ascii	"ScreenColorsPre\000"
 6738      656E436F 
 6738      6C6F7273 
 6738      50726500 
 6739              	.LASF138:
 6740 0dad 42474C61 		.ascii	"BGLayering\000"
ARM GAS  /tmp/ccV38c0o.s 			page 140


 6740      79657269 
 6740      6E6700
 6741              	.LASF167:
 6742 0db8 434D656D 		.ascii	"CMemory\000"
 6742      6F727900 
 6743              	.LASF140:
 6744 0dc0 466F7263 		.ascii	"ForceTransparency\000"
 6744      65547261 
 6744      6E737061 
 6744      72656E63 
 6744      7900
 6745              	.LASF305:
 6746 0dd2 43757272 		.ascii	"CurrentLine\000"
 6746      656E744C 
 6746      696E6500 
 6747              	.LASF174:
 6748 0dde 4C6F524F 		.ascii	"LoROM\000"
 6748      4D00
 6749              	.LASF489:
 6750 0de4 2F686F6D 		.ascii	"/home/bitrider/hd_bitrider/snes/asmpsnes\000"
 6750      652F6269 
 6750      74726964 
 6750      65722F68 
 6750      645F6269 
 6751              	.LASF225:
 6752 0e0d 5F5A4E37 		.ascii	"_ZN7CMemory8LoROMMapEv\000"
 6752      434D656D 
 6752      6F727938 
 6752      4C6F524F 
 6752      4D4D6170 
 6753              	.LASF191:
 6754 0e24 524F4D43 		.ascii	"ROMChecksum\000"
 6754      6865636B 
 6754      73756D00 
 6755              	.LASF384:
 6756 0e30 4D6F6465 		.ascii	"Mode7Repeat\000"
 6756      37526570 
 6756      65617400 
 6757              	.LASF377:
 6758 0e3c 5654696D 		.ascii	"VTimerEnabled\000"
 6758      6572456E 
 6758      61626C65 
 6758      6400
 6759              	.LASF226:
 6760 0e4a 4C6F524F 		.ascii	"LoROM24MBSMap\000"
 6760      4D32344D 
 6760      42534D61 
 6760      7000
 6761              	.LASF74:
 6762 0e58 53746F70 		.ascii	"StopEmulation\000"
 6762      456D756C 
 6762      6174696F 
 6762      6E00
 6763              	.LASF354:
 6764 0e66 4D617472 		.ascii	"MatrixB\000"
 6764      69784200 
 6765              	.LASF308:
ARM GAS  /tmp/ccV38c0o.s 			page 141


 6766 0e6e 50726576 		.ascii	"PrevMouseX\000"
 6766      4D6F7573 
 6766      655800
 6767              	.LASF352:
 6768 0e79 48564265 		.ascii	"HVBeamCounterLatched\000"
 6768      616D436F 
 6768      756E7465 
 6768      724C6174 
 6768      63686564 
 6769              	.LASF328:
 6770 0e8e 53434261 		.ascii	"SCBase\000"
 6770      736500
 6771              	.LASF152:
 6772 0e95 54757262 		.ascii	"TurboMode\000"
 6772      6F4D6F64 
 6772      6500
 6773              	.LASF490:
 6774 0e9f 2E5F3238 		.ascii	"._28\000"
 6774      00
 6775              	.LASF300:
 6776 0ea4 52656E64 		.ascii	"RenderedScreenWidth\000"
 6776      65726564 
 6776      53637265 
 6776      656E5769 
 6776      64746800 
 6777              	.LASF424:
 6778 0eb8 72323132 		.ascii	"r212c_s\000"
 6778      635F7300 
 6779              	.LASF30:
 6780 0ec0 50434174 		.ascii	"PCAtOpcodeStart\000"
 6780      4F70636F 
 6780      64655374 
 6780      61727400 
 6781              	.LASF72:
 6782 0ed0 50617573 		.ascii	"Paused\000"
 6782      656400
 6783              	.LASF107:
 6784 0ed7 53757065 		.ascii	"SuperScope\000"
 6784      7253636F 
 6784      706500
 6785              	.LASF402:
 6786 0ee2 4F414D57 		.ascii	"OAMWriteRegister\000"
 6786      72697465 
 6786      52656769 
 6786      73746572 
 6786      00
 6787              	.LASF246:
 6788 0ef3 416C6C41 		.ascii	"AllASCII\000"
 6788      53434949 
 6788      00
 6789              	.LASF222:
 6790 0efc 53616665 		.ascii	"Safe\000"
 6790      00
 6791              	.LASF459:
 6792 0f01 4672616D 		.ascii	"FrameAdvanceCount\000"
 6792      65416476 
 6792      616E6365 
ARM GAS  /tmp/ccV38c0o.s 			page 142


 6792      436F756E 
 6792      7400
 6793              	.LASF376:
 6794 0f13 4F414D44 		.ascii	"OAMData\000"
 6794      61746100 
 6795              	.LASF147:
 6796 0f1b 506F7274 		.ascii	"Port\000"
 6796      00
 6797              	.LASF488:
 6798 0f20 74696C65 		.ascii	"tile16add.cpp\000"
 6798      31366164 
 6798      642E6370 
 6798      7000
 6799              	.LASF281:
 6800 0f2e 436F6C6F 		.ascii	"ColorsChanged\000"
 6800      72734368 
 6800      616E6765 
 6800      6400
 6801              	.LASF96:
 6802 0f3c 466F7263 		.ascii	"ForceNoSuperFX\000"
 6802      654E6F53 
 6802      75706572 
 6802      465800
 6803              	.LASF330:
 6804 0f4b 484F6666 		.ascii	"HOffset\000"
 6804      73657400 
 6805              	.LASF71:
 6806 0f53 44697361 		.ascii	"DisableIRQ\000"
 6806      626C6549 
 6806      525100
 6807              	.LASF110:
 6808 0f5e 53687574 		.ascii	"ShutdownMaster\000"
 6808      646F776E 
 6808      4D617374 
 6808      657200
 6809              	.LASF380:
 6810 0f6d 4D6F7361 		.ascii	"Mosaic\000"
 6810      696300
 6811              	.LASF356:
 6812 0f74 4D617472 		.ascii	"MatrixD\000"
 6812      69784400 
 6813              	.LASF20:
 6814 0f7c 53526567 		.ascii	"SRegisters\000"
 6814      69737465 
 6814      727300
 6815              	.LASF75:
 6816 0f87 54726163 		.ascii	"TraceDMA\000"
 6816      65444D41 
 6816      00
 6817              	.LASF229:
 6818 0f90 5F5A4E37 		.ascii	"_ZN7CMemory16SRAM512KLoROMMapEv\000"
 6818      434D656D 
 6818      6F727931 
 6818      36535241 
 6818      4D353132 
 6819              	.LASF99:
 6820 0fb0 466F7263 		.ascii	"ForceSA1\000"
ARM GAS  /tmp/ccV38c0o.s 			page 143


 6820      65534131 
 6820      00
 6821              	.LASF24:
 6822 0fb9 4E4D4941 		.ascii	"NMIActive\000"
 6822      63746976 
 6822      6500
 6823              	.LASF447:
 6824 0fc3 5339784F 		.ascii	"S9xOpcode\000"
 6824      70636F64 
 6824      6500
 6825              	.LASF183:
 6826 0fcd 436F6D70 		.ascii	"CompanyId\000"
 6826      616E7949 
 6826      6400
 6827              	.LASF410:
 6828 0fd7 44656C74 		.ascii	"Delta\000"
 6828      6100
 6829              	.LASF136:
 6830 0fdd 53757070 		.ascii	"SupportHiRes\000"
 6830      6F727448 
 6830      69526573 
 6830      00
 6831              	.LASF190:
 6832 0fea 43616C63 		.ascii	"CalculatedChecksum\000"
 6832      756C6174 
 6832      65644368 
 6832      65636B73 
 6832      756D00
 6833              	.LASF169:
 6834 0ffd 5352414D 		.ascii	"SRAM\000"
 6834      00
 6835              	.LASF244:
 6836 1002 42534869 		.ascii	"BSHiROMMap\000"
 6836      524F4D4D 
 6836      617000
 6837              	.LASF62:
 6838 100d 44535053 		.ascii	"DSPSet\000"
 6838      657400
 6839              	.LASF320:
 6840 1014 2E5F3338 		.ascii	"._38\000"
 6840      00
 6841              	.LASF257:
 6842 1019 5F5A4E37 		.ascii	"_ZN7CMemory10TVStandardEv\000"
 6842      434D656D 
 6842      6F727931 
 6842      30545653 
 6842      74616E64 
 6843              	.LASF298:
 6844 1033 446F7562 		.ascii	"DoubleWidthPixels\000"
 6844      6C655769 
 6844      64746850 
 6844      6978656C 
 6844      7300
 6845              	.LASF33:
 6846 1045 4E657874 		.ascii	"NextEvent\000"
 6846      4576656E 
 6846      7400
ARM GAS  /tmp/ccV38c0o.s 			page 144


 6847              	.LASF9:
 6848 104f 6C6F6E67 		.ascii	"long long unsigned int\000"
 6848      206C6F6E 
 6848      6720756E 
 6848      7369676E 
 6848      65642069 
 6849              	.LASF282:
 6850 1066 48444D41 		.ascii	"HDMA\000"
 6850      00
 6851              	.LASF209:
 6852 106b 5F5A4E37 		.ascii	"_ZN7CMemory4InitEv\000"
 6852      434D656D 
 6852      6F727934 
 6852      496E6974 
 6852      457600
 6853              	.LASF192:
 6854 107e 524F4D43 		.ascii	"ROMComplementChecksum\000"
 6854      6F6D706C 
 6854      656D656E 
 6854      74436865 
 6854      636B7375 
 6855              	.LASF441:
 6856 1094 4E616D65 		.ascii	"NameSelect\000"
 6856      53656C65 
 6856      637400
 6857              	.LASF348:
 6858 109f 56426561 		.ascii	"VBeamPosLatched\000"
 6858      6D506F73 
 6858      4C617463 
 6858      68656400 
 6859              	.LASF54:
 6860 10af 4D656D6F 		.ascii	"Memory_BWRAM\000"
 6860      72795F42 
 6860      5752414D 
 6860      00
 6861              	.LASF435:
 6862 10bc 53697A65 		.ascii	"Sizes\000"
 6862      7300
 6863              	.LASF25:
 6864 10c2 49525141 		.ascii	"IRQActive\000"
 6864      63746976 
 6864      6500
 6865              	.LASF360:
 6866 10cc 4A6F7970 		.ascii	"Joypad2ButtonReadPos\000"
 6866      61643242 
 6866      7574746F 
 6866      6E526561 
 6866      64506F73 
 6867              	.LASF396:
 6868 10e1 4347464C 		.ascii	"CGFLIPRead\000"
 6868      49505265 
 6868      616400
 6869              	.LASF367:
 6870 10ec 5752414D 		.ascii	"WRAM\000"
 6870      00
 6871              	.LASF477:
 6872 10f1 47657442 		.ascii	"GetBank\000"
ARM GAS  /tmp/ccV38c0o.s 			page 145


 6872      616E6B00 
 6873              	.LASF400:
 6874 10f9 4D6F7573 		.ascii	"MouseSpeed\000"
 6874      65537065 
 6874      656400
 6875              	.LASF390:
 6876 1104 436C6970 		.ascii	"ClipWindowOverlapLogic\000"
 6876      57696E64 
 6876      6F774F76 
 6876      65726C61 
 6876      704C6F67 
 6877              	.LASF373:
 6878 111b 4F424A4E 		.ascii	"OBJNameBase\000"
 6878      616D6542 
 6878      61736500 
 6879              	.LASF234:
 6880 1127 4869524F 		.ascii	"HiROMMap\000"
 6880      4D4D6170 
 6880      00
 6881              	.LASF133:
 6882 1130 46697846 		.ascii	"FixFrequency\000"
 6882      72657175 
 6882      656E6379 
 6882      00
 6883              	.LASF479:
 6884 113d 49505055 		.ascii	"IPPU\000"
 6884      00
 6885              	.LASF366:
 6886 1142 53637265 		.ascii	"ScreenHeight\000"
 6886      656E4865 
 6886      69676874 
 6886      00
 6887              	.LASF52:
 6888 114f 4D656D6F 		.ascii	"Memory_BlockIsRAM\000"
 6888      72795F42 
 6888      6C6F636B 
 6888      49735241 
 6888      4D00
 6889              	.LASF182:
 6890 1161 524F4D49 		.ascii	"ROMId\000"
 6890      6400
 6891              	.LASF21:
 6892 1167 53435055 		.ascii	"SCPUState\000"
 6892      53746174 
 6892      6500
 6893              	.LASF292:
 6894 1171 536B6970 		.ascii	"SkippedFrames\000"
 6894      70656446 
 6894      72616D65 
 6894      7300
 6895              	.LASF438:
 6896 117f 42697453 		.ascii	"BitShift\000"
 6896      68696674 
 6896      00
 6897              	.LASF478:
 6898 1188 5369676E 		.ascii	"SignExtend\000"
 6898      45787465 
ARM GAS  /tmp/ccV38c0o.s 			page 146


 6898      6E6400
 6899              	.LASF76:
 6900 1193 54726163 		.ascii	"TraceHDMA\000"
 6900      6548444D 
 6900      4100
 6901              	.LASF254:
 6902 119d 43686563 		.ascii	"CheckForIPSPatch\000"
 6902      6B466F72 
 6902      49505350 
 6902      61746368 
 6902      00
 6903              	.LASF50:
 6904 11ae 4D656D6F 		.ascii	"Memory_WriteMap\000"
 6904      72795F57 
 6904      72697465 
 6904      4D617000 
 6905              	.LASF421:
 6906 11be 4D6F6465 		.ascii	"Mode7Mask\000"
 6906      374D6173 
 6906      6B00
 6907              	.LASF392:
 6908 11c8 436C6970 		.ascii	"ClipWindow2Enable\000"
 6908      57696E64 
 6908      6F773245 
 6908      6E61626C 
 6908      6500
 6909              	.LASF448:
 6910 11da 53494350 		.ascii	"SICPU\000"
 6910      5500
 6911              	.LASF428:
 6912 11e0 72323132 		.ascii	"r212f_s\000"
 6912      665F7300 
 6913              	.LASF297:
 6914 11e8 4C617463 		.ascii	"LatchedInterlace\000"
 6914      68656449 
 6914      6E746572 
 6914      6C616365 
 6914      00
 6915              	.LASF29:
 6916 11f9 50434261 		.ascii	"PCBase\000"
 6916      736500
 6917              	.LASF467:
 6918 1200 54696C65 		.ascii	"TileNumber\000"
 6918      4E756D62 
 6918      657200
 6919              	.LASF206:
 6920 120b 53617665 		.ascii	"SaveSRAM\000"
 6920      5352414D 
 6920      00
 6921              	.LASF57:
 6922 1214 5F41524D 		.ascii	"_ARM_asm_padding2\000"
 6922      5F61736D 
 6922      5F706164 
 6922      64696E67 
 6922      3200
 6923              	.LASF204:
 6924 1226 4C6F6164 		.ascii	"LoadSRAM\000"
ARM GAS  /tmp/ccV38c0o.s 			page 147


 6924      5352414D 
 6924      00
 6925              	.LASF272:
 6926 122f 524F4D49 		.ascii	"ROMID\000"
 6926      4400
 6927              	.LASF290:
 6928 1235 52656E64 		.ascii	"RenderedFramesCount\000"
 6928      65726564 
 6928      4672616D 
 6928      6573436F 
 6928      756E7400 
 6929              	.LASF416:
 6930 1249 44657074 		.ascii	"DepthDelta\000"
 6930      6844656C 
 6930      746100
 6931              	.LASF319:
 6932 1254 53505055 		.ascii	"SPPU\000"
 6932      00
 6933              	.LASF483:
 6934 1259 5339784F 		.ascii	"S9xOpcodesM0X0\000"
 6934      70636F64 
 6934      65734D30 
 6934      583000
 6935              	.LASF388:
 6936 1268 57696E64 		.ascii	"Window2Right\000"
 6936      6F773252 
 6936      69676874 
 6936      00
 6937              	.LASF115:
 6938 1275 44535031 		.ascii	"DSP1Master\000"
 6938      4D617374 
 6938      657200
 6939              	.LASF64:
 6940 1280 53536574 		.ascii	"SSettings\000"
 6940      74696E67 
 6940      7300
 6941              	.LASF31:
 6942 128a 57616974 		.ascii	"WaitAddress\000"
 6942      41646472 
 6942      65737300 
 6943              	.LASF454:
 6944 1296 43505545 		.ascii	"CPUExecuting\000"
 6944      78656375 
 6944      74696E67 
 6944      00
 6945              	.LASF378:
 6946 12a3 4854696D 		.ascii	"HTimerEnabled\000"
 6946      6572456E 
 6946      61626C65 
 6946      6400
 6947              	.LASF261:
 6948 12b1 5F5A4E37 		.ascii	"_ZN7CMemory13StaticRAMSizeEv\000"
 6948      434D656D 
 6948      6F727931 
 6948      33537461 
 6948      74696352 
 6949              	.LASF359:
ARM GAS  /tmp/ccV38c0o.s 			page 148


 6950 12ce 4A6F7970 		.ascii	"Joypad1ButtonReadPos\000"
 6950      61643142 
 6950      7574746F 
 6950      6E526561 
 6950      64506F73 
 6951              	.LASF13:
 6952 12e3 75696E74 		.ascii	"uint8\000"
 6952      3800
 6953              	.LASF326:
 6954 12e9 53686966 		.ascii	"Shift\000"
 6954      7400
 6955              	.LASF312:
 6956 12ef 48506F73 		.ascii	"HPos\000"
 6956      00
 6957              	.LASF143:
 6958 12f4 44697370 		.ascii	"DisplayFrameRate\000"
 6958      6C617946 
 6958      72616D65 
 6958      52617465 
 6958      00
 6959              	.LASF345:
 6960 1305 4F414D54 		.ascii	"OAMTileAddress\000"
 6960      696C6541 
 6960      64647265 
 6960      737300
 6961              	.LASF7:
 6962 1314 73686F72 		.ascii	"short int\000"
 6962      7420696E 
 6962      7400
 6963              	.LASF94:
 6964 131e 466F7263 		.ascii	"ForceNotInterleaved\000"
 6964      654E6F74 
 6964      496E7465 
 6964      726C6561 
 6964      76656400 
 6965              	.LASF355:
 6966 1332 4D617472 		.ascii	"MatrixC\000"
 6966      69784300 
 6967              	.LASF338:
 6968 133a 4347464C 		.ascii	"CGFLIP\000"
 6968      495000
 6969              	.LASF63:
 6970 1341 72737461 		.ascii	"rstatus\000"
 6970      74757300 
 6971              	.LASF411:
 6972 1349 5A45524F 		.ascii	"ZERO_OR_X2\000"
 6972      5F4F525F 
 6972      583200
 6973              	.LASF149:
 6974 1354 4F70656E 		.ascii	"OpenGLEnable\000"
 6974      474C456E 
 6974      61626C65 
 6974      00
 6975              	.LASF357:
 6976 1361 43656E74 		.ascii	"CentreX\000"
 6976      72655800 
 6977              	.LASF148:
ARM GAS  /tmp/ccV38c0o.s 			page 149


 6978 1369 476C6964 		.ascii	"GlideEnable\000"
 6978      65456E61 
 6978      626C6500 
 6979              	.LASF383:
 6980 1375 4D6F6465 		.ascii	"Mode7VFlip\000"
 6980      3756466C 
 6980      697000
 6981              	.LASF285:
 6982 1380 4C617463 		.ascii	"LatchedBlanking\000"
 6982      68656442 
 6982      6C616E6B 
 6982      696E6700 
 6983              	.LASF294:
 6984 1390 54696C65 		.ascii	"TileCache\000"
 6984      43616368 
 6984      6500
 6985              	.LASF265:
 6986 139a 5F5A4E37 		.ascii	"_ZN7CMemory7MapModeEv\000"
 6986      434D656D 
 6986      6F727937 
 6986      4D61704D 
 6986      6F646545 
 6987              	.LASF266:
 6988 13b0 4B617274 		.ascii	"KartContents\000"
 6988      436F6E74 
 6988      656E7473 
 6988      00
 6989              	.LASF181:
 6990 13bd 524F4D4E 		.ascii	"ROMName\000"
 6990      616D6500 
 6991              	.LASF466:
 6992 13c5 54696C65 		.ascii	"TileAddr\000"
 6992      41646472 
 6992      00
 6993              	.LASF492:
 6994 13ce 5F5A4E37 		.ascii	"_ZN7CMemory7caCRC32EPhjj\000"
 6994      434D656D 
 6994      6F727937 
 6994      63614352 
 6994      43333245 
 6995              	.LASF139:
 6996 13e7 44697361 		.ascii	"DisableGraphicWindows\000"
 6996      626C6547 
 6996      72617068 
 6996      69635769 
 6996      6E646F77 
 6997              	.LASF363:
 6998 13fd 46697865 		.ascii	"FixedColourGreen\000"
 6998      64436F6C 
 6998      6F757247 
 6998      7265656E 
 6998      00
 6999              	.LASF350:
 7000 140e 48426561 		.ascii	"HBeamFlip\000"
 7000      6D466C69 
 7000      7000
 7001              	.LASF434:
ARM GAS  /tmp/ccV38c0o.s 			page 150


 7002 1418 4F424A4C 		.ascii	"OBJList\000"
 7002      69737400 
 7003              	.LASF214:
 7004 1420 57726974 		.ascii	"WriteProtectROM\000"
 7004      6550726F 
 7004      74656374 
 7004      524F4D00 
 7005              	.LASF369:
 7006 1430 466F7263 		.ascii	"ForcedBlanking\000"
 7006      6564426C 
 7006      616E6B69 
 7006      6E6700
 7007              	.LASF391:
 7008 143f 436C6970 		.ascii	"ClipWindow1Enable\000"
 7008      57696E64 
 7008      6F773145 
 7008      6E61626C 
 7008      6500
 7009              	.LASF32:
 7010 1451 57616974 		.ascii	"WaitCounter\000"
 7010      436F756E 
 7010      74657200 
 7011              	.LASF79:
 7012 145d 54726163 		.ascii	"TraceDSP\000"
 7012      65445350 
 7012      00
 7013              	.LASF145:
 7014 1466 4E657450 		.ascii	"NetPlayServer\000"
 7014      6C617953 
 7014      65727665 
 7014      7200
 7015              	.LASF315:
 7016 1474 56466C69 		.ascii	"VFlip\000"
 7016      7000
 7017              	.LASF84:
 7018 147a 4672616D 		.ascii	"FrameTimePAL\000"
 7018      6554696D 
 7018      6550414C 
 7018      00
 7019              	.LASF111:
 7020 1487 4D756C74 		.ascii	"MultiPlayer5Master\000"
 7020      69506C61 
 7020      79657235 
 7020      4D617374 
 7020      657200
 7021              	.LASF453:
 7022 149a 5F4F7665 		.ascii	"_Overflow\000"
 7022      72666C6F 
 7022      7700
 7023              	.LASF249:
 7024 14a4 5F5A4E37 		.ascii	"_ZN7CMemory10ScoreHiROMEh\000"
 7024      434D656D 
 7024      6F727931 
 7024      3053636F 
 7024      72654869 
 7025              	.LASF45:
 7026 14be 42524B54 		.ascii	"BRKTriggered\000"
ARM GAS  /tmp/ccV38c0o.s 			page 151


 7026      72696767 
 7026      65726564 
 7026      00
 7027              	.LASF263:
 7028 14cb 5F5A4E37 		.ascii	"_ZN7CMemory7MapTypeEv\000"
 7028      434D656D 
 7028      6F727937 
 7028      4D617054 
 7028      79706545 
 7029              	.LASF125:
 7030 14e1 44697361 		.ascii	"DisableSoundEcho\000"
 7030      626C6553 
 7030      6F756E64 
 7030      4563686F 
 7030      00
 7031              	.LASF220:
 7032 14f2 4D617045 		.ascii	"MapExtraRAM\000"
 7032      78747261 
 7032      52414D00 
 7033              	.LASF258:
 7034 14fe 53706565 		.ascii	"Speed\000"
 7034      6400
 7035              	.LASF253:
 7036 1504 5F5A4E37 		.ascii	"_ZN7CMemory13ApplyROMFixesEv\000"
 7036      434D656D 
 7036      6F727931 
 7036      33417070 
 7036      6C79524F 
 7037              	.LASF122:
 7038 1521 536F756E 		.ascii	"SoundBufferSize\000"
 7038      64427566 
 7038      66657253 
 7038      697A6500 
 7039              	.LASF409:
 7040 1531 50697463 		.ascii	"Pitch\000"
 7040      6800
 7041              	.LASF216:
 7042 1537 46697852 		.ascii	"FixROMSpeed\000"
 7042      4F4D5370 
 7042      65656400 
 7043              	.LASF463:
 7044 1543 53746172 		.ascii	"StartLine\000"
 7044      744C696E 
 7044      6500
 7045              	.LASF476:
 7046 154d 4D656D6F 		.ascii	"Memory\000"
 7046      727900
 7047              	.LASF346:
 7048 1554 49525156 		.ascii	"IRQVBeamPos\000"
 7048      4265616D 
 7048      506F7300 
 7049              	.LASF233:
 7050 1560 5F5A4E37 		.ascii	"_ZN7CMemory19SufamiTurboLoROMMapEv\000"
 7050      434D656D 
 7050      6F727931 
 7050      39537566 
 7050      616D6954 
ARM GAS  /tmp/ccV38c0o.s 			page 152


 7051              	.LASF385:
 7052 1583 57696E64 		.ascii	"Window1Left\000"
 7052      6F77314C 
 7052      65667400 
 7053              	.LASF22:
 7054 158f 466C6167 		.ascii	"Flags\000"
 7054      7300
 7055              	.LASF481:
 7056 1595 5339784F 		.ascii	"S9xOpcodesM1X0\000"
 7056      70636F64 
 7056      65734D31 
 7056      583000
 7057              	.LASF480:
 7058 15a4 5339784F 		.ascii	"S9xOpcodesM1X1\000"
 7058      70636F64 
 7058      65734D31 
 7058      583100
 7059              	.LASF166:
 7060 15b3 53706565 		.ascii	"SpeedHacks\000"
 7060      64486163 
 7060      6B7300
 7061              	.LASF337:
 7062 15be 42726967 		.ascii	"Brightness\000"
 7062      68746E65 
 7062      737300
 7063              	.LASF349:
 7064 15c9 48426561 		.ascii	"HBeamPosLatched\000"
 7064      6D506F73 
 7064      4C617463 
 7064      68656400 
 7065              	.LASF205:
 7066 15d9 5F5A4E37 		.ascii	"_ZN7CMemory8LoadSRAMEPKc\000"
 7066      434D656D 
 7066      6F727938 
 7066      4C6F6164 
 7066      5352414D 
 7067              	.LASF163:
 7068 15f2 41505552 		.ascii	"APURAMInitialValue\000"
 7068      414D496E 
 7068      69746961 
 7068      6C56616C 
 7068      756500
 7069              	.LASF286:
 7070 1605 4F424A43 		.ascii	"OBJChanged\000"
 7070      68616E67 
 7070      656400
 7071              	.LASF473:
 7072 1610 726F7073 		.ascii	"rops\000"
 7072      00
 7073              	.LASF184:
 7074 1615 524F4D53 		.ascii	"ROMSpeed\000"
 7074      70656564 
 7074      00
 7075              	.LASF67:
 7076 161e 536F756E 		.ascii	"SoundSkipMethod\000"
 7076      64536B69 
 7076      704D6574 
ARM GAS  /tmp/ccV38c0o.s 			page 153


 7076      686F6400 
 7077              	.LASF179:
 7078 162e 426C6F63 		.ascii	"BlockIsRAM\000"
 7078      6B497352 
 7078      414D00
 7079              	.LASF252:
 7080 1639 4170706C 		.ascii	"ApplyROMFixes\000"
 7080      79524F4D 
 7080      46697865 
 7080      7300
 7081              	.LASF129:
 7082 1647 496E7465 		.ascii	"InterpolatedSound\000"
 7082      72706F6C 
 7082      61746564 
 7082      536F756E 
 7082      6400
 7083              	.LASF291:
 7084 1659 44697370 		.ascii	"DisplayedRenderedFrameCount\000"
 7084      6C617965 
 7084      6452656E 
 7084      64657265 
 7084      64467261 
 7085              	.LASF112:
 7086 1675 53757065 		.ascii	"SuperScopeMaster\000"
 7086      7253636F 
 7086      70654D61 
 7086      73746572 
 7086      00
 7087              	.LASF276:
 7088 1686 436C6970 		.ascii	"ClipData\000"
 7088      44617461 
 7088      00
 7089              	.LASF245:
 7090 168f 5F5A4E37 		.ascii	"_ZN7CMemory10BSHiROMMapEv\000"
 7090      434D656D 
 7090      6F727931 
 7090      30425348 
 7090      69524F4D 
 7091              	.LASF81:
 7092 16a9 4A6F7973 		.ascii	"JoystickEnabled\000"
 7092      7469636B 
 7092      456E6162 
 7092      6C656400 
 7093              	.LASF238:
 7094 16b9 54616C65 		.ascii	"TalesROMMap\000"
 7094      73524F4D 
 7094      4D617000 
 7095              	.LASF365:
 7096 16c5 53617665 		.ascii	"SavedOAMAddr\000"
 7096      644F414D 
 7096      41646472 
 7096      00
 7097              	.LASF280:
 7098 16d2 496E7465 		.ascii	"InternalPPU\000"
 7098      726E616C 
 7098      50505500 
 7099              	.LASF415:
ARM GAS  /tmp/ccV38c0o.s 			page 154


 7100 16de 50616C65 		.ascii	"PaletteShift\000"
 7100      74746553 
 7100      68696674 
 7100      00
 7101              	.LASF180:
 7102 16eb 426C6F63 		.ascii	"BlockIsROM\000"
 7102      6B497352 
 7102      4F4D00
 7103              	.LASF303:
 7104 16f6 53637265 		.ascii	"ScreenColors\000"
 7104      656E436F 
 7104      6C6F7273 
 7104      00
 7105              	.LASF311:
 7106 1703 534F424A 		.ascii	"SOBJ\000"
 7106      00
 7107              	.LASF116:
 7108 1708 53444431 		.ascii	"SDD1\000"
 7108      00
 7109              	.LASF69:
 7110 170d 48426C61 		.ascii	"HBlankStart\000"
 7110      6E6B5374 
 7110      61727400 
 7111              	.LASF333:
 7112 1719 53435369 		.ascii	"SCSize\000"
 7112      7A6500
 7113              	.LASF316:
 7114 1720 48466C69 		.ascii	"HFlip\000"
 7114      7000
 7115              	.LASF68:
 7116 1726 485F4D61 		.ascii	"H_Max\000"
 7116      7800
 7117              	.LASF339:
 7118 172c 43474441 		.ascii	"CGDATA\000"
 7118      544100
 7119              	.LASF150:
 7120 1733 4175746F 		.ascii	"AutoSaveDelay\000"
 7120      53617665 
 7120      44656C61 
 7120      7900
 7121              	.LASF242:
 7122 1741 53413152 		.ascii	"SA1ROMMap\000"
 7122      4F4D4D61 
 7122      7000
 7123              	.LASF472:
 7124 174b 57696474 		.ascii	"Width\000"
 7124      6800
 7125              	.LASF461:
 7126 1751 54696C65 		.ascii	"Tile\000"
 7126      00
 7127              	.LASF371:
 7128 1756 4F424A54 		.ascii	"OBJThroughSub\000"
 7128      68726F75 
 7128      67685375 
 7128      6200
 7129              	.LASF80:
 7130 1764 53776170 		.ascii	"SwapJoypads\000"
ARM GAS  /tmp/ccV38c0o.s 			page 155


 7130      4A6F7970 
 7130      61647300 
 7131              	.LASF17:
 7132 1770 696E7433 		.ascii	"int32\000"
 7132      3200
 7133              	.LASF100:
 7134 1776 466F7263 		.ascii	"ForceNoSA1\000"
 7134      654E6F53 
 7134      413100
 7135              	.LASF283:
 7136 1781 48444D41 		.ascii	"HDMAStarted\000"
 7136      53746172 
 7136      74656400 
 7137              	.LASF162:
 7138 178d 44616666 		.ascii	"DaffyDuck\000"
 7138      79447563 
 7138      6B00
 7139              	.LASF271:
 7140 1797 5F5A4E37 		.ascii	"_ZN7CMemory7HeadersEv\000"
 7140      434D656D 
 7140      6F727937 
 7140      48656164 
 7140      65727345 
 7141              	.LASF403:
 7142 17ad 42476E78 		.ascii	"BGnxOFSbyte\000"
 7142      4F465362 
 7142      79746500 
 7143              	.LASF379:
 7144 17b9 4854696D 		.ascii	"HTimerPosition\000"
 7144      6572506F 
 7144      73697469 
 7144      6F6E00
 7145              	.LASF404:
 7146 17c8 53474658 		.ascii	"SGFX\000"
 7146      00
 7147              	.LASF334:
 7148 17cd 4F666673 		.ascii	"OffsetsChanged\000"
 7148      65747343 
 7148      68616E67 
 7148      656400
 7149              	.LASF43:
 7150 17dc 57686963 		.ascii	"WhichEvent\000"
 7150      68457665 
 7150      6E7400
 7151              	.LASF203:
 7152 17e7 5F5A4E37 		.ascii	"_ZN7CMemory7InitROMEh\000"
 7152      434D656D 
 7152      6F727937 
 7152      496E6974 
 7152      524F4D45 
 7153              	.LASF14:
 7154 17fd 75696E74 		.ascii	"uint16\000"
 7154      313600
 7155              	.LASF170:
 7156 1804 42575241 		.ascii	"BWRAM\000"
 7156      4D00
 7157              	.LASF27:
ARM GAS  /tmp/ccV38c0o.s 			page 156


 7158 180a 52656773 		.ascii	"Regs\000"
 7158      00
 7159              	.LASF457:
 7160 180f 4672616D 		.ascii	"Frame\000"
 7160      6500
 7161              	.LASF55:
 7162 1815 4D656D6F 		.ascii	"Memory_SRAMMask\000"
 7162      72795F53 
 7162      52414D4D 
 7162      61736B00 
 7163              	.LASF78:
 7164 1825 54726163 		.ascii	"TraceUnknownRegisters\000"
 7164      65556E6B 
 7164      6E6F776E 
 7164      52656769 
 7164      73746572 
 7165              	.LASF165:
 7166 183b 61736D73 		.ascii	"asmspc700\000"
 7166      70633730 
 7166      3000
 7167              	.LASF51:
 7168 1845 4D656D6F 		.ascii	"Memory_MemorySpeed\000"
 7168      72795F4D 
 7168      656D6F72 
 7168      79537065 
 7168      656400
 7169              	.LASF460:
 7170 1858 44726177 		.ascii	"DrawTile16Add\000"
 7170      54696C65 
 7170      31364164 
 7170      6400
 7171              	.LASF173:
 7172 1866 4869524F 		.ascii	"HiROM\000"
 7172      4D00
 7173              	.LASF97:
 7174 186c 466F7263 		.ascii	"ForceDSP1\000"
 7174      65445350 
 7174      3100
 7175              	.LASF331:
 7176 1876 42475369 		.ascii	"BGSize\000"
 7176      7A6500
 7177              		.ident	"GCC: (GNU) 4.1.1"
