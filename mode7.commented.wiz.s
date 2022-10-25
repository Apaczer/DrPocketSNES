ARM GAS  /tmp/ccNOn6pJ.s 			page 1


   1              		.file	"mode7.cpp"
   2              		.section	.debug_abbrev,"",%progbits
   3              	.Ldebug_abbrev0:
   4              		.section	.debug_info,"",%progbits
   5              	.Ldebug_info0:
   6              		.section	.debug_line,"",%progbits
   7              	.Ldebug_line0:
   8 0000 A2030000 		.text
   8      02009700 
   8      00000201 
   8      FB0E0A00 
   8      01010101 
   9              	.Ltext0:
  10              		.align	2
  11              		.p2align 5,,31
  12              		.global	_Z25DrawBGMode7Background16R3Phii
  13              		.type	_Z25DrawBGMode7Background16R3Phii, %function
  14              	_Z25DrawBGMode7Background16R3Phii:
  15              	.LFB29:
  16              		.file 1 "mode7.cpp"
   1:mode7.cpp     **** #include "snes9x.h"
   2:mode7.cpp     **** #include "memmap.h"
   3:mode7.cpp     **** #include "ppu.h"
   4:mode7.cpp     **** #include "cpuexec.h"
   5:mode7.cpp     **** #include "display.h"
   6:mode7.cpp     **** #include "gfx.h"
   7:mode7.cpp     **** #include "apu.h"
   8:mode7.cpp     **** 
   9:mode7.cpp     **** extern struct SLineData LineData[240];
  10:mode7.cpp     **** extern struct SLineMatrixData LineMatrixData [240];
  11:mode7.cpp     **** extern uint8  Mode7Depths [2];
  12:mode7.cpp     **** 
  13:mode7.cpp     **** #define M7 19
  14:mode7.cpp     **** 
  15:mode7.cpp     **** /*
  16:mode7.cpp     **** void DrawBGMode7Background16 (uint8 *Screen, int bg, int depth)
  17:mode7.cpp     **** {
  18:mode7.cpp     ****     RENDER_BACKGROUND_MODE7ADDSUB (depth, GFX.ScreenColors [b & 0xff]);
  19:mode7.cpp     **** }
  20:mode7.cpp     **** */
  21:mode7.cpp     **** 
  22:mode7.cpp     **** #ifdef __DEBUG__
  23:mode7.cpp     ****  
  24:mode7.cpp     **** 	#define DMSG(rop) printf("Rendering Mode7 w/prio, ROp: " rop ", R:%d, r2130: %d, bg: %d\n", PPU.Mo
  25:mode7.cpp     **** #else
  26:mode7.cpp     **** 	#define DMSG(rop)
  27:mode7.cpp     **** #endif
  28:mode7.cpp     **** 
  29:mode7.cpp     **** void DrawBGMode7Background16R0 (uint8 *Screen, int bg, int depth);
  30:mode7.cpp     **** void DrawBGMode7Background16R1R2 (uint8 *Screen, int bg, int depth);
  31:mode7.cpp     **** void DrawBGMode7Background16R3 (uint8 *Screen, int bg, int depth);
  32:mode7.cpp     **** 
  33:mode7.cpp     **** void DrawBGMode7Background16 (uint8 *Screen, int bg, int depth)
  34:mode7.cpp     **** {
  35:mode7.cpp     **** 	DMSG("opaque");
  36:mode7.cpp     ****     CHECK_SOUND(); 
  37:mode7.cpp     **** 
ARM GAS  /tmp/ccNOn6pJ.s 			page 2


  38:mode7.cpp     ****     if (GFX.r2130 & 1) { 
  39:mode7.cpp     **** 		if (IPPU.DirectColourMapsNeedRebuild) S9xBuildDirectColourMaps (); 
  40:mode7.cpp     **** 		GFX.ScreenColors = DirectColourMaps [0]; 
  41:mode7.cpp     ****     } else  GFX.ScreenColors = IPPU.ScreenColors;
  42:mode7.cpp     **** 
  43:mode7.cpp     **** 	switch (PPU.Mode7Repeat) {
  44:mode7.cpp     **** 		case 0: 
  45:mode7.cpp     **** 			DrawBGMode7Background16R0(Screen, bg, depth);
  46:mode7.cpp     **** 			return;
  47:mode7.cpp     **** 		case 3:
  48:mode7.cpp     **** 			DrawBGMode7Background16R3(Screen, bg, depth);
  49:mode7.cpp     **** 			return;
  50:mode7.cpp     **** 		default:
  51:mode7.cpp     **** 			DrawBGMode7Background16R1R2(Screen, bg, depth);
  52:mode7.cpp     **** 			return;
  53:mode7.cpp     **** 	} 
  54:mode7.cpp     **** }
  55:mode7.cpp     **** 
  56:mode7.cpp     **** #define M7C	0x1fff
  57:mode7.cpp     **** 
  58:mode7.cpp     **** void DrawBGMode7Background16R3 (uint8 *Screen, int bg, int depth)
  17              		.loc 1 58 0
  18              		@ args = 0, pretend = 0, frame = 136
  19              		@ frame_needed = 0, uses_anonymous_args = 0
  20              	.LVL0:
  21              	.LBB2:
  59:mode7.cpp     **** {
  60:mode7.cpp     ****     int aa, cc;  
  61:mode7.cpp     ****     int startx; 
  62:mode7.cpp     ****     uint32 Left = 0; 
  63:mode7.cpp     ****     uint32 Right = 256; 
  64:mode7.cpp     ****     uint32 ClipCount = GFX.pCurrentClip->Count [0]; 
  22              		.loc 1 64 0
  23 0000 90C39FE5 		ldr	ip, .L20
  24              	.LBE2:
  25              		.loc 1 58 0
  26 0004 F04F2DE9 		stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
  27              	.LCFI0:
  28              	.LBB3:
  65:mode7.cpp     ****     
  66:mode7.cpp     ****     int32 HOffset; 
  67:mode7.cpp     ****     int32 VOffset; 
  68:mode7.cpp     ****     int32 CentreX; 
  69:mode7.cpp     ****     int32 CentreY;
  70:mode7.cpp     ****     uint8 *d;
  71:mode7.cpp     ****     uint16 *p;
  72:mode7.cpp     ****     int dir;
  73:mode7.cpp     ****     int yy; 
  74:mode7.cpp     ****     int xx; 
  75:mode7.cpp     ****     int yy3;
  76:mode7.cpp     ****     int xx3;
  77:mode7.cpp     ****     int BB; 
  78:mode7.cpp     ****     int DD; 
  79:mode7.cpp     ****     uint32 Line;
  80:mode7.cpp     ****     uint32 clip; 
  81:mode7.cpp     ****     uint8 b; 
  82:mode7.cpp     ****     uint8 *Depth;
ARM GAS  /tmp/ccNOn6pJ.s 			page 3


  83:mode7.cpp     **** 
  84:mode7.cpp     ****     if (!ClipCount) ClipCount = 1; 
  85:mode7.cpp     **** 
  86:mode7.cpp     ****     Screen += GFX.StartY * GFX_PITCH; 
  29              		.loc 1 86 0
  30 0008 48109CE5 		ldr	r1, [ip, #72]
  31              	.LVL1:
  32              		.loc 1 64 0
  33 000c 50309CE5 		ldr	r3, [ip, #80]
  34              	.LBE3:
  35              		.loc 1 58 0
  36 0010 88D04DE2 		sub	sp, sp, #136
  37              	.LCFI1:
  38              	.LBB4:
  39              		.loc 1 86 0
  40 0014 00108DE5 		str	r1, [sp, #0]
  41              	.LVL2:
  42              		.loc 1 64 0
  43 0018 30308DE5 		str	r3, [sp, #48]
  87:mode7.cpp     ****     Depth = GFX.DB + GFX.StartY * GFX_PPL;
  88:mode7.cpp     ****     struct SLineMatrixData *l = &LineMatrixData [GFX.StartY]; 
  89:mode7.cpp     **** 
  90:mode7.cpp     ****     for (Line = GFX.StartY; Line <= GFX.EndY; Line++, Screen += GFX_PITCH, Depth += GFX_PPL, l++) {
  91:mode7.cpp     **** 	HOffset = ((int32) LineData[Line].BG[0].HOffset << M7) >> M7; 
  92:mode7.cpp     **** 	VOffset = ((int32) LineData[Line].BG[0].VOffset << M7) >> M7; 
  93:mode7.cpp     **** 
  94:mode7.cpp     **** 	CentreX = ((int32) l->CentreX << M7) >> M7; 
  95:mode7.cpp     **** 	CentreY = ((int32) l->CentreY << M7) >> M7; 
  96:mode7.cpp     **** 
  97:mode7.cpp     **** 	if (PPU.Mode7VFlip) yy = 255 - (int) Line; 
  98:mode7.cpp     **** 	else yy = Line; 
  99:mode7.cpp     **** 
 100:mode7.cpp     **** 	yy += VOffset - CentreY;
 101:mode7.cpp     **** 	xx = HOffset - CentreX;
 102:mode7.cpp     **** 
 103:mode7.cpp     **** 	BB = l->MatrixB * yy + (CentreX << 8); 
 104:mode7.cpp     **** 	DD = l->MatrixD * yy + (CentreY << 8); 
 105:mode7.cpp     **** 	
 106:mode7.cpp     **** 	yy3 = ((yy + CentreY) & 7) << 4;
 107:mode7.cpp     **** 
 108:mode7.cpp     **** 	for (clip = 0; clip < ClipCount; clip++) 
 109:mode7.cpp     **** 	{ 
 110:mode7.cpp     **** 	    if (GFX.pCurrentClip->Count [0]){ 
 111:mode7.cpp     **** 			Left = GFX.pCurrentClip->Left [clip][0]; 
 112:mode7.cpp     **** 			Right = GFX.pCurrentClip->Right [clip][0]; 
 113:mode7.cpp     **** 			if (Right <= Left) continue; 
 114:mode7.cpp     **** 	    	} 
 115:mode7.cpp     **** 	    p = (uint16 *) Screen + Left; 
 116:mode7.cpp     **** 	    d = Depth + Left;
 117:mode7.cpp     **** 
 118:mode7.cpp     **** 	    if (PPU.Mode7HFlip) { 
 119:mode7.cpp     **** 			startx = Right - 1; 
 120:mode7.cpp     **** 			aa = -l->MatrixA; 
 121:mode7.cpp     **** 			cc = -l->MatrixC;
 122:mode7.cpp     **** 			dir = -1;
 123:mode7.cpp     **** 	    } else { 
 124:mode7.cpp     **** 			startx = Left; 
ARM GAS  /tmp/ccNOn6pJ.s 			page 4


 125:mode7.cpp     **** 			aa = l->MatrixA; 
 126:mode7.cpp     **** 			cc = l->MatrixC;
 127:mode7.cpp     **** 			dir = 1;
 128:mode7.cpp     **** 	    } 
 129:mode7.cpp     **** 
 130:mode7.cpp     **** 
 131:mode7.cpp     **** 		xx3 = (startx + HOffset);
 132:mode7.cpp     **** 
 133:mode7.cpp     **** 		asm volatile (
 134:mode7.cpp     **** 		"1:						\n"
 135:mode7.cpp     **** 		"	ldrb	r0, [%[d]], #1			\n"
 136:mode7.cpp     **** 		"	add	%[p], %[p], #2			\n"
 137:mode7.cpp     **** 		"	cmp	%[depth], r0			\n"
 138:mode7.cpp     **** 		"	bls	4f				\n"
 139:mode7.cpp     **** 		"	mov	r3, %[AA], asr #18		\n"	
 140:mode7.cpp     **** 		"	orrs	r3, r3, %[CC], asr #18		\n"			
 141:mode7.cpp     **** 		"	bne	2f				\n" 
 142:mode7.cpp     **** 		"						\n"
 143:mode7.cpp     **** 		"	mov	r3, %[CC], asr #11		\n"  
 144:mode7.cpp     **** 		"	mov	r1, %[AA], asr #11		\n" 
 145:mode7.cpp     **** 		"	add	r3, r1, r3, lsl #7		\n" 
 146:mode7.cpp     **** 		//"	mov	r3, r3, lsl #1			\n"
 147:mode7.cpp     **** 		"	ldrb	r3, [%[VRAM], r3, lsl #1]	\n"
 148:mode7.cpp     **** 		"						\n"
 149:mode7.cpp     **** 		"	and	r1, %[CC], #(7 << 8)		\n"
 150:mode7.cpp     **** 		"	add	r3, %[VRAM], r3, lsl #7		\n"
 151:mode7.cpp     **** 		"	and	r0, %[AA], #(7 << 8)		\n"
 152:mode7.cpp     **** 		"	add	r3, r3, r1, asr #4 		\n"
 153:mode7.cpp     **** 		"	add	r3, r3, r0, asr #7		\n"
 154:mode7.cpp     **** 		"						\n"
 155:mode7.cpp     **** 		"	ldr	r1, %[daa]			\n"
 156:mode7.cpp     **** 		"	ldrb	r0, [r3, #1]			\n"
 157:mode7.cpp     **** 		"	add	%[AA], %[AA], r1		\n"
 158:mode7.cpp     **** 		"	cmp	r0, #0				\n"		
 159:mode7.cpp     **** 		"	ldrne	r1, [%[colors], r0, lsl #2]	\n"	
 160:mode7.cpp     **** 		"	add	%[xx3], %[xx3], %[dir]		\n"
 161:mode7.cpp     **** 		"	strneb	%[depth], [%[d], #-1]		\n"
 162:mode7.cpp     **** 		"	ldr	r0, %[dcc]			\n"
 163:mode7.cpp     **** 		"	strneh	r1, [%[p], #-2]			\n"		
 164:mode7.cpp     **** 		"						\n"
 165:mode7.cpp     **** 		"	add	%[CC], %[CC], r0		\n"
 166:mode7.cpp     **** 		//"	add	%[d], %[d], #1			\n"
 167:mode7.cpp     **** 		//"	add	%[p], %[p], #2			\n"
 168:mode7.cpp     **** 		"	subs	%[x], %[x], #1			\n"
 169:mode7.cpp     **** 		"	bne	1b				\n"
 170:mode7.cpp     **** 		"	b	3f				\n"
 171:mode7.cpp     **** 		"2:						\n"
 172:mode7.cpp     **** 		//"	and	r1, %[yy3], #7			\n"
 173:mode7.cpp     **** 		"	and	r0, %[xx3], #7			\n"
 174:mode7.cpp     **** 		//"	mov	r3, r1, lsl #4 			\n"
 175:mode7.cpp     **** 		"	add	r3, %[yy3], r0, lsl #1 		\n"
 176:mode7.cpp     **** 		"						\n"
 177:mode7.cpp     **** 		"	add	r3, %[VRAM], r3			\n"
 178:mode7.cpp     **** 		"	ldrb	r0, [r3, #1]			\n"
 179:mode7.cpp     **** 		"	cmp	r0, #0				\n"		
 180:mode7.cpp     **** 		"	ldrne	r1, [%[colors], r0, lsl #2]	\n"	
 181:mode7.cpp     **** 		"	strneb	%[depth], [%[d], #-1]		\n"
ARM GAS  /tmp/ccNOn6pJ.s 			page 5


 182:mode7.cpp     **** 		"	strneh	r1, [%[p], #-2]			\n"		
 183:mode7.cpp     **** 		"4:						\n"
 184:mode7.cpp     **** 		"	ldr	r0, %[daa]			\n"
 185:mode7.cpp     **** 		"	ldr	r1, %[dcc]			\n"
 186:mode7.cpp     **** 		"	add	%[xx3], %[xx3], %[dir]		\n"
 187:mode7.cpp     **** 		"	add	%[AA], %[AA], r0		\n"
 188:mode7.cpp     **** 		"	add	%[CC], %[CC], r1		\n"
 189:mode7.cpp     **** 		//"	add	%[p], %[p], #2			\n"
 190:mode7.cpp     **** 		//"	add	%[d], %[d], #1			\n"
 191:mode7.cpp     **** 		"	subs	%[x], %[x], #1			\n"
 192:mode7.cpp     **** 		"	bne	1b				\n"
 193:mode7.cpp     **** 		"3:						\n"
 194:mode7.cpp     **** 		:
 195:mode7.cpp     **** 		: [x] "r" (Right - Left),
 196:mode7.cpp     **** 		  [AA] "r" (l->MatrixA * (startx + xx) + BB),
 197:mode7.cpp     **** 		  [CC] "r" (l->MatrixC * (startx + xx) + DD),
 198:mode7.cpp     **** 		  [daa] "m" (aa),
 199:mode7.cpp     **** 		  [dcc] "m" (cc),
 200:mode7.cpp     **** 		  [VRAM] "r" (Memory.VRAM),
 201:mode7.cpp     **** 		  [colors] "r" (GFX.ScreenColors),
 202:mode7.cpp     **** 		  [p] "r" (p),
 203:mode7.cpp     **** 		  [d] "r" (d),
 204:mode7.cpp     **** 		  [depth] "r" (depth),
 205:mode7.cpp     **** 		  [dir] "r" (dir),
 206:mode7.cpp     **** 		  [yy3] "r" (yy3),
 207:mode7.cpp     **** 		  [xx3] "r" (xx3)
 208:mode7.cpp     **** 		: "r0", "r1", "r3", "cc"
 209:mode7.cpp     **** 		); 
  44              		.loc 1 209 0
  45 001c 00509DE5 		ldr	r5, [sp, #0]
  46 0020 74339FE5 		ldr	r3, .L20+4
  47              		.loc 1 87 0
  48 0024 28E09CE5 		ldr	lr, [ip, #40]
  49              		.loc 1 209 0
  50 0028 0C10A0E3 		mov	r1, #12
  51              		.loc 1 87 0
  52 002c 00709DE5 		ldr	r7, [sp, #0]
  53              		.loc 1 209 0
  54 0030 953121E0 		mla	r1, r5, r1, r3
  55              		.loc 1 86 0
  56 0034 0A3DA0E3 		mov	r3, #640
  57 0038 930525E0 		mla	r5, r3, r5, r0
  58              		.loc 1 87 0
  59 003c 053D43E2 		sub	r3, r3, #320
  60 0040 93E727E0 		mla	r7, r3, r7, lr
  61              		.loc 1 209 0
  62 0044 54339FE5 		ldr	r3, .L20+8
  63              		.loc 1 64 0
  64 0048 30609DE5 		ldr	r6, [sp, #48]
  65              		.loc 1 209 0
  66 004c 083093E5 		ldr	r3, [r3, #8]
  67              		.loc 1 97 0
  68 0050 4C439FE5 		ldr	r4, .L20+12
  69              		.loc 1 64 0
  70 0054 006096E5 		ldr	r6, [r6, #0]
  71              		.loc 1 209 0
  72 0058 00A09DE5 		ldr	sl, [sp, #0]
ARM GAS  /tmp/ccNOn6pJ.s 			page 6


  73 005c 50308DE5 		str	r3, [sp, #80]
  74 0060 40339FE5 		ldr	r3, .L20+16
  75 0064 2C909CE5 		ldr	r9, [ip, #44]
  76              		.loc 1 90 0
  77 0068 4CC09CE5 		ldr	ip, [ip, #76]
  78              		.loc 1 118 0
  79 006c B78AD4E5 		ldrb	r8, [r4, #2743]	@ zero_extendqisi2
  80              		.loc 1 97 0
  81 0070 B84AD4E5 		ldrb	r4, [r4, #2744]	@ zero_extendqisi2
  82              		.loc 1 209 0
  83 0074 0A3283E0 		add	r3, r3, sl, asl #4
  84              		.loc 1 84 0
  85 0078 000056E3 		cmp	r6, #0
  86              		.loc 1 90 0
  87 007c 34C08DE5 		str	ip, [sp, #52]
  88              		.loc 1 84 0
  89 0080 0160A003 		moveq	r6, #1
  90              		.loc 1 209 0
  91 0084 0C1081E2 		add	r1, r1, #12
  92 0088 023083E2 		add	r3, r3, #2
  93 008c FFB06AE2 		rsb	fp, sl, #255
  94 0090 00C0A0E3 		mov	ip, #0
  95 0094 01ECA0E3 		mov	lr, #256
  96              		.loc 1 86 0
  97 0098 7C508DE5 		str	r5, [sp, #124]
  98              	.LVL3:
  99              		.loc 1 87 0
 100 009c 74708DE5 		str	r7, [sp, #116]
 101              	.LVL4:
 102              		.loc 1 118 0
 103 00a0 4C808DE5 		str	r8, [sp, #76]
 104              		.loc 1 209 0
 105 00a4 54908DE5 		str	r9, [sp, #84]
 106              		.loc 1 97 0
 107 00a8 38408DE5 		str	r4, [sp, #56]
 108              		.loc 1 84 0
 109 00ac 60608DE5 		str	r6, [sp, #96]
 110              	.LVL5:
 111              	.LBE4:
 112              		.loc 1 58 0
 113 00b0 2C208DE5 		str	r2, [sp, #44]
 114              	.LBB5:
 115              		.loc 1 209 0
 116 00b4 0A008DE9 		stmib	sp, {r1, r3}	@ phole stm
 117 00b8 78B08DE5 		str	fp, [sp, #120]
 118 00bc 58C08DE5 		str	ip, [sp, #88]
 119              	.LVL6:
 120 00c0 5CE08DE5 		str	lr, [sp, #92]
 121              	.LVL7:
 122 00c4 DE0000EA 		b	.L4
 123              	.LVL8:
 124              	.L5:
 125              		.loc 1 95 0
 126              	.LVL9:
 127 00c8 09009DE9 		ldmib	sp, {r0, r3}	@ phole ldm
 128 00cc F21050E1 		ldrsh	r1, [r0, #-2]
 129              		.loc 1 92 0
ARM GAS  /tmp/ccNOn6pJ.s 			page 7


 130 00d0 B22053E1 		ldrh	r2, [r3, #-2]
 131              		.loc 1 103 0
 132 00d4 04409DE5 		ldr	r4, [sp, #4]
 133              		.loc 1 97 0
 134 00d8 38609DE5 		ldr	r6, [sp, #56]
 135 00dc 78509DE5 		ldr	r5, [sp, #120]
 136              		.loc 1 91 0
 137 00e0 B0C0D3E1 		ldrh	ip, [r3, #0]
 138              		.loc 1 95 0
 139 00e4 8119A0E1 		mov	r1, r1, asl #19
 140              		.loc 1 97 0
 141 00e8 00309DE5 		ldr	r3, [sp, #0]
 142              	.LVL10:
 143              		.loc 1 95 0
 144 00ec C119A0E1 		mov	r1, r1, asr #19
 145              	.LVL11:
 146              		.loc 1 103 0
 147 00f0 FAE054E1 		ldrsh	lr, [r4, #-10]
 148              		.loc 1 100 0
 149 00f4 8229A0E1 		mov	r2, r2, asl #19
 150              		.loc 1 94 0
 151 00f8 F40050E1 		ldrsh	r0, [r0, #-4]
 152              		.loc 1 104 0
 153 00fc F64054E1 		ldrsh	r4, [r4, #-6]
 154              		.loc 1 97 0
 155 0100 000056E3 		cmp	r6, #0
 156              		.loc 1 100 0
 157 0104 C22961E0 		rsb	r2, r1, r2, asr #19
 158              		.loc 1 97 0
 159 0108 0530A011 		movne	r3, r5
 160              		.loc 1 100 0
 161 010c 023083E0 		add	r3, r3, r2
 162              	.LVL12:
 163              		.loc 1 106 0
 164 0110 012083E0 		add	r2, r3, r1
 165              		.loc 1 91 0
 166 0114 8CC9A0E1 		mov	ip, ip, asl #19
 167              		.loc 1 94 0
 168 0118 8009A0E1 		mov	r0, r0, asl #19
 169              		.loc 1 103 0
 170 011c 930E0EE0 		mul	lr, r3, lr
 171              		.loc 1 104 0
 172 0120 930404E0 		mul	r4, r3, r4
 173              		.loc 1 106 0
 174 0124 30809DE5 		ldr	r8, [sp, #48]
 175              		.loc 1 94 0
 176 0128 C009A0E1 		mov	r0, r0, asr #19
 177              	.LVL13:
 178              		.loc 1 91 0
 179 012c CCC9A0E1 		mov	ip, ip, asr #19
 180              		.loc 1 106 0
 181 0130 072002E2 		and	r2, r2, #7
 182              		.loc 1 103 0
 183 0134 0074A0E1 		mov	r7, r0, asl #8
 184              		.loc 1 106 0
 185 0138 0222A0E1 		mov	r2, r2, asl #4
 186              		.loc 1 101 0
ARM GAS  /tmp/ccNOn6pJ.s 			page 8


 187 013c 0C0060E0 		rsb	r0, r0, ip
 188              	.LVL14:
 189              		.loc 1 104 0
 190 0140 0114A0E1 		mov	r1, r1, asl #8
 191              	.LVL15:
 192              		.loc 1 106 0
 193 0144 0090A0E3 		mov	r9, #0
 194              		.loc 1 103 0
 195 0148 3CE08DE5 		str	lr, [sp, #60]
 196              		.loc 1 104 0
 197 014c 44408DE5 		str	r4, [sp, #68]
 198              		.loc 1 91 0
 199 0150 64C08DE5 		str	ip, [sp, #100]
 200              		.loc 1 103 0
 201 0154 40708DE5 		str	r7, [sp, #64]
 202              		.loc 1 106 0
 203 0158 6C208DE5 		str	r2, [sp, #108]
 204              		.loc 1 101 0
 205 015c 68008DE5 		str	r0, [sp, #104]
 206              		.loc 1 104 0
 207 0160 48108DE5 		str	r1, [sp, #72]
 208              		.loc 1 106 0
 209 0164 18808DE5 		str	r8, [sp, #24]
 210 0168 70908DE5 		str	r9, [sp, #112]
 211 016c C80000EA 		b	.L9
 212              	.LVL16:
 213              	.L10:
 214              		.loc 1 110 0
 215 0170 30A09DE5 		ldr	sl, [sp, #48]
 216 0174 00309AE5 		ldr	r3, [sl, #0]
 217 0178 000053E3 		cmp	r3, #0
 218 017c 6600000A 		beq	.L11
 219              		.loc 1 111 0
 220 0180 18B09DE5 		ldr	fp, [sp, #24]
 221              		.loc 1 112 0
 222 0184 18C09DE5 		ldr	ip, [sp, #24]
 223              		.loc 1 111 0
 224 0188 18B09BE5 		ldr	fp, [fp, #24]
 225              		.loc 1 112 0
 226 018c A8C09CE5 		ldr	ip, [ip, #168]
 227              		.loc 1 111 0
 228 0190 58B08DE5 		str	fp, [sp, #88]
 229              		.loc 1 113 0
 230 0194 0B005CE1 		cmp	ip, fp
 231              		.loc 1 112 0
 232 0198 5CC08DE5 		str	ip, [sp, #92]
 233              		.loc 1 113 0
 234 019c C200009A 		bls	.L13
 235              	.L11:
 236 01a0 04209DE5 		ldr	r2, [sp, #4]
 237              		.loc 1 118 0
 238 01a4 4CE09DE5 		ldr	lr, [sp, #76]
 239 01a8 FC3052E1 		ldrsh	r3, [r2, #-12]
 240              		.loc 1 119 0
 241 01ac 5C009DE5 		ldr	r0, [sp, #92]
 242 01b0 F82052E1 		ldrsh	r2, [r2, #-8]
 243              		.loc 1 209 0
ARM GAS  /tmp/ccNOn6pJ.s 			page 9


 244 01b4 04409DE5 		ldr	r4, [sp, #4]
 245              		.loc 1 118 0
 246 01b8 00005EE3 		cmp	lr, #0
 247              		.loc 1 119 0
 248 01bc 016040E2 		sub	r6, r0, #1
 249              	.LVL17:
 250              		.loc 1 121 0
 251 01c0 00206212 		rsbne	r2, r2, #0
 252              		.loc 1 124 0
 253 01c4 58609D05 		ldreq	r6, [sp, #88]
 254              		.loc 1 209 0
 255 01c8 68509DE5 		ldr	r5, [sp, #104]
 256              		.loc 1 121 0
 257 01cc 80208D15 		strne	r2, [sp, #128]
 258              		.loc 1 126 0
 259 01d0 80208D05 		streq	r2, [sp, #128]
 260              		.loc 1 209 0
 261 01d4 48C09DE5 		ldr	ip, [sp, #72]
 262 01d8 F82054E1 		ldrsh	r2, [r4, #-8]
 263              		.loc 1 120 0
 264 01dc 00306312 		rsbne	r3, r3, #0
 265              		.loc 1 125 0
 266 01e0 84308D05 		streq	r3, [sp, #132]
 267              		.loc 1 121 0
 268 01e4 0010E0E3 		mvn	r1, #0
 269              		.loc 1 126 0
 270 01e8 0130A003 		moveq	r3, #1
 271              		.loc 1 121 0
 272 01ec 14108DE5 		str	r1, [sp, #20]
 273              		.loc 1 120 0
 274 01f0 84308D15 		strne	r3, [sp, #132]
 275              		.loc 1 126 0
 276 01f4 14308D05 		streq	r3, [sp, #20]
 277              		.loc 1 209 0
 278 01f8 053086E0 		add	r3, r6, r5
 279 01fc FC1054E1 		ldrsh	r1, [r4, #-12]
 280 0200 93C22CE0 		mla	ip, r3, r2, ip
 281 0204 40209DE5 		ldr	r2, [sp, #64]
 282 0208 58909DE5 		ldr	r9, [sp, #88]
 283 020c 5C809DE5 		ldr	r8, [sp, #92]
 284 0210 7CA09DE5 		ldr	sl, [sp, #124]
 285 0214 74B09DE5 		ldr	fp, [sp, #116]
 286 0218 64709DE5 		ldr	r7, [sp, #100]
 287 021c 44E09DE5 		ldr	lr, [sp, #68]
 288 0220 932122E0 		mla	r2, r3, r1, r2
 289 0224 3C009DE5 		ldr	r0, [sp, #60]
 290 0228 088069E0 		rsb	r8, r9, r8
 291 022c 89A08AE0 		add	sl, sl, r9, asl #1
 292 0230 09B08BE0 		add	fp, fp, r9
 293 0234 076086E0 		add	r6, r6, r7
 294              	.LVL18:
 295 0238 0CC08EE0 		add	ip, lr, ip
 296 023c 10808DE5 		str	r8, [sp, #16]
 297 0240 20A08DE5 		str	sl, [sp, #32]
 298 0244 1CB08DE5 		str	fp, [sp, #28]
 299 0248 022080E0 		add	r2, r0, r2
 300 024c 50409DE5 		ldr	r4, [sp, #80]
ARM GAS  /tmp/ccNOn6pJ.s 			page 10


 301 0250 54509DE5 		ldr	r5, [sp, #84]
 302 0254 2C709DE5 		ldr	r7, [sp, #44]
 303 0258 14909DE5 		ldr	r9, [sp, #20]
 304 025c 6CE09DE5 		ldr	lr, [sp, #108]
 305              	#APP
 306              		1:						
 307 0260 0100DBE4 		ldrb	r0, [fp], #1			
 308 0264 02A08AE2 		add	sl, sl, #2			
 309 0268 000057E1 		cmp	r7, r0			
 310 026c BB00009A 		bls	4f				
 311 0270 4239A0E1 		mov	r3, r2, asr #18		
 312 0274 4C3993E1 		orrs	r3, r3, ip, asr #18		
 313 0278 B300001A 		bne	2f				
 314              							
 315 027c CC35A0E1 		mov	r3, ip, asr #11		
 316 0280 C215A0E1 		mov	r1, r2, asr #11		
 317 0284 833381E0 		add	r3, r1, r3, lsl #7		
 318 0288 8330D4E7 		ldrb	r3, [r4, r3, lsl #1]	
 319              							
 320 028c 071C0CE2 		and	r1, ip, #(7 << 8)		
 321 0290 833384E0 		add	r3, r4, r3, lsl #7		
 322 0294 070C02E2 		and	r0, r2, #(7 << 8)		
 323 0298 413283E0 		add	r3, r3, r1, asr #4 		
 324 029c C03383E0 		add	r3, r3, r0, asr #7		
 325              							
 326 02a0 84109DE5 		ldr	r1, [sp, #132]			
 327 02a4 0100D3E5 		ldrb	r0, [r3, #1]			
 328 02a8 012082E0 		add	r2, r2, r1		
 329 02ac 000050E3 		cmp	r0, #0				
 330 02b0 00119517 		ldrne	r1, [r5, r0, lsl #2]	
 331 02b4 096086E0 		add	r6, r6, r9		
 332 02b8 01704B15 		strneb	r7, [fp, #-1]		
 333 02bc 80009DE5 		ldr	r0, [sp, #128]			
 334 02c0 B2104A11 		strneh	r1, [sl, #-2]			
 335              							
 336 02c4 00C08CE0 		add	ip, ip, r0		
 337 02c8 018058E2 		subs	r8, r8, #1			
 338 02cc 9600001A 		bne	1b				
 339 02d0 C20000EA 		b	3f				
 340              	2:						
 341 02d4 070006E2 		and	r0, r6, #7			
 342 02d8 80308EE0 		add	r3, lr, r0, lsl #1 		
 343              							
 344 02dc 033084E0 		add	r3, r4, r3			
 345 02e0 0100D3E5 		ldrb	r0, [r3, #1]			
 346 02e4 000050E3 		cmp	r0, #0				
 347 02e8 00119517 		ldrne	r1, [r5, r0, lsl #2]	
 348 02ec 01704B15 		strneb	r7, [fp, #-1]		
 349 02f0 B2104A11 		strneh	r1, [sl, #-2]			
 350              	4:						
 351 02f4 84009DE5 		ldr	r0, [sp, #132]			
 352 02f8 80109DE5 		ldr	r1, [sp, #128]			
 353 02fc 096086E0 		add	r6, r6, r9		
 354 0300 002082E0 		add	r2, r2, r0		
 355 0304 01C08CE0 		add	ip, ip, r1		
 356 0308 018058E2 		subs	r8, r8, #1			
 357 030c 9600001A 		bne	1b				
ARM GAS  /tmp/ccNOn6pJ.s 			page 11


 358              	3:						
 359              	
 360              	.L13:
 361              		.loc 1 108 0
 362 0310 70009DE5 		ldr	r0, [sp, #112]
 363 0314 18109DE5 		ldr	r1, [sp, #24]
 364 0318 010080E2 		add	r0, r0, #1
 365 031c 181081E2 		add	r1, r1, #24
 366 0320 70008DE5 		str	r0, [sp, #112]
 367 0324 18108DE5 		str	r1, [sp, #24]
 368              	.LVL19:
 369              	.L9:
 370 0328 70209DE5 		ldr	r2, [sp, #112]
 371 032c 60309DE5 		ldr	r3, [sp, #96]
 372              	.LVL20:
 373 0330 030052E1 		cmp	r2, r3
 374 0334 5A00001A 		bne	.L10
 375              		.loc 1 90 0
 376 0338 00409DE5 		ldr	r4, [sp, #0]
 377 033c 7C509DE5 		ldr	r5, [sp, #124]
 378 0340 74609DE5 		ldr	r6, [sp, #116]
 379 0344 04709DE5 		ldr	r7, [sp, #4]
 380 0348 78809DE5 		ldr	r8, [sp, #120]
 381 034c 08909DE5 		ldr	r9, [sp, #8]
 382 0350 014084E2 		add	r4, r4, #1
 383 0354 0A5D85E2 		add	r5, r5, #640
 384 0358 056D86E2 		add	r6, r6, #320
 385 035c 0C7087E2 		add	r7, r7, #12
 386 0360 018048E2 		sub	r8, r8, #1
 387 0364 109089E2 		add	r9, r9, #16
 388 0368 00408DE5 		str	r4, [sp, #0]
 389 036c 7C508DE5 		str	r5, [sp, #124]
 390 0370 74608DE5 		str	r6, [sp, #116]
 391 0374 04708DE5 		str	r7, [sp, #4]
 392 0378 78808DE5 		str	r8, [sp, #120]
 393 037c 08908DE5 		str	r9, [sp, #8]
 394              	.LVL21:
 395              	.L4:
 396 0380 00A09DE5 		ldr	sl, [sp, #0]
 397 0384 34B09DE5 		ldr	fp, [sp, #52]
 398 0388 0B005AE1 		cmp	sl, fp
 399 038c 3000009A 		bls	.L5
 400              	.LBE5:
 210:mode7.cpp     **** 	} 
 211:mode7.cpp     ****     }
 212:mode7.cpp     **** 
 213:mode7.cpp     **** }
 401              		.loc 1 213 0
 402 0390 88D08DE2 		add	sp, sp, #136
 403 0394 F08FBDE8 		ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 404              	.L21:
 405              		.align	2
 406              	.L20:
 407 0398 00000000 		.word	GFX
 408 039c 00000000 		.word	LineMatrixData
 409 03a0 00000000 		.word	Memory
 410 03a4 00000000 		.word	PPU
ARM GAS  /tmp/ccNOn6pJ.s 			page 12


 411 03a8 00000000 		.word	LineData
 412              	.LFE29:
 413              		.size	_Z25DrawBGMode7Background16R3Phii, .-_Z25DrawBGMode7Background16R3Phii
 414              		.global	__gxx_personality_sj0
 415              		.align	2
 416 03ac 0000A0E1 		.p2align 5,,31
 416      0000A0E1 
 416      0000A0E1 
 416      0000A0E1 
 416      0000A0E1 
 417              		.global	_Z27DrawBGMode7Background16R1R2Phii
 418              		.type	_Z27DrawBGMode7Background16R1R2Phii, %function
 419              	_Z27DrawBGMode7Background16R1R2Phii:
 420              	.LFB30:
 214:mode7.cpp     **** 
 215:mode7.cpp     **** void DrawBGMode7Background16R1R2 (uint8 *Screen, int bg, int depth)
 421              		.loc 1 215 0
 422              		@ args = 0, pretend = 0, frame = 124
 423              		@ frame_needed = 0, uses_anonymous_args = 0
 424              	.LVL22:
 425              	.LBB6:
 216:mode7.cpp     **** {
 217:mode7.cpp     ****     int aa, cc;  
 218:mode7.cpp     ****     int startx; 
 219:mode7.cpp     ****     uint32 Left = 0; 
 220:mode7.cpp     ****     uint32 Right = 256; 
 221:mode7.cpp     ****     uint32 ClipCount = GFX.pCurrentClip->Count [0]; 
 222:mode7.cpp     ****     
 223:mode7.cpp     ****     int32 HOffset; 
 224:mode7.cpp     ****     int32 VOffset; 
 225:mode7.cpp     ****     int32 CentreX; 
 226:mode7.cpp     ****     int32 CentreY;
 227:mode7.cpp     ****     uint8 *d;
 228:mode7.cpp     ****     uint16 *p;
 229:mode7.cpp     ****     int yy; 
 230:mode7.cpp     ****     int xx; 
 231:mode7.cpp     ****     int BB; 
 232:mode7.cpp     ****     int DD; 
 233:mode7.cpp     ****     uint32 Line;
 234:mode7.cpp     ****     uint32 clip; 
 235:mode7.cpp     ****     uint8 b; 
 236:mode7.cpp     ****     uint32 AndByY;
 237:mode7.cpp     ****     uint32 AndByX = 0xffffffff; 
 238:mode7.cpp     ****     if (Settings.Dezaemon && PPU.Mode7Repeat == 2) AndByX = 0x7ff;
 426              		.loc 1 238 0
 427 03c0 78339FE5 		ldr	r3, .L44
 428              	.LBE6:
 429              		.loc 1 215 0
 430 03c4 F04F2DE9 		stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 431              	.LCFI2:
 432              	.LBB7:
 433              		.loc 1 238 0
 434 03c8 2311D3E5 		ldrb	r1, [r3, #291]	@ zero_extendqisi2
 435              	.LVL23:
 436              		.loc 1 221 0
 437 03cc 70339FE5 		ldr	r3, .L44+4
 438              	.LBE7:
ARM GAS  /tmp/ccNOn6pJ.s 			page 13


 439              		.loc 1 215 0
 440 03d0 0040A0E1 		mov	r4, r0
 441              	.LBB8:
 442              		.loc 1 221 0
 443 03d4 503093E5 		ldr	r3, [r3, #80]
 444              	.LBE8:
 445              		.loc 1 215 0
 446 03d8 7CD04DE2 		sub	sp, sp, #124
 447              	.LCFI3:
 448              	.LBB9:
 449              		.loc 1 221 0
 450 03dc 000093E5 		ldr	r0, [r3, #0]
 451              	.LVL24:
 452 03e0 2C308DE5 		str	r3, [sp, #44]
 453              		.loc 1 238 0
 454 03e4 000051E3 		cmp	r1, #0
 455              		.loc 1 237 0
 456 03e8 0030E0E3 		mvn	r3, #0
 457              	.LBE9:
 458              		.loc 1 215 0
 459 03ec 28208DE5 		str	r2, [sp, #40]
 460              	.LBB10:
 461              		.loc 1 221 0
 462 03f0 5C008DE5 		str	r0, [sp, #92]
 463              	.LVL25:
 464              		.loc 1 237 0
 465 03f4 74308DE5 		str	r3, [sp, #116]
 466              	.LVL26:
 467              		.loc 1 238 0
 468 03f8 0201000A 		beq	.L23
 469              	.LVL27:
 470 03fc 44339FE5 		ldr	r3, .L44+8
 471 0400 B93AD3E5 		ldrb	r3, [r3, #2745]	@ zero_extendqisi2
 472 0404 020053E3 		cmp	r3, #2
 473 0408 3C339F05 		ldreq	r3, .L44+12
 474 040c 74308D05 		streq	r3, [sp, #116]
 475              	.L23:
 239:mode7.cpp     ****     AndByY = AndByX << 4;
 240:mode7.cpp     ****     AndByX = AndByX << 1;
 241:mode7.cpp     ****     uint8 *Depth;
 242:mode7.cpp     **** 
 243:mode7.cpp     ****     if (!ClipCount) ClipCount = 1; 
 244:mode7.cpp     **** 
 245:mode7.cpp     ****     Screen += GFX.StartY * GFX_PITCH; 
 476              		.loc 1 245 0
 477 0410 2C139FE5 		ldr	r1, .L44+4
 246:mode7.cpp     ****     Depth = GFX.DB + GFX.StartY * GFX_PPL;
 247:mode7.cpp     **** 
 248:mode7.cpp     ****     struct SLineMatrixData *l = &LineMatrixData [GFX.StartY]; 
 249:mode7.cpp     **** 
 250:mode7.cpp     ****     for (Line = GFX.StartY; Line <= GFX.EndY; Line++, Screen += GFX_PITCH, Depth += GFX_PPL, l++) {
 251:mode7.cpp     **** 	HOffset = ((int32) LineData[Line].BG[0].HOffset << M7) >> M7; 
 252:mode7.cpp     **** 	VOffset = ((int32) LineData[Line].BG[0].VOffset << M7) >> M7; 
 253:mode7.cpp     **** 
 254:mode7.cpp     **** 	CentreX = ((int32) l->CentreX << M7) >> M7; 
 255:mode7.cpp     **** 	CentreY = ((int32) l->CentreY << M7) >> M7; 
 256:mode7.cpp     **** 
ARM GAS  /tmp/ccNOn6pJ.s 			page 14


 257:mode7.cpp     **** 	if (PPU.Mode7VFlip) yy = 255 - (int) Line; 
 258:mode7.cpp     **** 	else yy = Line; 
 259:mode7.cpp     **** 
 260:mode7.cpp     **** 	yy += VOffset - CentreY;
 261:mode7.cpp     **** 	xx = HOffset - CentreX;
 262:mode7.cpp     **** 
 263:mode7.cpp     **** 	BB = l->MatrixB * yy + (CentreX << 8); 
 264:mode7.cpp     **** 	DD = l->MatrixD * yy + (CentreY << 8); 
 265:mode7.cpp     **** 	
 266:mode7.cpp     **** 	for (clip = 0; clip < ClipCount; clip++) { 
 267:mode7.cpp     **** 	    if (GFX.pCurrentClip->Count [0]){ 
 268:mode7.cpp     **** 			Left = GFX.pCurrentClip->Left [clip][0]; 
 269:mode7.cpp     **** 			Right = GFX.pCurrentClip->Right [clip][0]; 
 270:mode7.cpp     **** 			if (Right <= Left) continue; 
 271:mode7.cpp     **** 	    	} 
 272:mode7.cpp     **** 	    p = (uint16 *) Screen + Left; 
 273:mode7.cpp     **** 	    d = Depth + Left;
 274:mode7.cpp     **** 
 275:mode7.cpp     **** 	    if (PPU.Mode7HFlip) { 
 276:mode7.cpp     **** 			startx = Right - 1; 
 277:mode7.cpp     **** 			aa = -l->MatrixA; 
 278:mode7.cpp     **** 			cc = -l->MatrixC;
 279:mode7.cpp     **** 	    } else { 
 280:mode7.cpp     **** 			startx = Left; 
 281:mode7.cpp     **** 			aa = l->MatrixA; 
 282:mode7.cpp     **** 			cc = l->MatrixC;
 283:mode7.cpp     **** 	    } 
 284:mode7.cpp     **** 		asm volatile (
 285:mode7.cpp     **** 		"1:						\n"
 286:mode7.cpp     **** 		"	ldrb	r0, [%[d]], #1			\n"
 287:mode7.cpp     **** 		"	add	%[p], %[p], #2			\n"
 288:mode7.cpp     **** 		"	cmp	%[depth], r0			\n"
 289:mode7.cpp     **** 		"	bls	2f				\n"
 290:mode7.cpp     **** 		"	mov	r3, %[AA], asr #18		\n"
 291:mode7.cpp     **** 		"	orrs	r3, r3, %[CC], asr #18		\n"			
 292:mode7.cpp     **** 		"	bne	2f				\n" 
 293:mode7.cpp     **** 		"						\n"
 294:mode7.cpp     **** 		"	ldr	r1, %[AndByY]			\n"
 295:mode7.cpp     **** 		"	ldr	r0, %[AndByX]			\n"
 296:mode7.cpp     **** 		"	and	r1, r1, %[CC], asr #4		\n"
 297:mode7.cpp     **** 		"	and	r0, r0, %[AA], asr #7		\n"
 298:mode7.cpp     **** 		"						\n"
 299:mode7.cpp     **** 		"	and	r3, r1, #0x7f			\n" 
 300:mode7.cpp     **** 		"	sub	r3, r1, r3			\n" 
 301:mode7.cpp     **** 		"	add	r3, r3, r0, asr #4		\n"
 302:mode7.cpp     **** 		//"	add	r3, r3, r3			\n"
 303:mode7.cpp     **** 		"	ldrb	r3, [%[VRAM], r3, lsl #1]	\n"
 304:mode7.cpp     **** 		"	and	r1, r1, #0x70			\n"
 305:mode7.cpp     **** 		"						\n"
 306:mode7.cpp     **** 		"	add	r3, %[VRAM], r3, lsl #7		\n"
 307:mode7.cpp     **** 		"						\n"
 308:mode7.cpp     **** 		"	and	r0, r0, #14			\n"
 309:mode7.cpp     **** 		"	add	r3, r3, r1			\n"
 310:mode7.cpp     **** 		"	add	r3, r3, r0			\n"
 311:mode7.cpp     **** 		"						\n"
 312:mode7.cpp     **** 		"	ldrb	r0, [r3, #1]			\n"
 313:mode7.cpp     **** 		"	add	%[AA], %[AA], %[daa]		\n"
ARM GAS  /tmp/ccNOn6pJ.s 			page 15


 314:mode7.cpp     **** 		"	cmp	r0, #0				\n"		
 315:mode7.cpp     **** 		"	ldrne	r1, [%[colors], r0, lsl #2]	\n"	
 316:mode7.cpp     **** 		"	strneb	%[depth], [%[d], #-1]		\n"
 317:mode7.cpp     **** 		"	add	%[CC], %[CC], %[dcc]		\n"
 318:mode7.cpp     **** 		"	strneh	r1, [%[p], #-2]			\n"
 319:mode7.cpp     **** 		//"	add	%[p], %[p], #2			\n"
 320:mode7.cpp     **** 		//"	add	%[d], %[d], #1			\n"		
 321:mode7.cpp     **** 		"	subs	%[x], %[x], #1			\n"
 322:mode7.cpp     **** 		"	bne	1b				\n"
 323:mode7.cpp     **** 		"	b	3f				\n"		
 324:mode7.cpp     **** 		"2:						\n"
 325:mode7.cpp     **** 		"	add	%[AA], %[AA], %[daa]		\n"
 326:mode7.cpp     **** 		"	add	%[CC], %[CC], %[dcc]		\n"
 327:mode7.cpp     **** 		//"	add	%[p], %[p], #2			\n"
 328:mode7.cpp     **** 		//"	add	%[d], %[d], #1			\n"		
 329:mode7.cpp     **** 		"	subs	%[x], %[x], #1			\n"
 330:mode7.cpp     **** 		"	bne	1b				\n"
 331:mode7.cpp     **** 		"3:						\n"
 332:mode7.cpp     **** 		:
 333:mode7.cpp     **** 		: [x] "r" (Right - Left),
 334:mode7.cpp     **** 		  [AA] "r" (l->MatrixA * (startx + xx) + BB),
 335:mode7.cpp     **** 		  [CC] "r" (l->MatrixC * (startx + xx) + DD),
 336:mode7.cpp     **** 		  [daa] "r" (aa),
 337:mode7.cpp     **** 		  [dcc] "r" (cc),
 338:mode7.cpp     **** 		  [VRAM] "r" (Memory.VRAM),
 339:mode7.cpp     **** 		  [colors] "r" (GFX.ScreenColors),
 340:mode7.cpp     **** 		  [p] "r" (p),
 341:mode7.cpp     **** 		  [d] "r" (d),
 342:mode7.cpp     **** 		  [depth] "r" (depth),
 343:mode7.cpp     **** 		  [AndByX] "m" (AndByX),
 344:mode7.cpp     **** 		  [AndByY] "m" (AndByY)
 345:mode7.cpp     **** 		: "r0", "r1", "r3", "cc"
 346:mode7.cpp     **** 		); 
 478              		.loc 1 346 0
 479 0414 34339FE5 		ldr	r3, .L44+16
 480              		.loc 1 245 0
 481 0418 482091E5 		ldr	r2, [r1, #72]
 482              		.loc 1 246 0
 483 041c 280091E5 		ldr	r0, [r1, #40]
 484              		.loc 1 245 0
 485 0420 00208DE5 		str	r2, [sp, #0]
 486              	.LVL28:
 487              		.loc 1 346 0
 488 0424 00E09DE5 		ldr	lr, [sp, #0]
 489              		.loc 1 245 0
 490 0428 00509DE5 		ldr	r5, [sp, #0]
 491              		.loc 1 346 0
 492 042c 0C20A0E3 		mov	r2, #12
 493              		.loc 1 246 0
 494 0430 00609DE5 		ldr	r6, [sp, #0]
 495              		.loc 1 346 0
 496 0434 923E2EE0 		mla	lr, r2, lr, r3
 497              		.loc 1 245 0
 498 0438 0A3DA0E3 		mov	r3, #640
 499 043c 934525E0 		mla	r5, r3, r5, r4
 500              		.loc 1 246 0
 501 0440 053D43E2 		sub	r3, r3, #320
ARM GAS  /tmp/ccNOn6pJ.s 			page 16


 502 0444 930626E0 		mla	r6, r3, r6, r0
 503              		.loc 1 346 0
 504 0448 04339FE5 		ldr	r3, .L44+20
 505              		.loc 1 257 0
 506 044c F4C29FE5 		ldr	ip, .L44+8
 507              		.loc 1 346 0
 508 0450 083093E5 		ldr	r3, [r3, #8]
 509 0454 00A09DE5 		ldr	sl, [sp, #0]
 510 0458 4C308DE5 		str	r3, [sp, #76]
 511 045c F4329FE5 		ldr	r3, .L44+24
 512              		.loc 1 243 0
 513 0460 5CB09DE5 		ldr	fp, [sp, #92]
 514              		.loc 1 239 0
 515 0464 74209DE5 		ldr	r2, [sp, #116]
 516              		.loc 1 346 0
 517 0468 2C9091E5 		ldr	r9, [r1, #44]
 518              		.loc 1 250 0
 519 046c 4C1091E5 		ldr	r1, [r1, #76]
 520              		.loc 1 275 0
 521 0470 B77ADCE5 		ldrb	r7, [ip, #2743]	@ zero_extendqisi2
 522              		.loc 1 346 0
 523 0474 0A3283E0 		add	r3, r3, sl, asl #4
 524              		.loc 1 257 0
 525 0478 B8CADCE5 		ldrb	ip, [ip, #2744]	@ zero_extendqisi2
 526              		.loc 1 346 0
 527 047c 023083E2 		add	r3, r3, #2
 528              		.loc 1 243 0
 529 0480 00005BE3 		cmp	fp, #0
 530              		.loc 1 250 0
 531 0484 30108DE5 		str	r1, [sp, #48]
 532              		.loc 1 243 0
 533 0488 01B0A003 		moveq	fp, #1
 534              		.loc 1 240 0
 535 048c 8210A0E1 		mov	r1, r2, asl #1
 536              		.loc 1 346 0
 537 0490 0C808EE2 		add	r8, lr, #12
 538 0494 0C308DE5 		str	r3, [sp, #12]
 539              		.loc 1 239 0
 540 0498 0222A0E1 		mov	r2, r2, asl #4
 541              		.loc 1 346 0
 542 049c FFE06AE2 		rsb	lr, sl, #255
 543 04a0 0000A0E3 		mov	r0, #0
 544 04a4 013CA0E3 		mov	r3, #256
 545              		.loc 1 245 0
 546 04a8 70508DE5 		str	r5, [sp, #112]
 547              	.LVL29:
 548              		.loc 1 246 0
 549 04ac 68608DE5 		str	r6, [sp, #104]
 550              	.LVL30:
 551              		.loc 1 275 0
 552 04b0 48708DE5 		str	r7, [sp, #72]
 553              		.loc 1 346 0
 554 04b4 50908DE5 		str	r9, [sp, #80]
 555              		.loc 1 257 0
 556 04b8 34C08DE5 		str	ip, [sp, #52]
 557              		.loc 1 243 0
 558 04bc 5CB08DE5 		str	fp, [sp, #92]
ARM GAS  /tmp/ccNOn6pJ.s 			page 17


 559              		.loc 1 346 0
 560 04c0 6CE08DE5 		str	lr, [sp, #108]
 561 04c4 54008DE5 		str	r0, [sp, #84]
 562              	.LVL31:
 563 04c8 58308DE5 		str	r3, [sp, #88]
 564              	.LVL32:
 565              		.loc 1 239 0
 566 04cc 78208DE5 		str	r2, [sp, #120]
 567              	.LVL33:
 568              		.loc 1 240 0
 569 04d0 74108DE5 		str	r1, [sp, #116]
 570 04d4 C80100EA 		b	.L28
 571              	.LVL34:
 572              	.L29:
 573              		.loc 1 252 0
 574 04d8 0C409DE5 		ldr	r4, [sp, #12]
 575              	.LVL35:
 576              		.loc 1 255 0
 577 04dc F2C058E1 		ldrsh	ip, [r8, #-2]
 578              		.loc 1 252 0
 579 04e0 B22054E1 		ldrh	r2, [r4, #-2]
 580              		.loc 1 257 0
 581 04e4 34609DE5 		ldr	r6, [sp, #52]
 582 04e8 6C509DE5 		ldr	r5, [sp, #108]
 583              		.loc 1 251 0
 584 04ec 0C709DE5 		ldr	r7, [sp, #12]
 585              		.loc 1 257 0
 586 04f0 00309DE5 		ldr	r3, [sp, #0]
 587              	.LVL36:
 588              		.loc 1 255 0
 589 04f4 8CC9A0E1 		mov	ip, ip, asl #19
 590 04f8 CCC9A0E1 		mov	ip, ip, asr #19
 591              	.LVL37:
 592              		.loc 1 260 0
 593 04fc 8229A0E1 		mov	r2, r2, asl #19
 594              		.loc 1 254 0
 595 0500 F40058E1 		ldrsh	r0, [r8, #-4]
 596              		.loc 1 263 0
 597 0504 FA4058E1 		ldrsh	r4, [r8, #-10]
 598              		.loc 1 264 0
 599 0508 F6E058E1 		ldrsh	lr, [r8, #-6]
 600              		.loc 1 257 0
 601 050c 000056E3 		cmp	r6, #0
 602              		.loc 1 260 0
 603 0510 C2296CE0 		rsb	r2, ip, r2, asr #19
 604              		.loc 1 257 0
 605 0514 0530A011 		movne	r3, r5
 606              		.loc 1 251 0
 607 0518 B010D7E1 		ldrh	r1, [r7, #0]
 608              		.loc 1 260 0
 609 051c 023083E0 		add	r3, r3, r2
 610              	.LVL38:
 611              		.loc 1 264 0
 612 0520 930E0EE0 		mul	lr, r3, lr
 613              		.loc 1 254 0
 614 0524 8009A0E1 		mov	r0, r0, asl #19
 615              		.loc 1 263 0
ARM GAS  /tmp/ccNOn6pJ.s 			page 18


 616 0528 930404E0 		mul	r4, r3, r4
 617              		.loc 1 264 0
 618 052c 2C909DE5 		ldr	r9, [sp, #44]
 619              		.loc 1 254 0
 620 0530 C009A0E1 		mov	r0, r0, asr #19
 621              	.LVL39:
 622              		.loc 1 261 0
 623 0534 8119A0E1 		mov	r1, r1, asl #19
 624 0538 C11960E0 		rsb	r1, r0, r1, asr #19
 625              		.loc 1 264 0
 626 053c 0CC4A0E1 		mov	ip, ip, asl #8
 627              	.LVL40:
 628              		.loc 1 263 0
 629 0540 0004A0E1 		mov	r0, r0, asl #8
 630              	.LVL41:
 631              		.loc 1 264 0
 632 0544 00A0A0E3 		mov	sl, #0
 633 0548 40E08DE5 		str	lr, [sp, #64]
 634              		.loc 1 263 0
 635 054c 38408DE5 		str	r4, [sp, #56]
 636              		.loc 1 261 0
 637 0550 60108DE5 		str	r1, [sp, #96]
 638              		.loc 1 263 0
 639 0554 3C008DE5 		str	r0, [sp, #60]
 640              		.loc 1 264 0
 641 0558 44C08DE5 		str	ip, [sp, #68]
 642 055c 08908DE5 		str	r9, [sp, #8]
 643 0560 64A08DE5 		str	sl, [sp, #100]
 644 0564 B40100EA 		b	.L33
 645              	.L34:
 646              		.loc 1 267 0
 647 0568 2CB09DE5 		ldr	fp, [sp, #44]
 648 056c 00309BE5 		ldr	r3, [fp, #0]
 649              	.LVL42:
 650 0570 000053E3 		cmp	r3, #0
 651 0574 6401000A 		beq	.L35
 652              		.loc 1 268 0
 653 0578 08C09DE5 		ldr	ip, [sp, #8]
 654              		.loc 1 269 0
 655 057c 08E09DE5 		ldr	lr, [sp, #8]
 656              		.loc 1 268 0
 657 0580 18C09CE5 		ldr	ip, [ip, #24]
 658              		.loc 1 269 0
 659 0584 A8E09EE5 		ldr	lr, [lr, #168]
 660              		.loc 1 268 0
 661 0588 54C08DE5 		str	ip, [sp, #84]
 662              		.loc 1 270 0
 663 058c 0C005EE1 		cmp	lr, ip
 664              		.loc 1 269 0
 665 0590 58E08DE5 		str	lr, [sp, #88]
 666              		.loc 1 270 0
 667 0594 AE01009A 		bls	.L37
 668              	.L35:
 669              		.loc 1 275 0
 670 0598 48009DE5 		ldr	r0, [sp, #72]
 671 059c FC2058E1 		ldrsh	r2, [r8, #-12]
 672              		.loc 1 276 0
ARM GAS  /tmp/ccNOn6pJ.s 			page 19


 673 05a0 58109DE5 		ldr	r1, [sp, #88]
 674              		.loc 1 275 0
 675 05a4 000050E3 		cmp	r0, #0
 676              		.loc 1 276 0
 677 05a8 013041E2 		sub	r3, r1, #1
 678              	.LVL43:
 679              		.loc 1 277 0
 680 05ac 00206212 		rsbne	r2, r2, #0
 681 05b0 F81058E1 		ldrsh	r1, [r8, #-8]
 682              		.loc 1 346 0
 683 05b4 60409DE5 		ldr	r4, [sp, #96]
 684              		.loc 1 280 0
 685 05b8 54309D05 		ldreq	r3, [sp, #84]
 686              		.loc 1 277 0
 687 05bc 04208D15 		strne	r2, [sp, #4]
 688              		.loc 1 281 0
 689 05c0 04208D05 		streq	r2, [sp, #4]
 690              		.loc 1 346 0
 691 05c4 44C09DE5 		ldr	ip, [sp, #68]
 692 05c8 F82058E1 		ldrsh	r2, [r8, #-8]
 693 05cc 043083E0 		add	r3, r3, r4
 694              	.LVL44:
 695              		.loc 1 278 0
 696 05d0 00106112 		rsbne	r1, r1, #0
 697 05d4 18108D15 		strne	r1, [sp, #24]
 698              		.loc 1 282 0
 699 05d8 18108D05 		streq	r1, [sp, #24]
 700              		.loc 1 346 0
 701 05dc 93C22CE0 		mla	ip, r3, r2, ip
 702 05e0 FC1058E1 		ldrsh	r1, [r8, #-12]
 703 05e4 3C209DE5 		ldr	r2, [sp, #60]
 704 05e8 54609DE5 		ldr	r6, [sp, #84]
 705 05ec 58509DE5 		ldr	r5, [sp, #88]
 706 05f0 70709DE5 		ldr	r7, [sp, #112]
 707 05f4 68909DE5 		ldr	r9, [sp, #104]
 708 05f8 40A09DE5 		ldr	sl, [sp, #64]
 709 05fc 38B09DE5 		ldr	fp, [sp, #56]
 710 0600 932122E0 		mla	r2, r3, r1, r2
 711 0604 055066E0 		rsb	r5, r6, r5
 712 0608 867087E0 		add	r7, r7, r6, asl #1
 713 060c 069089E0 		add	r9, r9, r6
 714 0610 0CC08AE0 		add	ip, sl, ip
 715 0614 02208BE0 		add	r2, fp, r2
 716 0618 14508DE5 		str	r5, [sp, #20]
 717 061c 10708DE5 		str	r7, [sp, #16]
 718 0620 1C908DE5 		str	r9, [sp, #28]
 719 0624 04E09DE5 		ldr	lr, [sp, #4]
 720 0628 18409DE5 		ldr	r4, [sp, #24]
 721 062c 4C609DE5 		ldr	r6, [sp, #76]
 722 0630 50A09DE5 		ldr	sl, [sp, #80]
 723 0634 28B09DE5 		ldr	fp, [sp, #40]
 724              	#APP
 725              		1:						
 726 0638 0100D9E4 		ldrb	r0, [r9], #1			
 727 063c 027087E2 		add	r7, r7, #2			
 728 0640 00005BE1 		cmp	fp, r0			
 729 0644 AA01009A 		bls	2f				
ARM GAS  /tmp/ccNOn6pJ.s 			page 20


 730 0648 4239A0E1 		mov	r3, r2, asr #18		
 731 064c 4C3993E1 		orrs	r3, r3, ip, asr #18		
 732 0650 AA01001A 		bne	2f				
 733              							
 734 0654 78109DE5 		ldr	r1, [sp, #120]			
 735 0658 74009DE5 		ldr	r0, [sp, #116]			
 736 065c 4C1201E0 		and	r1, r1, ip, asr #4		
 737 0660 C20300E0 		and	r0, r0, r2, asr #7		
 738              							
 739 0664 7F3001E2 		and	r3, r1, #0x7f			
 740 0668 033041E0 		sub	r3, r1, r3			
 741 066c 403283E0 		add	r3, r3, r0, asr #4		
 742 0670 8330D6E7 		ldrb	r3, [r6, r3, lsl #1]	
 743 0674 701001E2 		and	r1, r1, #0x70			
 744              							
 745 0678 833386E0 		add	r3, r6, r3, lsl #7		
 746              							
 747 067c 0E0000E2 		and	r0, r0, #14			
 748 0680 013083E0 		add	r3, r3, r1			
 749 0684 003083E0 		add	r3, r3, r0			
 750              							
 751 0688 0100D3E5 		ldrb	r0, [r3, #1]			
 752 068c 0E2082E0 		add	r2, r2, lr		
 753 0690 000050E3 		cmp	r0, #0				
 754 0694 00119A17 		ldrne	r1, [sl, r0, lsl #2]	
 755 0698 01B04915 		strneb	fp, [r9, #-1]		
 756 069c 04C08CE0 		add	ip, ip, r4		
 757 06a0 B2104711 		strneh	r1, [r7, #-2]			
 758 06a4 015055E2 		subs	r5, r5, #1			
 759 06a8 8C01001A 		bne	1b				
 760 06ac AE0100EA 		b	3f				
 761              	2:						
 762 06b0 0E2082E0 		add	r2, r2, lr		
 763 06b4 04C08CE0 		add	ip, ip, r4		
 764 06b8 015055E2 		subs	r5, r5, #1			
 765 06bc 8C01001A 		bne	1b				
 766              	3:						
 767              	
 768              	.L37:
 769              		.loc 1 266 0
 770 06c0 64C09DE5 		ldr	ip, [sp, #100]
 771 06c4 08E09DE5 		ldr	lr, [sp, #8]
 772 06c8 01C08CE2 		add	ip, ip, #1
 773 06cc 18E08EE2 		add	lr, lr, #24
 774 06d0 64C08DE5 		str	ip, [sp, #100]
 775 06d4 08E08DE5 		str	lr, [sp, #8]
 776              	.LVL45:
 777              	.L33:
 778 06d8 64009DE5 		ldr	r0, [sp, #100]
 779 06dc 5C109DE5 		ldr	r1, [sp, #92]
 780 06e0 010050E1 		cmp	r0, r1
 781 06e4 5801001A 		bne	.L34
 782              		.loc 1 250 0
 783 06e8 00209DE5 		ldr	r2, [sp, #0]
 784 06ec 70309DE5 		ldr	r3, [sp, #112]
 785              	.LVL46:
 786 06f0 68409DE5 		ldr	r4, [sp, #104]
ARM GAS  /tmp/ccNOn6pJ.s 			page 21


 787 06f4 6C509DE5 		ldr	r5, [sp, #108]
 788 06f8 0C609DE5 		ldr	r6, [sp, #12]
 789 06fc 012082E2 		add	r2, r2, #1
 790 0700 0A3D83E2 		add	r3, r3, #640
 791 0704 054D84E2 		add	r4, r4, #320
 792 0708 015045E2 		sub	r5, r5, #1
 793 070c 106086E2 		add	r6, r6, #16
 794 0710 0C8088E2 		add	r8, r8, #12
 795 0714 00208DE5 		str	r2, [sp, #0]
 796 0718 70308DE5 		str	r3, [sp, #112]
 797 071c 68408DE5 		str	r4, [sp, #104]
 798 0720 6C508DE5 		str	r5, [sp, #108]
 799 0724 0C608DE5 		str	r6, [sp, #12]
 800              	.LVL47:
 801              	.L28:
 802 0728 00709DE5 		ldr	r7, [sp, #0]
 803 072c 30909DE5 		ldr	r9, [sp, #48]
 804 0730 090057E1 		cmp	r7, r9
 805 0734 3401009A 		bls	.L29
 806              	.LBE10:
 347:mode7.cpp     ****  	 }
 348:mode7.cpp     ****    }
 349:mode7.cpp     **** }
 807              		.loc 1 349 0
 808 0738 7CD08DE2 		add	sp, sp, #124
 809 073c F08FBDE8 		ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 810              	.L45:
 811              		.align	2
 812              	.L44:
 813 0740 00000000 		.word	Settings
 814 0744 00000000 		.word	GFX
 815 0748 00000000 		.word	PPU
 816 074c FF070000 		.word	2047
 817 0750 00000000 		.word	LineMatrixData
 818 0754 00000000 		.word	Memory
 819 0758 00000000 		.word	LineData
 820              	.LFE30:
 821              		.size	_Z27DrawBGMode7Background16R1R2Phii, .-_Z27DrawBGMode7Background16R1R2Phii
 822              		.align	2
 823 075c 0000A0E1 		.p2align 5,,31
 824              		.global	_Z25DrawBGMode7Background16R0Phii
 825              		.type	_Z25DrawBGMode7Background16R0Phii, %function
 826              	_Z25DrawBGMode7Background16R0Phii:
 827              	.LFB31:
 350:mode7.cpp     **** 
 351:mode7.cpp     **** 
 352:mode7.cpp     **** void DrawBGMode7Background16R0 (uint8 *Screen, int bg, int depth)
 828              		.loc 1 352 0
 829              		@ args = 0, pretend = 0, frame = 120
 830              		@ frame_needed = 0, uses_anonymous_args = 0
 831              	.LVL48:
 832              	.LBB11:
 353:mode7.cpp     **** {  
 354:mode7.cpp     ****     int aa, cc;  
 355:mode7.cpp     ****     int startx; 
 356:mode7.cpp     ****     uint32 Left; 
 357:mode7.cpp     ****     uint32 Right; 
ARM GAS  /tmp/ccNOn6pJ.s 			page 22


 358:mode7.cpp     ****     uint32 ClipCount = GFX.pCurrentClip->Count [0]; 
 833              		.loc 1 358 0
 834 0760 10C39FE5 		ldr	ip, .L66
 835              	.LBE11:
 836              		.loc 1 352 0
 837 0764 F04F2DE9 		stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 838              	.LCFI4:
 839              	.LBB12:
 359:mode7.cpp     ****     
 360:mode7.cpp     ****     int32 HOffset; 
 361:mode7.cpp     ****     int32 VOffset; 
 362:mode7.cpp     ****     int32 CentreX; 
 363:mode7.cpp     ****     int32 CentreY;
 364:mode7.cpp     ****     uint16 *p;
 365:mode7.cpp     ****     uint8 *d;
 366:mode7.cpp     ****     int yy; 
 367:mode7.cpp     ****     int xx; 
 368:mode7.cpp     ****     int BB; 
 369:mode7.cpp     ****     int DD; 
 370:mode7.cpp     ****     uint32 Line;
 371:mode7.cpp     ****     uint32 clip;
 372:mode7.cpp     ****     struct SLineMatrixData *l;
 373:mode7.cpp     ****     uint8 *Depth;
 374:mode7.cpp     ****      
 375:mode7.cpp     **** 
 376:mode7.cpp     **** 	Left = 0; 
 377:mode7.cpp     **** 	Right = 256; 
 378:mode7.cpp     **** 
 379:mode7.cpp     **** 
 380:mode7.cpp     ****     if (!ClipCount) ClipCount = 1; 
 381:mode7.cpp     **** 
 382:mode7.cpp     **** 
 383:mode7.cpp     ****     l = &LineMatrixData [GFX.StartY];
 840              		.loc 1 383 0
 841 0768 48309CE5 		ldr	r3, [ip, #72]
 842              	.LBE12:
 843              		.loc 1 352 0
 844 076c 78D04DE2 		sub	sp, sp, #120
 845              	.LCFI5:
 846              	.LBB13:
 847              		.loc 1 383 0
 848 0770 00308DE5 		str	r3, [sp, #0]
 849              	.LVL49:
 384:mode7.cpp     ****     Screen  += GFX.StartY * GFX_PITCH;
 385:mode7.cpp     ****     Depth = GFX.DB + GFX.StartY * GFX_PPL;
 386:mode7.cpp     **** 
 387:mode7.cpp     ****     for (Line = GFX.StartY; Line <= GFX.EndY; Line++, Screen += GFX_PITCH, Depth += GFX_PPL, l++) {
 388:mode7.cpp     **** 	HOffset = ((int32) LineData[Line].BG[0].HOffset << M7) >> M7; 
 389:mode7.cpp     **** 	VOffset = ((int32) LineData[Line].BG[0].VOffset << M7) >> M7; 
 390:mode7.cpp     **** 
 391:mode7.cpp     **** 	CentreX = ((int32) l->CentreX << M7) >> M7; 
 392:mode7.cpp     **** 	CentreY = ((int32) l->CentreY << M7) >> M7; 
 393:mode7.cpp     **** 
 394:mode7.cpp     **** 	if (PPU.Mode7VFlip) yy = 255 - (int) Line; 
 395:mode7.cpp     **** 	else yy = Line; 
 396:mode7.cpp     **** 
 397:mode7.cpp     **** 	/*yy += (VOffset - CentreY) % 1023;
ARM GAS  /tmp/ccNOn6pJ.s 			page 23


 398:mode7.cpp     **** 	xx = (HOffset - CentreX) % 1023;
 399:mode7.cpp     **** */
 400:mode7.cpp     **** 
 401:mode7.cpp     **** 	yy += ((VOffset - CentreY) << (32-10+1)) >> (32-10+1) ;
 402:mode7.cpp     **** 	xx = ((HOffset - CentreX) << (32-10+1)) >> (32-10+1);
 403:mode7.cpp     **** 
 404:mode7.cpp     **** 	BB = l->MatrixB * yy + (CentreX << 8); 
 405:mode7.cpp     **** 	DD = l->MatrixD * yy + (CentreY << 8); 
 406:mode7.cpp     **** 
 407:mode7.cpp     **** 	for (clip = 0; clip < ClipCount; clip++) 
 408:mode7.cpp     **** 	{ 
 409:mode7.cpp     **** 	    if (GFX.pCurrentClip->Count [0]){ 
 410:mode7.cpp     **** 			Left = GFX.pCurrentClip->Left [clip][0]; 
 411:mode7.cpp     **** 			Right = GFX.pCurrentClip->Right [clip][0]; 
 412:mode7.cpp     **** 			if (Right <= Left) continue; 
 413:mode7.cpp     **** 	    	} 
 414:mode7.cpp     **** 
 415:mode7.cpp     **** 	    p = (uint16 *) Screen + Left; 
 416:mode7.cpp     **** 	    d = Depth + Left;
 417:mode7.cpp     **** 
 418:mode7.cpp     **** 	    if (PPU.Mode7HFlip) { 
 419:mode7.cpp     **** 			startx = Right - 1; 
 420:mode7.cpp     **** 			aa = -l->MatrixA; 
 421:mode7.cpp     **** 			cc = -l->MatrixC;
 422:mode7.cpp     **** 	    } else { 
 423:mode7.cpp     **** 			startx = Left; 
 424:mode7.cpp     **** 			aa = l->MatrixA; 
 425:mode7.cpp     **** 			cc = l->MatrixC;
 426:mode7.cpp     **** 	    } 
 427:mode7.cpp     **** 		asm volatile (
 428:mode7.cpp     **** 		"	b	1f				\n"
 429:mode7.cpp     **** 		//"7:						\n" // AndByX
 430:mode7.cpp     **** 		//"	.word	(0x3ff << 1)                    \n"
 431:mode7.cpp     **** 		"8:						\n" // AndByY
 432:mode7.cpp     **** 		"	.word	(0x3ff << 4)                    \n"
 433:mode7.cpp     **** 		"						\n"
 434:mode7.cpp     **** 		"1:						\n"
 435:mode7.cpp     **** 		"	ldrb	r0, [%[d]], #1			\n"
 436:mode7.cpp     **** 		"	ldr	r3, 8b				\n"
 437:mode7.cpp     **** 		"	add	%[p], %[p], #2			\n"
 438:mode7.cpp     **** 		"	cmp	%[depth], r0			\n"
 439:mode7.cpp     **** 		"	bls	2f				\n"
 440:mode7.cpp     **** 		"	and	r1, r3, %[CC], asr #4		\n"
 441:mode7.cpp     **** 		//"	ldr	r0, 7b				\n"
 442:mode7.cpp     **** 		"	mov	r0, r3, asr #3			\n"		
 443:mode7.cpp     **** 		"	and	r3, r1, #0x7f			\n" 
 444:mode7.cpp     **** 		"	and	r0, r0, %[AA], asr #7		\n"
 445:mode7.cpp     **** 		"	sub	r3, r1, r3			\n" 
 446:mode7.cpp     **** 		"	add	r3, r3, r0, asr #4		\n"
 447:mode7.cpp     **** 		//"	add	r3, r3, r3			\n"
 448:mode7.cpp     **** 		"	ldrb	r3, [%[VRAM], r3, lsl #1]	\n"
 449:mode7.cpp     **** 		"						\n"
 450:mode7.cpp     **** 		"	and	r1, r1, #0x70			\n"
 451:mode7.cpp     **** 		"	add	r3, %[VRAM], r3, lsl #7		\n"
 452:mode7.cpp     **** 		"						\n"
 453:mode7.cpp     **** 		"	and	r0, r0, #14			\n"
 454:mode7.cpp     **** 		"	add	r3, r3, r1			\n"
ARM GAS  /tmp/ccNOn6pJ.s 			page 24


 455:mode7.cpp     **** 		"	add	r3, r3, r0			\n"
 456:mode7.cpp     **** 		"						\n"
 457:mode7.cpp     **** 		"	ldrb	r0, [r3, #1]			\n"
 458:mode7.cpp     **** 		"	cmp	r0, #0				\n"		
 459:mode7.cpp     **** 		"	ldrne	r1, [%[colors], r0, lsl #2]	\n"	
 460:mode7.cpp     **** 		"	strneb	%[depth], [%[d], #-1]		\n"
 461:mode7.cpp     **** 		"	strneh	r1, [%[p], #-2]			\n"		
 462:mode7.cpp     **** 		"						\n"
 463:mode7.cpp     **** 		"2:						\n"
 464:mode7.cpp     **** 		"	add	%[AA], %[AA], %[daa]		\n"
 465:mode7.cpp     **** 		"	add	%[CC], %[CC], %[dcc]		\n"
 466:mode7.cpp     **** 		//"	add	%[p], %[p], #2			\n"
 467:mode7.cpp     **** 		//"	add	%[d], %[d], #1			\n"		
 468:mode7.cpp     **** 		"	subs	%[x], %[x], #1			\n"
 469:mode7.cpp     **** 		"	bne	1b				\n"
 470:mode7.cpp     **** 		:
 471:mode7.cpp     **** 		: [x] "r" (Right - Left),
 472:mode7.cpp     **** 		  [AA] "r" (l->MatrixA * (startx + xx) + BB),
 473:mode7.cpp     **** 		  [CC] "r" (l->MatrixC * (startx + xx) + DD),
 474:mode7.cpp     **** 		  [daa] "r" (aa),
 475:mode7.cpp     **** 		  [dcc] "r" (cc),
 476:mode7.cpp     **** 		  [VRAM] "r" (Memory.VRAM),
 477:mode7.cpp     **** 		  [colors] "r" (GFX.ScreenColors),
 478:mode7.cpp     **** 		  [p] "r" (p),
 479:mode7.cpp     **** 		  [d] "r" (d), 
 480:mode7.cpp     **** 		  [depth] "r" (depth)
 481:mode7.cpp     **** 		: "r0", "r1", "r3", "cc"
 482:mode7.cpp     **** 		);
 850              		.loc 1 482 0
 851 0774 00509DE5 		ldr	r5, [sp, #0]
 852 0778 FC329FE5 		ldr	r3, .L66+4
 853              		.loc 1 385 0
 854 077c 28E09CE5 		ldr	lr, [ip, #40]
 855              		.loc 1 482 0
 856 0780 0C10A0E3 		mov	r1, #12
 857              	.LVL50:
 858              		.loc 1 385 0
 859 0784 00709DE5 		ldr	r7, [sp, #0]
 860              		.loc 1 482 0
 861 0788 953121E0 		mla	r1, r5, r1, r3
 862              		.loc 1 384 0
 863 078c 0A3DA0E3 		mov	r3, #640
 864              		.loc 1 358 0
 865 0790 50409CE5 		ldr	r4, [ip, #80]
 866              		.loc 1 384 0
 867 0794 930525E0 		mla	r5, r3, r5, r0
 868              		.loc 1 385 0
 869 0798 053D43E2 		sub	r3, r3, #320
 870 079c 93E727E0 		mla	r7, r3, r7, lr
 871              		.loc 1 482 0
 872 07a0 D8329FE5 		ldr	r3, .L66+8
 873              		.loc 1 358 0
 874 07a4 2C408DE5 		str	r4, [sp, #44]
 875              		.loc 1 482 0
 876 07a8 083093E5 		ldr	r3, [r3, #8]
 877              		.loc 1 358 0
 878 07ac 2C609DE5 		ldr	r6, [sp, #44]
ARM GAS  /tmp/ccNOn6pJ.s 			page 25


 879              		.loc 1 394 0
 880 07b0 CC429FE5 		ldr	r4, .L66+12
 881              		.loc 1 358 0
 882 07b4 006096E5 		ldr	r6, [r6, #0]
 883              		.loc 1 482 0
 884 07b8 00B09DE5 		ldr	fp, [sp, #0]
 885 07bc 4C308DE5 		str	r3, [sp, #76]
 886 07c0 C0329FE5 		ldr	r3, .L66+16
 887 07c4 2CA09CE5 		ldr	sl, [ip, #44]
 888              		.loc 1 387 0
 889 07c8 4CC09CE5 		ldr	ip, [ip, #76]
 890              		.loc 1 418 0
 891 07cc B79AD4E5 		ldrb	r9, [r4, #2743]	@ zero_extendqisi2
 892              		.loc 1 394 0
 893 07d0 B84AD4E5 		ldrb	r4, [r4, #2744]	@ zero_extendqisi2
 894              		.loc 1 482 0
 895 07d4 0B3283E0 		add	r3, r3, fp, asl #4
 896              		.loc 1 380 0
 897 07d8 000056E3 		cmp	r6, #0
 898              		.loc 1 358 0
 899 07dc 74608DE5 		str	r6, [sp, #116]
 900              	.LVL51:
 901              		.loc 1 387 0
 902 07e0 30C08DE5 		str	ip, [sp, #48]
 903              		.loc 1 380 0
 904 07e4 0160A003 		moveq	r6, #1
 905              		.loc 1 482 0
 906 07e8 023083E2 		add	r3, r3, #2
 907 07ec FFC06BE2 		rsb	ip, fp, #255
 908 07f0 00E0A0E3 		mov	lr, #0
 909 07f4 010CA0E3 		mov	r0, #256
 910              	.LVL52:
 911 07f8 0C8081E2 		add	r8, r1, #12
 912              		.loc 1 384 0
 913 07fc 70508DE5 		str	r5, [sp, #112]
 914              	.LVL53:
 915              		.loc 1 385 0
 916 0800 68708DE5 		str	r7, [sp, #104]
 917              	.LVL54:
 918              		.loc 1 418 0
 919 0804 48908DE5 		str	r9, [sp, #72]
 920              		.loc 1 482 0
 921 0808 50A08DE5 		str	sl, [sp, #80]
 922              		.loc 1 394 0
 923 080c 34408DE5 		str	r4, [sp, #52]
 924              		.loc 1 380 0
 925 0810 5C608DE5 		str	r6, [sp, #92]
 926              	.LVL55:
 927              	.LBE13:
 928              		.loc 1 352 0
 929 0814 28208DE5 		str	r2, [sp, #40]
 930              	.LBB14:
 931              		.loc 1 482 0
 932 0818 0C308DE5 		str	r3, [sp, #12]
 933 081c 6CC08DE5 		str	ip, [sp, #108]
 934 0820 54E08DE5 		str	lr, [sp, #84]
 935              	.LVL56:
ARM GAS  /tmp/ccNOn6pJ.s 			page 26


 936 0824 58008DE5 		str	r0, [sp, #88]
 937              	.LVL57:
 938 0828 960200EA 		b	.L50
 939              	.LVL58:
 940              	.L51:
 941              		.loc 1 389 0
 942 082c 0C309DE5 		ldr	r3, [sp, #12]
 943              		.loc 1 392 0
 944 0830 F2C058E1 		ldrsh	ip, [r8, #-2]
 945              		.loc 1 389 0
 946 0834 B22053E1 		ldrh	r2, [r3, #-2]
 947              		.loc 1 394 0
 948 0838 34609DE5 		ldr	r6, [sp, #52]
 949              		.loc 1 392 0
 950 083c 8CC9A0E1 		mov	ip, ip, asl #19
 951              		.loc 1 391 0
 952 0840 F40058E1 		ldrsh	r0, [r8, #-4]
 953              		.loc 1 394 0
 954 0844 6C509DE5 		ldr	r5, [sp, #108]
 955              		.loc 1 392 0
 956 0848 CCC9A0E1 		mov	ip, ip, asr #19
 957              	.LVL59:
 958              		.loc 1 388 0
 959 084c B010D3E1 		ldrh	r1, [r3, #0]
 960              		.loc 1 394 0
 961 0850 00309DE5 		ldr	r3, [sp, #0]
 962              	.LVL60:
 963              		.loc 1 401 0
 964 0854 02206CE0 		rsb	r2, ip, r2
 965              		.loc 1 404 0
 966 0858 FA4058E1 		ldrsh	r4, [r8, #-10]
 967              		.loc 1 405 0
 968 085c F6E058E1 		ldrsh	lr, [r8, #-6]
 969              		.loc 1 394 0
 970 0860 000056E3 		cmp	r6, #0
 971 0864 0530A011 		movne	r3, r5
 972              		.loc 1 391 0
 973 0868 8009A0E1 		mov	r0, r0, asl #19
 974              		.loc 1 401 0
 975 086c 822BA0E1 		mov	r2, r2, asl #23
 976 0870 C23B83E0 		add	r3, r3, r2, asr #23
 977              	.LVL61:
 978              		.loc 1 391 0
 979 0874 C009A0E1 		mov	r0, r0, asr #19
 980              	.LVL62:
 981              		.loc 1 402 0
 982 0878 011060E0 		rsb	r1, r0, r1
 983              		.loc 1 405 0
 984 087c 930E0EE0 		mul	lr, r3, lr
 985              		.loc 1 404 0
 986 0880 930404E0 		mul	r4, r3, r4
 987              		.loc 1 405 0
 988 0884 2C709DE5 		ldr	r7, [sp, #44]
 989              		.loc 1 402 0
 990 0888 811BA0E1 		mov	r1, r1, asl #23
 991 088c C11BA0E1 		mov	r1, r1, asr #23
 992              		.loc 1 404 0
ARM GAS  /tmp/ccNOn6pJ.s 			page 27


 993 0890 0004A0E1 		mov	r0, r0, asl #8
 994              	.LVL63:
 995              		.loc 1 405 0
 996 0894 0CC4A0E1 		mov	ip, ip, asl #8
 997              	.LVL64:
 998 0898 0090A0E3 		mov	r9, #0
 999 089c 40E08DE5 		str	lr, [sp, #64]
 1000              		.loc 1 404 0
 1001 08a0 38408DE5 		str	r4, [sp, #56]
 1002              		.loc 1 402 0
 1003 08a4 60108DE5 		str	r1, [sp, #96]
 1004              		.loc 1 404 0
 1005 08a8 3C008DE5 		str	r0, [sp, #60]
 1006              		.loc 1 405 0
 1007 08ac 44C08DE5 		str	ip, [sp, #68]
 1008 08b0 08708DE5 		str	r7, [sp, #8]
 1009 08b4 64908DE5 		str	r9, [sp, #100]
 1010 08b8 820200EA 		b	.L55
 1011              	.L56:
 1012              		.loc 1 409 0
 1013 08bc 74A09DE5 		ldr	sl, [sp, #116]
 1014 08c0 00005AE3 		cmp	sl, #0
 1015 08c4 3802000A 		beq	.L57
 1016              		.loc 1 410 0
 1017 08c8 08B09DE5 		ldr	fp, [sp, #8]
 1018              		.loc 1 411 0
 1019 08cc 08C09DE5 		ldr	ip, [sp, #8]
 1020              		.loc 1 410 0
 1021 08d0 18B09BE5 		ldr	fp, [fp, #24]
 1022              		.loc 1 411 0
 1023 08d4 A8C09CE5 		ldr	ip, [ip, #168]
 1024              		.loc 1 410 0
 1025 08d8 54B08DE5 		str	fp, [sp, #84]
 1026              		.loc 1 412 0
 1027 08dc 0B005CE1 		cmp	ip, fp
 1028              		.loc 1 411 0
 1029 08e0 58C08DE5 		str	ip, [sp, #88]
 1030              		.loc 1 412 0
 1031 08e4 7C02009A 		bls	.L59
 1032              	.L57:
 1033              		.loc 1 418 0
 1034 08e8 48E09DE5 		ldr	lr, [sp, #72]
 1035 08ec FC2058E1 		ldrsh	r2, [r8, #-12]
 1036              		.loc 1 419 0
 1037 08f0 58009DE5 		ldr	r0, [sp, #88]
 1038              		.loc 1 418 0
 1039 08f4 00005EE3 		cmp	lr, #0
 1040 08f8 F81058E1 		ldrsh	r1, [r8, #-8]
 1041              		.loc 1 419 0
 1042 08fc 013040E2 		sub	r3, r0, #1
 1043              	.LVL65:
 1044              		.loc 1 420 0
 1045 0900 00206212 		rsbne	r2, r2, #0
 1046              		.loc 1 482 0
 1047 0904 60409DE5 		ldr	r4, [sp, #96]
 1048              		.loc 1 423 0
 1049 0908 54309D05 		ldreq	r3, [sp, #84]
ARM GAS  /tmp/ccNOn6pJ.s 			page 28


 1050              		.loc 1 420 0
 1051 090c 04208D15 		strne	r2, [sp, #4]
 1052              		.loc 1 424 0
 1053 0910 04208D05 		streq	r2, [sp, #4]
 1054              		.loc 1 482 0
 1055 0914 44C09DE5 		ldr	ip, [sp, #68]
 1056 0918 F82058E1 		ldrsh	r2, [r8, #-8]
 1057 091c 043083E0 		add	r3, r3, r4
 1058              	.LVL66:
 1059              		.loc 1 421 0
 1060 0920 00106112 		rsbne	r1, r1, #0
 1061 0924 18108D15 		strne	r1, [sp, #24]
 1062              		.loc 1 425 0
 1063 0928 18108D05 		streq	r1, [sp, #24]
 1064              		.loc 1 482 0
 1065 092c 93C22CE0 		mla	ip, r3, r2, ip
 1066 0930 FC1058E1 		ldrsh	r1, [r8, #-12]
 1067 0934 3C209DE5 		ldr	r2, [sp, #60]
 1068 0938 54609DE5 		ldr	r6, [sp, #84]
 1069 093c 58509DE5 		ldr	r5, [sp, #88]
 1070 0940 70709DE5 		ldr	r7, [sp, #112]
 1071 0944 68909DE5 		ldr	r9, [sp, #104]
 1072 0948 40A09DE5 		ldr	sl, [sp, #64]
 1073 094c 38B09DE5 		ldr	fp, [sp, #56]
 1074 0950 932122E0 		mla	r2, r3, r1, r2
 1075 0954 055066E0 		rsb	r5, r6, r5
 1076 0958 867087E0 		add	r7, r7, r6, asl #1
 1077 095c 069089E0 		add	r9, r9, r6
 1078 0960 0CC08AE0 		add	ip, sl, ip
 1079 0964 02208BE0 		add	r2, fp, r2
 1080 0968 14508DE5 		str	r5, [sp, #20]
 1081 096c 10708DE5 		str	r7, [sp, #16]
 1082 0970 1C908DE5 		str	r9, [sp, #28]
 1083 0974 04E09DE5 		ldr	lr, [sp, #4]
 1084 0978 18409DE5 		ldr	r4, [sp, #24]
 1085 097c 4C609DE5 		ldr	r6, [sp, #76]
 1086 0980 50A09DE5 		ldr	sl, [sp, #80]
 1087 0984 28B09DE5 		ldr	fp, [sp, #40]
 1088              	#APP
 1089 0988 620200EA 			b	1f				
 1090              	8:						
 1091 098c F03F0000 		.word	(0x3ff << 4)                    
 1092              							
 1093              	1:						
 1094 0990 0100D9E4 		ldrb	r0, [r9], #1			
 1095 0994 10301FE5 		ldr	r3, 8b				
 1096 0998 027087E2 		add	r7, r7, #2			
 1097 099c 00005BE1 		cmp	fp, r0			
 1098 09a0 7802009A 		bls	2f				
 1099 09a4 4C1203E0 		and	r1, r3, ip, asr #4		
 1100 09a8 C301A0E1 		mov	r0, r3, asr #3			
 1101 09ac 7F3001E2 		and	r3, r1, #0x7f			
 1102 09b0 C20300E0 		and	r0, r0, r2, asr #7		
 1103 09b4 033041E0 		sub	r3, r1, r3			
 1104 09b8 403283E0 		add	r3, r3, r0, asr #4		
 1105 09bc 8330D6E7 		ldrb	r3, [r6, r3, lsl #1]	
 1106              							
ARM GAS  /tmp/ccNOn6pJ.s 			page 29


 1107 09c0 701001E2 		and	r1, r1, #0x70			
 1108 09c4 833386E0 		add	r3, r6, r3, lsl #7		
 1109              							
 1110 09c8 0E0000E2 		and	r0, r0, #14			
 1111 09cc 013083E0 		add	r3, r3, r1			
 1112 09d0 003083E0 		add	r3, r3, r0			
 1113              							
 1114 09d4 0100D3E5 		ldrb	r0, [r3, #1]			
 1115 09d8 000050E3 		cmp	r0, #0				
 1116 09dc 00119A17 		ldrne	r1, [sl, r0, lsl #2]	
 1117 09e0 01B04915 		strneb	fp, [r9, #-1]		
 1118 09e4 B2104711 		strneh	r1, [r7, #-2]			
 1119              							
 1120              	2:						
 1121 09e8 0E2082E0 		add	r2, r2, lr		
 1122 09ec 04C08CE0 		add	ip, ip, r4		
 1123 09f0 015055E2 		subs	r5, r5, #1			
 1124 09f4 6202001A 		bne	1b				
 1125              	
 1126              	.LVL67:
 1127              	.L59:
 1128              		.loc 1 407 0
 1129 09f8 64C09DE5 		ldr	ip, [sp, #100]
 1130 09fc 08E09DE5 		ldr	lr, [sp, #8]
 1131 0a00 01C08CE2 		add	ip, ip, #1
 1132 0a04 18E08EE2 		add	lr, lr, #24
 1133 0a08 64C08DE5 		str	ip, [sp, #100]
 1134 0a0c 08E08DE5 		str	lr, [sp, #8]
 1135              	.L55:
 1136 0a10 64009DE5 		ldr	r0, [sp, #100]
 1137 0a14 5C209DE5 		ldr	r2, [sp, #92]
 1138 0a18 020050E1 		cmp	r0, r2
 1139 0a1c 2D02001A 		bne	.L56
 1140              		.loc 1 387 0
 1141 0a20 00309DE5 		ldr	r3, [sp, #0]
 1142              	.LVL68:
 1143 0a24 70409DE5 		ldr	r4, [sp, #112]
 1144 0a28 68509DE5 		ldr	r5, [sp, #104]
 1145 0a2c 6C609DE5 		ldr	r6, [sp, #108]
 1146 0a30 0C709DE5 		ldr	r7, [sp, #12]
 1147 0a34 013083E2 		add	r3, r3, #1
 1148 0a38 0A4D84E2 		add	r4, r4, #640
 1149 0a3c 055D85E2 		add	r5, r5, #320
 1150 0a40 016046E2 		sub	r6, r6, #1
 1151 0a44 107087E2 		add	r7, r7, #16
 1152 0a48 0C8088E2 		add	r8, r8, #12
 1153 0a4c 00308DE5 		str	r3, [sp, #0]
 1154 0a50 70408DE5 		str	r4, [sp, #112]
 1155 0a54 68508DE5 		str	r5, [sp, #104]
 1156 0a58 6C608DE5 		str	r6, [sp, #108]
 1157 0a5c 0C708DE5 		str	r7, [sp, #12]
 1158              	.LVL69:
 1159              	.L50:
 1160 0a60 00909DE5 		ldr	r9, [sp, #0]
 1161 0a64 30A09DE5 		ldr	sl, [sp, #48]
 1162 0a68 0A0059E1 		cmp	r9, sl
 1163 0a6c 0902009A 		bls	.L51
ARM GAS  /tmp/ccNOn6pJ.s 			page 30


 1164              	.LBE14:
 483:mode7.cpp     **** 
 484:mode7.cpp     **** 	} 
 485:mode7.cpp     ****     }
 486:mode7.cpp     **** 
 487:mode7.cpp     **** }
 1165              		.loc 1 487 0
 1166 0a70 78D08DE2 		add	sp, sp, #120
 1167 0a74 F08FBDE8 		ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 1168              	.L67:
 1169              		.align	2
 1170              	.L66:
 1171 0a78 00000000 		.word	GFX
 1172 0a7c 00000000 		.word	LineMatrixData
 1173 0a80 00000000 		.word	Memory
 1174 0a84 00000000 		.word	PPU
 1175 0a88 00000000 		.word	LineData
 1176              	.LFE31:
 1177              		.size	_Z25DrawBGMode7Background16R0Phii, .-_Z25DrawBGMode7Background16R0Phii
 1178              		.align	2
 1179 0a8c 0000A0E1 		.p2align 5,,31
 1179      0000A0E1 
 1179      0000A0E1 
 1179      0000A0E1 
 1179      0000A0E1 
 1180              		.global	_Z23DrawBGMode7Background16Phii
 1181              		.type	_Z23DrawBGMode7Background16Phii, %function
 1182              	_Z23DrawBGMode7Background16Phii:
 1183              	.LFB28:
 1184              		.loc 1 33 0
 1185              		@ args = 0, pretend = 0, frame = 0
 1186              		@ frame_needed = 0, uses_anonymous_args = 0
 1187              	.LVL70:
 1188 0aa0 F0402DE9 		stmfd	sp!, {r4, r5, r6, r7, lr}
 1189              	.LCFI6:
 1190              		.loc 1 38 0
 1191 0aa4 8C709FE5 		ldr	r7, .L81
 1192              		.loc 1 33 0
 1193 0aa8 0040A0E1 		mov	r4, r0
 1194              		.loc 1 38 0
 1195 0aac 6230D7E5 		ldrb	r3, [r7, #98]	@ zero_extendqisi2
 1196              		.loc 1 33 0
 1197 0ab0 0150A0E1 		mov	r5, r1
 1198              		.loc 1 38 0
 1199 0ab4 010013E3 		tst	r3, #1
 1200              		.loc 1 33 0
 1201 0ab8 0260A0E1 		mov	r6, r2
 1202              		.loc 1 41 0
 1203 0abc 78309F05 		ldreq	r3, .L81+4
 1204              		.loc 1 38 0
 1205 0ac0 B502000A 		beq	.L80
 1206              	.LVL71:
 1207              		.loc 1 39 0
 1208 0ac4 74309FE5 		ldr	r3, .L81+8
 1209 0ac8 0730D3E5 		ldrb	r3, [r3, #7]	@ zero_extendqisi2
 1210 0acc 000053E3 		cmp	r3, #0
 1211 0ad0 B402000A 		beq	.L71
ARM GAS  /tmp/ccNOn6pJ.s 			page 31


 1212 0ad4 FEFFFFEB 		bl	S9xBuildDirectColourMaps
 1213              	.LVL72:
 1214              	.L71:
 1215              		.loc 1 40 0
 1216 0ad8 64309FE5 		ldr	r3, .L81+12
 1217              	.L80:
 1218              		.loc 1 41 0
 1219 0adc 2C3087E5 		str	r3, [r7, #44]
 1220              		.loc 1 43 0
 1221 0ae0 60309FE5 		ldr	r3, .L81+16
 1222 0ae4 B93AD3E5 		ldrb	r3, [r3, #2745]	@ zero_extendqisi2
 1223 0ae8 000053E3 		cmp	r3, #0
 1224 0aec BD02000A 		beq	.L75
 1225 0af0 030053E3 		cmp	r3, #3
 1226 0af4 C702001A 		bne	.L79
 1227 0af8 C20200EA 		b	.L76
 1228              	.L75:
 1229              		.loc 1 45 0
 1230 0afc 0400A0E1 		mov	r0, r4
 1231 0b00 0510A0E1 		mov	r1, r5
 1232 0b04 0620A0E1 		mov	r2, r6
 1233              		.loc 1 54 0
 1234 0b08 F040BDE8 		ldmfd	sp!, {r4, r5, r6, r7, lr}
 1235              		.loc 1 45 0
 1236 0b0c FEFFFFEA 		b	_Z25DrawBGMode7Background16R0Phii
 1237              	.LVL73:
 1238              	.L76:
 1239              		.loc 1 48 0
 1240 0b10 0400A0E1 		mov	r0, r4
 1241 0b14 0510A0E1 		mov	r1, r5
 1242 0b18 0620A0E1 		mov	r2, r6
 1243              		.loc 1 54 0
 1244 0b1c F040BDE8 		ldmfd	sp!, {r4, r5, r6, r7, lr}
 1245              		.loc 1 48 0
 1246 0b20 FEFFFFEA 		b	_Z25DrawBGMode7Background16R3Phii
 1247              	.LVL74:
 1248              	.L79:
 1249              		.loc 1 51 0
 1250 0b24 0400A0E1 		mov	r0, r4
 1251 0b28 0510A0E1 		mov	r1, r5
 1252 0b2c 0620A0E1 		mov	r2, r6
 1253              		.loc 1 54 0
 1254 0b30 F040BDE8 		ldmfd	sp!, {r4, r5, r6, r7, lr}
 1255              		.loc 1 51 0
 1256 0b34 FEFFFFEA 		b	_Z27DrawBGMode7Background16R1R2Phii
 1257              	.L82:
 1258              		.align	2
 1259              	.L81:
 1260 0b38 00000000 		.word	GFX
 1261 0b3c 440C0000 		.word	IPPU+3140
 1262 0b40 00000000 		.word	IPPU
 1263 0b44 00000000 		.word	DirectColourMaps
 1264 0b48 00000000 		.word	PPU
 1265              	.LFE28:
 1266              		.size	_Z23DrawBGMode7Background16Phii, .-_Z23DrawBGMode7Background16Phii
 1267              		.section	.debug_frame,"",%progbits
 1268              	.Lframe0:
ARM GAS  /tmp/ccNOn6pJ.s 			page 32


 1269 0000 0C000000 		.4byte	.LECIE0-.LSCIE0
 1270              	.LSCIE0:
 1271 0004 FFFFFFFF 		.4byte	0xffffffff
 1272 0008 01       		.byte	0x1
 1273 0009 00       		.ascii	"\000"
 1274 000a 01       		.uleb128 0x1
 1275 000b 7C       		.sleb128 -4
 1276 000c 0E       		.byte	0xe
 1277 000d 0C       		.byte	0xc
 1278 000e 0D       		.uleb128 0xd
 1279 000f 00       		.uleb128 0x0
 1280              		.align	2
 1281              	.LECIE0:
 1282              	.LSFDE0:
 1283 0010 28000000 		.4byte	.LEFDE0-.LASFDE0
 1284              	.LASFDE0:
 1285 0014 00000000 		.4byte	.Lframe0
 1286 0018 00000000 		.4byte	.LFB29
 1287 001c AC030000 		.4byte	.LFE29-.LFB29
 1288 0020 48       		.byte	0x4
 1289              		.4byte	.LCFI0-.LFB29
 1290 0021 0E       		.byte	0xe
 1291 0022 24       		.uleb128 0x24
 1292 0023 4C       		.byte	0x4
 1293              		.4byte	.LCFI1-.LCFI0
 1294 0024 0E       		.byte	0xe
 1295 0025 AC01     		.uleb128 0xac
 1296 0027 8E       		.byte	0x8e
 1297 0028 01       		.uleb128 0x1
 1298 0029 8B       		.byte	0x8b
 1299 002a 02       		.uleb128 0x2
 1300 002b 8A       		.byte	0x8a
 1301 002c 03       		.uleb128 0x3
 1302 002d 89       		.byte	0x89
 1303 002e 04       		.uleb128 0x4
 1304 002f 88       		.byte	0x88
 1305 0030 05       		.uleb128 0x5
 1306 0031 87       		.byte	0x87
 1307 0032 06       		.uleb128 0x6
 1308 0033 86       		.byte	0x86
 1309 0034 07       		.uleb128 0x7
 1310 0035 85       		.byte	0x85
 1311 0036 08       		.uleb128 0x8
 1312 0037 84       		.byte	0x84
 1313 0038 09       		.uleb128 0x9
 1314 0039 000000   		.align	2
 1315              	.LEFDE0:
 1316              	.LSFDE2:
 1317 003c 28000000 		.4byte	.LEFDE2-.LASFDE2
 1318              	.LASFDE2:
 1319 0040 00000000 		.4byte	.Lframe0
 1320 0044 C0030000 		.4byte	.LFB30
 1321 0048 9C030000 		.4byte	.LFE30-.LFB30
 1322 004c 48       		.byte	0x4
 1323              		.4byte	.LCFI2-.LFB30
 1324 004d 0E       		.byte	0xe
 1325 004e 24       		.uleb128 0x24
ARM GAS  /tmp/ccNOn6pJ.s 			page 33


 1326 004f 8E       		.byte	0x8e
 1327 0050 01       		.uleb128 0x1
 1328 0051 8B       		.byte	0x8b
 1329 0052 02       		.uleb128 0x2
 1330 0053 8A       		.byte	0x8a
 1331 0054 03       		.uleb128 0x3
 1332 0055 89       		.byte	0x89
 1333 0056 04       		.uleb128 0x4
 1334 0057 88       		.byte	0x88
 1335 0058 05       		.uleb128 0x5
 1336 0059 87       		.byte	0x87
 1337 005a 06       		.uleb128 0x6
 1338 005b 86       		.byte	0x86
 1339 005c 07       		.uleb128 0x7
 1340 005d 85       		.byte	0x85
 1341 005e 08       		.uleb128 0x8
 1342 005f 84       		.byte	0x84
 1343 0060 09       		.uleb128 0x9
 1344 0061 54       		.byte	0x4
 1345              		.4byte	.LCFI3-.LCFI2
 1346 0062 0E       		.byte	0xe
 1347 0063 A001     		.uleb128 0xa0
 1348 0065 000000   		.align	2
 1349              	.LEFDE2:
 1350              	.LSFDE4:
 1351 0068 28000000 		.4byte	.LEFDE4-.LASFDE4
 1352              	.LASFDE4:
 1353 006c 00000000 		.4byte	.Lframe0
 1354 0070 60070000 		.4byte	.LFB31
 1355 0074 2C030000 		.4byte	.LFE31-.LFB31
 1356 0078 48       		.byte	0x4
 1357              		.4byte	.LCFI4-.LFB31
 1358 0079 0E       		.byte	0xe
 1359 007a 24       		.uleb128 0x24
 1360 007b 48       		.byte	0x4
 1361              		.4byte	.LCFI5-.LCFI4
 1362 007c 0E       		.byte	0xe
 1363 007d 9C01     		.uleb128 0x9c
 1364 007f 8E       		.byte	0x8e
 1365 0080 01       		.uleb128 0x1
 1366 0081 8B       		.byte	0x8b
 1367 0082 02       		.uleb128 0x2
 1368 0083 8A       		.byte	0x8a
 1369 0084 03       		.uleb128 0x3
 1370 0085 89       		.byte	0x89
 1371 0086 04       		.uleb128 0x4
 1372 0087 88       		.byte	0x88
 1373 0088 05       		.uleb128 0x5
 1374 0089 87       		.byte	0x87
 1375 008a 06       		.uleb128 0x6
 1376 008b 86       		.byte	0x86
 1377 008c 07       		.uleb128 0x7
 1378 008d 85       		.byte	0x85
 1379 008e 08       		.uleb128 0x8
 1380 008f 84       		.byte	0x84
 1381 0090 09       		.uleb128 0x9
 1382 0091 000000   		.align	2
ARM GAS  /tmp/ccNOn6pJ.s 			page 34


 1383              	.LEFDE4:
 1384              	.LSFDE6:
 1385 0094 1C000000 		.4byte	.LEFDE6-.LASFDE6
 1386              	.LASFDE6:
 1387 0098 00000000 		.4byte	.Lframe0
 1388 009c A00A0000 		.4byte	.LFB28
 1389 00a0 AC000000 		.4byte	.LFE28-.LFB28
 1390 00a4 44       		.byte	0x4
 1391              		.4byte	.LCFI6-.LFB28
 1392 00a5 0E       		.byte	0xe
 1393 00a6 14       		.uleb128 0x14
 1394 00a7 8E       		.byte	0x8e
 1395 00a8 01       		.uleb128 0x1
 1396 00a9 87       		.byte	0x87
 1397 00aa 02       		.uleb128 0x2
 1398 00ab 86       		.byte	0x86
 1399 00ac 03       		.uleb128 0x3
 1400 00ad 85       		.byte	0x85
 1401 00ae 04       		.uleb128 0x4
 1402 00af 84       		.byte	0x84
 1403 00b0 05       		.uleb128 0x5
 1404 00b1 000000   		.align	2
 1405              	.LEFDE6:
 1406              		.file 2 "port.h"
 1407              		.file 3 "gfx.h"
 1408              		.file 4 "<built-in>"
 1409              		.file 5 "snes9x.h"
 1410              		.file 6 "65c816.h"
 1411              		.file 7 "memmap.h"
 1412              		.file 8 "rops.h"
 1413              		.file 9 "ppu.h"
 1414              		.file 10 "cpuexec.h"
 1415              		.file 11 "apu.h"
 1416              		.file 12 "spc700.h"
 1417              		.text
 1418              	.Letext0:
 1419 0b4c 0000A0E1 		.section	.debug_loc,"",%progbits
 1419      0000A0E1 
 1419      0000A0E1 
 1419      0000A0E1 
 1419      0000A0E1 
 1420              	.Ldebug_loc0:
 1421              	.LLST0:
 1422 0000 00000000 		.4byte	.LFB29-.Ltext0
 1423 0004 08000000 		.4byte	.LCFI0-.Ltext0
 1424 0008 0100     		.2byte	0x1
 1425 000a 5D       		.byte	0x5d
 1426 000b 08000000 		.4byte	.LCFI0-.Ltext0
 1427 000f 14000000 		.4byte	.LCFI1-.Ltext0
 1428 0013 0200     		.2byte	0x2
 1429 0015 7D       		.byte	0x7d
 1430 0016 24       		.sleb128 36
 1431 0017 14000000 		.4byte	.LCFI1-.Ltext0
 1432 001b AC030000 		.4byte	.LFE29-.Ltext0
 1433 001f 0300     		.2byte	0x3
 1434 0021 7D       		.byte	0x7d
 1435 0022 AC01     		.sleb128 172
ARM GAS  /tmp/ccNOn6pJ.s 			page 35


 1436 0024 00000000 		.4byte	0x0
 1437 0028 00000000 		.4byte	0x0
 1438              	.LLST1:
 1439 002c 00000000 		.4byte	.LVL0-.Ltext0
 1440 0030 9C000000 		.4byte	.LVL3-.Ltext0
 1441 0034 0100     		.2byte	0x1
 1442 0036 50       		.byte	0x50
 1443 0037 9C000000 		.4byte	.LVL3-.Ltext0
 1444 003b C8000000 		.4byte	.LVL9-.Ltext0
 1445 003f 0200     		.2byte	0x2
 1446 0041 91       		.byte	0x91
 1447 0042 6C       		.sleb128 -20
 1448 0043 80030000 		.4byte	.LVL21-.Ltext0
 1449 0047 AC030000 		.4byte	.LFE29-.Ltext0
 1450 004b 0100     		.2byte	0x1
 1451 004d 50       		.byte	0x50
 1452 004e 00000000 		.4byte	0x0
 1453 0052 00000000 		.4byte	0x0
 1454              	.LLST2:
 1455 0056 00000000 		.4byte	.LVL0-.Ltext0
 1456 005a 0C000000 		.4byte	.LVL1-.Ltext0
 1457 005e 0100     		.2byte	0x1
 1458 0060 51       		.byte	0x51
 1459 0061 00000000 		.4byte	0x0
 1460 0065 00000000 		.4byte	0x0
 1461              	.LLST3:
 1462 0069 00000000 		.4byte	.LVL0-.Ltext0
 1463 006d C8000000 		.4byte	.LVL8-.Ltext0
 1464 0071 0100     		.2byte	0x1
 1465 0073 52       		.byte	0x52
 1466 0074 C8000000 		.4byte	.LVL8-.Ltext0
 1467 0078 AC030000 		.4byte	.LFE29-.Ltext0
 1468 007c 0300     		.2byte	0x3
 1469 007e 91       		.byte	0x91
 1470 007f 9C7F     		.sleb128 -100
 1471 0081 00000000 		.4byte	0x0
 1472 0085 00000000 		.4byte	0x0
 1473              	.LLST4:
 1474 0089 C0010000 		.4byte	.LVL17-.Ltext0
 1475 008d 38020000 		.4byte	.LVL18-.Ltext0
 1476 0091 0100     		.2byte	0x1
 1477 0093 56       		.byte	0x56
 1478 0094 00000000 		.4byte	0x0
 1479 0098 00000000 		.4byte	0x0
 1480              	.LLST5:
 1481 009c 2C010000 		.4byte	.LVL13-.Ltext0
 1482 00a0 40010000 		.4byte	.LVL14-.Ltext0
 1483 00a4 0100     		.2byte	0x1
 1484 00a6 50       		.byte	0x50
 1485 00a7 00000000 		.4byte	0x0
 1486 00ab 00000000 		.4byte	0x0
 1487              	.LLST6:
 1488 00af F0000000 		.4byte	.LVL11-.Ltext0
 1489 00b3 44010000 		.4byte	.LVL15-.Ltext0
 1490 00b7 0100     		.2byte	0x1
 1491 00b9 51       		.byte	0x51
 1492 00ba 00000000 		.4byte	0x0
ARM GAS  /tmp/ccNOn6pJ.s 			page 36


 1493 00be 00000000 		.4byte	0x0
 1494              	.LLST7:
 1495 00c2 EC000000 		.4byte	.LVL10-.Ltext0
 1496 00c6 10010000 		.4byte	.LVL12-.Ltext0
 1497 00ca 0100     		.2byte	0x1
 1498 00cc 53       		.byte	0x53
 1499 00cd 28030000 		.4byte	.LVL19-.Ltext0
 1500 00d1 30030000 		.4byte	.LVL20-.Ltext0
 1501 00d5 0100     		.2byte	0x1
 1502 00d7 53       		.byte	0x53
 1503 00d8 00000000 		.4byte	0x0
 1504 00dc 00000000 		.4byte	0x0
 1505              	.LLST8:
 1506 00e0 C0030000 		.4byte	.LFB30-.Ltext0
 1507 00e4 C8030000 		.4byte	.LCFI2-.Ltext0
 1508 00e8 0100     		.2byte	0x1
 1509 00ea 5D       		.byte	0x5d
 1510 00eb C8030000 		.4byte	.LCFI2-.Ltext0
 1511 00ef DC030000 		.4byte	.LCFI3-.Ltext0
 1512 00f3 0200     		.2byte	0x2
 1513 00f5 7D       		.byte	0x7d
 1514 00f6 24       		.sleb128 36
 1515 00f7 DC030000 		.4byte	.LCFI3-.Ltext0
 1516 00fb 5C070000 		.4byte	.LFE30-.Ltext0
 1517 00ff 0300     		.2byte	0x3
 1518 0101 7D       		.byte	0x7d
 1519 0102 A001     		.sleb128 160
 1520 0104 00000000 		.4byte	0x0
 1521 0108 00000000 		.4byte	0x0
 1522              	.LLST9:
 1523 010c C0030000 		.4byte	.LVL22-.Ltext0
 1524 0110 E0030000 		.4byte	.LVL24-.Ltext0
 1525 0114 0100     		.2byte	0x1
 1526 0116 50       		.byte	0x50
 1527 0117 E0030000 		.4byte	.LVL24-.Ltext0
 1528 011b AC040000 		.4byte	.LVL29-.Ltext0
 1529 011f 0100     		.2byte	0x1
 1530 0121 54       		.byte	0x54
 1531 0122 AC040000 		.4byte	.LVL29-.Ltext0
 1532 0126 DC040000 		.4byte	.LVL35-.Ltext0
 1533 012a 0200     		.2byte	0x2
 1534 012c 91       		.byte	0x91
 1535 012d 6C       		.sleb128 -20
 1536 012e 28070000 		.4byte	.LVL47-.Ltext0
 1537 0132 5C070000 		.4byte	.LFE30-.Ltext0
 1538 0136 0100     		.2byte	0x1
 1539 0138 54       		.byte	0x54
 1540 0139 00000000 		.4byte	0x0
 1541 013d 00000000 		.4byte	0x0
 1542              	.LLST10:
 1543 0141 C0030000 		.4byte	.LVL22-.Ltext0
 1544 0145 CC030000 		.4byte	.LVL23-.Ltext0
 1545 0149 0100     		.2byte	0x1
 1546 014b 51       		.byte	0x51
 1547 014c 00000000 		.4byte	0x0
 1548 0150 00000000 		.4byte	0x0
 1549              	.LLST11:
ARM GAS  /tmp/ccNOn6pJ.s 			page 37


 1550 0154 C0030000 		.4byte	.LVL22-.Ltext0
 1551 0158 FC030000 		.4byte	.LVL27-.Ltext0
 1552 015c 0100     		.2byte	0x1
 1553 015e 52       		.byte	0x52
 1554 015f FC030000 		.4byte	.LVL27-.Ltext0
 1555 0163 5C070000 		.4byte	.LFE30-.Ltext0
 1556 0167 0300     		.2byte	0x3
 1557 0169 91       		.byte	0x91
 1558 016a A47F     		.sleb128 -92
 1559 016c 00000000 		.4byte	0x0
 1560 0170 00000000 		.4byte	0x0
 1561              	.LLST12:
 1562 0174 AC050000 		.4byte	.LVL43-.Ltext0
 1563 0178 D0050000 		.4byte	.LVL44-.Ltext0
 1564 017c 0100     		.2byte	0x1
 1565 017e 53       		.byte	0x53
 1566 017f 00000000 		.4byte	0x0
 1567 0183 00000000 		.4byte	0x0
 1568              	.LLST13:
 1569 0187 34050000 		.4byte	.LVL39-.Ltext0
 1570 018b 44050000 		.4byte	.LVL41-.Ltext0
 1571 018f 0100     		.2byte	0x1
 1572 0191 50       		.byte	0x50
 1573 0192 00000000 		.4byte	0x0
 1574 0196 00000000 		.4byte	0x0
 1575              	.LLST14:
 1576 019a FC040000 		.4byte	.LVL37-.Ltext0
 1577 019e 40050000 		.4byte	.LVL40-.Ltext0
 1578 01a2 0100     		.2byte	0x1
 1579 01a4 5C       		.byte	0x5c
 1580 01a5 00000000 		.4byte	0x0
 1581 01a9 00000000 		.4byte	0x0
 1582              	.LLST15:
 1583 01ad F4040000 		.4byte	.LVL36-.Ltext0
 1584 01b1 20050000 		.4byte	.LVL38-.Ltext0
 1585 01b5 0100     		.2byte	0x1
 1586 01b7 53       		.byte	0x53
 1587 01b8 D8060000 		.4byte	.LVL45-.Ltext0
 1588 01bc F0060000 		.4byte	.LVL46-.Ltext0
 1589 01c0 0100     		.2byte	0x1
 1590 01c2 53       		.byte	0x53
 1591 01c3 00000000 		.4byte	0x0
 1592 01c7 00000000 		.4byte	0x0
 1593              	.LLST16:
 1594 01cb 60070000 		.4byte	.LFB31-.Ltext0
 1595 01cf 68070000 		.4byte	.LCFI4-.Ltext0
 1596 01d3 0100     		.2byte	0x1
 1597 01d5 5D       		.byte	0x5d
 1598 01d6 68070000 		.4byte	.LCFI4-.Ltext0
 1599 01da 70070000 		.4byte	.LCFI5-.Ltext0
 1600 01de 0200     		.2byte	0x2
 1601 01e0 7D       		.byte	0x7d
 1602 01e1 24       		.sleb128 36
 1603 01e2 70070000 		.4byte	.LCFI5-.Ltext0
 1604 01e6 8C0A0000 		.4byte	.LFE31-.Ltext0
 1605 01ea 0300     		.2byte	0x3
 1606 01ec 7D       		.byte	0x7d
ARM GAS  /tmp/ccNOn6pJ.s 			page 38


 1607 01ed 9C01     		.sleb128 156
 1608 01ef 00000000 		.4byte	0x0
 1609 01f3 00000000 		.4byte	0x0
 1610              	.LLST17:
 1611 01f7 60070000 		.4byte	.LVL48-.Ltext0
 1612 01fb F8070000 		.4byte	.LVL52-.Ltext0
 1613 01ff 0100     		.2byte	0x1
 1614 0201 50       		.byte	0x50
 1615 0202 00080000 		.4byte	.LVL53-.Ltext0
 1616 0206 8C0A0000 		.4byte	.LFE31-.Ltext0
 1617 020a 0200     		.2byte	0x2
 1618 020c 91       		.byte	0x91
 1619 020d 70       		.sleb128 -16
 1620 020e 00000000 		.4byte	0x0
 1621 0212 00000000 		.4byte	0x0
 1622              	.LLST18:
 1623 0216 60070000 		.4byte	.LVL48-.Ltext0
 1624 021a 84070000 		.4byte	.LVL50-.Ltext0
 1625 021e 0100     		.2byte	0x1
 1626 0220 51       		.byte	0x51
 1627 0221 00000000 		.4byte	0x0
 1628 0225 00000000 		.4byte	0x0
 1629              	.LLST19:
 1630 0229 60070000 		.4byte	.LVL48-.Ltext0
 1631 022d 2C080000 		.4byte	.LVL58-.Ltext0
 1632 0231 0100     		.2byte	0x1
 1633 0233 52       		.byte	0x52
 1634 0234 2C080000 		.4byte	.LVL58-.Ltext0
 1635 0238 8C0A0000 		.4byte	.LFE31-.Ltext0
 1636 023c 0300     		.2byte	0x3
 1637 023e 91       		.byte	0x91
 1638 023f A87F     		.sleb128 -88
 1639 0241 00000000 		.4byte	0x0
 1640 0245 00000000 		.4byte	0x0
 1641              	.LLST20:
 1642 0249 00090000 		.4byte	.LVL65-.Ltext0
 1643 024d 20090000 		.4byte	.LVL66-.Ltext0
 1644 0251 0100     		.2byte	0x1
 1645 0253 53       		.byte	0x53
 1646 0254 00000000 		.4byte	0x0
 1647 0258 00000000 		.4byte	0x0
 1648              	.LLST21:
 1649 025c E0070000 		.4byte	.LVL51-.Ltext0
 1650 0260 14080000 		.4byte	.LVL55-.Ltext0
 1651 0264 0200     		.2byte	0x2
 1652 0266 91       		.byte	0x91
 1653 0267 74       		.sleb128 -12
 1654 0268 14080000 		.4byte	.LVL55-.Ltext0
 1655 026c 8C0A0000 		.4byte	.LFE31-.Ltext0
 1656 0270 0200     		.2byte	0x2
 1657 0272 91       		.byte	0x91
 1658 0273 5C       		.sleb128 -36
 1659 0274 00000000 		.4byte	0x0
 1660 0278 00000000 		.4byte	0x0
 1661              	.LLST22:
 1662 027c 78080000 		.4byte	.LVL62-.Ltext0
 1663 0280 94080000 		.4byte	.LVL63-.Ltext0
ARM GAS  /tmp/ccNOn6pJ.s 			page 39


 1664 0284 0100     		.2byte	0x1
 1665 0286 50       		.byte	0x50
 1666 0287 00000000 		.4byte	0x0
 1667 028b 00000000 		.4byte	0x0
 1668              	.LLST23:
 1669 028f 4C080000 		.4byte	.LVL59-.Ltext0
 1670 0293 98080000 		.4byte	.LVL64-.Ltext0
 1671 0297 0100     		.2byte	0x1
 1672 0299 5C       		.byte	0x5c
 1673 029a 00000000 		.4byte	0x0
 1674 029e 00000000 		.4byte	0x0
 1675              	.LLST24:
 1676 02a2 54080000 		.4byte	.LVL60-.Ltext0
 1677 02a6 74080000 		.4byte	.LVL61-.Ltext0
 1678 02aa 0100     		.2byte	0x1
 1679 02ac 53       		.byte	0x53
 1680 02ad 74080000 		.4byte	.LVL61-.Ltext0
 1681 02b1 00090000 		.4byte	.LVL65-.Ltext0
 1682 02b5 0100     		.2byte	0x1
 1683 02b7 53       		.byte	0x53
 1684 02b8 F8090000 		.4byte	.LVL67-.Ltext0
 1685 02bc 240A0000 		.4byte	.LVL68-.Ltext0
 1686 02c0 0100     		.2byte	0x1
 1687 02c2 53       		.byte	0x53
 1688 02c3 00000000 		.4byte	0x0
 1689 02c7 00000000 		.4byte	0x0
 1690              	.LLST25:
 1691 02cb A00A0000 		.4byte	.LFB28-.Ltext0
 1692 02cf A40A0000 		.4byte	.LCFI6-.Ltext0
 1693 02d3 0100     		.2byte	0x1
 1694 02d5 5D       		.byte	0x5d
 1695 02d6 A40A0000 		.4byte	.LCFI6-.Ltext0
 1696 02da 4C0B0000 		.4byte	.LFE28-.Ltext0
 1697 02de 0200     		.2byte	0x2
 1698 02e0 7D       		.byte	0x7d
 1699 02e1 14       		.sleb128 20
 1700 02e2 00000000 		.4byte	0x0
 1701 02e6 00000000 		.4byte	0x0
 1702              	.LLST26:
 1703 02ea A00A0000 		.4byte	.LVL70-.Ltext0
 1704 02ee C40A0000 		.4byte	.LVL71-.Ltext0
 1705 02f2 0100     		.2byte	0x1
 1706 02f4 50       		.byte	0x50
 1707 02f5 C40A0000 		.4byte	.LVL71-.Ltext0
 1708 02f9 4C0B0000 		.4byte	.LFE28-.Ltext0
 1709 02fd 0100     		.2byte	0x1
 1710 02ff 54       		.byte	0x54
 1711 0300 00000000 		.4byte	0x0
 1712 0304 00000000 		.4byte	0x0
 1713              	.LLST27:
 1714 0308 A00A0000 		.4byte	.LVL70-.Ltext0
 1715 030c C40A0000 		.4byte	.LVL71-.Ltext0
 1716 0310 0100     		.2byte	0x1
 1717 0312 51       		.byte	0x51
 1718 0313 C40A0000 		.4byte	.LVL71-.Ltext0
 1719 0317 4C0B0000 		.4byte	.LFE28-.Ltext0
 1720 031b 0100     		.2byte	0x1
ARM GAS  /tmp/ccNOn6pJ.s 			page 40


 1721 031d 55       		.byte	0x55
 1722 031e 00000000 		.4byte	0x0
 1723 0322 00000000 		.4byte	0x0
 1724              	.LLST28:
 1725 0326 A00A0000 		.4byte	.LVL70-.Ltext0
 1726 032a C40A0000 		.4byte	.LVL71-.Ltext0
 1727 032e 0100     		.2byte	0x1
 1728 0330 52       		.byte	0x52
 1729 0331 C40A0000 		.4byte	.LVL71-.Ltext0
 1730 0335 4C0B0000 		.4byte	.LFE28-.Ltext0
 1731 0339 0100     		.2byte	0x1
 1732 033b 56       		.byte	0x56
 1733 033c 00000000 		.4byte	0x0
 1734 0340 00000000 		.4byte	0x0
 1735              		.section	.debug_info
 1736 0000 22270000 		.4byte	0x2722
 1737 0004 0200     		.2byte	0x2
 1738 0006 00000000 		.4byte	.Ldebug_abbrev0
 1739 000a 04       		.byte	0x4
 1740 000b 01       		.uleb128 0x1
 1741 000c 00000000 		.4byte	.Ldebug_line0
 1742 0010 4C0B0000 		.4byte	.Letext0
 1743 0014 00000000 		.4byte	.Ltext0
 1744 0018 73080000 		.4byte	.LASF505
 1745 001c 04       		.byte	0x4
 1746 001d 3C140000 		.4byte	.LASF506
 1747 0021 5A0E0000 		.4byte	.LASF507
 1748 0025 02       		.uleb128 0x2
 1749 0026 160E0000 		.4byte	.LASF0
 1750 002a 04       		.byte	0x4
 1751 002b 07       		.byte	0x7
 1752 002c 02       		.uleb128 0x2
 1753 002d 85050000 		.4byte	.LASF1
 1754 0031 01       		.byte	0x1
 1755 0032 08       		.byte	0x8
 1756 0033 02       		.uleb128 0x2
 1757 0034 72040000 		.4byte	.LASF2
 1758 0038 02       		.byte	0x2
 1759 0039 07       		.byte	0x7
 1760 003a 02       		.uleb128 0x2
 1761 003b F3090000 		.4byte	.LASF3
 1762 003f 04       		.byte	0x4
 1763 0040 07       		.byte	0x7
 1764 0041 02       		.uleb128 0x2
 1765 0042 2E050000 		.4byte	.LASF4
 1766 0046 01       		.byte	0x1
 1767 0047 06       		.byte	0x6
 1768 0048 02       		.uleb128 0x2
 1769 0049 DB130000 		.4byte	.LASF5
 1770 004d 02       		.byte	0x2
 1771 004e 05       		.byte	0x5
 1772 004f 03       		.uleb128 0x3
 1773 0050 696E7400 		.ascii	"int\000"
 1774 0054 04       		.byte	0x4
 1775 0055 05       		.byte	0x5
 1776 0056 02       		.uleb128 0x2
 1777 0057 410C0000 		.4byte	.LASF6
ARM GAS  /tmp/ccNOn6pJ.s 			page 41


 1778 005b 08       		.byte	0x8
 1779 005c 05       		.byte	0x5
 1780 005d 02       		.uleb128 0x2
 1781 005e BF100000 		.4byte	.LASF7
 1782 0062 08       		.byte	0x8
 1783 0063 07       		.byte	0x7
 1784 0064 02       		.uleb128 0x2
 1785 0065 AB030000 		.4byte	.LASF8
 1786 0069 04       		.byte	0x4
 1787 006a 05       		.byte	0x5
 1788 006b 04       		.uleb128 0x4
 1789 006c 7B000000 		.4byte	0x7b
 1790 0070 4F000000 		.4byte	0x4f
 1791 0074 05       		.uleb128 0x5
 1792 0075 7B000000 		.4byte	0x7b
 1793 0079 01       		.byte	0x1
 1794 007a 00       		.byte	0x0
 1795 007b 02       		.uleb128 0x2
 1796 007c 160E0000 		.4byte	.LASF0
 1797 0080 04       		.byte	0x4
 1798 0081 07       		.byte	0x7
 1799 0082 06       		.uleb128 0x6
 1800 0083 04       		.byte	0x4
 1801 0084 88000000 		.4byte	0x88
 1802 0088 02       		.uleb128 0x2
 1803 0089 7D060000 		.4byte	.LASF9
 1804 008d 01       		.byte	0x1
 1805 008e 08       		.byte	0x8
 1806 008f 07       		.uleb128 0x7
 1807 0090 04       		.byte	0x4
 1808 0091 06       		.uleb128 0x6
 1809 0092 04       		.byte	0x4
 1810 0093 97000000 		.4byte	0x97
 1811 0097 08       		.uleb128 0x8
 1812 0098 88000000 		.4byte	0x88
 1813 009c 09       		.uleb128 0x9
 1814 009d 9D090000 		.4byte	.LASF10
 1815 00a1 02       		.byte	0x2
 1816 00a2 B0       		.byte	0xb0
 1817 00a3 2C000000 		.4byte	0x2c
 1818 00a7 09       		.uleb128 0x9
 1819 00a8 A0130000 		.4byte	.LASF11
 1820 00ac 02       		.byte	0x2
 1821 00ad B1       		.byte	0xb1
 1822 00ae 2C000000 		.4byte	0x2c
 1823 00b2 09       		.uleb128 0x9
 1824 00b3 F8180000 		.4byte	.LASF12
 1825 00b7 02       		.byte	0x2
 1826 00b8 B2       		.byte	0xb2
 1827 00b9 33000000 		.4byte	0x33
 1828 00bd 09       		.uleb128 0x9
 1829 00be F3080000 		.4byte	.LASF13
 1830 00c2 02       		.byte	0x2
 1831 00c3 B3       		.byte	0xb3
 1832 00c4 25000000 		.4byte	0x25
 1833 00c8 09       		.uleb128 0x9
 1834 00c9 31010000 		.4byte	.LASF14
ARM GAS  /tmp/ccNOn6pJ.s 			page 42


 1835 00cd 02       		.byte	0x2
 1836 00ce B4       		.byte	0xb4
 1837 00cf 25000000 		.4byte	0x25
 1838 00d3 09       		.uleb128 0x9
 1839 00d4 6B180000 		.4byte	.LASF15
 1840 00d8 02       		.byte	0x2
 1841 00d9 B7       		.byte	0xb7
 1842 00da 4F000000 		.4byte	0x4f
 1843 00de 09       		.uleb128 0x9
 1844 00df 82090000 		.4byte	.LASF16
 1845 00e3 02       		.byte	0x2
 1846 00e4 C3       		.byte	0xc3
 1847 00e5 2C000000 		.4byte	0x2c
 1848 00e9 0A       		.uleb128 0xa
 1849 00ea 2D010000 		.4byte	0x12d
 1850 00ee B9020000 		.4byte	.LASF455
 1851 00f2 02       		.byte	0x2
 1852 00f3 06       		.byte	0x6
 1853 00f4 63       		.byte	0x63
 1854 00f5 0B       		.uleb128 0xb
 1855 00f6 1A010000 		.4byte	0x11a
 1856 00fa 150F0000 		.4byte	.LASF17
 1857 00fe 02       		.byte	0x2
 1858 00ff 06       		.byte	0x6
 1859 0100 65       		.byte	0x65
 1860 0101 0C       		.uleb128 0xc
 1861 0102 6C00     		.ascii	"l\000"
 1862 0104 06       		.byte	0x6
 1863 0105 65       		.byte	0x65
 1864 0106 A7000000 		.4byte	0xa7
 1865 010a 02       		.byte	0x2
 1866 010b 23       		.byte	0x23
 1867 010c 00       		.uleb128 0x0
 1868 010d 0C       		.uleb128 0xc
 1869 010e 6800     		.ascii	"h\000"
 1870 0110 06       		.byte	0x6
 1871 0111 65       		.byte	0x65
 1872 0112 A7000000 		.4byte	0xa7
 1873 0116 02       		.byte	0x2
 1874 0117 23       		.byte	0x23
 1875 0118 01       		.uleb128 0x1
 1876 0119 00       		.byte	0x0
 1877 011a 0D       		.uleb128 0xd
 1878 011b 4200     		.ascii	"B\000"
 1879 011d 06       		.byte	0x6
 1880 011e 65       		.byte	0x65
 1881 011f F5000000 		.4byte	0xf5
 1882 0123 0D       		.uleb128 0xd
 1883 0124 5700     		.ascii	"W\000"
 1884 0126 06       		.byte	0x6
 1885 0127 69       		.byte	0x69
 1886 0128 B2000000 		.4byte	0xb2
 1887 012c 00       		.byte	0x0
 1888 012d 0B       		.uleb128 0xb
 1889 012e A9010000 		.4byte	0x1a9
 1890 0132 EC0F0000 		.4byte	.LASF18
 1891 0136 10       		.byte	0x10
ARM GAS  /tmp/ccNOn6pJ.s 			page 43


 1892 0137 06       		.byte	0x6
 1893 0138 6C       		.byte	0x6c
 1894 0139 0C       		.uleb128 0xc
 1895 013a 504200   		.ascii	"PB\000"
 1896 013d 06       		.byte	0x6
 1897 013e 6D       		.byte	0x6d
 1898 013f A7000000 		.4byte	0xa7
 1899 0143 02       		.byte	0x2
 1900 0144 23       		.byte	0x23
 1901 0145 00       		.uleb128 0x0
 1902 0146 0C       		.uleb128 0xc
 1903 0147 444200   		.ascii	"DB\000"
 1904 014a 06       		.byte	0x6
 1905 014b 6E       		.byte	0x6e
 1906 014c A7000000 		.4byte	0xa7
 1907 0150 02       		.byte	0x2
 1908 0151 23       		.byte	0x23
 1909 0152 01       		.uleb128 0x1
 1910 0153 0C       		.uleb128 0xc
 1911 0154 5000     		.ascii	"P\000"
 1912 0156 06       		.byte	0x6
 1913 0157 6F       		.byte	0x6f
 1914 0158 E9000000 		.4byte	0xe9
 1915 015c 02       		.byte	0x2
 1916 015d 23       		.byte	0x23
 1917 015e 02       		.uleb128 0x2
 1918 015f 0C       		.uleb128 0xc
 1919 0160 4100     		.ascii	"A\000"
 1920 0162 06       		.byte	0x6
 1921 0163 70       		.byte	0x70
 1922 0164 E9000000 		.4byte	0xe9
 1923 0168 02       		.byte	0x2
 1924 0169 23       		.byte	0x23
 1925 016a 04       		.uleb128 0x4
 1926 016b 0C       		.uleb128 0xc
 1927 016c 4400     		.ascii	"D\000"
 1928 016e 06       		.byte	0x6
 1929 016f 71       		.byte	0x71
 1930 0170 E9000000 		.4byte	0xe9
 1931 0174 02       		.byte	0x2
 1932 0175 23       		.byte	0x23
 1933 0176 06       		.uleb128 0x6
 1934 0177 0C       		.uleb128 0xc
 1935 0178 5800     		.ascii	"X\000"
 1936 017a 06       		.byte	0x6
 1937 017b 72       		.byte	0x72
 1938 017c E9000000 		.4byte	0xe9
 1939 0180 02       		.byte	0x2
 1940 0181 23       		.byte	0x23
 1941 0182 08       		.uleb128 0x8
 1942 0183 0C       		.uleb128 0xc
 1943 0184 5300     		.ascii	"S\000"
 1944 0186 06       		.byte	0x6
 1945 0187 73       		.byte	0x73
 1946 0188 E9000000 		.4byte	0xe9
 1947 018c 02       		.byte	0x2
 1948 018d 23       		.byte	0x23
ARM GAS  /tmp/ccNOn6pJ.s 			page 44


 1949 018e 0A       		.uleb128 0xa
 1950 018f 0C       		.uleb128 0xc
 1951 0190 5900     		.ascii	"Y\000"
 1952 0192 06       		.byte	0x6
 1953 0193 74       		.byte	0x74
 1954 0194 E9000000 		.4byte	0xe9
 1955 0198 02       		.byte	0x2
 1956 0199 23       		.byte	0x23
 1957 019a 0C       		.uleb128 0xc
 1958 019b 0C       		.uleb128 0xc
 1959 019c 504300   		.ascii	"PC\000"
 1960 019f 06       		.byte	0x6
 1961 01a0 75       		.byte	0x75
 1962 01a1 B2000000 		.4byte	0xb2
 1963 01a5 02       		.byte	0x2
 1964 01a6 23       		.byte	0x23
 1965 01a7 0E       		.uleb128 0xe
 1966 01a8 00       		.byte	0x0
 1967 01a9 0B       		.uleb128 0xb
 1968 01aa 16040000 		.4byte	0x416
 1969 01ae D7110000 		.4byte	.LASF19
 1970 01b2 9C       		.byte	0x9c
 1971 01b3 05       		.byte	0x5
 1972 01b4 C6       		.byte	0xc6
 1973 01b5 0E       		.uleb128 0xe
 1974 01b6 9A160000 		.4byte	.LASF20
 1975 01ba 05       		.byte	0x5
 1976 01bb C7       		.byte	0xc7
 1977 01bc C8000000 		.4byte	0xc8
 1978 01c0 02       		.byte	0x2
 1979 01c1 23       		.byte	0x23
 1980 01c2 00       		.uleb128 0x0
 1981 01c3 0E       		.uleb128 0xe
 1982 01c4 740D0000 		.4byte	.LASF21
 1983 01c8 05       		.byte	0x5
 1984 01c9 C8       		.byte	0xc8
 1985 01ca 9C000000 		.4byte	0x9c
 1986 01ce 02       		.byte	0x2
 1987 01cf 23       		.byte	0x23
 1988 01d0 04       		.uleb128 0x4
 1989 01d1 0E       		.uleb128 0xe
 1990 01d2 29100000 		.4byte	.LASF22
 1991 01d6 05       		.byte	0x5
 1992 01d7 C9       		.byte	0xc9
 1993 01d8 9C000000 		.4byte	0x9c
 1994 01dc 02       		.byte	0x2
 1995 01dd 23       		.byte	0x23
 1996 01de 05       		.uleb128 0x5
 1997 01df 0E       		.uleb128 0xe
 1998 01e0 27110000 		.4byte	.LASF23
 1999 01e4 05       		.byte	0x5
 2000 01e5 CA       		.byte	0xca
 2001 01e6 9C000000 		.4byte	0x9c
 2002 01ea 02       		.byte	0x2
 2003 01eb 23       		.byte	0x23
 2004 01ec 06       		.uleb128 0x6
 2005 01ed 0E       		.uleb128 0xe
ARM GAS  /tmp/ccNOn6pJ.s 			page 45


 2006 01ee 02040000 		.4byte	.LASF24
 2007 01f2 05       		.byte	0x5
 2008 01f3 CB       		.byte	0xcb
 2009 01f4 9C000000 		.4byte	0x9c
 2010 01f8 02       		.byte	0x2
 2011 01f9 23       		.byte	0x23
 2012 01fa 07       		.uleb128 0x7
 2013 01fb 0E       		.uleb128 0xe
 2014 01fc 05190000 		.4byte	.LASF25
 2015 0200 05       		.byte	0x5
 2016 0201 CC       		.byte	0xcc
 2017 0202 2D010000 		.4byte	0x12d
 2018 0206 02       		.byte	0x2
 2019 0207 23       		.byte	0x23
 2020 0208 08       		.uleb128 0x8
 2021 0209 0C       		.uleb128 0xc
 2022 020a 504300   		.ascii	"PC\000"
 2023 020d 05       		.byte	0x5
 2024 020e D6       		.byte	0xd6
 2025 020f 16040000 		.4byte	0x416
 2026 0213 02       		.byte	0x2
 2027 0214 23       		.byte	0x23
 2028 0215 18       		.uleb128 0x18
 2029 0216 0E       		.uleb128 0xe
 2030 0217 6C080000 		.4byte	.LASF26
 2031 021b 05       		.byte	0x5
 2032 021c D7       		.byte	0xd7
 2033 021d D3000000 		.4byte	0xd3
 2034 0221 02       		.byte	0x2
 2035 0222 23       		.byte	0x23
 2036 0223 1C       		.uleb128 0x1c
 2037 0224 0E       		.uleb128 0xe
 2038 0225 B0120000 		.4byte	.LASF27
 2039 0229 05       		.byte	0x5
 2040 022a D8       		.byte	0xd8
 2041 022b 16040000 		.4byte	0x416
 2042 022f 02       		.byte	0x2
 2043 0230 23       		.byte	0x23
 2044 0231 20       		.uleb128 0x20
 2045 0232 0E       		.uleb128 0xe
 2046 0233 360F0000 		.4byte	.LASF28
 2047 0237 05       		.byte	0x5
 2048 0238 D9       		.byte	0xd9
 2049 0239 16040000 		.4byte	0x416
 2050 023d 02       		.byte	0x2
 2051 023e 23       		.byte	0x23
 2052 023f 24       		.uleb128 0x24
 2053 0240 0E       		.uleb128 0xe
 2054 0241 36130000 		.4byte	.LASF29
 2055 0245 05       		.byte	0x5
 2056 0246 DA       		.byte	0xda
 2057 0247 16040000 		.4byte	0x416
 2058 024b 02       		.byte	0x2
 2059 024c 23       		.byte	0x23
 2060 024d 28       		.uleb128 0x28
 2061 024e 0E       		.uleb128 0xe
 2062 024f 4D150000 		.4byte	.LASF30
ARM GAS  /tmp/ccNOn6pJ.s 			page 46


 2063 0253 05       		.byte	0x5
 2064 0254 DB       		.byte	0xdb
 2065 0255 C8000000 		.4byte	0xc8
 2066 0259 02       		.byte	0x2
 2067 025a 23       		.byte	0x23
 2068 025b 2C       		.uleb128 0x2c
 2069 025c 0E       		.uleb128 0xe
 2070 025d B5100000 		.4byte	.LASF31
 2071 0261 05       		.byte	0x5
 2072 0262 DC       		.byte	0xdc
 2073 0263 1C040000 		.4byte	0x41c
 2074 0267 02       		.byte	0x2
 2075 0268 23       		.byte	0x23
 2076 0269 30       		.uleb128 0x30
 2077 026a 0E       		.uleb128 0xe
 2078 026b B6040000 		.4byte	.LASF32
 2079 026f 05       		.byte	0x5
 2080 0270 DD       		.byte	0xdd
 2081 0271 D3000000 		.4byte	0xd3
 2082 0275 02       		.byte	0x2
 2083 0276 23       		.byte	0x23
 2084 0277 34       		.uleb128 0x34
 2085 0278 0E       		.uleb128 0xe
 2086 0279 80020000 		.4byte	.LASF33
 2087 027d 05       		.byte	0x5
 2088 027e DE       		.byte	0xde
 2089 027f D3000000 		.4byte	0xd3
 2090 0283 02       		.byte	0x2
 2091 0284 23       		.byte	0x23
 2092 0285 38       		.uleb128 0x38
 2093 0286 0E       		.uleb128 0xe
 2094 0287 B90D0000 		.4byte	.LASF34
 2095 028b 05       		.byte	0x5
 2096 028c DF       		.byte	0xdf
 2097 028d D3000000 		.4byte	0xd3
 2098 0291 02       		.byte	0x2
 2099 0292 23       		.byte	0x23
 2100 0293 3C       		.uleb128 0x3c
 2101 0294 0E       		.uleb128 0xe
 2102 0295 1B060000 		.4byte	.LASF35
 2103 0299 05       		.byte	0x5
 2104 029a E0       		.byte	0xe0
 2105 029b D3000000 		.4byte	0xd3
 2106 029f 02       		.byte	0x2
 2107 02a0 23       		.byte	0x23
 2108 02a1 40       		.uleb128 0x40
 2109 02a2 0E       		.uleb128 0xe
 2110 02a3 61000000 		.4byte	.LASF36
 2111 02a7 05       		.byte	0x5
 2112 02a8 E1       		.byte	0xe1
 2113 02a9 C8000000 		.4byte	0xc8
 2114 02ad 02       		.byte	0x2
 2115 02ae 23       		.byte	0x23
 2116 02af 44       		.uleb128 0x44
 2117 02b0 0E       		.uleb128 0xe
 2118 02b1 27090000 		.4byte	.LASF37
 2119 02b5 05       		.byte	0x5
ARM GAS  /tmp/ccNOn6pJ.s 			page 47


 2120 02b6 E2       		.byte	0xe2
 2121 02b7 C8000000 		.4byte	0xc8
 2122 02bb 02       		.byte	0x2
 2123 02bc 23       		.byte	0x23
 2124 02bd 48       		.uleb128 0x48
 2125 02be 0E       		.uleb128 0xe
 2126 02bf 900C0000 		.4byte	.LASF38
 2127 02c3 05       		.byte	0x5
 2128 02c4 E3       		.byte	0xe3
 2129 02c5 C8000000 		.4byte	0xc8
 2130 02c9 02       		.byte	0x2
 2131 02ca 23       		.byte	0x23
 2132 02cb 4C       		.uleb128 0x4c
 2133 02cc 0E       		.uleb128 0xe
 2134 02cd A3090000 		.4byte	.LASF39
 2135 02d1 05       		.byte	0x5
 2136 02d2 E4       		.byte	0xe4
 2137 02d3 C8000000 		.4byte	0xc8
 2138 02d7 02       		.byte	0x2
 2139 02d8 23       		.byte	0x23
 2140 02d9 50       		.uleb128 0x50
 2141 02da 0E       		.uleb128 0xe
 2142 02db 5D020000 		.4byte	.LASF40
 2143 02df 05       		.byte	0x5
 2144 02e0 E6       		.byte	0xe6
 2145 02e1 9C000000 		.4byte	0x9c
 2146 02e5 02       		.byte	0x2
 2147 02e6 23       		.byte	0x23
 2148 02e7 54       		.uleb128 0x54
 2149 02e8 0E       		.uleb128 0xe
 2150 02e9 D7180000 		.4byte	.LASF41
 2151 02ed 05       		.byte	0x5
 2152 02ee E7       		.byte	0xe7
 2153 02ef A7000000 		.4byte	0xa7
 2154 02f3 02       		.byte	0x2
 2155 02f4 23       		.byte	0x23
 2156 02f5 55       		.uleb128 0x55
 2157 02f6 0E       		.uleb128 0xe
 2158 02f7 A60A0000 		.4byte	.LASF42
 2159 02fb 05       		.byte	0x5
 2160 02fc E8       		.byte	0xe8
 2161 02fd 9C000000 		.4byte	0x9c
 2162 0301 02       		.byte	0x2
 2163 0302 23       		.byte	0x23
 2164 0303 56       		.uleb128 0x56
 2165 0304 0E       		.uleb128 0xe
 2166 0305 D3150000 		.4byte	.LASF43
 2167 0309 05       		.byte	0x5
 2168 030a E9       		.byte	0xe9
 2169 030b 9C000000 		.4byte	0x9c
 2170 030f 02       		.byte	0x2
 2171 0310 23       		.byte	0x23
 2172 0311 57       		.uleb128 0x57
 2173 0312 0E       		.uleb128 0xe
 2174 0313 3A070000 		.4byte	.LASF44
 2175 0317 05       		.byte	0x5
 2176 0318 EA       		.byte	0xea
ARM GAS  /tmp/ccNOn6pJ.s 			page 48


 2177 0319 C8000000 		.4byte	0xc8
 2178 031d 02       		.byte	0x2
 2179 031e 23       		.byte	0x23
 2180 031f 58       		.uleb128 0x58
 2181 0320 0E       		.uleb128 0xe
 2182 0321 E3030000 		.4byte	.LASF45
 2183 0325 05       		.byte	0x5
 2184 0326 EB       		.byte	0xeb
 2185 0327 9C000000 		.4byte	0x9c
 2186 032b 02       		.byte	0x2
 2187 032c 23       		.byte	0x23
 2188 032d 5C       		.uleb128 0x5c
 2189 032e 0E       		.uleb128 0xe
 2190 032f B7010000 		.4byte	.LASF46
 2191 0333 05       		.byte	0x5
 2192 0334 EC       		.byte	0xec
 2193 0335 21040000 		.4byte	0x421
 2194 0339 02       		.byte	0x2
 2195 033a 23       		.byte	0x23
 2196 033b 5D       		.uleb128 0x5d
 2197 033c 0E       		.uleb128 0xe
 2198 033d DE0C0000 		.4byte	.LASF47
 2199 0341 05       		.byte	0x5
 2200 0342 EE       		.byte	0xee
 2201 0343 16040000 		.4byte	0x416
 2202 0347 02       		.byte	0x2
 2203 0348 23       		.byte	0x23
 2204 0349 60       		.uleb128 0x60
 2205 034a 0E       		.uleb128 0xe
 2206 034b 1F120000 		.4byte	.LASF48
 2207 034f 05       		.byte	0x5
 2208 0350 EF       		.byte	0xef
 2209 0351 16040000 		.4byte	0x416
 2210 0355 02       		.byte	0x2
 2211 0356 23       		.byte	0x23
 2212 0357 64       		.uleb128 0x64
 2213 0358 0E       		.uleb128 0xe
 2214 0359 4D190000 		.4byte	.LASF49
 2215 035d 05       		.byte	0x5
 2216 035e F0       		.byte	0xf0
 2217 035f 31040000 		.4byte	0x431
 2218 0363 02       		.byte	0x2
 2219 0364 23       		.byte	0x23
 2220 0365 68       		.uleb128 0x68
 2221 0366 0E       		.uleb128 0xe
 2222 0367 BF110000 		.4byte	.LASF50
 2223 036b 05       		.byte	0x5
 2224 036c F1       		.byte	0xf1
 2225 036d 16040000 		.4byte	0x416
 2226 0371 02       		.byte	0x2
 2227 0372 23       		.byte	0x23
 2228 0373 6C       		.uleb128 0x6c
 2229 0374 0E       		.uleb128 0xe
 2230 0375 A50B0000 		.4byte	.LASF51
 2231 0379 05       		.byte	0x5
 2232 037a F2       		.byte	0xf2
 2233 037b 16040000 		.4byte	0x416
ARM GAS  /tmp/ccNOn6pJ.s 			page 49


 2234 037f 02       		.byte	0x2
 2235 0380 23       		.byte	0x23
 2236 0381 70       		.uleb128 0x70
 2237 0382 0E       		.uleb128 0xe
 2238 0383 14110000 		.4byte	.LASF52
 2239 0387 05       		.byte	0x5
 2240 0388 F3       		.byte	0xf3
 2241 0389 16040000 		.4byte	0x416
 2242 038d 02       		.byte	0x2
 2243 038e 23       		.byte	0x23
 2244 038f 74       		.uleb128 0x74
 2245 0390 0E       		.uleb128 0xe
 2246 0391 1D190000 		.4byte	.LASF53
 2247 0395 05       		.byte	0x5
 2248 0396 F4       		.byte	0xf4
 2249 0397 C8000000 		.4byte	0xc8
 2250 039b 02       		.byte	0x2
 2251 039c 23       		.byte	0x23
 2252 039d 78       		.uleb128 0x78
 2253 039e 0E       		.uleb128 0xe
 2254 039f C9090000 		.4byte	.LASF54
 2255 03a3 05       		.byte	0x5
 2256 03a4 F5       		.byte	0xf5
 2257 03a5 BD000000 		.4byte	0xbd
 2258 03a9 02       		.byte	0x2
 2259 03aa 23       		.byte	0x23
 2260 03ab 7C       		.uleb128 0x7c
 2261 03ac 0E       		.uleb128 0xe
 2262 03ad C0120000 		.4byte	.LASF55
 2263 03b1 05       		.byte	0x5
 2264 03b2 F6       		.byte	0xf6
 2265 03b3 BD000000 		.4byte	0xbd
 2266 03b7 03       		.byte	0x3
 2267 03b8 23       		.byte	0x23
 2268 03b9 8001     		.uleb128 0x80
 2269 03bb 0E       		.uleb128 0xe
 2270 03bc AA040000 		.4byte	.LASF56
 2271 03c0 05       		.byte	0x5
 2272 03c1 F7       		.byte	0xf7
 2273 03c2 C8000000 		.4byte	0xc8
 2274 03c6 03       		.byte	0x3
 2275 03c7 23       		.byte	0x23
 2276 03c8 8401     		.uleb128 0x84
 2277 03ca 0E       		.uleb128 0xe
 2278 03cb 720C0000 		.4byte	.LASF57
 2279 03cf 05       		.byte	0x5
 2280 03d0 F8       		.byte	0xf8
 2281 03d1 C8000000 		.4byte	0xc8
 2282 03d5 03       		.byte	0x3
 2283 03d6 23       		.byte	0x23
 2284 03d7 8801     		.uleb128 0x88
 2285 03d9 0E       		.uleb128 0xe
 2286 03da 95010000 		.4byte	.LASF58
 2287 03de 05       		.byte	0x5
 2288 03df F9       		.byte	0xf9
 2289 03e0 1C040000 		.4byte	0x41c
 2290 03e4 03       		.byte	0x3
ARM GAS  /tmp/ccNOn6pJ.s 			page 50


 2291 03e5 23       		.byte	0x23
 2292 03e6 8C01     		.uleb128 0x8c
 2293 03e8 0E       		.uleb128 0xe
 2294 03e9 D80D0000 		.4byte	.LASF59
 2295 03ed 05       		.byte	0x5
 2296 03ee FA       		.byte	0xfa
 2297 03ef 8F000000 		.4byte	0x8f
 2298 03f3 03       		.byte	0x3
 2299 03f4 23       		.byte	0x23
 2300 03f5 9001     		.uleb128 0x90
 2301 03f7 0E       		.uleb128 0xe
 2302 03f8 7D100000 		.4byte	.LASF60
 2303 03fc 05       		.byte	0x5
 2304 03fd FB       		.byte	0xfb
 2305 03fe 8F000000 		.4byte	0x8f
 2306 0402 03       		.byte	0x3
 2307 0403 23       		.byte	0x23
 2308 0404 9401     		.uleb128 0x94
 2309 0406 0E       		.uleb128 0xe
 2310 0407 08140000 		.4byte	.LASF61
 2311 040b 05       		.byte	0x5
 2312 040c FC       		.byte	0xfc
 2313 040d D3000000 		.4byte	0xd3
 2314 0411 03       		.byte	0x3
 2315 0412 23       		.byte	0x23
 2316 0413 9801     		.uleb128 0x98
 2317 0415 00       		.byte	0x0
 2318 0416 06       		.uleb128 0x6
 2319 0417 04       		.byte	0x4
 2320 0418 A7000000 		.4byte	0xa7
 2321 041c 0F       		.uleb128 0xf
 2322 041d D3000000 		.4byte	0xd3
 2323 0421 04       		.uleb128 0x4
 2324 0422 31040000 		.4byte	0x431
 2325 0426 9C000000 		.4byte	0x9c
 2326 042a 05       		.uleb128 0x5
 2327 042b 7B000000 		.4byte	0x7b
 2328 042f 02       		.byte	0x2
 2329 0430 00       		.byte	0x0
 2330 0431 06       		.uleb128 0x6
 2331 0432 04       		.byte	0x4
 2332 0433 C8000000 		.4byte	0xc8
 2333 0437 10       		.uleb128 0x10
 2334 0438 8F0A0000 		.4byte	0xa8f
 2335 043c 2C130000 		.4byte	.LASF62
 2336 0440 2C01     		.2byte	0x12c
 2337 0442 05       		.byte	0x5
 2338 0443 0601     		.2byte	0x106
 2339 0445 11       		.uleb128 0x11
 2340 0446 56000000 		.4byte	.LASF63
 2341 044a 05       		.byte	0x5
 2342 044b 0801     		.2byte	0x108
 2343 044d 9C000000 		.4byte	0x9c
 2344 0451 02       		.byte	0x2
 2345 0452 23       		.byte	0x23
 2346 0453 00       		.uleb128 0x0
 2347 0454 11       		.uleb128 0x11
ARM GAS  /tmp/ccNOn6pJ.s 			page 51


 2348 0455 AE010000 		.4byte	.LASF64
 2349 0459 05       		.byte	0x5
 2350 045a 0901     		.2byte	0x109
 2351 045c 9C000000 		.4byte	0x9c
 2352 0460 02       		.byte	0x2
 2353 0461 23       		.byte	0x23
 2354 0462 01       		.uleb128 0x1
 2355 0463 11       		.uleb128 0x11
 2356 0464 1E170000 		.4byte	.LASF65
 2357 0468 05       		.byte	0x5
 2358 0469 0B01     		.2byte	0x10b
 2359 046b A7000000 		.4byte	0xa7
 2360 046f 02       		.byte	0x2
 2361 0470 23       		.byte	0x23
 2362 0471 02       		.uleb128 0x2
 2363 0472 11       		.uleb128 0x11
 2364 0473 26180000 		.4byte	.LASF66
 2365 0477 05       		.byte	0x5
 2366 0478 0C01     		.2byte	0x10c
 2367 047a 64000000 		.4byte	0x64
 2368 047e 02       		.byte	0x2
 2369 047f 23       		.byte	0x23
 2370 0480 04       		.uleb128 0x4
 2371 0481 11       		.uleb128 0x11
 2372 0482 0D180000 		.4byte	.LASF67
 2373 0486 05       		.byte	0x5
 2374 0487 0D01     		.2byte	0x10d
 2375 0489 64000000 		.4byte	0x64
 2376 048d 02       		.byte	0x2
 2377 048e 23       		.byte	0x23
 2378 048f 08       		.uleb128 0x8
 2379 0490 11       		.uleb128 0x11
 2380 0491 8C030000 		.4byte	.LASF68
 2381 0495 05       		.byte	0x5
 2382 0496 0E01     		.2byte	0x10e
 2383 0498 64000000 		.4byte	0x64
 2384 049c 02       		.byte	0x2
 2385 049d 23       		.byte	0x23
 2386 049e 0C       		.uleb128 0xc
 2387 049f 11       		.uleb128 0x11
 2388 04a0 C30F0000 		.4byte	.LASF69
 2389 04a4 05       		.byte	0x5
 2390 04a5 0F01     		.2byte	0x10f
 2391 04a7 9C000000 		.4byte	0x9c
 2392 04ab 02       		.byte	0x2
 2393 04ac 23       		.byte	0x23
 2394 04ad 10       		.uleb128 0x10
 2395 04ae 11       		.uleb128 0x11
 2396 04af 4B0F0000 		.4byte	.LASF70
 2397 04b3 05       		.byte	0x5
 2398 04b4 1001     		.2byte	0x110
 2399 04b6 9C000000 		.4byte	0x9c
 2400 04ba 02       		.byte	0x2
 2401 04bb 23       		.byte	0x23
 2402 04bc 11       		.uleb128 0x11
 2403 04bd 11       		.uleb128 0x11
 2404 04be 2E070000 		.4byte	.LASF71
ARM GAS  /tmp/ccNOn6pJ.s 			page 52


 2405 04c2 05       		.byte	0x5
 2406 04c3 1101     		.2byte	0x111
 2407 04c5 9C000000 		.4byte	0x9c
 2408 04c9 02       		.byte	0x2
 2409 04ca 23       		.byte	0x23
 2410 04cb 12       		.uleb128 0x12
 2411 04cc 11       		.uleb128 0x11
 2412 04cd CE0E0000 		.4byte	.LASF72
 2413 04d1 05       		.byte	0x5
 2414 04d2 1201     		.2byte	0x112
 2415 04d4 9C000000 		.4byte	0x9c
 2416 04d8 02       		.byte	0x2
 2417 04d9 23       		.byte	0x23
 2418 04da 13       		.uleb128 0x13
 2419 04db 11       		.uleb128 0x11
 2420 04dc F70F0000 		.4byte	.LASF73
 2421 04e0 05       		.byte	0x5
 2422 04e1 1501     		.2byte	0x115
 2423 04e3 9C000000 		.4byte	0x9c
 2424 04e7 02       		.byte	0x2
 2425 04e8 23       		.byte	0x23
 2426 04e9 14       		.uleb128 0x14
 2427 04ea 11       		.uleb128 0x11
 2428 04eb FA110000 		.4byte	.LASF74
 2429 04ef 05       		.byte	0x5
 2430 04f0 1601     		.2byte	0x116
 2431 04f2 9C000000 		.4byte	0x9c
 2432 04f6 02       		.byte	0x2
 2433 04f7 23       		.byte	0x23
 2434 04f8 15       		.uleb128 0x15
 2435 04f9 11       		.uleb128 0x11
 2436 04fa 0E010000 		.4byte	.LASF75
 2437 04fe 05       		.byte	0x5
 2438 04ff 1701     		.2byte	0x117
 2439 0501 9C000000 		.4byte	0x9c
 2440 0505 02       		.byte	0x2
 2441 0506 23       		.byte	0x23
 2442 0507 16       		.uleb128 0x16
 2443 0508 11       		.uleb128 0x11
 2444 0509 2D190000 		.4byte	.LASF76
 2445 050d 05       		.byte	0x5
 2446 050e 1801     		.2byte	0x118
 2447 0510 9C000000 		.4byte	0x9c
 2448 0514 02       		.byte	0x2
 2449 0515 23       		.byte	0x23
 2450 0516 17       		.uleb128 0x17
 2451 0517 11       		.uleb128 0x11
 2452 0518 59150000 		.4byte	.LASF77
 2453 051c 05       		.byte	0x5
 2454 051d 1901     		.2byte	0x119
 2455 051f 9C000000 		.4byte	0x9c
 2456 0523 02       		.byte	0x2
 2457 0524 23       		.byte	0x23
 2458 0525 18       		.uleb128 0x18
 2459 0526 11       		.uleb128 0x11
 2460 0527 59180000 		.4byte	.LASF78
 2461 052b 05       		.byte	0x5
ARM GAS  /tmp/ccNOn6pJ.s 			page 53


 2462 052c 1C01     		.2byte	0x11c
 2463 052e 9C000000 		.4byte	0x9c
 2464 0532 02       		.byte	0x2
 2465 0533 23       		.byte	0x23
 2466 0534 19       		.uleb128 0x19
 2467 0535 11       		.uleb128 0x11
 2468 0536 A9170000 		.4byte	.LASF79
 2469 053a 05       		.byte	0x5
 2470 053b 1D01     		.2byte	0x11d
 2471 053d 9C000000 		.4byte	0x9c
 2472 0541 02       		.byte	0x2
 2473 0542 23       		.byte	0x23
 2474 0543 1A       		.uleb128 0x1a
 2475 0544 11       		.uleb128 0x11
 2476 0545 B9070000 		.4byte	.LASF80
 2477 0549 05       		.byte	0x5
 2478 054a 2001     		.2byte	0x120
 2479 054c 9C000000 		.4byte	0x9c
 2480 0550 02       		.byte	0x2
 2481 0551 23       		.byte	0x23
 2482 0552 1B       		.uleb128 0x1b
 2483 0553 11       		.uleb128 0x11
 2484 0554 69050000 		.4byte	.LASF81
 2485 0558 05       		.byte	0x5
 2486 0559 2101     		.2byte	0x121
 2487 055b 9C000000 		.4byte	0x9c
 2488 055f 02       		.byte	0x2
 2489 0560 23       		.byte	0x23
 2490 0561 1C       		.uleb128 0x1c
 2491 0562 12       		.uleb128 0x12
 2492 0563 50414C00 		.ascii	"PAL\000"
 2493 0567 05       		.byte	0x5
 2494 0568 2201     		.2byte	0x122
 2495 056a 9C000000 		.4byte	0x9c
 2496 056e 02       		.byte	0x2
 2497 056f 23       		.byte	0x23
 2498 0570 1D       		.uleb128 0x1d
 2499 0571 11       		.uleb128 0x11
 2500 0572 76150000 		.4byte	.LASF82
 2501 0576 05       		.byte	0x5
 2502 0577 2301     		.2byte	0x123
 2503 0579 C8000000 		.4byte	0xc8
 2504 057d 02       		.byte	0x2
 2505 057e 23       		.byte	0x23
 2506 057f 20       		.uleb128 0x20
 2507 0580 11       		.uleb128 0x11
 2508 0581 1E0B0000 		.4byte	.LASF83
 2509 0585 05       		.byte	0x5
 2510 0586 2401     		.2byte	0x124
 2511 0588 C8000000 		.4byte	0xc8
 2512 058c 02       		.byte	0x2
 2513 058d 23       		.byte	0x23
 2514 058e 24       		.uleb128 0x24
 2515 058f 11       		.uleb128 0x11
 2516 0590 DB020000 		.4byte	.LASF84
 2517 0594 05       		.byte	0x5
 2518 0595 2501     		.2byte	0x125
ARM GAS  /tmp/ccNOn6pJ.s 			page 54


 2519 0597 C8000000 		.4byte	0xc8
 2520 059b 02       		.byte	0x2
 2521 059c 23       		.byte	0x23
 2522 059d 28       		.uleb128 0x28
 2523 059e 11       		.uleb128 0x11
 2524 059f 81030000 		.4byte	.LASF85
 2525 05a3 05       		.byte	0x5
 2526 05a4 2601     		.2byte	0x126
 2527 05a6 C8000000 		.4byte	0xc8
 2528 05aa 02       		.byte	0x2
 2529 05ab 23       		.byte	0x23
 2530 05ac 2C       		.uleb128 0x2c
 2531 05ad 11       		.uleb128 0x11
 2532 05ae 530A0000 		.4byte	.LASF86
 2533 05b2 05       		.byte	0x5
 2534 05b3 2901     		.2byte	0x129
 2535 05b5 9C000000 		.4byte	0x9c
 2536 05b9 02       		.byte	0x2
 2537 05ba 23       		.byte	0x23
 2538 05bb 30       		.uleb128 0x30
 2539 05bc 11       		.uleb128 0x11
 2540 05bd 76030000 		.4byte	.LASF87
 2541 05c1 05       		.byte	0x5
 2542 05c2 2A01     		.2byte	0x12a
 2543 05c4 9C000000 		.4byte	0x9c
 2544 05c8 02       		.byte	0x2
 2545 05c9 23       		.byte	0x23
 2546 05ca 31       		.uleb128 0x31
 2547 05cb 11       		.uleb128 0x11
 2548 05cc 51020000 		.4byte	.LASF88
 2549 05d0 05       		.byte	0x5
 2550 05d1 2B01     		.2byte	0x12b
 2551 05d3 9C000000 		.4byte	0x9c
 2552 05d7 02       		.byte	0x2
 2553 05d8 23       		.byte	0x23
 2554 05d9 32       		.uleb128 0x32
 2555 05da 11       		.uleb128 0x11
 2556 05db 3A040000 		.4byte	.LASF89
 2557 05df 05       		.byte	0x5
 2558 05e0 2C01     		.2byte	0x12c
 2559 05e2 9C000000 		.4byte	0x9c
 2560 05e6 02       		.byte	0x2
 2561 05e7 23       		.byte	0x23
 2562 05e8 33       		.uleb128 0x33
 2563 05e9 11       		.uleb128 0x11
 2564 05ea B30A0000 		.4byte	.LASF90
 2565 05ee 05       		.byte	0x5
 2566 05ef 2D01     		.2byte	0x12d
 2567 05f1 9C000000 		.4byte	0x9c
 2568 05f5 02       		.byte	0x2
 2569 05f6 23       		.byte	0x23
 2570 05f7 34       		.uleb128 0x34
 2571 05f8 11       		.uleb128 0x11
 2572 05f9 030D0000 		.4byte	.LASF91
 2573 05fd 05       		.byte	0x5
 2574 05fe 2E01     		.2byte	0x12e
 2575 0600 9C000000 		.4byte	0x9c
ARM GAS  /tmp/ccNOn6pJ.s 			page 55


 2576 0604 02       		.byte	0x2
 2577 0605 23       		.byte	0x23
 2578 0606 35       		.uleb128 0x35
 2579 0607 11       		.uleb128 0x11
 2580 0608 E5130000 		.4byte	.LASF92
 2581 060c 05       		.byte	0x5
 2582 060d 2F01     		.2byte	0x12f
 2583 060f 9C000000 		.4byte	0x9c
 2584 0613 02       		.byte	0x2
 2585 0614 23       		.byte	0x23
 2586 0615 36       		.uleb128 0x36
 2587 0616 11       		.uleb128 0x11
 2588 0617 CA070000 		.4byte	.LASF93
 2589 061b 05       		.byte	0x5
 2590 061c 3201     		.2byte	0x132
 2591 061e 9C000000 		.4byte	0x9c
 2592 0622 02       		.byte	0x2
 2593 0623 23       		.byte	0x23
 2594 0624 37       		.uleb128 0x37
 2595 0625 11       		.uleb128 0x11
 2596 0626 A70F0000 		.4byte	.LASF94
 2597 062a 05       		.byte	0x5
 2598 062b 3301     		.2byte	0x133
 2599 062d 9C000000 		.4byte	0x9c
 2600 0631 02       		.byte	0x2
 2601 0632 23       		.byte	0x23
 2602 0633 38       		.uleb128 0x38
 2603 0634 11       		.uleb128 0x11
 2604 0635 66190000 		.4byte	.LASF95
 2605 0639 05       		.byte	0x5
 2606 063a 3401     		.2byte	0x134
 2607 063c 9C000000 		.4byte	0x9c
 2608 0640 02       		.byte	0x2
 2609 0641 23       		.byte	0x23
 2610 0642 39       		.uleb128 0x39
 2611 0643 11       		.uleb128 0x11
 2612 0644 31020000 		.4byte	.LASF96
 2613 0648 05       		.byte	0x5
 2614 0649 3501     		.2byte	0x135
 2615 064b 9C000000 		.4byte	0x9c
 2616 064f 02       		.byte	0x2
 2617 0650 23       		.byte	0x23
 2618 0651 3A       		.uleb128 0x3a
 2619 0652 11       		.uleb128 0x11
 2620 0653 20100000 		.4byte	.LASF97
 2621 0657 05       		.byte	0x5
 2622 0658 3601     		.2byte	0x136
 2623 065a 9C000000 		.4byte	0x9c
 2624 065e 02       		.byte	0x2
 2625 065f 23       		.byte	0x23
 2626 0660 3B       		.uleb128 0x3b
 2627 0661 11       		.uleb128 0x11
 2628 0662 71180000 		.4byte	.LASF98
 2629 0666 05       		.byte	0x5
 2630 0667 3701     		.2byte	0x137
 2631 0669 9C000000 		.4byte	0x9c
 2632 066d 02       		.byte	0x2
ARM GAS  /tmp/ccNOn6pJ.s 			page 56


 2633 066e 23       		.byte	0x23
 2634 066f 3C       		.uleb128 0x3c
 2635 0670 11       		.uleb128 0x11
 2636 0671 850D0000 		.4byte	.LASF99
 2637 0675 05       		.byte	0x5
 2638 0676 3801     		.2byte	0x138
 2639 0678 9C000000 		.4byte	0x9c
 2640 067c 02       		.byte	0x2
 2641 067d 23       		.byte	0x23
 2642 067e 3D       		.uleb128 0x3d
 2643 067f 11       		.uleb128 0x11
 2644 0680 5D060000 		.4byte	.LASF100
 2645 0684 05       		.byte	0x5
 2646 0685 3901     		.2byte	0x139
 2647 0687 9C000000 		.4byte	0x9c
 2648 068b 02       		.byte	0x2
 2649 068c 23       		.byte	0x23
 2650 068d 3E       		.uleb128 0x3e
 2651 068e 11       		.uleb128 0x11
 2652 068f CC030000 		.4byte	.LASF101
 2653 0693 05       		.byte	0x5
 2654 0694 3A01     		.2byte	0x13a
 2655 0696 9C000000 		.4byte	0x9c
 2656 069a 02       		.byte	0x2
 2657 069b 23       		.byte	0x23
 2658 069c 3F       		.uleb128 0x3f
 2659 069d 11       		.uleb128 0x11
 2660 069e D9050000 		.4byte	.LASF102
 2661 06a2 05       		.byte	0x5
 2662 06a3 3B01     		.2byte	0x13b
 2663 06a5 9C000000 		.4byte	0x9c
 2664 06a9 02       		.byte	0x2
 2665 06aa 23       		.byte	0x23
 2666 06ab 40       		.uleb128 0x40
 2667 06ac 11       		.uleb128 0x11
 2668 06ad CC0C0000 		.4byte	.LASF103
 2669 06b1 05       		.byte	0x5
 2670 06b2 3C01     		.2byte	0x13c
 2671 06b4 9C000000 		.4byte	0x9c
 2672 06b8 02       		.byte	0x2
 2673 06b9 23       		.byte	0x23
 2674 06ba 41       		.uleb128 0x41
 2675 06bb 11       		.uleb128 0x11
 2676 06bc BE020000 		.4byte	.LASF104
 2677 06c0 05       		.byte	0x5
 2678 06c1 3D01     		.2byte	0x13d
 2679 06c3 9C000000 		.4byte	0x9c
 2680 06c7 02       		.byte	0x2
 2681 06c8 23       		.byte	0x23
 2682 06c9 42       		.uleb128 0x42
 2683 06ca 11       		.uleb128 0x11
 2684 06cb 43030000 		.4byte	.LASF105
 2685 06cf 05       		.byte	0x5
 2686 06d0 3E01     		.2byte	0x13e
 2687 06d2 9C000000 		.4byte	0x9c
 2688 06d6 02       		.byte	0x2
 2689 06d7 23       		.byte	0x23
ARM GAS  /tmp/ccNOn6pJ.s 			page 57


 2690 06d8 43       		.uleb128 0x43
 2691 06d9 11       		.uleb128 0x11
 2692 06da 4E070000 		.4byte	.LASF106
 2693 06de 05       		.byte	0x5
 2694 06df 3F01     		.2byte	0x13f
 2695 06e1 9C000000 		.4byte	0x9c
 2696 06e5 02       		.byte	0x2
 2697 06e6 23       		.byte	0x23
 2698 06e7 44       		.uleb128 0x44
 2699 06e8 11       		.uleb128 0x11
 2700 06e9 950A0000 		.4byte	.LASF107
 2701 06ed 05       		.byte	0x5
 2702 06ee 4001     		.2byte	0x140
 2703 06f0 C8000000 		.4byte	0xc8
 2704 06f4 02       		.byte	0x2
 2705 06f5 23       		.byte	0x23
 2706 06f6 48       		.uleb128 0x48
 2707 06f7 11       		.uleb128 0x11
 2708 06f8 CE0F0000 		.4byte	.LASF108
 2709 06fc 05       		.byte	0x5
 2710 06fd 4201     		.2byte	0x142
 2711 06ff 9C000000 		.4byte	0x9c
 2712 0703 02       		.byte	0x2
 2713 0704 23       		.byte	0x23
 2714 0705 4C       		.uleb128 0x4c
 2715 0706 11       		.uleb128 0x11
 2716 0707 91150000 		.4byte	.LASF109
 2717 070b 05       		.byte	0x5
 2718 070c 4301     		.2byte	0x143
 2719 070e 9C000000 		.4byte	0x9c
 2720 0712 02       		.byte	0x2
 2721 0713 23       		.byte	0x23
 2722 0714 4D       		.uleb128 0x4d
 2723 0715 11       		.uleb128 0x11
 2724 0716 75170000 		.4byte	.LASF110
 2725 071a 05       		.byte	0x5
 2726 071b 4401     		.2byte	0x144
 2727 071d 9C000000 		.4byte	0x9c
 2728 0721 02       		.byte	0x2
 2729 0722 23       		.byte	0x23
 2730 0723 4E       		.uleb128 0x4e
 2731 0724 11       		.uleb128 0x11
 2732 0725 3F090000 		.4byte	.LASF111
 2733 0729 05       		.byte	0x5
 2734 072a 4501     		.2byte	0x145
 2735 072c 9C000000 		.4byte	0x9c
 2736 0730 02       		.byte	0x2
 2737 0731 23       		.byte	0x23
 2738 0732 4F       		.uleb128 0x4f
 2739 0733 11       		.uleb128 0x11
 2740 0734 C40C0000 		.4byte	.LASF112
 2741 0738 05       		.byte	0x5
 2742 0739 4601     		.2byte	0x146
 2743 073b 9C000000 		.4byte	0x9c
 2744 073f 02       		.byte	0x2
 2745 0740 23       		.byte	0x23
 2746 0741 50       		.uleb128 0x50
ARM GAS  /tmp/ccNOn6pJ.s 			page 58


 2747 0742 11       		.uleb128 0x11
 2748 0743 21130000 		.4byte	.LASF113
 2749 0747 05       		.byte	0x5
 2750 0748 4701     		.2byte	0x147
 2751 074a 9C000000 		.4byte	0x9c
 2752 074e 02       		.byte	0x2
 2753 074f 23       		.byte	0x23
 2754 0750 51       		.uleb128 0x51
 2755 0751 12       		.uleb128 0x12
 2756 0752 53413100 		.ascii	"SA1\000"
 2757 0756 05       		.byte	0x5
 2758 0757 4801     		.2byte	0x148
 2759 0759 9C000000 		.4byte	0x9c
 2760 075d 02       		.byte	0x2
 2761 075e 23       		.byte	0x23
 2762 075f 52       		.uleb128 0x52
 2763 0760 12       		.uleb128 0x12
 2764 0761 433400   		.ascii	"C4\000"
 2765 0764 05       		.byte	0x5
 2766 0765 4901     		.2byte	0x149
 2767 0767 9C000000 		.4byte	0x9c
 2768 076b 02       		.byte	0x2
 2769 076c 23       		.byte	0x23
 2770 076d 53       		.uleb128 0x53
 2771 076e 11       		.uleb128 0x11
 2772 076f 08180000 		.4byte	.LASF114
 2773 0773 05       		.byte	0x5
 2774 0774 4A01     		.2byte	0x14a
 2775 0776 9C000000 		.4byte	0x9c
 2776 077a 02       		.byte	0x2
 2777 077b 23       		.byte	0x23
 2778 077c 54       		.uleb128 0x54
 2779 077d 11       		.uleb128 0x11
 2780 077e B8060000 		.4byte	.LASF115
 2781 0782 05       		.byte	0x5
 2782 0783 4D01     		.2byte	0x14d
 2783 0785 C8000000 		.4byte	0xc8
 2784 0789 02       		.byte	0x2
 2785 078a 23       		.byte	0x23
 2786 078b 58       		.uleb128 0x58
 2787 078c 11       		.uleb128 0x11
 2788 078d A3050000 		.4byte	.LASF116
 2789 0791 05       		.byte	0x5
 2790 0792 4E01     		.2byte	0x14e
 2791 0794 9C000000 		.4byte	0x9c
 2792 0798 02       		.byte	0x2
 2793 0799 23       		.byte	0x23
 2794 079a 5C       		.uleb128 0x5c
 2795 079b 11       		.uleb128 0x11
 2796 079c 89000000 		.4byte	.LASF117
 2797 07a0 05       		.byte	0x5
 2798 07a1 4F01     		.2byte	0x14f
 2799 07a3 9C000000 		.4byte	0x9c
 2800 07a7 02       		.byte	0x2
 2801 07a8 23       		.byte	0x23
 2802 07a9 5D       		.uleb128 0x5d
 2803 07aa 11       		.uleb128 0x11
ARM GAS  /tmp/ccNOn6pJ.s 			page 59


 2804 07ab FF0A0000 		.4byte	.LASF118
 2805 07af 05       		.byte	0x5
 2806 07b0 5001     		.2byte	0x150
 2807 07b2 9C000000 		.4byte	0x9c
 2808 07b6 02       		.byte	0x2
 2809 07b7 23       		.byte	0x23
 2810 07b8 5E       		.uleb128 0x5e
 2811 07b9 11       		.uleb128 0x11
 2812 07ba 310C0000 		.4byte	.LASF119
 2813 07be 05       		.byte	0x5
 2814 07bf 5101     		.2byte	0x151
 2815 07c1 9C000000 		.4byte	0x9c
 2816 07c5 02       		.byte	0x2
 2817 07c6 23       		.byte	0x23
 2818 07c7 5F       		.uleb128 0x5f
 2819 07c8 11       		.uleb128 0x11
 2820 07c9 36160000 		.4byte	.LASF120
 2821 07cd 05       		.byte	0x5
 2822 07ce 5201     		.2byte	0x152
 2823 07d0 4F000000 		.4byte	0x4f
 2824 07d4 02       		.byte	0x2
 2825 07d5 23       		.byte	0x23
 2826 07d6 60       		.uleb128 0x60
 2827 07d7 11       		.uleb128 0x11
 2828 07d8 7F0C0000 		.4byte	.LASF121
 2829 07dc 05       		.byte	0x5
 2830 07dd 5301     		.2byte	0x153
 2831 07df 4F000000 		.4byte	0x4f
 2832 07e3 02       		.byte	0x2
 2833 07e4 23       		.byte	0x23
 2834 07e5 64       		.uleb128 0x64
 2835 07e6 11       		.uleb128 0x11
 2836 07e7 86080000 		.4byte	.LASF122
 2837 07eb 05       		.byte	0x5
 2838 07ec 5401     		.2byte	0x154
 2839 07ee 9C000000 		.4byte	0x9c
 2840 07f2 02       		.byte	0x2
 2841 07f3 23       		.byte	0x23
 2842 07f4 68       		.uleb128 0x68
 2843 07f5 11       		.uleb128 0x11
 2844 07f6 F6150000 		.4byte	.LASF123
 2845 07fa 05       		.byte	0x5
 2846 07fb 5501     		.2byte	0x155
 2847 07fd 9C000000 		.4byte	0x9c
 2848 0801 02       		.byte	0x2
 2849 0802 23       		.byte	0x23
 2850 0803 69       		.uleb128 0x69
 2851 0804 11       		.uleb128 0x11
 2852 0805 2F0D0000 		.4byte	.LASF124
 2853 0809 05       		.byte	0x5
 2854 080a 5601     		.2byte	0x156
 2855 080c 9C000000 		.4byte	0x9c
 2856 0810 02       		.byte	0x2
 2857 0811 23       		.byte	0x23
 2858 0812 6A       		.uleb128 0x6a
 2859 0813 11       		.uleb128 0x11
 2860 0814 4E030000 		.4byte	.LASF125
ARM GAS  /tmp/ccNOn6pJ.s 			page 60


 2861 0818 05       		.byte	0x5
 2862 0819 5701     		.2byte	0x157
 2863 081b 9C000000 		.4byte	0x9c
 2864 081f 02       		.byte	0x2
 2865 0820 23       		.byte	0x23
 2866 0821 6B       		.uleb128 0x6b
 2867 0822 11       		.uleb128 0x11
 2868 0823 010C0000 		.4byte	.LASF126
 2869 0827 05       		.byte	0x5
 2870 0828 5801     		.2byte	0x158
 2871 082a 9C000000 		.4byte	0x9c
 2872 082e 02       		.byte	0x2
 2873 082f 23       		.byte	0x23
 2874 0830 6C       		.uleb128 0x6c
 2875 0831 11       		.uleb128 0x11
 2876 0832 47170000 		.4byte	.LASF127
 2877 0836 05       		.byte	0x5
 2878 0837 5901     		.2byte	0x159
 2879 0839 9C000000 		.4byte	0x9c
 2880 083d 02       		.byte	0x2
 2881 083e 23       		.byte	0x23
 2882 083f 6D       		.uleb128 0x6d
 2883 0840 11       		.uleb128 0x11
 2884 0841 DF0B0000 		.4byte	.LASF128
 2885 0845 05       		.byte	0x5
 2886 0846 5A01     		.2byte	0x15a
 2887 0848 9C000000 		.4byte	0x9c
 2888 084c 02       		.byte	0x2
 2889 084d 23       		.byte	0x23
 2890 084e 6E       		.uleb128 0x6e
 2891 084f 11       		.uleb128 0x11
 2892 0850 A8110000 		.4byte	.LASF129
 2893 0854 05       		.byte	0x5
 2894 0855 5B01     		.2byte	0x15b
 2895 0857 9C000000 		.4byte	0x9c
 2896 085b 02       		.byte	0x2
 2897 085c 23       		.byte	0x23
 2898 085d 6F       		.uleb128 0x6f
 2899 085e 11       		.uleb128 0x11
 2900 085f DE060000 		.4byte	.LASF130
 2901 0863 05       		.byte	0x5
 2902 0864 5D01     		.2byte	0x15d
 2903 0866 A7000000 		.4byte	0xa7
 2904 086a 02       		.byte	0x2
 2905 086b 23       		.byte	0x23
 2906 086c 70       		.uleb128 0x70
 2907 086d 11       		.uleb128 0x11
 2908 086e 9B110000 		.4byte	.LASF131
 2909 0872 05       		.byte	0x5
 2910 0873 5E01     		.2byte	0x15e
 2911 0875 9C000000 		.4byte	0x9c
 2912 0879 02       		.byte	0x2
 2913 087a 23       		.byte	0x23
 2914 087b 71       		.uleb128 0x71
 2915 087c 11       		.uleb128 0x11
 2916 087d EF0C0000 		.4byte	.LASF132
 2917 0881 05       		.byte	0x5
ARM GAS  /tmp/ccNOn6pJ.s 			page 61


 2918 0882 6101     		.2byte	0x161
 2919 0884 9C000000 		.4byte	0x9c
 2920 0888 02       		.byte	0x2
 2921 0889 23       		.byte	0x23
 2922 088a 72       		.uleb128 0x72
 2923 088b 11       		.uleb128 0x11
 2924 088c E6090000 		.4byte	.LASF133
 2925 0890 05       		.byte	0x5
 2926 0891 6201     		.2byte	0x162
 2927 0893 9C000000 		.4byte	0x9c
 2928 0897 02       		.byte	0x2
 2929 0898 23       		.byte	0x23
 2930 0899 73       		.uleb128 0x73
 2931 089a 11       		.uleb128 0x11
 2932 089b 4D100000 		.4byte	.LASF134
 2933 089f 05       		.byte	0x5
 2934 08a0 6301     		.2byte	0x163
 2935 08a2 9C000000 		.4byte	0x9c
 2936 08a6 02       		.byte	0x2
 2937 08a7 23       		.byte	0x23
 2938 08a8 74       		.uleb128 0x74
 2939 08a9 11       		.uleb128 0x11
 2940 08aa 89020000 		.4byte	.LASF135
 2941 08ae 05       		.byte	0x5
 2942 08af 6401     		.2byte	0x164
 2943 08b1 9C000000 		.4byte	0x9c
 2944 08b5 02       		.byte	0x2
 2945 08b6 23       		.byte	0x23
 2946 08b7 75       		.uleb128 0x75
 2947 08b8 11       		.uleb128 0x11
 2948 08b9 230E0000 		.4byte	.LASF136
 2949 08bd 05       		.byte	0x5
 2950 08be 6701     		.2byte	0x167
 2951 08c0 9C000000 		.4byte	0x9c
 2952 08c4 02       		.byte	0x2
 2953 08c5 23       		.byte	0x23
 2954 08c6 76       		.uleb128 0x76
 2955 08c7 11       		.uleb128 0x11
 2956 08c8 D1140000 		.4byte	.LASF137
 2957 08cc 05       		.byte	0x5
 2958 08cd 6801     		.2byte	0x168
 2959 08cf 9C000000 		.4byte	0x9c
 2960 08d3 02       		.byte	0x2
 2961 08d4 23       		.byte	0x23
 2962 08d5 77       		.uleb128 0x77
 2963 08d6 11       		.uleb128 0x11
 2964 08d7 360E0000 		.4byte	.LASF138
 2965 08db 05       		.byte	0x5
 2966 08dc 6901     		.2byte	0x169
 2967 08de 9C000000 		.4byte	0x9c
 2968 08e2 02       		.byte	0x2
 2969 08e3 23       		.byte	0x23
 2970 08e4 78       		.uleb128 0x78
 2971 08e5 11       		.uleb128 0x11
 2972 08e6 C40D0000 		.4byte	.LASF139
 2973 08ea 05       		.byte	0x5
 2974 08eb 6A01     		.2byte	0x16a
ARM GAS  /tmp/ccNOn6pJ.s 			page 62


 2975 08ed 9C000000 		.4byte	0x9c
 2976 08f1 02       		.byte	0x2
 2977 08f2 23       		.byte	0x23
 2978 08f3 79       		.uleb128 0x79
 2979 08f4 11       		.uleb128 0x11
 2980 08f5 38010000 		.4byte	.LASF140
 2981 08f9 05       		.byte	0x5
 2982 08fa 6B01     		.2byte	0x16b
 2983 08fc 9C000000 		.4byte	0x9c
 2984 0900 02       		.byte	0x2
 2985 0901 23       		.byte	0x23
 2986 0902 7A       		.uleb128 0x7a
 2987 0903 11       		.uleb128 0x11
 2988 0904 BB130000 		.4byte	.LASF141
 2989 0908 05       		.byte	0x5
 2990 0909 6C01     		.2byte	0x16c
 2991 090b 9C000000 		.4byte	0x9c
 2992 090f 02       		.byte	0x2
 2993 0910 23       		.byte	0x23
 2994 0911 7B       		.uleb128 0x7b
 2995 0912 11       		.uleb128 0x11
 2996 0913 31060000 		.4byte	.LASF142
 2997 0917 05       		.byte	0x5
 2998 0918 6F01     		.2byte	0x16f
 2999 091a 9C000000 		.4byte	0x9c
 3000 091e 02       		.byte	0x2
 3001 091f 23       		.byte	0x23
 3002 0920 7C       		.uleb128 0x7c
 3003 0921 11       		.uleb128 0x11
 3004 0922 62150000 		.4byte	.LASF143
 3005 0926 05       		.byte	0x5
 3006 0927 7001     		.2byte	0x170
 3007 0929 9C000000 		.4byte	0x9c
 3008 092d 02       		.byte	0x2
 3009 092e 23       		.byte	0x23
 3010 092f 7D       		.uleb128 0x7d
 3011 0930 11       		.uleb128 0x11
 3012 0931 670C0000 		.4byte	.LASF144
 3013 0935 05       		.byte	0x5
 3014 0936 7101     		.2byte	0x171
 3015 0938 8F0A0000 		.4byte	0xa8f
 3016 093c 02       		.byte	0x2
 3017 093d 23       		.byte	0x23
 3018 093e 7E       		.uleb128 0x7e
 3019 093f 11       		.uleb128 0x11
 3020 0940 940F0000 		.4byte	.LASF145
 3021 0944 05       		.byte	0x5
 3022 0945 7201     		.2byte	0x172
 3023 0947 4F000000 		.4byte	0x4f
 3024 094b 03       		.byte	0x3
 3025 094c 23       		.byte	0x23
 3026 094d 8002     		.uleb128 0x100
 3027 094f 11       		.uleb128 0x11
 3028 0950 30140000 		.4byte	.LASF146
 3029 0954 05       		.byte	0x5
 3030 0955 7301     		.2byte	0x173
 3031 0957 9C000000 		.4byte	0x9c
ARM GAS  /tmp/ccNOn6pJ.s 			page 63


 3032 095b 03       		.byte	0x3
 3033 095c 23       		.byte	0x23
 3034 095d 8402     		.uleb128 0x104
 3035 095f 11       		.uleb128 0x11
 3036 0960 1B140000 		.4byte	.LASF147
 3037 0964 05       		.byte	0x5
 3038 0965 7401     		.2byte	0x174
 3039 0967 9C000000 		.4byte	0x9c
 3040 096b 03       		.byte	0x3
 3041 096c 23       		.byte	0x23
 3042 096d 8502     		.uleb128 0x105
 3043 096f 11       		.uleb128 0x11
 3044 0970 33180000 		.4byte	.LASF148
 3045 0974 05       		.byte	0x5
 3046 0975 7501     		.2byte	0x175
 3047 0977 D3000000 		.4byte	0xd3
 3048 097b 03       		.byte	0x3
 3049 097c 23       		.byte	0x23
 3050 097d 8802     		.uleb128 0x108
 3051 097f 11       		.uleb128 0x11
 3052 0980 F4070000 		.4byte	.LASF149
 3053 0984 05       		.byte	0x5
 3054 0985 7601     		.2byte	0x176
 3055 0987 9C000000 		.4byte	0x9c
 3056 098b 03       		.byte	0x3
 3057 098c 23       		.byte	0x23
 3058 098d 8C02     		.uleb128 0x10c
 3059 098f 11       		.uleb128 0x11
 3060 0990 0B0F0000 		.4byte	.LASF150
 3061 0994 05       		.byte	0x5
 3062 0995 7701     		.2byte	0x177
 3063 0997 9C000000 		.4byte	0x9c
 3064 099b 03       		.byte	0x3
 3065 099c 23       		.byte	0x23
 3066 099d 8D02     		.uleb128 0x10d
 3067 099f 11       		.uleb128 0x11
 3068 09a0 F10B0000 		.4byte	.LASF151
 3069 09a4 05       		.byte	0x5
 3070 09a5 7801     		.2byte	0x178
 3071 09a7 C8000000 		.4byte	0xc8
 3072 09ab 03       		.byte	0x3
 3073 09ac 23       		.byte	0x23
 3074 09ad 9002     		.uleb128 0x110
 3075 09af 11       		.uleb128 0x11
 3076 09b0 B5080000 		.4byte	.LASF152
 3077 09b4 05       		.byte	0x5
 3078 09b5 7901     		.2byte	0x179
 3079 09b7 C8000000 		.4byte	0xc8
 3080 09bb 03       		.byte	0x3
 3081 09bc 23       		.byte	0x23
 3082 09bd 9402     		.uleb128 0x114
 3083 09bf 11       		.uleb128 0x11
 3084 09c0 42080000 		.4byte	.LASF153
 3085 09c4 05       		.byte	0x5
 3086 09c5 7A01     		.2byte	0x17a
 3087 09c7 C8000000 		.4byte	0xc8
 3088 09cb 03       		.byte	0x3
ARM GAS  /tmp/ccNOn6pJ.s 			page 64


 3089 09cc 23       		.byte	0x23
 3090 09cd 9802     		.uleb128 0x118
 3091 09cf 11       		.uleb128 0x11
 3092 09d0 04050000 		.4byte	.LASF154
 3093 09d4 05       		.byte	0x5
 3094 09d5 7D01     		.2byte	0x17d
 3095 09d7 C8000000 		.4byte	0xc8
 3096 09db 03       		.byte	0x3
 3097 09dc 23       		.byte	0x23
 3098 09dd 9C02     		.uleb128 0x11c
 3099 09df 11       		.uleb128 0x11
 3100 09e0 6C030000 		.4byte	.LASF155
 3101 09e4 05       		.byte	0x5
 3102 09e5 7E01     		.2byte	0x17e
 3103 09e7 9C000000 		.4byte	0x9c
 3104 09eb 03       		.byte	0x3
 3105 09ec 23       		.byte	0x23
 3106 09ed A002     		.uleb128 0x120
 3107 09ef 11       		.uleb128 0x11
 3108 09f0 36080000 		.4byte	.LASF156
 3109 09f4 05       		.byte	0x5
 3110 09f5 7F01     		.2byte	0x17f
 3111 09f7 9C000000 		.4byte	0x9c
 3112 09fb 03       		.byte	0x3
 3113 09fc 23       		.byte	0x23
 3114 09fd A102     		.uleb128 0x121
 3115 09ff 11       		.uleb128 0x11
 3116 0a00 52060000 		.4byte	.LASF157
 3117 0a04 05       		.byte	0x5
 3118 0a05 8001     		.2byte	0x180
 3119 0a07 9C000000 		.4byte	0x9c
 3120 0a0b 03       		.byte	0x3
 3121 0a0c 23       		.byte	0x23
 3122 0a0d A202     		.uleb128 0x122
 3123 0a0f 11       		.uleb128 0x11
 3124 0a10 82060000 		.4byte	.LASF158
 3125 0a14 05       		.byte	0x5
 3126 0a15 8101     		.2byte	0x181
 3127 0a17 9C000000 		.4byte	0x9c
 3128 0a1b 03       		.byte	0x3
 3129 0a1c 23       		.byte	0x23
 3130 0a1d A302     		.uleb128 0x123
 3131 0a1f 11       		.uleb128 0x11
 3132 0a20 1B050000 		.4byte	.LASF159
 3133 0a24 05       		.byte	0x5
 3134 0a25 8201     		.2byte	0x182
 3135 0a27 9C000000 		.4byte	0x9c
 3136 0a2b 03       		.byte	0x3
 3137 0a2c 23       		.byte	0x23
 3138 0a2d A402     		.uleb128 0x124
 3139 0a2f 12       		.uleb128 0x12
 3140 0a30 425300   		.ascii	"BS\000"
 3141 0a33 05       		.byte	0x5
 3142 0a34 8301     		.2byte	0x183
 3143 0a36 9C000000 		.4byte	0x9c
 3144 0a3a 03       		.byte	0x3
 3145 0a3b 23       		.byte	0x23
ARM GAS  /tmp/ccNOn6pJ.s 			page 65


 3146 0a3c A502     		.uleb128 0x125
 3147 0a3e 11       		.uleb128 0x11
 3148 0a3f 88180000 		.4byte	.LASF160
 3149 0a43 05       		.byte	0x5
 3150 0a44 8401     		.2byte	0x184
 3151 0a46 9C000000 		.4byte	0x9c
 3152 0a4a 03       		.byte	0x3
 3153 0a4b 23       		.byte	0x23
 3154 0a4c A602     		.uleb128 0x126
 3155 0a4e 11       		.uleb128 0x11
 3156 0a4f F2160000 		.4byte	.LASF161
 3157 0a53 05       		.byte	0x5
 3158 0a54 8501     		.2byte	0x185
 3159 0a56 A7000000 		.4byte	0xa7
 3160 0a5a 03       		.byte	0x3
 3161 0a5b 23       		.byte	0x23
 3162 0a5c A702     		.uleb128 0x127
 3163 0a5e 11       		.uleb128 0x11
 3164 0a5f 2A000000 		.4byte	.LASF162
 3165 0a63 05       		.byte	0x5
 3166 0a64 8601     		.2byte	0x186
 3167 0a66 9C000000 		.4byte	0x9c
 3168 0a6a 03       		.byte	0x3
 3169 0a6b 23       		.byte	0x23
 3170 0a6c A802     		.uleb128 0x128
 3171 0a6e 11       		.uleb128 0x11
 3172 0a6f 43190000 		.4byte	.LASF163
 3173 0a73 05       		.byte	0x5
 3174 0a74 8801     		.2byte	0x188
 3175 0a76 9C000000 		.4byte	0x9c
 3176 0a7a 03       		.byte	0x3
 3177 0a7b 23       		.byte	0x23
 3178 0a7c A902     		.uleb128 0x129
 3179 0a7e 11       		.uleb128 0x11
 3180 0a7f BE160000 		.4byte	.LASF164
 3181 0a83 05       		.byte	0x5
 3182 0a84 8901     		.2byte	0x189
 3183 0a86 9C000000 		.4byte	0x9c
 3184 0a8a 03       		.byte	0x3
 3185 0a8b 23       		.byte	0x23
 3186 0a8c AA02     		.uleb128 0x12a
 3187 0a8e 00       		.byte	0x0
 3188 0a8f 04       		.uleb128 0x4
 3189 0a90 9F0A0000 		.4byte	0xa9f
 3190 0a94 88000000 		.4byte	0x88
 3191 0a98 05       		.uleb128 0x5
 3192 0a99 7B000000 		.4byte	0x7b
 3193 0a9d 7F       		.byte	0x7f
 3194 0a9e 00       		.byte	0x0
 3195 0a9f 13       		.uleb128 0x13
 3196 0aa0 07110000 		.4byte	0x1107
 3197 0aa4 2E0E0000 		.4byte	.LASF165
 3198 0aa8 74040100 		.4byte	0x10474
 3199 0aac 07       		.byte	0x7
 3200 0aad 5A       		.byte	0x5a
 3201 0aae 0C       		.uleb128 0xc
 3202 0aaf 52414D00 		.ascii	"RAM\000"
ARM GAS  /tmp/ccNOn6pJ.s 			page 66


 3203 0ab3 07       		.byte	0x7
 3204 0ab4 8F       		.byte	0x8f
 3205 0ab5 16040000 		.4byte	0x416
 3206 0ab9 02       		.byte	0x2
 3207 0aba 23       		.byte	0x23
 3208 0abb 00       		.uleb128 0x0
 3209 0abc 0C       		.uleb128 0xc
 3210 0abd 524F4D00 		.ascii	"ROM\000"
 3211 0ac1 07       		.byte	0x7
 3212 0ac2 90       		.byte	0x90
 3213 0ac3 16040000 		.4byte	0x416
 3214 0ac7 02       		.byte	0x2
 3215 0ac8 23       		.byte	0x23
 3216 0ac9 04       		.uleb128 0x4
 3217 0aca 0E       		.uleb128 0xe
 3218 0acb F5040000 		.4byte	.LASF166
 3219 0acf 07       		.byte	0x7
 3220 0ad0 91       		.byte	0x91
 3221 0ad1 16040000 		.4byte	0x416
 3222 0ad5 02       		.byte	0x2
 3223 0ad6 23       		.byte	0x23
 3224 0ad7 08       		.uleb128 0x8
 3225 0ad8 0E       		.uleb128 0xe
 3226 0ad9 6D100000 		.4byte	.LASF167
 3227 0add 07       		.byte	0x7
 3228 0ade 92       		.byte	0x92
 3229 0adf 16040000 		.4byte	0x416
 3230 0ae3 02       		.byte	0x2
 3231 0ae4 23       		.byte	0x23
 3232 0ae5 0C       		.uleb128 0xc
 3233 0ae6 0E       		.uleb128 0xe
 3234 0ae7 FF180000 		.4byte	.LASF168
 3235 0aeb 07       		.byte	0x7
 3236 0aec 93       		.byte	0x93
 3237 0aed 16040000 		.4byte	0x416
 3238 0af1 02       		.byte	0x2
 3239 0af2 23       		.byte	0x23
 3240 0af3 10       		.uleb128 0x10
 3241 0af4 0E       		.uleb128 0xe
 3242 0af5 95090000 		.4byte	.LASF169
 3243 0af9 07       		.byte	0x7
 3244 0afa 94       		.byte	0x94
 3245 0afb 16040000 		.4byte	0x416
 3246 0aff 02       		.byte	0x2
 3247 0b00 23       		.byte	0x23
 3248 0b01 14       		.uleb128 0x14
 3249 0b02 0E       		.uleb128 0xe
 3250 0b03 B4030000 		.4byte	.LASF170
 3251 0b07 07       		.byte	0x7
 3252 0b08 95       		.byte	0x95
 3253 0b09 16040000 		.4byte	0x416
 3254 0b0d 02       		.byte	0x2
 3255 0b0e 23       		.byte	0x23
 3256 0b0f 18       		.uleb128 0x18
 3257 0b10 0E       		.uleb128 0xe
 3258 0b11 60190000 		.4byte	.LASF171
 3259 0b15 07       		.byte	0x7
ARM GAS  /tmp/ccNOn6pJ.s 			page 67


 3260 0b16 96       		.byte	0x96
 3261 0b17 DE000000 		.4byte	0xde
 3262 0b1b 02       		.byte	0x2
 3263 0b1c 23       		.byte	0x23
 3264 0b1d 1C       		.uleb128 0x1c
 3265 0b1e 0E       		.uleb128 0xe
 3266 0b1f 540E0000 		.4byte	.LASF172
 3267 0b23 07       		.byte	0x7
 3268 0b24 97       		.byte	0x97
 3269 0b25 DE000000 		.4byte	0xde
 3270 0b29 02       		.byte	0x2
 3271 0b2a 23       		.byte	0x23
 3272 0b2b 1D       		.uleb128 0x1d
 3273 0b2c 0E       		.uleb128 0xe
 3274 0b2d BA000000 		.4byte	.LASF173
 3275 0b31 07       		.byte	0x7
 3276 0b32 98       		.byte	0x98
 3277 0b33 B2000000 		.4byte	0xb2
 3278 0b37 02       		.byte	0x2
 3279 0b38 23       		.byte	0x23
 3280 0b39 1E       		.uleb128 0x1e
 3281 0b3a 0E       		.uleb128 0xe
 3282 0b3b D2020000 		.4byte	.LASF174
 3283 0b3f 07       		.byte	0x7
 3284 0b40 99       		.byte	0x99
 3285 0b41 A7000000 		.4byte	0xa7
 3286 0b45 02       		.byte	0x2
 3287 0b46 23       		.byte	0x23
 3288 0b47 20       		.uleb128 0x20
 3289 0b48 0C       		.uleb128 0xc
 3290 0b49 4D617000 		.ascii	"Map\000"
 3291 0b4d 07       		.byte	0x7
 3292 0b4e 9A       		.byte	0x9a
 3293 0b4f 07110000 		.4byte	0x1107
 3294 0b53 02       		.byte	0x2
 3295 0b54 23       		.byte	0x23
 3296 0b55 24       		.uleb128 0x24
 3297 0b56 0E       		.uleb128 0xe
 3298 0b57 A40C0000 		.4byte	.LASF175
 3299 0b5b 07       		.byte	0x7
 3300 0b5c 9B       		.byte	0x9b
 3301 0b5d 07110000 		.4byte	0x1107
 3302 0b61 04       		.byte	0x4
 3303 0b62 23       		.byte	0x23
 3304 0b63 A48001   		.uleb128 0x4024
 3305 0b66 0E       		.uleb128 0xe
 3306 0b67 2C0B0000 		.4byte	.LASF176
 3307 0b6b 07       		.byte	0x7
 3308 0b6c 9C       		.byte	0x9c
 3309 0b6d 18110000 		.4byte	0x1118
 3310 0b71 04       		.byte	0x4
 3311 0b72 23       		.byte	0x23
 3312 0b73 A48002   		.uleb128 0x8024
 3313 0b76 0E       		.uleb128 0xe
 3314 0b77 2E170000 		.4byte	.LASF177
 3315 0b7b 07       		.byte	0x7
 3316 0b7c 9D       		.byte	0x9d
ARM GAS  /tmp/ccNOn6pJ.s 			page 68


 3317 0b7d 29110000 		.4byte	0x1129
 3318 0b81 04       		.byte	0x4
 3319 0b82 23       		.byte	0x23
 3320 0b83 A48003   		.uleb128 0xc024
 3321 0b86 0E       		.uleb128 0xe
 3322 0b87 EB170000 		.4byte	.LASF178
 3323 0b8b 07       		.byte	0x7
 3324 0b8c 9E       		.byte	0x9e
 3325 0b8d 29110000 		.4byte	0x1129
 3326 0b91 04       		.byte	0x4
 3327 0b92 23       		.byte	0x23
 3328 0b93 A4A003   		.uleb128 0xd024
 3329 0b96 0E       		.uleb128 0xe
 3330 0b97 B0140000 		.4byte	.LASF179
 3331 0b9b 07       		.byte	0x7
 3332 0b9c 9F       		.byte	0x9f
 3333 0b9d 3A110000 		.4byte	0x113a
 3334 0ba1 04       		.byte	0x4
 3335 0ba2 23       		.byte	0x23
 3336 0ba3 A4C003   		.uleb128 0xe024
 3337 0ba6 0E       		.uleb128 0xe
 3338 0ba7 D1110000 		.4byte	.LASF180
 3339 0bab 07       		.byte	0x7
 3340 0bac A0       		.byte	0xa0
 3341 0bad 4A110000 		.4byte	0x114a
 3342 0bb1 04       		.byte	0x4
 3343 0bb2 23       		.byte	0x23
 3344 0bb3 BBC003   		.uleb128 0xe03b
 3345 0bb6 0E       		.uleb128 0xe
 3346 0bb7 3D100000 		.4byte	.LASF181
 3347 0bbb 07       		.byte	0x7
 3348 0bbc A1       		.byte	0xa1
 3349 0bbd 5A110000 		.4byte	0x115a
 3350 0bc1 04       		.byte	0x4
 3351 0bc2 23       		.byte	0x23
 3352 0bc3 C0C003   		.uleb128 0xe040
 3353 0bc6 0E       		.uleb128 0xe
 3354 0bc7 15170000 		.4byte	.LASF182
 3355 0bcb 07       		.byte	0x7
 3356 0bcc A2       		.byte	0xa2
 3357 0bcd A7000000 		.4byte	0xa7
 3358 0bd1 04       		.byte	0x4
 3359 0bd2 23       		.byte	0x23
 3360 0bd3 C3C003   		.uleb128 0xe043
 3361 0bd6 0E       		.uleb128 0xe
 3362 0bd7 15000000 		.4byte	.LASF183
 3363 0bdb 07       		.byte	0x7
 3364 0bdc A3       		.byte	0xa3
 3365 0bdd A7000000 		.4byte	0xa7
 3366 0be1 04       		.byte	0x4
 3367 0be2 23       		.byte	0x23
 3368 0be3 C4C003   		.uleb128 0xe044
 3369 0be6 0E       		.uleb128 0xe
 3370 0be7 050A0000 		.4byte	.LASF184
 3371 0beb 07       		.byte	0x7
 3372 0bec A4       		.byte	0xa4
 3373 0bed A7000000 		.4byte	0xa7
ARM GAS  /tmp/ccNOn6pJ.s 			page 69


 3374 0bf1 04       		.byte	0x4
 3375 0bf2 23       		.byte	0x23
 3376 0bf3 C5C003   		.uleb128 0xe045
 3377 0bf6 0E       		.uleb128 0xe
 3378 0bf7 E2040000 		.4byte	.LASF185
 3379 0bfb 07       		.byte	0x7
 3380 0bfc A5       		.byte	0xa5
 3381 0bfd D3000000 		.4byte	0xd3
 3382 0c01 04       		.byte	0x4
 3383 0c02 23       		.byte	0x23
 3384 0c03 C8C003   		.uleb128 0xe048
 3385 0c06 0E       		.uleb128 0xe
 3386 0c07 71060000 		.4byte	.LASF186
 3387 0c0b 07       		.byte	0x7
 3388 0c0c A6       		.byte	0xa6
 3389 0c0d D3000000 		.4byte	0xd3
 3390 0c11 04       		.byte	0x4
 3391 0c12 23       		.byte	0x23
 3392 0c13 CCC003   		.uleb128 0xe04c
 3393 0c16 0E       		.uleb128 0xe
 3394 0c17 CA060000 		.4byte	.LASF187
 3395 0c1b 07       		.byte	0x7
 3396 0c1c A7       		.byte	0xa7
 3397 0c1d C8000000 		.4byte	0xc8
 3398 0c21 04       		.byte	0x4
 3399 0c22 23       		.byte	0x23
 3400 0c23 D0C003   		.uleb128 0xe050
 3401 0c26 0E       		.uleb128 0xe
 3402 0c27 5A100000 		.4byte	.LASF188
 3403 0c2b 07       		.byte	0x7
 3404 0c2c A8       		.byte	0xa8
 3405 0c2d C8000000 		.4byte	0xc8
 3406 0c31 04       		.byte	0x4
 3407 0c32 23       		.byte	0x23
 3408 0c33 D4C003   		.uleb128 0xe054
 3409 0c36 0E       		.uleb128 0xe
 3410 0c37 9A0E0000 		.4byte	.LASF189
 3411 0c3b 07       		.byte	0x7
 3412 0c3c A9       		.byte	0xa9
 3413 0c3d C8000000 		.4byte	0xc8
 3414 0c41 04       		.byte	0x4
 3415 0c42 23       		.byte	0x23
 3416 0c43 D8C003   		.uleb128 0xe058
 3417 0c46 0E       		.uleb128 0xe
 3418 0c47 EE100000 		.4byte	.LASF190
 3419 0c4b 07       		.byte	0x7
 3420 0c4c AA       		.byte	0xaa
 3421 0c4d C8000000 		.4byte	0xc8
 3422 0c51 04       		.byte	0x4
 3423 0c52 23       		.byte	0x23
 3424 0c53 DCC003   		.uleb128 0xe05c
 3425 0c56 0E       		.uleb128 0xe
 3426 0c57 E9080000 		.4byte	.LASF191
 3427 0c5b 07       		.byte	0x7
 3428 0c5c AB       		.byte	0xab
 3429 0c5d 16040000 		.4byte	0x416
 3430 0c61 04       		.byte	0x4
ARM GAS  /tmp/ccNOn6pJ.s 			page 70


 3431 0c62 23       		.byte	0x23
 3432 0c63 E0C003   		.uleb128 0xe060
 3433 0c66 0E       		.uleb128 0xe
 3434 0c67 28060000 		.4byte	.LASF192
 3435 0c6b 07       		.byte	0x7
 3436 0c6c AC       		.byte	0xac
 3437 0c6d 16040000 		.4byte	0x416
 3438 0c71 04       		.byte	0x4
 3439 0c72 23       		.byte	0x23
 3440 0c73 E4C003   		.uleb128 0xe064
 3441 0c76 0E       		.uleb128 0xe
 3442 0c77 5A0D0000 		.4byte	.LASF193
 3443 0c7b 07       		.byte	0x7
 3444 0c7c AD       		.byte	0xad
 3445 0c7d C8000000 		.4byte	0xc8
 3446 0c81 04       		.byte	0x4
 3447 0c82 23       		.byte	0x23
 3448 0c83 E8C003   		.uleb128 0xe068
 3449 0c86 0E       		.uleb128 0xe
 3450 0c87 DE010000 		.4byte	.LASF194
 3451 0c8b 07       		.byte	0x7
 3452 0c8c AE       		.byte	0xae
 3453 0c8d C8000000 		.4byte	0xc8
 3454 0c91 04       		.byte	0x4
 3455 0c92 23       		.byte	0x23
 3456 0c93 ECC003   		.uleb128 0xe06c
 3457 0c96 0E       		.uleb128 0xe
 3458 0c97 A4060000 		.4byte	.LASF195
 3459 0c9b 07       		.byte	0x7
 3460 0c9c AF       		.byte	0xaf
 3461 0c9d C8000000 		.4byte	0xc8
 3462 0ca1 04       		.byte	0x4
 3463 0ca2 23       		.byte	0x23
 3464 0ca3 F0C003   		.uleb128 0xe070
 3465 0ca6 0E       		.uleb128 0xe
 3466 0ca7 C40A0000 		.4byte	.LASF196
 3467 0cab 07       		.byte	0x7
 3468 0cac B0       		.byte	0xb0
 3469 0cad 6A110000 		.4byte	0x116a
 3470 0cb1 04       		.byte	0x4
 3471 0cb2 23       		.byte	0x23
 3472 0cb3 F4C003   		.uleb128 0xe074
 3473 0cb6 0E       		.uleb128 0xe
 3474 0cb7 DA090000 		.4byte	.LASF197
 3475 0cbb 07       		.byte	0x7
 3476 0cbc B2       		.byte	0xb2
 3477 0cbd 7B110000 		.4byte	0x117b
 3478 0cc1 04       		.byte	0x4
 3479 0cc2 23       		.byte	0x23
 3480 0cc3 F48004   		.uleb128 0x10074
 3481 0cc6 14       		.uleb128 0x14
 3482 0cc7 E70C0000 		.4byte	0xce7
 3483 0ccb 01       		.byte	0x1
 3484 0ccc CE0B0000 		.4byte	.LASF198
 3485 0cd0 07       		.byte	0x7
 3486 0cd1 5C       		.byte	0x5c
 3487 0cd2 19020000 		.4byte	.LASF200
ARM GAS  /tmp/ccNOn6pJ.s 			page 71


 3488 0cd6 DE000000 		.4byte	0xde
 3489 0cda 01       		.byte	0x1
 3490 0cdb 15       		.uleb128 0x15
 3491 0cdc 8C110000 		.4byte	0x118c
 3492 0ce0 01       		.byte	0x1
 3493 0ce1 16       		.uleb128 0x16
 3494 0ce2 91000000 		.4byte	0x91
 3495 0ce6 00       		.byte	0x0
 3496 0ce7 17       		.uleb128 0x17
 3497 0ce8 040D0000 		.4byte	0xd04
 3498 0cec 01       		.byte	0x1
 3499 0ced B1050000 		.4byte	.LASF199
 3500 0cf1 07       		.byte	0x7
 3501 0cf2 5D       		.byte	0x5d
 3502 0cf3 E2180000 		.4byte	.LASF201
 3503 0cf7 01       		.byte	0x1
 3504 0cf8 15       		.uleb128 0x15
 3505 0cf9 8C110000 		.4byte	0x118c
 3506 0cfd 01       		.byte	0x1
 3507 0cfe 16       		.uleb128 0x16
 3508 0cff DE000000 		.4byte	0xde
 3509 0d03 00       		.byte	0x0
 3510 0d04 14       		.uleb128 0x14
 3511 0d05 250D0000 		.4byte	0xd25
 3512 0d09 01       		.byte	0x1
 3513 0d0a D2120000 		.4byte	.LASF202
 3514 0d0e 07       		.byte	0x7
 3515 0d0f 5E       		.byte	0x5e
 3516 0d10 D9160000 		.4byte	.LASF203
 3517 0d14 DE000000 		.4byte	0xde
 3518 0d18 01       		.byte	0x1
 3519 0d19 15       		.uleb128 0x15
 3520 0d1a 8C110000 		.4byte	0x118c
 3521 0d1e 01       		.byte	0x1
 3522 0d1f 16       		.uleb128 0x16
 3523 0d20 91000000 		.4byte	0x91
 3524 0d24 00       		.byte	0x0
 3525 0d25 14       		.uleb128 0x14
 3526 0d26 460D0000 		.4byte	0xd46
 3527 0d2a 01       		.byte	0x1
 3528 0d2b B7120000 		.4byte	.LASF204
 3529 0d2f 07       		.byte	0x7
 3530 0d30 5F       		.byte	0x5f
 3531 0d31 F6010000 		.4byte	.LASF205
 3532 0d35 DE000000 		.4byte	0xde
 3533 0d39 01       		.byte	0x1
 3534 0d3a 15       		.uleb128 0x15
 3535 0d3b 8C110000 		.4byte	0x118c
 3536 0d3f 01       		.byte	0x1
 3537 0d40 16       		.uleb128 0x16
 3538 0d41 91000000 		.4byte	0x91
 3539 0d45 00       		.byte	0x0
 3540 0d46 14       		.uleb128 0x14
 3541 0d47 620D0000 		.4byte	0xd62
 3542 0d4b 01       		.byte	0x1
 3543 0d4c D90C0000 		.4byte	.LASF206
 3544 0d50 07       		.byte	0x7
ARM GAS  /tmp/ccNOn6pJ.s 			page 72


 3545 0d51 60       		.byte	0x60
 3546 0d52 DB100000 		.4byte	.LASF207
 3547 0d56 DE000000 		.4byte	0xde
 3548 0d5a 01       		.byte	0x1
 3549 0d5b 15       		.uleb128 0x15
 3550 0d5c 8C110000 		.4byte	0x118c
 3551 0d60 01       		.byte	0x1
 3552 0d61 00       		.byte	0x0
 3553 0d62 17       		.uleb128 0x17
 3554 0d63 7A0D0000 		.4byte	0xd7a
 3555 0d67 01       		.byte	0x1
 3556 0d68 58070000 		.4byte	.LASF208
 3557 0d6c 07       		.byte	0x7
 3558 0d6d 61       		.byte	0x61
 3559 0d6e 3E0A0000 		.4byte	.LASF209
 3560 0d72 01       		.byte	0x1
 3561 0d73 15       		.uleb128 0x15
 3562 0d74 8C110000 		.4byte	0x118c
 3563 0d78 01       		.byte	0x1
 3564 0d79 00       		.byte	0x0
 3565 0d7a 17       		.uleb128 0x17
 3566 0d7b 920D0000 		.4byte	0xd92
 3567 0d7f 01       		.byte	0x1
 3568 0d80 C7080000 		.4byte	.LASF210
 3569 0d84 07       		.byte	0x7
 3570 0d85 62       		.byte	0x62
 3571 0d86 66090000 		.4byte	.LASF211
 3572 0d8a 01       		.byte	0x1
 3573 0d8b 15       		.uleb128 0x15
 3574 0d8c 8C110000 		.4byte	0x118c
 3575 0d90 01       		.byte	0x1
 3576 0d91 00       		.byte	0x0
 3577 0d92 17       		.uleb128 0x17
 3578 0d93 AA0D0000 		.4byte	0xdaa
 3579 0d97 01       		.byte	0x1
 3580 0d98 1C150000 		.4byte	.LASF212
 3581 0d9c 07       		.byte	0x7
 3582 0d9d 64       		.byte	0x64
 3583 0d9e 76010000 		.4byte	.LASF213
 3584 0da2 01       		.byte	0x1
 3585 0da3 15       		.uleb128 0x15
 3586 0da4 8C110000 		.4byte	0x118c
 3587 0da8 01       		.byte	0x1
 3588 0da9 00       		.byte	0x0
 3589 0daa 17       		.uleb128 0x17
 3590 0dab C20D0000 		.4byte	0xdc2
 3591 0daf 01       		.byte	0x1
 3592 0db0 4C160000 		.4byte	.LASF214
 3593 0db4 07       		.byte	0x7
 3594 0db5 65       		.byte	0x65
 3595 0db6 FC020000 		.4byte	.LASF215
 3596 0dba 01       		.byte	0x1
 3597 0dbb 15       		.uleb128 0x15
 3598 0dbc 8C110000 		.4byte	0x118c
 3599 0dc0 01       		.byte	0x1
 3600 0dc1 00       		.byte	0x0
 3601 0dc2 17       		.uleb128 0x17
ARM GAS  /tmp/ccNOn6pJ.s 			page 73


 3602 0dc3 DA0D0000 		.4byte	0xdda
 3603 0dc7 01       		.byte	0x1
 3604 0dc8 43020000 		.4byte	.LASF216
 3605 0dcc 07       		.byte	0x7
 3606 0dcd 66       		.byte	0x66
 3607 0dce D4080000 		.4byte	.LASF217
 3608 0dd2 01       		.byte	0x1
 3609 0dd3 15       		.uleb128 0x15
 3610 0dd4 8C110000 		.4byte	0x118c
 3611 0dd8 01       		.byte	0x1
 3612 0dd9 00       		.byte	0x0
 3613 0dda 17       		.uleb128 0x17
 3614 0ddb F20D0000 		.4byte	0xdf2
 3615 0ddf 01       		.byte	0x1
 3616 0de0 07160000 		.4byte	.LASF218
 3617 0de4 07       		.byte	0x7
 3618 0de5 67       		.byte	0x67
 3619 0de6 BE050000 		.4byte	.LASF219
 3620 0dea 01       		.byte	0x1
 3621 0deb 15       		.uleb128 0x15
 3622 0dec 8C110000 		.4byte	0x118c
 3623 0df0 01       		.byte	0x1
 3624 0df1 00       		.byte	0x0
 3625 0df2 14       		.uleb128 0x14
 3626 0df3 130E0000 		.4byte	0xe13
 3627 0df7 01       		.byte	0x1
 3628 0df8 750F0000 		.4byte	.LASF220
 3629 0dfc 07       		.byte	0x7
 3630 0dfd 68       		.byte	0x68
 3631 0dfe F10D0000 		.4byte	.LASF221
 3632 0e02 82000000 		.4byte	0x82
 3633 0e06 01       		.byte	0x1
 3634 0e07 15       		.uleb128 0x15
 3635 0e08 8C110000 		.4byte	0x118c
 3636 0e0c 01       		.byte	0x1
 3637 0e0d 16       		.uleb128 0x16
 3638 0e0e 91000000 		.4byte	0x91
 3639 0e12 00       		.byte	0x0
 3640 0e13 17       		.uleb128 0x17
 3641 0e14 2B0E0000 		.4byte	0xe2b
 3642 0e18 01       		.byte	0x1
 3643 0e19 5F040000 		.4byte	.LASF222
 3644 0e1d 07       		.byte	0x7
 3645 0e1e 6A       		.byte	0x6a
 3646 0e1f 830E0000 		.4byte	.LASF223
 3647 0e23 01       		.byte	0x1
 3648 0e24 15       		.uleb128 0x15
 3649 0e25 8C110000 		.4byte	0x118c
 3650 0e29 01       		.byte	0x1
 3651 0e2a 00       		.byte	0x0
 3652 0e2b 17       		.uleb128 0x17
 3653 0e2c 430E0000 		.4byte	0xe43
 3654 0e30 01       		.byte	0x1
 3655 0e31 C00E0000 		.4byte	.LASF224
 3656 0e35 07       		.byte	0x7
 3657 0e36 6B       		.byte	0x6b
 3658 0e37 380B0000 		.4byte	.LASF225
ARM GAS  /tmp/ccNOn6pJ.s 			page 74


 3659 0e3b 01       		.byte	0x1
 3660 0e3c 15       		.uleb128 0x15
 3661 0e3d 8C110000 		.4byte	0x118c
 3662 0e41 01       		.byte	0x1
 3663 0e42 00       		.byte	0x0
 3664 0e43 17       		.uleb128 0x17
 3665 0e44 5B0E0000 		.4byte	0xe5b
 3666 0e48 01       		.byte	0x1
 3667 0e49 08080000 		.4byte	.LASF226
 3668 0e4d 07       		.byte	0x7
 3669 0e4e 6C       		.byte	0x6c
 3670 0e4f 00100000 		.4byte	.LASF227
 3671 0e53 01       		.byte	0x1
 3672 0e54 15       		.uleb128 0x15
 3673 0e55 8C110000 		.4byte	0x118c
 3674 0e59 01       		.byte	0x1
 3675 0e5a 00       		.byte	0x0
 3676 0e5b 17       		.uleb128 0x17
 3677 0e5c 730E0000 		.4byte	0xe73
 3678 0e60 01       		.byte	0x1
 3679 0e61 BA030000 		.4byte	.LASF228
 3680 0e65 07       		.byte	0x7
 3681 0e66 6D       		.byte	0x6d
 3682 0e67 8D0D0000 		.4byte	.LASF229
 3683 0e6b 01       		.byte	0x1
 3684 0e6c 15       		.uleb128 0x15
 3685 0e6d 8C110000 		.4byte	0x118c
 3686 0e71 01       		.byte	0x1
 3687 0e72 00       		.byte	0x0
 3688 0e73 17       		.uleb128 0x17
 3689 0e74 8B0E0000 		.4byte	0xe8b
 3690 0e78 01       		.byte	0x1
 3691 0e79 C9040000 		.4byte	.LASF230
 3692 0e7d 07       		.byte	0x7
 3693 0e7e 6E       		.byte	0x6e
 3694 0e7f 6B160000 		.4byte	.LASF231
 3695 0e83 01       		.byte	0x1
 3696 0e84 15       		.uleb128 0x15
 3697 0e85 8C110000 		.4byte	0x118c
 3698 0e89 01       		.byte	0x1
 3699 0e8a 00       		.byte	0x0
 3700 0e8b 17       		.uleb128 0x17
 3701 0e8c A30E0000 		.4byte	0xea3
 3702 0e90 01       		.byte	0x1
 3703 0e91 150B0000 		.4byte	.LASF232
 3704 0e95 07       		.byte	0x7
 3705 0e96 6F       		.byte	0x6f
 3706 0e97 B10B0000 		.4byte	.LASF233
 3707 0e9b 01       		.byte	0x1
 3708 0e9c 15       		.uleb128 0x15
 3709 0e9d 8C110000 		.4byte	0x118c
 3710 0ea1 01       		.byte	0x1
 3711 0ea2 00       		.byte	0x0
 3712 0ea3 17       		.uleb128 0x17
 3713 0ea4 BB0E0000 		.4byte	0xebb
 3714 0ea8 01       		.byte	0x1
 3715 0ea9 D7070000 		.4byte	.LASF234
ARM GAS  /tmp/ccNOn6pJ.s 			page 75


 3716 0ead 07       		.byte	0x7
 3717 0eae 70       		.byte	0x70
 3718 0eaf 63020000 		.4byte	.LASF235
 3719 0eb3 01       		.byte	0x1
 3720 0eb4 15       		.uleb128 0x15
 3721 0eb5 8C110000 		.4byte	0x118c
 3722 0eb9 01       		.byte	0x1
 3723 0eba 00       		.byte	0x0
 3724 0ebb 17       		.uleb128 0x17
 3725 0ebc D80E0000 		.4byte	0xed8
 3726 0ec0 01       		.byte	0x1
 3727 0ec1 B9170000 		.4byte	.LASF236
 3728 0ec5 07       		.byte	0x7
 3729 0ec6 71       		.byte	0x71
 3730 0ec7 28030000 		.4byte	.LASF237
 3731 0ecb 01       		.byte	0x1
 3732 0ecc 15       		.uleb128 0x15
 3733 0ecd 8C110000 		.4byte	0x118c
 3734 0ed1 01       		.byte	0x1
 3735 0ed2 16       		.uleb128 0x16
 3736 0ed3 DE000000 		.4byte	0xde
 3737 0ed7 00       		.byte	0x0
 3738 0ed8 17       		.uleb128 0x17
 3739 0ed9 F00E0000 		.4byte	0xef0
 3740 0edd 01       		.byte	0x1
 3741 0ede 46060000 		.4byte	.LASF238
 3742 0ee2 07       		.byte	0x7
 3743 0ee3 72       		.byte	0x72
 3744 0ee4 630B0000 		.4byte	.LASF239
 3745 0ee8 01       		.byte	0x1
 3746 0ee9 15       		.uleb128 0x15
 3747 0eea 8C110000 		.4byte	0x118c
 3748 0eee 01       		.byte	0x1
 3749 0eef 00       		.byte	0x0
 3750 0ef0 17       		.uleb128 0x17
 3751 0ef1 080F0000 		.4byte	0xf08
 3752 0ef5 01       		.byte	0x1
 3753 0ef6 41180000 		.4byte	.LASF240
 3754 0efa 07       		.byte	0x7
 3755 0efb 73       		.byte	0x73
 3756 0efc 33000000 		.4byte	.LASF241
 3757 0f00 01       		.byte	0x1
 3758 0f01 15       		.uleb128 0x15
 3759 0f02 8C110000 		.4byte	0x118c
 3760 0f06 01       		.byte	0x1
 3761 0f07 00       		.byte	0x0
 3762 0f08 17       		.uleb128 0x17
 3763 0f09 200F0000 		.4byte	0xf20
 3764 0f0d 01       		.byte	0x1
 3765 0f0e 72100000 		.4byte	.LASF242
 3766 0f12 07       		.byte	0x7
 3767 0f13 74       		.byte	0x74
 3768 0f14 8F170000 		.4byte	.LASF243
 3769 0f18 01       		.byte	0x1
 3770 0f19 15       		.uleb128 0x15
 3771 0f1a 8C110000 		.4byte	0x118c
 3772 0f1e 01       		.byte	0x1
ARM GAS  /tmp/ccNOn6pJ.s 			page 76


 3773 0f1f 00       		.byte	0x0
 3774 0f20 14       		.uleb128 0x14
 3775 0f21 460F0000 		.4byte	0xf46
 3776 0f25 01       		.byte	0x1
 3777 0f26 6C0F0000 		.4byte	.LASF244
 3778 0f2a 07       		.byte	0x7
 3779 0f2b 75       		.byte	0x75
 3780 0f2c 8A040000 		.4byte	.LASF245
 3781 0f30 DE000000 		.4byte	0xde
 3782 0f34 01       		.byte	0x1
 3783 0f35 15       		.uleb128 0x15
 3784 0f36 8C110000 		.4byte	0x118c
 3785 0f3a 01       		.byte	0x1
 3786 0f3b 16       		.uleb128 0x16
 3787 0f3c 16040000 		.4byte	0x416
 3788 0f40 16       		.uleb128 0x16
 3789 0f41 4F000000 		.4byte	0x4f
 3790 0f45 00       		.byte	0x0
 3791 0f46 14       		.uleb128 0x14
 3792 0f47 670F0000 		.4byte	0xf67
 3793 0f4b 01       		.byte	0x1
 3794 0f4c AE0D0000 		.4byte	.LASF246
 3795 0f50 07       		.byte	0x7
 3796 0f51 76       		.byte	0x76
 3797 0f52 B9150000 		.4byte	.LASF247
 3798 0f56 4F000000 		.4byte	0x4f
 3799 0f5a 01       		.byte	0x1
 3800 0f5b 15       		.uleb128 0x15
 3801 0f5c 8C110000 		.4byte	0x118c
 3802 0f60 01       		.byte	0x1
 3803 0f61 16       		.uleb128 0x16
 3804 0f62 DE000000 		.4byte	0xde
 3805 0f66 00       		.byte	0x0
 3806 0f67 14       		.uleb128 0x14
 3807 0f68 880F0000 		.4byte	0xf88
 3808 0f6c 01       		.byte	0x1
 3809 0f6d 57010000 		.4byte	.LASF248
 3810 0f71 07       		.byte	0x7
 3811 0f72 77       		.byte	0x77
 3812 0f73 240A0000 		.4byte	.LASF249
 3813 0f77 4F000000 		.4byte	0x4f
 3814 0f7b 01       		.byte	0x1
 3815 0f7c 15       		.uleb128 0x15
 3816 0f7d 8C110000 		.4byte	0x118c
 3817 0f81 01       		.byte	0x1
 3818 0f82 16       		.uleb128 0x16
 3819 0f83 DE000000 		.4byte	0xde
 3820 0f87 00       		.byte	0x0
 3821 0f88 17       		.uleb128 0x17
 3822 0f89 A00F0000 		.4byte	0xfa0
 3823 0f8d 01       		.byte	0x1
 3824 0f8e 39170000 		.4byte	.LASF250
 3825 0f92 07       		.byte	0x7
 3826 0f93 78       		.byte	0x78
 3827 0f94 19160000 		.4byte	.LASF251
 3828 0f98 01       		.byte	0x1
 3829 0f99 15       		.uleb128 0x15
ARM GAS  /tmp/ccNOn6pJ.s 			page 77


 3830 0f9a 8C110000 		.4byte	0x118c
 3831 0f9e 01       		.byte	0x1
 3832 0f9f 00       		.byte	0x0
 3833 0fa0 17       		.uleb128 0x17
 3834 0fa1 C70F0000 		.4byte	0xfc7
 3835 0fa5 01       		.byte	0x1
 3836 0fa6 0E120000 		.4byte	.LASF252
 3837 0faa 07       		.byte	0x7
 3838 0fab 7A       		.byte	0x7a
 3839 0fac 02090000 		.4byte	.LASF253
 3840 0fb0 01       		.byte	0x1
 3841 0fb1 15       		.uleb128 0x15
 3842 0fb2 8C110000 		.4byte	0x118c
 3843 0fb6 01       		.byte	0x1
 3844 0fb7 16       		.uleb128 0x16
 3845 0fb8 91000000 		.4byte	0x91
 3846 0fbc 16       		.uleb128 0x16
 3847 0fbd DE000000 		.4byte	0xde
 3848 0fc1 16       		.uleb128 0x16
 3849 0fc2 92110000 		.4byte	0x1192
 3850 0fc6 00       		.byte	0x0
 3851 0fc7 14       		.uleb128 0x14
 3852 0fc8 E30F0000 		.4byte	0xfe3
 3853 0fcc 01       		.byte	0x1
 3854 0fcd B9090000 		.4byte	.LASF254
 3855 0fd1 07       		.byte	0x7
 3856 0fd2 7C       		.byte	0x7c
 3857 0fd3 89100000 		.4byte	.LASF255
 3858 0fd7 91000000 		.4byte	0x91
 3859 0fdb 01       		.byte	0x1
 3860 0fdc 15       		.uleb128 0x15
 3861 0fdd 8C110000 		.4byte	0x118c
 3862 0fe1 01       		.byte	0x1
 3863 0fe2 00       		.byte	0x0
 3864 0fe3 14       		.uleb128 0x14
 3865 0fe4 FF0F0000 		.4byte	0xfff
 3866 0fe8 01       		.byte	0x1
 3867 0fe9 13160000 		.4byte	.LASF256
 3868 0fed 07       		.byte	0x7
 3869 0fee 7D       		.byte	0x7d
 3870 0fef 7B0A0000 		.4byte	.LASF257
 3871 0ff3 91000000 		.4byte	0x91
 3872 0ff7 01       		.byte	0x1
 3873 0ff8 15       		.uleb128 0x15
 3874 0ff9 8C110000 		.4byte	0x118c
 3875 0ffd 01       		.byte	0x1
 3876 0ffe 00       		.byte	0x0
 3877 0fff 14       		.uleb128 0x14
 3878 1000 1B100000 		.4byte	0x101b
 3879 1004 01       		.byte	0x1
 3880 1005 C4020000 		.4byte	.LASF258
 3881 1009 07       		.byte	0x7
 3882 100a 7E       		.byte	0x7e
 3883 100b 6E130000 		.4byte	.LASF259
 3884 100f 91000000 		.4byte	0x91
 3885 1013 01       		.byte	0x1
 3886 1014 15       		.uleb128 0x15
ARM GAS  /tmp/ccNOn6pJ.s 			page 78


 3887 1015 8C110000 		.4byte	0x118c
 3888 1019 01       		.byte	0x1
 3889 101a 00       		.byte	0x0
 3890 101b 14       		.uleb128 0x14
 3891 101c 37100000 		.4byte	0x1037
 3892 1020 01       		.byte	0x1
 3893 1021 37090000 		.4byte	.LASF260
 3894 1025 07       		.byte	0x7
 3895 1026 7F       		.byte	0x7f
 3896 1027 E0150000 		.4byte	.LASF261
 3897 102b 91000000 		.4byte	0x91
 3898 102f 01       		.byte	0x1
 3899 1030 15       		.uleb128 0x15
 3900 1031 8C110000 		.4byte	0x118c
 3901 1035 01       		.byte	0x1
 3902 1036 00       		.byte	0x0
 3903 1037 14       		.uleb128 0x14
 3904 1038 53100000 		.4byte	0x1053
 3905 103c 01       		.byte	0x1
 3906 103d 0D0B0000 		.4byte	.LASF262
 3907 1041 07       		.byte	0x7
 3908 1042 80       		.byte	0x80
 3909 1043 8D140000 		.4byte	.LASF263
 3910 1047 91000000 		.4byte	0x91
 3911 104b 01       		.byte	0x1
 3912 104c 15       		.uleb128 0x15
 3913 104d 8C110000 		.4byte	0x118c
 3914 1051 01       		.byte	0x1
 3915 1052 00       		.byte	0x0
 3916 1053 14       		.uleb128 0x14
 3917 1054 6F100000 		.4byte	0x106f
 3918 1058 01       		.byte	0x1
 3919 1059 A3140000 		.4byte	.LASF264
 3920 105d 07       		.byte	0x7
 3921 105e 81       		.byte	0x81
 3922 105f 90000000 		.4byte	.LASF265
 3923 1063 91000000 		.4byte	0x91
 3924 1067 01       		.byte	0x1
 3925 1068 15       		.uleb128 0x15
 3926 1069 8C110000 		.4byte	0x118c
 3927 106d 01       		.byte	0x1
 3928 106e 00       		.byte	0x0
 3929 106f 14       		.uleb128 0x14
 3930 1070 8B100000 		.4byte	0x108b
 3931 1074 01       		.byte	0x1
 3932 1075 DD040000 		.4byte	.LASF266
 3933 1079 07       		.byte	0x7
 3934 107a 82       		.byte	0x82
 3935 107b D30A0000 		.4byte	.LASF267
 3936 107f 91000000 		.4byte	0x91
 3937 1083 01       		.byte	0x1
 3938 1084 15       		.uleb128 0x15
 3939 1085 8C110000 		.4byte	0x118c
 3940 1089 01       		.byte	0x1
 3941 108a 00       		.byte	0x0
 3942 108b 14       		.uleb128 0x14
 3943 108c A7100000 		.4byte	0x10a7
ARM GAS  /tmp/ccNOn6pJ.s 			page 79


 3944 1090 01       		.byte	0x1
 3945 1091 93050000 		.4byte	.LASF268
 3946 1095 07       		.byte	0x7
 3947 1096 83       		.byte	0x83
 3948 1097 92180000 		.4byte	.LASF269
 3949 109b 91000000 		.4byte	0x91
 3950 109f 01       		.byte	0x1
 3951 10a0 15       		.uleb128 0x15
 3952 10a1 8C110000 		.4byte	0x118c
 3953 10a5 01       		.byte	0x1
 3954 10a6 00       		.byte	0x0
 3955 10a7 14       		.uleb128 0x14
 3956 10a8 C3100000 		.4byte	0x10c3
 3957 10ac 01       		.byte	0x1
 3958 10ad DB120000 		.4byte	.LASF270
 3959 10b1 07       		.byte	0x7
 3960 10b2 84       		.byte	0x84
 3961 10b3 A1080000 		.4byte	.LASF271
 3962 10b7 91000000 		.4byte	0x91
 3963 10bb 01       		.byte	0x1
 3964 10bc 15       		.uleb128 0x15
 3965 10bd 8C110000 		.4byte	0x118c
 3966 10c1 01       		.byte	0x1
 3967 10c2 00       		.byte	0x0
 3968 10c3 14       		.uleb128 0x14
 3969 10c4 DF100000 		.4byte	0x10df
 3970 10c8 01       		.byte	0x1
 3971 10c9 67060000 		.4byte	.LASF272
 3972 10cd 07       		.byte	0x7
 3973 10ce 85       		.byte	0x85
 3974 10cf 4F0C0000 		.4byte	.LASF273
 3975 10d3 91000000 		.4byte	0x91
 3976 10d7 01       		.byte	0x1
 3977 10d8 15       		.uleb128 0x15
 3978 10d9 8C110000 		.4byte	0x118c
 3979 10dd 01       		.byte	0x1
 3980 10de 00       		.byte	0x0
 3981 10df 18       		.uleb128 0x18
 3982 10e0 01       		.byte	0x1
 3983 10e1 96070000 		.4byte	.LASF508
 3984 10e5 07       		.byte	0x7
 3985 10e6 86       		.byte	0x86
 3986 10e7 B8140000 		.4byte	.LASF509
 3987 10eb C8000000 		.4byte	0xc8
 3988 10ef 01       		.byte	0x1
 3989 10f0 15       		.uleb128 0x15
 3990 10f1 8C110000 		.4byte	0x118c
 3991 10f5 01       		.byte	0x1
 3992 10f6 16       		.uleb128 0x16
 3993 10f7 16040000 		.4byte	0x416
 3994 10fb 16       		.uleb128 0x16
 3995 10fc C8000000 		.4byte	0xc8
 3996 1100 16       		.uleb128 0x16
 3997 1101 C8000000 		.4byte	0xc8
 3998 1105 00       		.byte	0x0
 3999 1106 00       		.byte	0x0
 4000 1107 04       		.uleb128 0x4
ARM GAS  /tmp/ccNOn6pJ.s 			page 80


 4001 1108 18110000 		.4byte	0x1118
 4002 110c 16040000 		.4byte	0x416
 4003 1110 19       		.uleb128 0x19
 4004 1111 7B000000 		.4byte	0x7b
 4005 1115 FF0F     		.2byte	0xfff
 4006 1117 00       		.byte	0x0
 4007 1118 04       		.uleb128 0x4
 4008 1119 29110000 		.4byte	0x1129
 4009 111d C8000000 		.4byte	0xc8
 4010 1121 19       		.uleb128 0x19
 4011 1122 7B000000 		.4byte	0x7b
 4012 1126 FF0F     		.2byte	0xfff
 4013 1128 00       		.byte	0x0
 4014 1129 04       		.uleb128 0x4
 4015 112a 3A110000 		.4byte	0x113a
 4016 112e A7000000 		.4byte	0xa7
 4017 1132 19       		.uleb128 0x19
 4018 1133 7B000000 		.4byte	0x7b
 4019 1137 FF0F     		.2byte	0xfff
 4020 1139 00       		.byte	0x0
 4021 113a 04       		.uleb128 0x4
 4022 113b 4A110000 		.4byte	0x114a
 4023 113f 88000000 		.4byte	0x88
 4024 1143 05       		.uleb128 0x5
 4025 1144 7B000000 		.4byte	0x7b
 4026 1148 16       		.byte	0x16
 4027 1149 00       		.byte	0x0
 4028 114a 04       		.uleb128 0x4
 4029 114b 5A110000 		.4byte	0x115a
 4030 114f 88000000 		.4byte	0x88
 4031 1153 05       		.uleb128 0x5
 4032 1154 7B000000 		.4byte	0x7b
 4033 1158 04       		.byte	0x4
 4034 1159 00       		.byte	0x0
 4035 115a 04       		.uleb128 0x4
 4036 115b 6A110000 		.4byte	0x116a
 4037 115f 88000000 		.4byte	0x88
 4038 1163 05       		.uleb128 0x5
 4039 1164 7B000000 		.4byte	0x7b
 4040 1168 02       		.byte	0x2
 4041 1169 00       		.byte	0x0
 4042 116a 04       		.uleb128 0x4
 4043 116b 7B110000 		.4byte	0x117b
 4044 116f A7000000 		.4byte	0xa7
 4045 1173 19       		.uleb128 0x19
 4046 1174 7B000000 		.4byte	0x7b
 4047 1178 FF1F     		.2byte	0x1fff
 4048 117a 00       		.byte	0x0
 4049 117b 04       		.uleb128 0x4
 4050 117c 8C110000 		.4byte	0x118c
 4051 1180 88000000 		.4byte	0x88
 4052 1184 19       		.uleb128 0x19
 4053 1185 7B000000 		.4byte	0x7b
 4054 1189 FF03     		.2byte	0x3ff
 4055 118b 00       		.byte	0x0
 4056 118c 06       		.uleb128 0x6
 4057 118d 04       		.byte	0x4
ARM GAS  /tmp/ccNOn6pJ.s 			page 81


 4058 118e 9F0A0000 		.4byte	0xa9f
 4059 1192 1A       		.uleb128 0x1a
 4060 1193 04       		.byte	0x4
 4061 1194 D3000000 		.4byte	0xd3
 4062 1198 0B       		.uleb128 0xb
 4063 1199 CF110000 		.4byte	0x11cf
 4064 119d 62030000 		.4byte	.LASF274
 4065 11a1 08       		.byte	0x8
 4066 11a2 08       		.byte	0x8
 4067 11a3 7C       		.byte	0x7c
 4068 11a4 0E       		.uleb128 0xe
 4069 11a5 D9060000 		.4byte	.LASF275
 4070 11a9 08       		.byte	0x8
 4071 11aa 7D       		.byte	0x7d
 4072 11ab 2C000000 		.4byte	0x2c
 4073 11af 02       		.byte	0x2
 4074 11b0 23       		.byte	0x23
 4075 11b1 00       		.uleb128 0x0
 4076 11b2 0C       		.uleb128 0xc
 4077 11b3 726F7000 		.ascii	"rop\000"
 4078 11b7 08       		.byte	0x8
 4079 11b8 7E       		.byte	0x7e
 4080 11b9 2C000000 		.4byte	0x2c
 4081 11bd 02       		.byte	0x2
 4082 11be 23       		.byte	0x23
 4083 11bf 01       		.uleb128 0x1
 4084 11c0 0E       		.uleb128 0xe
 4085 11c1 39060000 		.4byte	.LASF276
 4086 11c5 08       		.byte	0x8
 4087 11c6 7F       		.byte	0x7f
 4088 11c7 25000000 		.4byte	0x25
 4089 11cb 02       		.byte	0x2
 4090 11cc 23       		.byte	0x23
 4091 11cd 04       		.uleb128 0x4
 4092 11ce 00       		.byte	0x0
 4093 11cf 1B       		.uleb128 0x1b
 4094 11d0 08120000 		.4byte	0x1208
 4095 11d4 86170000 		.4byte	.LASF277
 4096 11d8 3801     		.2byte	0x138
 4097 11da 09       		.byte	0x9
 4098 11db 42       		.byte	0x42
 4099 11dc 0E       		.uleb128 0xe
 4100 11dd 9E0C0000 		.4byte	.LASF278
 4101 11e1 09       		.byte	0x9
 4102 11e2 43       		.byte	0x43
 4103 11e3 08120000 		.4byte	0x1208
 4104 11e7 02       		.byte	0x2
 4105 11e8 23       		.byte	0x23
 4106 11e9 00       		.uleb128 0x0
 4107 11ea 0E       		.uleb128 0xe
 4108 11eb 42050000 		.4byte	.LASF279
 4109 11ef 09       		.byte	0x9
 4110 11f0 44       		.byte	0x44
 4111 11f1 18120000 		.4byte	0x1218
 4112 11f5 02       		.byte	0x2
 4113 11f6 23       		.byte	0x23
 4114 11f7 18       		.uleb128 0x18
ARM GAS  /tmp/ccNOn6pJ.s 			page 82


 4115 11f8 0E       		.uleb128 0xe
 4116 11f9 8F0A0000 		.4byte	.LASF280
 4117 11fd 09       		.byte	0x9
 4118 11fe 45       		.byte	0x45
 4119 11ff 18120000 		.4byte	0x1218
 4120 1203 03       		.byte	0x3
 4121 1204 23       		.byte	0x23
 4122 1205 A801     		.uleb128 0xa8
 4123 1207 00       		.byte	0x0
 4124 1208 04       		.uleb128 0x4
 4125 1209 18120000 		.4byte	0x1218
 4126 120d C8000000 		.4byte	0xc8
 4127 1211 05       		.uleb128 0x5
 4128 1212 7B000000 		.4byte	0x7b
 4129 1216 05       		.byte	0x5
 4130 1217 00       		.byte	0x0
 4131 1218 04       		.uleb128 0x4
 4132 1219 2E120000 		.4byte	0x122e
 4133 121d C8000000 		.4byte	0xc8
 4134 1221 05       		.uleb128 0x5
 4135 1222 7B000000 		.4byte	0x7b
 4136 1226 05       		.byte	0x5
 4137 1227 05       		.uleb128 0x5
 4138 1228 7B000000 		.4byte	0x7b
 4139 122c 05       		.byte	0x5
 4140 122d 00       		.byte	0x0
 4141 122e 1B       		.uleb128 0x1b
 4142 122f 24140000 		.4byte	0x1424
 4143 1233 D2170000 		.4byte	.LASF281
 4144 1237 F012     		.2byte	0x12f0
 4145 1239 09       		.byte	0x9
 4146 123a 48       		.byte	0x48
 4147 123b 0E       		.uleb128 0xe
 4148 123c 990F0000 		.4byte	.LASF282
 4149 1240 09       		.byte	0x9
 4150 1241 49       		.byte	0x49
 4151 1242 9C000000 		.4byte	0x9c
 4152 1246 02       		.byte	0x2
 4153 1247 23       		.byte	0x23
 4154 1248 00       		.uleb128 0x0
 4155 1249 0E       		.uleb128 0xe
 4156 124a D6100000 		.4byte	.LASF283
 4157 124e 09       		.byte	0x9
 4158 124f 4A       		.byte	0x4a
 4159 1250 A7000000 		.4byte	0xa7
 4160 1254 02       		.byte	0x2
 4161 1255 23       		.byte	0x23
 4162 1256 01       		.uleb128 0x1
 4163 1257 0E       		.uleb128 0xe
 4164 1258 7C180000 		.4byte	.LASF284
 4165 125c 09       		.byte	0x9
 4166 125d 4B       		.byte	0x4b
 4167 125e 9C000000 		.4byte	0x9c
 4168 1262 02       		.byte	0x2
 4169 1263 23       		.byte	0x23
 4170 1264 02       		.uleb128 0x2
 4171 1265 0E       		.uleb128 0xe
ARM GAS  /tmp/ccNOn6pJ.s 			page 83


 4172 1266 660D0000 		.4byte	.LASF285
 4173 126a 09       		.byte	0x9
 4174 126b 4C       		.byte	0x4c
 4175 126c A7000000 		.4byte	0xa7
 4176 1270 02       		.byte	0x2
 4177 1271 23       		.byte	0x23
 4178 1272 03       		.uleb128 0x3
 4179 1273 0E       		.uleb128 0xe
 4180 1274 51140000 		.4byte	.LASF286
 4181 1278 09       		.byte	0x9
 4182 1279 4D       		.byte	0x4d
 4183 127a 9C000000 		.4byte	0x9c
 4184 127e 02       		.byte	0x2
 4185 127f 23       		.byte	0x23
 4186 1280 04       		.uleb128 0x4
 4187 1281 0E       		.uleb128 0xe
 4188 1282 05170000 		.4byte	.LASF287
 4189 1286 09       		.byte	0x9
 4190 1287 4E       		.byte	0x4e
 4191 1288 9C000000 		.4byte	0x9c
 4192 128c 02       		.byte	0x2
 4193 128d 23       		.byte	0x23
 4194 128e 05       		.uleb128 0x5
 4195 128f 0E       		.uleb128 0xe
 4196 1290 C3000000 		.4byte	.LASF288
 4197 1294 09       		.byte	0x9
 4198 1295 4F       		.byte	0x4f
 4199 1296 9C000000 		.4byte	0x9c
 4200 129a 02       		.byte	0x2
 4201 129b 23       		.byte	0x23
 4202 129c 06       		.uleb128 0x6
 4203 129d 0E       		.uleb128 0xe
 4204 129e 150C0000 		.4byte	.LASF289
 4205 12a2 09       		.byte	0x9
 4206 12a3 50       		.byte	0x50
 4207 12a4 9C000000 		.4byte	0x9c
 4208 12a8 02       		.byte	0x2
 4209 12a9 23       		.byte	0x23
 4210 12aa 07       		.uleb128 0x7
 4211 12ab 0E       		.uleb128 0xe
 4212 12ac 8B060000 		.4byte	.LASF290
 4213 12b0 09       		.byte	0x9
 4214 12b1 51       		.byte	0x51
 4215 12b2 C8000000 		.4byte	0xc8
 4216 12b6 02       		.byte	0x2
 4217 12b7 23       		.byte	0x23
 4218 12b8 08       		.uleb128 0x8
 4219 12b9 0E       		.uleb128 0xe
 4220 12ba E1120000 		.4byte	.LASF291
 4221 12be 09       		.byte	0x9
 4222 12bf 52       		.byte	0x52
 4223 12c0 C8000000 		.4byte	0xc8
 4224 12c4 02       		.byte	0x2
 4225 12c5 23       		.byte	0x23
 4226 12c6 0C       		.uleb128 0xc
 4227 12c7 0E       		.uleb128 0xe
 4228 12c8 59170000 		.4byte	.LASF292
ARM GAS  /tmp/ccNOn6pJ.s 			page 84


 4229 12cc 09       		.byte	0x9
 4230 12cd 53       		.byte	0x53
 4231 12ce C8000000 		.4byte	0xc8
 4232 12d2 02       		.byte	0x2
 4233 12d3 23       		.byte	0x23
 4234 12d4 10       		.uleb128 0x10
 4235 12d5 0E       		.uleb128 0xe
 4236 12d6 E1110000 		.4byte	.LASF293
 4237 12da 09       		.byte	0x9
 4238 12db 54       		.byte	0x54
 4239 12dc C8000000 		.4byte	0xc8
 4240 12e0 02       		.byte	0x2
 4241 12e1 23       		.byte	0x23
 4242 12e2 14       		.uleb128 0x14
 4243 12e3 0E       		.uleb128 0xe
 4244 12e4 17030000 		.4byte	.LASF294
 4245 12e8 09       		.byte	0x9
 4246 12e9 55       		.byte	0x55
 4247 12ea C8000000 		.4byte	0xc8
 4248 12ee 02       		.byte	0x2
 4249 12ef 23       		.byte	0x23
 4250 12f0 18       		.uleb128 0x18
 4251 12f1 0E       		.uleb128 0xe
 4252 12f2 61140000 		.4byte	.LASF295
 4253 12f6 09       		.byte	0x9
 4254 12f7 56       		.byte	0x56
 4255 12f8 24140000 		.4byte	0x1424
 4256 12fc 02       		.byte	0x2
 4257 12fd 23       		.byte	0x23
 4258 12fe 1C       		.uleb128 0x1c
 4259 12ff 0E       		.uleb128 0xe
 4260 1300 4B000000 		.4byte	.LASF296
 4261 1304 09       		.byte	0x9
 4262 1305 57       		.byte	0x57
 4263 1306 24140000 		.4byte	0x1424
 4264 130a 02       		.byte	0x2
 4265 130b 23       		.byte	0x23
 4266 130c 28       		.uleb128 0x28
 4267 130d 0E       		.uleb128 0xe
 4268 130e 83150000 		.4byte	.LASF297
 4269 1312 09       		.byte	0x9
 4270 1313 58       		.byte	0x58
 4271 1314 9C000000 		.4byte	0x9c
 4272 1318 02       		.byte	0x2
 4273 1319 23       		.byte	0x23
 4274 131a 34       		.uleb128 0x34
 4275 131b 0E       		.uleb128 0xe
 4276 131c 9F120000 		.4byte	.LASF298
 4277 1320 09       		.byte	0x9
 4278 1321 59       		.byte	0x59
 4279 1322 9C000000 		.4byte	0x9c
 4280 1326 02       		.byte	0x2
 4281 1327 23       		.byte	0x23
 4282 1328 35       		.uleb128 0x35
 4283 1329 0E       		.uleb128 0xe
 4284 132a A3100000 		.4byte	.LASF299
 4285 132e 09       		.byte	0x9
ARM GAS  /tmp/ccNOn6pJ.s 			page 85


 4286 132f 5A       		.byte	0x5a
 4287 1330 9C000000 		.4byte	0x9c
 4288 1334 02       		.byte	0x2
 4289 1335 23       		.byte	0x23
 4290 1336 36       		.uleb128 0x36
 4291 1337 0E       		.uleb128 0xe
 4292 1338 C9010000 		.4byte	.LASF300
 4293 133c 09       		.byte	0x9
 4294 133d 5B       		.byte	0x5b
 4295 133e 4F000000 		.4byte	0x4f
 4296 1342 02       		.byte	0x2
 4297 1343 23       		.byte	0x23
 4298 1344 38       		.uleb128 0x38
 4299 1345 0E       		.uleb128 0xe
 4300 1346 1A0F0000 		.4byte	.LASF301
 4301 134a 09       		.byte	0x9
 4302 134b 5C       		.byte	0x5c
 4303 134c 4F000000 		.4byte	0x4f
 4304 1350 02       		.byte	0x2
 4305 1351 23       		.byte	0x23
 4306 1352 3C       		.uleb128 0x3c
 4307 1353 0C       		.uleb128 0xc
 4308 1354 52656400 		.ascii	"Red\000"
 4309 1358 09       		.byte	0x9
 4310 1359 5D       		.byte	0x5d
 4311 135a 34140000 		.4byte	0x1434
 4312 135e 02       		.byte	0x2
 4313 135f 23       		.byte	0x23
 4314 1360 40       		.uleb128 0x40
 4315 1361 0E       		.uleb128 0xe
 4316 1362 EB0B0000 		.4byte	.LASF302
 4317 1366 09       		.byte	0x9
 4318 1367 5E       		.byte	0x5e
 4319 1368 34140000 		.4byte	0x1434
 4320 136c 03       		.byte	0x3
 4321 136d 23       		.byte	0x23
 4322 136e C008     		.uleb128 0x440
 4323 1370 0E       		.uleb128 0xe
 4324 1371 62010000 		.4byte	.LASF303
 4325 1375 09       		.byte	0x9
 4326 1376 5F       		.byte	0x5f
 4327 1377 34140000 		.4byte	0x1434
 4328 137b 03       		.byte	0x3
 4329 137c 23       		.byte	0x23
 4330 137d C010     		.uleb128 0x840
 4331 137f 0C       		.uleb128 0xc
 4332 1380 584200   		.ascii	"XB\000"
 4333 1383 09       		.byte	0x9
 4334 1384 60       		.byte	0x60
 4335 1385 16040000 		.4byte	0x416
 4336 1389 03       		.byte	0x3
 4337 138a 23       		.byte	0x23
 4338 138b C018     		.uleb128 0xc40
 4339 138d 0E       		.uleb128 0xe
 4340 138e F6170000 		.4byte	.LASF304
 4341 1392 09       		.byte	0x9
 4342 1393 61       		.byte	0x61
ARM GAS  /tmp/ccNOn6pJ.s 			page 86


 4343 1394 34140000 		.4byte	0x1434
 4344 1398 03       		.byte	0x3
 4345 1399 23       		.byte	0x23
 4346 139a C418     		.uleb128 0xc44
 4347 139c 0E       		.uleb128 0xe
 4348 139d 1D000000 		.4byte	.LASF305
 4349 13a1 09       		.byte	0x9
 4350 13a2 62       		.byte	0x62
 4351 13a3 4F000000 		.4byte	0x4f
 4352 13a7 03       		.byte	0x3
 4353 13a8 23       		.byte	0x23
 4354 13a9 C420     		.uleb128 0x1044
 4355 13ab 0E       		.uleb128 0xe
 4356 13ac 480E0000 		.4byte	.LASF306
 4357 13b0 09       		.byte	0x9
 4358 13b1 63       		.byte	0x63
 4359 13b2 4F000000 		.4byte	0x4f
 4360 13b6 03       		.byte	0x3
 4361 13b7 23       		.byte	0x23
 4362 13b8 C820     		.uleb128 0x1048
 4363 13ba 0E       		.uleb128 0xe
 4364 13bb 5B090000 		.4byte	.LASF307
 4365 13bf 09       		.byte	0x9
 4366 13c0 64       		.byte	0x64
 4367 13c1 4F000000 		.4byte	0x4f
 4368 13c5 03       		.byte	0x3
 4369 13c6 23       		.byte	0x23
 4370 13c7 CC20     		.uleb128 0x104c
 4371 13c9 0E       		.uleb128 0xe
 4372 13ca 550B0000 		.4byte	.LASF308
 4373 13ce 09       		.byte	0x9
 4374 13cf 65       		.byte	0x65
 4375 13d0 44140000 		.4byte	0x1444
 4376 13d4 03       		.byte	0x3
 4377 13d5 23       		.byte	0x23
 4378 13d6 D020     		.uleb128 0x1050
 4379 13d8 0E       		.uleb128 0xe
 4380 13d9 43030000 		.4byte	.LASF105
 4381 13dd 09       		.byte	0x9
 4382 13de 66       		.byte	0x66
 4383 13df C8000000 		.4byte	0xc8
 4384 13e3 03       		.byte	0x3
 4385 13e4 23       		.byte	0x23
 4386 13e5 E420     		.uleb128 0x1064
 4387 13e7 0E       		.uleb128 0xe
 4388 13e8 BE020000 		.4byte	.LASF104
 4389 13ec 09       		.byte	0x9
 4390 13ed 67       		.byte	0x67
 4391 13ee 54140000 		.4byte	0x1454
 4392 13f2 03       		.byte	0x3
 4393 13f3 23       		.byte	0x23
 4394 13f4 E820     		.uleb128 0x1068
 4395 13f6 0E       		.uleb128 0xe
 4396 13f7 E40E0000 		.4byte	.LASF309
 4397 13fb 09       		.byte	0x9
 4398 13fc 68       		.byte	0x68
 4399 13fd 6B000000 		.4byte	0x6b
ARM GAS  /tmp/ccNOn6pJ.s 			page 87


 4400 1401 03       		.byte	0x3
 4401 1402 23       		.byte	0x23
 4402 1403 F020     		.uleb128 0x1070
 4403 1405 0E       		.uleb128 0xe
 4404 1406 9E070000 		.4byte	.LASF310
 4405 140a 09       		.byte	0x9
 4406 140b 69       		.byte	0x69
 4407 140c 6B000000 		.4byte	0x6b
 4408 1410 03       		.byte	0x3
 4409 1411 23       		.byte	0x23
 4410 1412 F820     		.uleb128 0x1078
 4411 1414 0E       		.uleb128 0xe
 4412 1415 6D040000 		.4byte	.LASF311
 4413 1419 09       		.byte	0x9
 4414 141a 6A       		.byte	0x6a
 4415 141b 64140000 		.4byte	0x1464
 4416 141f 03       		.byte	0x3
 4417 1420 23       		.byte	0x23
 4418 1421 8021     		.uleb128 0x1080
 4419 1423 00       		.byte	0x0
 4420 1424 04       		.uleb128 0x4
 4421 1425 34140000 		.4byte	0x1434
 4422 1429 16040000 		.4byte	0x416
 4423 142d 05       		.uleb128 0x5
 4424 142e 7B000000 		.4byte	0x7b
 4425 1432 02       		.byte	0x2
 4426 1433 00       		.byte	0x0
 4427 1434 04       		.uleb128 0x4
 4428 1435 44140000 		.4byte	0x1444
 4429 1439 C8000000 		.4byte	0xc8
 4430 143d 05       		.uleb128 0x5
 4431 143e 7B000000 		.4byte	0x7b
 4432 1442 FF       		.byte	0xff
 4433 1443 00       		.byte	0x0
 4434 1444 04       		.uleb128 0x4
 4435 1445 54140000 		.4byte	0x1454
 4436 1449 C8000000 		.4byte	0xc8
 4437 144d 05       		.uleb128 0x5
 4438 144e 7B000000 		.4byte	0x7b
 4439 1452 04       		.byte	0x4
 4440 1453 00       		.byte	0x0
 4441 1454 04       		.uleb128 0x4
 4442 1455 64140000 		.4byte	0x1464
 4443 1459 C8000000 		.4byte	0xc8
 4444 145d 05       		.uleb128 0x5
 4445 145e 7B000000 		.4byte	0x7b
 4446 1462 01       		.byte	0x1
 4447 1463 00       		.byte	0x0
 4448 1464 04       		.uleb128 0x4
 4449 1465 74140000 		.4byte	0x1474
 4450 1469 CF110000 		.4byte	0x11cf
 4451 146d 05       		.uleb128 0x5
 4452 146e 7B000000 		.4byte	0x7b
 4453 1472 01       		.byte	0x1
 4454 1473 00       		.byte	0x0
 4455 1474 0B       		.uleb128 0xb
 4456 1475 F1140000 		.4byte	0x14f1
ARM GAS  /tmp/ccNOn6pJ.s 			page 88


 4457 1479 03180000 		.4byte	.LASF312
 4458 147d 0C       		.byte	0xc
 4459 147e 09       		.byte	0x9
 4460 147f 6E       		.byte	0x6e
 4461 1480 0E       		.uleb128 0xe
 4462 1481 AC130000 		.4byte	.LASF313
 4463 1485 09       		.byte	0x9
 4464 1486 6F       		.byte	0x6f
 4465 1487 48000000 		.4byte	0x48
 4466 148b 02       		.byte	0x2
 4467 148c 23       		.byte	0x23
 4468 148d 00       		.uleb128 0x0
 4469 148e 0E       		.uleb128 0xe
 4470 148f 53070000 		.4byte	.LASF314
 4471 1493 09       		.byte	0x9
 4472 1494 70       		.byte	0x70
 4473 1495 B2000000 		.4byte	0xb2
 4474 1499 02       		.byte	0x2
 4475 149a 23       		.byte	0x23
 4476 149b 02       		.uleb128 0x2
 4477 149c 0E       		.uleb128 0xe
 4478 149d 81080000 		.4byte	.LASF315
 4479 14a1 09       		.byte	0x9
 4480 14a2 71       		.byte	0x71
 4481 14a3 B2000000 		.4byte	0xb2
 4482 14a7 02       		.byte	0x2
 4483 14a8 23       		.byte	0x23
 4484 14a9 04       		.uleb128 0x4
 4485 14aa 0E       		.uleb128 0xe
 4486 14ab 70150000 		.4byte	.LASF316
 4487 14af 09       		.byte	0x9
 4488 14b0 72       		.byte	0x72
 4489 14b1 A7000000 		.4byte	0xa7
 4490 14b5 02       		.byte	0x2
 4491 14b6 23       		.byte	0x23
 4492 14b7 06       		.uleb128 0x6
 4493 14b8 0E       		.uleb128 0xe
 4494 14b9 20180000 		.4byte	.LASF317
 4495 14bd 09       		.byte	0x9
 4496 14be 73       		.byte	0x73
 4497 14bf A7000000 		.4byte	0xa7
 4498 14c3 02       		.byte	0x2
 4499 14c4 23       		.byte	0x23
 4500 14c5 07       		.uleb128 0x7
 4501 14c6 0E       		.uleb128 0xe
 4502 14c7 48040000 		.4byte	.LASF318
 4503 14cb 09       		.byte	0x9
 4504 14cc 74       		.byte	0x74
 4505 14cd A7000000 		.4byte	0xa7
 4506 14d1 02       		.byte	0x2
 4507 14d2 23       		.byte	0x23
 4508 14d3 08       		.uleb128 0x8
 4509 14d4 0E       		.uleb128 0xe
 4510 14d5 C2070000 		.4byte	.LASF319
 4511 14d9 09       		.byte	0x9
 4512 14da 75       		.byte	0x75
 4513 14db A7000000 		.4byte	0xa7
ARM GAS  /tmp/ccNOn6pJ.s 			page 89


 4514 14df 02       		.byte	0x2
 4515 14e0 23       		.byte	0x23
 4516 14e1 09       		.uleb128 0x9
 4517 14e2 0E       		.uleb128 0xe
 4518 14e3 DD040000 		.4byte	.LASF266
 4519 14e7 09       		.byte	0x9
 4520 14e8 76       		.byte	0x76
 4521 14e9 A7000000 		.4byte	0xa7
 4522 14ed 02       		.byte	0x2
 4523 14ee 23       		.byte	0x23
 4524 14ef 0A       		.uleb128 0xa
 4525 14f0 00       		.byte	0x0
 4526 14f1 1B       		.uleb128 0x1b
 4527 14f2 FF190000 		.4byte	0x19ff
 4528 14f6 00130000 		.4byte	.LASF320
 4529 14fa F00A     		.2byte	0xaf0
 4530 14fc 09       		.byte	0x9
 4531 14fd 79       		.byte	0x79
 4532 14fe 0B       		.uleb128 0xb
 4533 14ff 5F150000 		.4byte	0x155f
 4534 1503 84100000 		.4byte	.LASF321
 4535 1507 0C       		.byte	0xc
 4536 1508 09       		.byte	0x9
 4537 1509 7E       		.byte	0x7e
 4538 150a 0E       		.uleb128 0xe
 4539 150b B9050000 		.4byte	.LASF322
 4540 150f 09       		.byte	0x9
 4541 1510 7F       		.byte	0x7f
 4542 1511 9C000000 		.4byte	0x9c
 4543 1515 02       		.byte	0x2
 4544 1516 23       		.byte	0x23
 4545 1517 00       		.uleb128 0x0
 4546 1518 0E       		.uleb128 0xe
 4547 1519 26040000 		.4byte	.LASF323
 4548 151d 09       		.byte	0x9
 4549 151e 80       		.byte	0x80
 4550 151f A7000000 		.4byte	0xa7
 4551 1523 02       		.byte	0x2
 4552 1524 23       		.byte	0x23
 4553 1525 01       		.uleb128 0x1
 4554 1526 0E       		.uleb128 0xe
 4555 1527 B1090000 		.4byte	.LASF324
 4556 152b 09       		.byte	0x9
 4557 152c 81       		.byte	0x81
 4558 152d B2000000 		.4byte	0xb2
 4559 1531 02       		.byte	0x2
 4560 1532 23       		.byte	0x23
 4561 1533 02       		.uleb128 0x2
 4562 1534 0E       		.uleb128 0xe
 4563 1535 3D020000 		.4byte	.LASF325
 4564 1539 09       		.byte	0x9
 4565 153a 82       		.byte	0x82
 4566 153b B2000000 		.4byte	0xb2
 4567 153f 02       		.byte	0x2
 4568 1540 23       		.byte	0x23
 4569 1541 04       		.uleb128 0x4
 4570 1542 0E       		.uleb128 0xe
ARM GAS  /tmp/ccNOn6pJ.s 			page 90


 4571 1543 5B080000 		.4byte	.LASF326
 4572 1547 09       		.byte	0x9
 4573 1548 83       		.byte	0x83
 4574 1549 B2000000 		.4byte	0xb2
 4575 154d 02       		.byte	0x2
 4576 154e 23       		.byte	0x23
 4577 154f 06       		.uleb128 0x6
 4578 1550 0E       		.uleb128 0xe
 4579 1551 A6130000 		.4byte	.LASF327
 4580 1555 09       		.byte	0x9
 4581 1556 84       		.byte	0x84
 4582 1557 B2000000 		.4byte	0xb2
 4583 155b 02       		.byte	0x2
 4584 155c 23       		.byte	0x23
 4585 155d 08       		.uleb128 0x8
 4586 155e 00       		.byte	0x0
 4587 155f 0B       		.uleb128 0xb
 4588 1560 CE150000 		.4byte	0x15ce
 4589 1564 67030000 		.4byte	.LASF328
 4590 1568 10       		.byte	0x10
 4591 1569 09       		.byte	0x9
 4592 156a 87       		.byte	0x87
 4593 156b 0E       		.uleb128 0xe
 4594 156c 040F0000 		.4byte	.LASF329
 4595 1570 09       		.byte	0x9
 4596 1571 88       		.byte	0x88
 4597 1572 B2000000 		.4byte	0xb2
 4598 1576 02       		.byte	0x2
 4599 1577 23       		.byte	0x23
 4600 1578 00       		.uleb128 0x0
 4601 1579 0E       		.uleb128 0xe
 4602 157a 3A050000 		.4byte	.LASF330
 4603 157e 09       		.byte	0x9
 4604 157f 89       		.byte	0x89
 4605 1580 B2000000 		.4byte	0xb2
 4606 1584 02       		.byte	0x2
 4607 1585 23       		.byte	0x23
 4608 1586 02       		.uleb128 0x2
 4609 1587 0E       		.uleb128 0xe
 4610 1588 BB0F0000 		.4byte	.LASF331
 4611 158c 09       		.byte	0x9
 4612 158d 8A       		.byte	0x8a
 4613 158e B2000000 		.4byte	0xb2
 4614 1592 02       		.byte	0x2
 4615 1593 23       		.byte	0x23
 4616 1594 04       		.uleb128 0x4
 4617 1595 0E       		.uleb128 0xe
 4618 1596 70190000 		.4byte	.LASF332
 4619 159a 09       		.byte	0x9
 4620 159b 8B       		.byte	0x8b
 4621 159c A7000000 		.4byte	0xa7
 4622 15a0 02       		.byte	0x2
 4623 15a1 23       		.byte	0x23
 4624 15a2 06       		.uleb128 0x6
 4625 15a3 0E       		.uleb128 0xe
 4626 15a4 F9030000 		.4byte	.LASF333
 4627 15a8 09       		.byte	0x9
ARM GAS  /tmp/ccNOn6pJ.s 			page 91


 4628 15a9 8C       		.byte	0x8c
 4629 15aa B2000000 		.4byte	0xb2
 4630 15ae 02       		.byte	0x2
 4631 15af 23       		.byte	0x23
 4632 15b0 08       		.uleb128 0x8
 4633 15b1 0E       		.uleb128 0xe
 4634 15b2 19180000 		.4byte	.LASF334
 4635 15b6 09       		.byte	0x9
 4636 15b7 8D       		.byte	0x8d
 4637 15b8 B2000000 		.4byte	0xb2
 4638 15bc 02       		.byte	0x2
 4639 15bd 23       		.byte	0x23
 4640 15be 0A       		.uleb128 0xa
 4641 15bf 0E       		.uleb128 0xe
 4642 15c0 C8180000 		.4byte	.LASF335
 4643 15c4 09       		.byte	0x9
 4644 15c5 8E       		.byte	0x8e
 4645 15c6 9C000000 		.4byte	0x9c
 4646 15ca 02       		.byte	0x2
 4647 15cb 23       		.byte	0x23
 4648 15cc 0C       		.uleb128 0xc
 4649 15cd 00       		.byte	0x0
 4650 15ce 0E       		.uleb128 0xe
 4651 15cf 50010000 		.4byte	.LASF336
 4652 15d3 09       		.byte	0x9
 4653 15d4 7A       		.byte	0x7a
 4654 15d5 A7000000 		.4byte	0xa7
 4655 15d9 02       		.byte	0x2
 4656 15da 23       		.byte	0x23
 4657 15db 00       		.uleb128 0x0
 4658 15dc 0E       		.uleb128 0xe
 4659 15dd 6F0A0000 		.4byte	.LASF337
 4660 15e1 09       		.byte	0x9
 4661 15e2 7B       		.byte	0x7b
 4662 15e3 A7000000 		.4byte	0xa7
 4663 15e7 02       		.byte	0x2
 4664 15e8 23       		.byte	0x23
 4665 15e9 01       		.uleb128 0x1
 4666 15ea 0E       		.uleb128 0xe
 4667 15eb AE070000 		.4byte	.LASF338
 4668 15ef 09       		.byte	0x9
 4669 15f0 7C       		.byte	0x7c
 4670 15f1 A7000000 		.4byte	0xa7
 4671 15f5 02       		.byte	0x2
 4672 15f6 23       		.byte	0x23
 4673 15f7 02       		.uleb128 0x2
 4674 15f8 0C       		.uleb128 0xc
 4675 15f9 564D4100 		.ascii	"VMA\000"
 4676 15fd 09       		.byte	0x9
 4677 15fe 85       		.byte	0x85
 4678 15ff FE140000 		.4byte	0x14fe
 4679 1603 02       		.byte	0x2
 4680 1604 23       		.byte	0x23
 4681 1605 04       		.uleb128 0x4
 4682 1606 0C       		.uleb128 0xc
 4683 1607 424700   		.ascii	"BG\000"
 4684 160a 09       		.byte	0x9
ARM GAS  /tmp/ccNOn6pJ.s 			page 92


 4685 160b 8F       		.byte	0x8f
 4686 160c FF190000 		.4byte	0x19ff
 4687 1610 02       		.byte	0x2
 4688 1611 23       		.byte	0x23
 4689 1612 10       		.uleb128 0x10
 4690 1613 0E       		.uleb128 0xe
 4691 1614 01140000 		.4byte	.LASF339
 4692 1618 09       		.byte	0x9
 4693 1619 91       		.byte	0x91
 4694 161a 9C000000 		.4byte	0x9c
 4695 161e 02       		.byte	0x2
 4696 161f 23       		.byte	0x23
 4697 1620 50       		.uleb128 0x50
 4698 1621 0E       		.uleb128 0xe
 4699 1622 2C180000 		.4byte	.LASF340
 4700 1626 09       		.byte	0x9
 4701 1627 92       		.byte	0x92
 4702 1628 0F1A0000 		.4byte	0x1a0f
 4703 162c 02       		.byte	0x2
 4704 162d 23       		.byte	0x23
 4705 162e 52       		.uleb128 0x52
 4706 162f 0E       		.uleb128 0xe
 4707 1630 AD0C0000 		.4byte	.LASF341
 4708 1634 09       		.byte	0x9
 4709 1635 93       		.byte	0x93
 4710 1636 A7000000 		.4byte	0xa7
 4711 163a 03       		.byte	0x3
 4712 163b 23       		.byte	0x23
 4713 163c D204     		.uleb128 0x252
 4714 163e 0E       		.uleb128 0xe
 4715 163f EE060000 		.4byte	.LASF342
 4716 1643 09       		.byte	0x9
 4717 1644 94       		.byte	0x94
 4718 1645 A7000000 		.4byte	0xa7
 4719 1649 03       		.byte	0x3
 4720 164a 23       		.byte	0x23
 4721 164b D304     		.uleb128 0x253
 4722 164d 0C       		.uleb128 0xc
 4723 164e 4F424A00 		.ascii	"OBJ\000"
 4724 1652 09       		.byte	0x9
 4725 1653 95       		.byte	0x95
 4726 1654 1F1A0000 		.4byte	0x1a1f
 4727 1658 03       		.byte	0x3
 4728 1659 23       		.byte	0x23
 4729 165a D404     		.uleb128 0x254
 4730 165c 0E       		.uleb128 0xe
 4731 165d 890B0000 		.4byte	.LASF343
 4732 1661 09       		.byte	0x9
 4733 1662 96       		.byte	0x96
 4734 1663 A7000000 		.4byte	0xa7
 4735 1667 03       		.byte	0x3
 4736 1668 23       		.byte	0x23
 4737 1669 D410     		.uleb128 0x854
 4738 166b 0E       		.uleb128 0xe
 4739 166c 55050000 		.4byte	.LASF344
 4740 1670 09       		.byte	0x9
 4741 1671 97       		.byte	0x97
ARM GAS  /tmp/ccNOn6pJ.s 			page 93


 4742 1672 B2000000 		.4byte	0xb2
 4743 1676 03       		.byte	0x3
 4744 1677 23       		.byte	0x23
 4745 1678 D610     		.uleb128 0x856
 4746 167a 0E       		.uleb128 0xe
 4747 167b 13060000 		.4byte	.LASF345
 4748 167f 09       		.byte	0x9
 4749 1680 99       		.byte	0x99
 4750 1681 A7000000 		.4byte	0xa7
 4751 1685 03       		.byte	0x3
 4752 1686 23       		.byte	0x23
 4753 1687 D810     		.uleb128 0x858
 4754 1689 0E       		.uleb128 0xe
 4755 168a CC130000 		.4byte	.LASF346
 4756 168e 09       		.byte	0x9
 4757 168f 9A       		.byte	0x9a
 4758 1690 B2000000 		.4byte	0xb2
 4759 1694 03       		.byte	0x3
 4760 1695 23       		.byte	0x23
 4761 1696 DA10     		.uleb128 0x85a
 4762 1698 0E       		.uleb128 0xe
 4763 1699 5F160000 		.4byte	.LASF347
 4764 169d 09       		.byte	0x9
 4765 169e 9B       		.byte	0x9b
 4766 169f B2000000 		.4byte	0xb2
 4767 16a3 03       		.byte	0x3
 4768 16a4 23       		.byte	0x23
 4769 16a5 DC10     		.uleb128 0x85c
 4770 16a7 0E       		.uleb128 0xe
 4771 16a8 19080000 		.4byte	.LASF348
 4772 16ac 09       		.byte	0x9
 4773 16ad 9C       		.byte	0x9c
 4774 16ae B2000000 		.4byte	0xb2
 4775 16b2 03       		.byte	0x3
 4776 16b3 23       		.byte	0x23
 4777 16b4 DE10     		.uleb128 0x85e
 4778 16b6 0E       		.uleb128 0xe
 4779 16b7 04110000 		.4byte	.LASF349
 4780 16bb 09       		.byte	0x9
 4781 16bc 9D       		.byte	0x9d
 4782 16bd B2000000 		.4byte	0xb2
 4783 16c1 03       		.byte	0x3
 4784 16c2 23       		.byte	0x23
 4785 16c3 E010     		.uleb128 0x860
 4786 16c5 0E       		.uleb128 0xe
 4787 16c6 C9160000 		.4byte	.LASF350
 4788 16ca 09       		.byte	0x9
 4789 16cb 9E       		.byte	0x9e
 4790 16cc B2000000 		.4byte	0xb2
 4791 16d0 03       		.byte	0x3
 4792 16d1 23       		.byte	0x23
 4793 16d2 E210     		.uleb128 0x862
 4794 16d4 0E       		.uleb128 0xe
 4795 16d5 0A150000 		.4byte	.LASF351
 4796 16d9 09       		.byte	0x9
 4797 16da A0       		.byte	0xa0
 4798 16db A7000000 		.4byte	0xa7
ARM GAS  /tmp/ccNOn6pJ.s 			page 94


 4799 16df 03       		.byte	0x3
 4800 16e0 23       		.byte	0x23
 4801 16e1 E410     		.uleb128 0x864
 4802 16e3 0E       		.uleb128 0xe
 4803 16e4 0D0A0000 		.4byte	.LASF352
 4804 16e8 09       		.byte	0x9
 4805 16e9 A1       		.byte	0xa1
 4806 16ea A7000000 		.4byte	0xa7
 4807 16ee 03       		.byte	0x3
 4808 16ef 23       		.byte	0x23
 4809 16f0 E510     		.uleb128 0x865
 4810 16f2 0E       		.uleb128 0xe
 4811 16f3 EF0E0000 		.4byte	.LASF353
 4812 16f7 09       		.byte	0x9
 4813 16f8 A2       		.byte	0xa2
 4814 16f9 A7000000 		.4byte	0xa7
 4815 16fd 03       		.byte	0x3
 4816 16fe 23       		.byte	0x23
 4817 16ff E610     		.uleb128 0x866
 4818 1701 0E       		.uleb128 0xe
 4819 1702 9B050000 		.4byte	.LASF354
 4820 1706 09       		.byte	0x9
 4821 1707 A4       		.byte	0xa4
 4822 1708 48000000 		.4byte	0x48
 4823 170c 03       		.byte	0x3
 4824 170d 23       		.byte	0x23
 4825 170e E810     		.uleb128 0x868
 4826 1710 0E       		.uleb128 0xe
 4827 1711 DC0E0000 		.4byte	.LASF355
 4828 1715 09       		.byte	0x9
 4829 1716 A5       		.byte	0xa5
 4830 1717 48000000 		.4byte	0x48
 4831 171b 03       		.byte	0x3
 4832 171c 23       		.byte	0x23
 4833 171d EA10     		.uleb128 0x86a
 4834 171f 0E       		.uleb128 0xe
 4835 1720 F9130000 		.4byte	.LASF356
 4836 1724 09       		.byte	0x9
 4837 1725 A6       		.byte	0xa6
 4838 1726 48000000 		.4byte	0x48
 4839 172a 03       		.byte	0x3
 4840 172b 23       		.byte	0x23
 4841 172c EC10     		.uleb128 0x86c
 4842 172e 0E       		.uleb128 0xe
 4843 172f E40F0000 		.4byte	.LASF357
 4844 1733 09       		.byte	0x9
 4845 1734 A7       		.byte	0xa7
 4846 1735 48000000 		.4byte	0x48
 4847 1739 03       		.byte	0x3
 4848 173a 23       		.byte	0x23
 4849 173b EE10     		.uleb128 0x86e
 4850 173d 0E       		.uleb128 0xe
 4851 173e 28140000 		.4byte	.LASF358
 4852 1742 09       		.byte	0x9
 4853 1743 A8       		.byte	0xa8
 4854 1744 48000000 		.4byte	0x48
 4855 1748 03       		.byte	0x3
ARM GAS  /tmp/ccNOn6pJ.s 			page 95


 4856 1749 23       		.byte	0x23
 4857 174a F010     		.uleb128 0x870
 4858 174c 0E       		.uleb128 0xe
 4859 174d 00080000 		.4byte	.LASF359
 4860 1751 09       		.byte	0x9
 4861 1752 A9       		.byte	0xa9
 4862 1753 48000000 		.4byte	0x48
 4863 1757 03       		.byte	0x3
 4864 1758 23       		.byte	0x23
 4865 1759 F210     		.uleb128 0x872
 4866 175b 0E       		.uleb128 0xe
 4867 175c 8B130000 		.4byte	.LASF360
 4868 1760 09       		.byte	0x9
 4869 1761 AA       		.byte	0xaa
 4870 1762 A7000000 		.4byte	0xa7
 4871 1766 03       		.byte	0x3
 4872 1767 23       		.byte	0x23
 4873 1768 F410     		.uleb128 0x874
 4874 176a 0E       		.uleb128 0xe
 4875 176b 31110000 		.4byte	.LASF361
 4876 176f 09       		.byte	0x9
 4877 1770 AB       		.byte	0xab
 4878 1771 A7000000 		.4byte	0xa7
 4879 1775 03       		.byte	0x3
 4880 1776 23       		.byte	0x23
 4881 1777 F510     		.uleb128 0x875
 4882 1779 0E       		.uleb128 0xe
 4883 177a 5D0B0000 		.4byte	.LASF362
 4884 177e 09       		.byte	0x9
 4885 177f AD       		.byte	0xad
 4886 1780 A7000000 		.4byte	0xa7
 4887 1784 03       		.byte	0x3
 4888 1785 23       		.byte	0x23
 4889 1786 F610     		.uleb128 0x876
 4890 1788 0E       		.uleb128 0xe
 4891 1789 67010000 		.4byte	.LASF363
 4892 178d 09       		.byte	0x9
 4893 178e AE       		.byte	0xae
 4894 178f A7000000 		.4byte	0xa7
 4895 1793 03       		.byte	0x3
 4896 1794 23       		.byte	0x23
 4897 1795 F710     		.uleb128 0x877
 4898 1797 0E       		.uleb128 0xe
 4899 1798 E7140000 		.4byte	.LASF364
 4900 179c 09       		.byte	0x9
 4901 179d AF       		.byte	0xaf
 4902 179e A7000000 		.4byte	0xa7
 4903 17a2 03       		.byte	0x3
 4904 17a3 23       		.byte	0x23
 4905 17a4 F810     		.uleb128 0x878
 4906 17a6 0E       		.uleb128 0xe
 4907 17a7 4B090000 		.4byte	.LASF365
 4908 17ab 09       		.byte	0x9
 4909 17ac B0       		.byte	0xb0
 4910 17ad A7000000 		.4byte	0xa7
 4911 17b1 03       		.byte	0x3
 4912 17b2 23       		.byte	0x23
ARM GAS  /tmp/ccNOn6pJ.s 			page 96


 4913 17b3 F910     		.uleb128 0x879
 4914 17b5 0E       		.uleb128 0xe
 4915 17b6 C5170000 		.4byte	.LASF366
 4916 17ba 09       		.byte	0x9
 4917 17bb B1       		.byte	0xb1
 4918 17bc B2000000 		.4byte	0xb2
 4919 17c0 03       		.byte	0x3
 4920 17c1 23       		.byte	0x23
 4921 17c2 FA10     		.uleb128 0x87a
 4922 17c4 0E       		.uleb128 0xe
 4923 17c5 B2110000 		.4byte	.LASF367
 4924 17c9 09       		.byte	0x9
 4925 17ca B2       		.byte	0xb2
 4926 17cb B2000000 		.4byte	0xb2
 4927 17cf 03       		.byte	0x3
 4928 17d0 23       		.byte	0x23
 4929 17d1 FC10     		.uleb128 0x87c
 4930 17d3 0E       		.uleb128 0xe
 4931 17d4 51110000 		.4byte	.LASF368
 4932 17d8 09       		.byte	0x9
 4933 17d9 B3       		.byte	0xb3
 4934 17da C8000000 		.4byte	0xc8
 4935 17de 03       		.byte	0x3
 4936 17df 23       		.byte	0x23
 4937 17e0 8011     		.uleb128 0x880
 4938 17e2 0E       		.uleb128 0xe
 4939 17e3 EF000000 		.4byte	.LASF369
 4940 17e7 09       		.byte	0x9
 4941 17e8 B4       		.byte	0xb4
 4942 17e9 A7000000 		.4byte	0xa7
 4943 17ed 03       		.byte	0x3
 4944 17ee 23       		.byte	0x23
 4945 17ef 8411     		.uleb128 0x884
 4946 17f1 0E       		.uleb128 0xe
 4947 17f2 2C150000 		.4byte	.LASF370
 4948 17f6 09       		.byte	0x9
 4949 17f7 B5       		.byte	0xb5
 4950 17f8 9C000000 		.4byte	0x9c
 4951 17fc 03       		.byte	0x3
 4952 17fd 23       		.byte	0x23
 4953 17fe 8511     		.uleb128 0x885
 4954 1800 0E       		.uleb128 0xe
 4955 1801 E5070000 		.4byte	.LASF371
 4956 1805 09       		.byte	0x9
 4957 1806 B6       		.byte	0xb6
 4958 1807 9C000000 		.4byte	0x9c
 4959 180b 03       		.byte	0x3
 4960 180c 23       		.byte	0x23
 4961 180d 8611     		.uleb128 0x886
 4962 180f 0E       		.uleb128 0xe
 4963 1810 4B180000 		.4byte	.LASF372
 4964 1814 09       		.byte	0x9
 4965 1815 B7       		.byte	0xb7
 4966 1816 9C000000 		.4byte	0x9c
 4967 181a 03       		.byte	0x3
 4968 181b 23       		.byte	0x23
 4969 181c 8711     		.uleb128 0x887
ARM GAS  /tmp/ccNOn6pJ.s 			page 97


 4970 181e 0E       		.uleb128 0xe
 4971 181f 9D030000 		.4byte	.LASF373
 4972 1823 09       		.byte	0x9
 4973 1824 B8       		.byte	0xb8
 4974 1825 A7000000 		.4byte	0xa7
 4975 1829 03       		.byte	0x3
 4976 182a 23       		.byte	0x23
 4977 182b 8811     		.uleb128 0x888
 4978 182d 0E       		.uleb128 0xe
 4979 182e 80110000 		.4byte	.LASF374
 4980 1832 09       		.byte	0x9
 4981 1833 B9       		.byte	0xb9
 4982 1834 B2000000 		.4byte	0xb2
 4983 1838 03       		.byte	0x3
 4984 1839 23       		.byte	0x23
 4985 183a 8A11     		.uleb128 0x88a
 4986 183c 0E       		.uleb128 0xe
 4987 183d 2A080000 		.4byte	.LASF375
 4988 1841 09       		.byte	0x9
 4989 1842 BA       		.byte	0xba
 4990 1843 9C000000 		.4byte	0x9c
 4991 1847 03       		.byte	0x3
 4992 1848 23       		.byte	0x23
 4993 1849 8C11     		.uleb128 0x88c
 4994 184b 0E       		.uleb128 0xe
 4995 184c 44010000 		.4byte	.LASF376
 4996 1850 09       		.byte	0x9
 4997 1851 BB       		.byte	0xbb
 4998 1852 A7000000 		.4byte	0xa7
 4999 1856 03       		.byte	0x3
 5000 1857 23       		.byte	0x23
 5001 1858 8D11     		.uleb128 0x88d
 5002 185a 0E       		.uleb128 0xe
 5003 185b 8C0F0000 		.4byte	.LASF377
 5004 185f 09       		.byte	0x9
 5005 1860 BC       		.byte	0xbc
 5006 1861 2F1A0000 		.4byte	0x1a2f
 5007 1865 03       		.byte	0x3
 5008 1866 23       		.byte	0x23
 5009 1867 8E11     		.uleb128 0x88e
 5010 1869 0E       		.uleb128 0xe
 5011 186a B20E0000 		.4byte	.LASF378
 5012 186e 09       		.byte	0x9
 5013 186f BD       		.byte	0xbd
 5014 1870 9C000000 		.4byte	0x9c
 5015 1874 03       		.byte	0x3
 5016 1875 23       		.byte	0x23
 5017 1876 AE15     		.uleb128 0xaae
 5018 1878 0E       		.uleb128 0xe
 5019 1879 60130000 		.4byte	.LASF379
 5020 187d 09       		.byte	0x9
 5021 187e BE       		.byte	0xbe
 5022 187f 9C000000 		.4byte	0x9c
 5023 1883 03       		.byte	0x3
 5024 1884 23       		.byte	0x23
 5025 1885 AF15     		.uleb128 0xaaf
 5026 1887 0E       		.uleb128 0xe
ARM GAS  /tmp/ccNOn6pJ.s 			page 98


 5027 1888 B4180000 		.4byte	.LASF380
 5028 188c 09       		.byte	0x9
 5029 188d BF       		.byte	0xbf
 5030 188e 48000000 		.4byte	0x48
 5031 1892 03       		.byte	0x3
 5032 1893 23       		.byte	0x23
 5033 1894 B015     		.uleb128 0xab0
 5034 1896 0E       		.uleb128 0xe
 5035 1897 DD0F0000 		.4byte	.LASF381
 5036 189b 09       		.byte	0x9
 5037 189c C0       		.byte	0xc0
 5038 189d A7000000 		.4byte	0xa7
 5039 18a1 03       		.byte	0x3
 5040 18a2 23       		.byte	0x23
 5041 18a3 B215     		.uleb128 0xab2
 5042 18a5 0E       		.uleb128 0xe
 5043 18a6 C0040000 		.4byte	.LASF382
 5044 18aa 09       		.byte	0x9
 5045 18ab C1       		.byte	0xc1
 5046 18ac 401A0000 		.4byte	0x1a40
 5047 18b0 03       		.byte	0x3
 5048 18b1 23       		.byte	0x23
 5049 18b2 B315     		.uleb128 0xab3
 5050 18b4 0E       		.uleb128 0xe
 5051 18b5 00000000 		.4byte	.LASF383
 5052 18b9 09       		.byte	0x9
 5053 18ba C2       		.byte	0xc2
 5054 18bb 9C000000 		.4byte	0x9c
 5055 18bf 03       		.byte	0x3
 5056 18c0 23       		.byte	0x23
 5057 18c1 B715     		.uleb128 0xab7
 5058 18c3 0E       		.uleb128 0xe
 5059 18c4 46140000 		.4byte	.LASF384
 5060 18c8 09       		.byte	0x9
 5061 18c9 C3       		.byte	0xc3
 5062 18ca 9C000000 		.4byte	0x9c
 5063 18ce 03       		.byte	0x3
 5064 18cf 23       		.byte	0x23
 5065 18d0 B815     		.uleb128 0xab8
 5066 18d2 0E       		.uleb128 0xe
 5067 18d3 A60E0000 		.4byte	.LASF385
 5068 18d7 09       		.byte	0x9
 5069 18d8 C4       		.byte	0xc4
 5070 18d9 A7000000 		.4byte	0xa7
 5071 18dd 03       		.byte	0x3
 5072 18de 23       		.byte	0x23
 5073 18df B915     		.uleb128 0xab9
 5074 18e1 0E       		.uleb128 0xe
 5075 18e2 8E160000 		.4byte	.LASF386
 5076 18e6 09       		.byte	0x9
 5077 18e7 C5       		.byte	0xc5
 5078 18e8 A7000000 		.4byte	0xa7
 5079 18ec 03       		.byte	0x3
 5080 18ed 23       		.byte	0x23
 5081 18ee BA15     		.uleb128 0xaba
 5082 18f0 0E       		.uleb128 0xe
 5083 18f1 440D0000 		.4byte	.LASF387
ARM GAS  /tmp/ccNOn6pJ.s 			page 99


 5084 18f5 09       		.byte	0x9
 5085 18f6 C6       		.byte	0xc6
 5086 18f7 A7000000 		.4byte	0xa7
 5087 18fb 03       		.byte	0x3
 5088 18fc 23       		.byte	0x23
 5089 18fd BB15     		.uleb128 0xabb
 5090 18ff 0E       		.uleb128 0xe
 5091 1900 5D050000 		.4byte	.LASF388
 5092 1904 09       		.byte	0x9
 5093 1905 C7       		.byte	0xc7
 5094 1906 A7000000 		.4byte	0xa7
 5095 190a 03       		.byte	0x3
 5096 190b 23       		.byte	0x23
 5097 190c BC15     		.uleb128 0xabc
 5098 190e 0E       		.uleb128 0xe
 5099 190f 14130000 		.4byte	.LASF389
 5100 1913 09       		.byte	0x9
 5101 1914 C8       		.byte	0xc8
 5102 1915 A7000000 		.4byte	0xa7
 5103 1919 03       		.byte	0x3
 5104 191a 23       		.byte	0x23
 5105 191b BD15     		.uleb128 0xabd
 5106 191d 0E       		.uleb128 0xe
 5107 191e F1020000 		.4byte	.LASF390
 5108 1922 09       		.byte	0x9
 5109 1923 C9       		.byte	0xc9
 5110 1924 501A0000 		.4byte	0x1a50
 5111 1928 03       		.byte	0x3
 5112 1929 23       		.byte	0x23
 5113 192a BE15     		.uleb128 0xabe
 5114 192c 0E       		.uleb128 0xe
 5115 192d 69110000 		.4byte	.LASF391
 5116 1931 09       		.byte	0x9
 5117 1932 CA       		.byte	0xca
 5118 1933 501A0000 		.4byte	0x1a50
 5119 1937 03       		.byte	0x3
 5120 1938 23       		.byte	0x23
 5121 1939 C415     		.uleb128 0xac4
 5122 193b 0E       		.uleb128 0xe
 5123 193c 3B150000 		.4byte	.LASF392
 5124 1940 09       		.byte	0x9
 5125 1941 CB       		.byte	0xcb
 5126 1942 501A0000 		.4byte	0x1a50
 5127 1946 03       		.byte	0x3
 5128 1947 23       		.byte	0x23
 5129 1948 CA15     		.uleb128 0xaca
 5130 194a 0E       		.uleb128 0xe
 5131 194b 7F120000 		.4byte	.LASF393
 5132 194f 09       		.byte	0x9
 5133 1950 CC       		.byte	0xcc
 5134 1951 501A0000 		.4byte	0x1a50
 5135 1955 03       		.byte	0x3
 5136 1956 23       		.byte	0x23
 5137 1957 D015     		.uleb128 0xad0
 5138 1959 0E       		.uleb128 0xe
 5139 195a 77070000 		.4byte	.LASF394
 5140 195e 09       		.byte	0x9
ARM GAS  /tmp/ccNOn6pJ.s 			page 100


 5141 195f CD       		.byte	0xcd
 5142 1960 601A0000 		.4byte	0x1a60
 5143 1964 03       		.byte	0x3
 5144 1965 23       		.byte	0x23
 5145 1966 D615     		.uleb128 0xad6
 5146 1968 0E       		.uleb128 0xe
 5147 1969 DF0D0000 		.4byte	.LASF395
 5148 196d 09       		.byte	0x9
 5149 196e CE       		.byte	0xce
 5150 196f 601A0000 		.4byte	0x1a60
 5151 1973 03       		.byte	0x3
 5152 1974 23       		.byte	0x23
 5153 1975 DC15     		.uleb128 0xadc
 5154 1977 0E       		.uleb128 0xe
 5155 1978 F9000000 		.4byte	.LASF396
 5156 197c 09       		.byte	0x9
 5157 197d CF       		.byte	0xcf
 5158 197e 9C000000 		.4byte	0x9c
 5159 1982 03       		.byte	0x3
 5160 1983 23       		.byte	0x23
 5161 1984 E215     		.uleb128 0xae2
 5162 1986 0E       		.uleb128 0xe
 5163 1987 46110000 		.4byte	.LASF397
 5164 198b 09       		.byte	0x9
 5165 198c D0       		.byte	0xd0
 5166 198d A7000000 		.4byte	0xa7
 5167 1991 03       		.byte	0x3
 5168 1992 23       		.byte	0x23
 5169 1993 E315     		.uleb128 0xae3
 5170 1995 0E       		.uleb128 0xe
 5171 1996 47050000 		.4byte	.LASF398
 5172 199a 09       		.byte	0x9
 5173 199b D1       		.byte	0xd1
 5174 199c B2000000 		.4byte	0xb2
 5175 19a0 03       		.byte	0x3
 5176 19a1 23       		.byte	0x23
 5177 19a2 E415     		.uleb128 0xae4
 5178 19a4 0E       		.uleb128 0xe
 5179 19a5 5E0A0000 		.4byte	.LASF399
 5180 19a9 09       		.byte	0x9
 5181 19aa D2       		.byte	0xd2
 5182 19ab 9C000000 		.4byte	0x9c
 5183 19af 03       		.byte	0x3
 5184 19b0 23       		.byte	0x23
 5185 19b1 E615     		.uleb128 0xae6
 5186 19b3 0E       		.uleb128 0xe
 5187 19b4 19070000 		.4byte	.LASF400
 5188 19b8 09       		.byte	0x9
 5189 19b9 D3       		.byte	0xd3
 5190 19ba A7000000 		.4byte	0xa7
 5191 19be 03       		.byte	0x3
 5192 19bf 23       		.byte	0x23
 5193 19c0 E715     		.uleb128 0xae7
 5194 19c2 0E       		.uleb128 0xe
 5195 19c3 5E110000 		.4byte	.LASF401
 5196 19c7 09       		.byte	0x9
 5197 19c8 D4       		.byte	0xd4
ARM GAS  /tmp/ccNOn6pJ.s 			page 101


 5198 19c9 701A0000 		.4byte	0x1a70
 5199 19cd 03       		.byte	0x3
 5200 19ce 23       		.byte	0x23
 5201 19cf E815     		.uleb128 0xae8
 5202 19d1 0E       		.uleb128 0xe
 5203 19d2 96060000 		.4byte	.LASF402
 5204 19d6 09       		.byte	0x9
 5205 19d7 D5       		.byte	0xd5
 5206 19d8 B2000000 		.4byte	0xb2
 5207 19dc 03       		.byte	0x3
 5208 19dd 23       		.byte	0x23
 5209 19de EA15     		.uleb128 0xaea
 5210 19e0 0E       		.uleb128 0xe
 5211 19e1 5B0F0000 		.4byte	.LASF403
 5212 19e5 09       		.byte	0x9
 5213 19e6 D6       		.byte	0xd6
 5214 19e7 B2000000 		.4byte	0xb2
 5215 19eb 03       		.byte	0x3
 5216 19ec 23       		.byte	0x23
 5217 19ed EC15     		.uleb128 0xaec
 5218 19ef 0E       		.uleb128 0xe
 5219 19f0 A8180000 		.4byte	.LASF404
 5220 19f4 09       		.byte	0x9
 5221 19f5 D7       		.byte	0xd7
 5222 19f6 A7000000 		.4byte	0xa7
 5223 19fa 03       		.byte	0x3
 5224 19fb 23       		.byte	0x23
 5225 19fc EE15     		.uleb128 0xaee
 5226 19fe 00       		.byte	0x0
 5227 19ff 04       		.uleb128 0x4
 5228 1a00 0F1A0000 		.4byte	0x1a0f
 5229 1a04 5F150000 		.4byte	0x155f
 5230 1a08 05       		.uleb128 0x5
 5231 1a09 7B000000 		.4byte	0x7b
 5232 1a0d 03       		.byte	0x3
 5233 1a0e 00       		.byte	0x0
 5234 1a0f 04       		.uleb128 0x4
 5235 1a10 1F1A0000 		.4byte	0x1a1f
 5236 1a14 B2000000 		.4byte	0xb2
 5237 1a18 05       		.uleb128 0x5
 5238 1a19 7B000000 		.4byte	0x7b
 5239 1a1d FF       		.byte	0xff
 5240 1a1e 00       		.byte	0x0
 5241 1a1f 04       		.uleb128 0x4
 5242 1a20 2F1A0000 		.4byte	0x1a2f
 5243 1a24 74140000 		.4byte	0x1474
 5244 1a28 05       		.uleb128 0x5
 5245 1a29 7B000000 		.4byte	0x7b
 5246 1a2d 7F       		.byte	0x7f
 5247 1a2e 00       		.byte	0x0
 5248 1a2f 04       		.uleb128 0x4
 5249 1a30 401A0000 		.4byte	0x1a40
 5250 1a34 A7000000 		.4byte	0xa7
 5251 1a38 19       		.uleb128 0x19
 5252 1a39 7B000000 		.4byte	0x7b
 5253 1a3d 1F02     		.2byte	0x21f
 5254 1a3f 00       		.byte	0x0
ARM GAS  /tmp/ccNOn6pJ.s 			page 102


 5255 1a40 04       		.uleb128 0x4
 5256 1a41 501A0000 		.4byte	0x1a50
 5257 1a45 9C000000 		.4byte	0x9c
 5258 1a49 05       		.uleb128 0x5
 5259 1a4a 7B000000 		.4byte	0x7b
 5260 1a4e 03       		.byte	0x3
 5261 1a4f 00       		.byte	0x0
 5262 1a50 04       		.uleb128 0x4
 5263 1a51 601A0000 		.4byte	0x1a60
 5264 1a55 A7000000 		.4byte	0xa7
 5265 1a59 05       		.uleb128 0x5
 5266 1a5a 7B000000 		.4byte	0x7b
 5267 1a5e 05       		.byte	0x5
 5268 1a5f 00       		.byte	0x0
 5269 1a60 04       		.uleb128 0x4
 5270 1a61 701A0000 		.4byte	0x1a70
 5271 1a65 9C000000 		.4byte	0x9c
 5272 1a69 05       		.uleb128 0x5
 5273 1a6a 7B000000 		.4byte	0x7b
 5274 1a6e 05       		.byte	0x5
 5275 1a6f 00       		.byte	0x0
 5276 1a70 04       		.uleb128 0x4
 5277 1a71 801A0000 		.4byte	0x1a80
 5278 1a75 A7000000 		.4byte	0xa7
 5279 1a79 05       		.uleb128 0x5
 5280 1a7a 7B000000 		.4byte	0x7b
 5281 1a7e 01       		.byte	0x1
 5282 1a7f 00       		.byte	0x0
 5283 1a80 1B       		.uleb128 0x1b
 5284 1a81 9E1C0000 		.4byte	0x1c9e
 5285 1a85 C3180000 		.4byte	.LASF405
 5286 1a89 7406     		.2byte	0x674
 5287 1a8b 03       		.byte	0x3
 5288 1a8c 33       		.byte	0x33
 5289 1a8d 0E       		.uleb128 0xe
 5290 1a8e A3040000 		.4byte	.LASF406
 5291 1a92 03       		.byte	0x3
 5292 1a93 35       		.byte	0x35
 5293 1a94 16040000 		.4byte	0x416
 5294 1a98 02       		.byte	0x2
 5295 1a99 23       		.byte	0x23
 5296 1a9a 00       		.uleb128 0x0
 5297 1a9b 0E       		.uleb128 0xe
 5298 1a9c 8B090000 		.4byte	.LASF407
 5299 1aa0 03       		.byte	0x3
 5300 1aa1 36       		.byte	0x36
 5301 1aa2 16040000 		.4byte	0x416
 5302 1aa6 02       		.byte	0x2
 5303 1aa7 23       		.byte	0x23
 5304 1aa8 04       		.uleb128 0x4
 5305 1aa9 0E       		.uleb128 0xe
 5306 1aaa 89070000 		.4byte	.LASF408
 5307 1aae 03       		.byte	0x3
 5308 1aaf 37       		.byte	0x37
 5309 1ab0 16040000 		.4byte	0x416
 5310 1ab4 02       		.byte	0x2
 5311 1ab5 23       		.byte	0x23
ARM GAS  /tmp/ccNOn6pJ.s 			page 103


 5312 1ab6 08       		.uleb128 0x8
 5313 1ab7 0E       		.uleb128 0xe
 5314 1ab8 A5020000 		.4byte	.LASF409
 5315 1abc 03       		.byte	0x3
 5316 1abd 38       		.byte	0x38
 5317 1abe 16040000 		.4byte	0x416
 5318 1ac2 02       		.byte	0x2
 5319 1ac3 23       		.byte	0x23
 5320 1ac4 0C       		.uleb128 0xc
 5321 1ac5 0E       		.uleb128 0xe
 5322 1ac6 46160000 		.4byte	.LASF410
 5323 1aca 03       		.byte	0x3
 5324 1acb 39       		.byte	0x39
 5325 1acc C8000000 		.4byte	0xc8
 5326 1ad0 02       		.byte	0x2
 5327 1ad1 23       		.byte	0x23
 5328 1ad2 10       		.uleb128 0x10
 5329 1ad3 0E       		.uleb128 0xe
 5330 1ad4 47100000 		.4byte	.LASF411
 5331 1ad8 03       		.byte	0x3
 5332 1ad9 3C       		.byte	0x3c
 5333 1ada 4F000000 		.4byte	0x4f
 5334 1ade 02       		.byte	0x2
 5335 1adf 23       		.byte	0x23
 5336 1ae0 14       		.uleb128 0x14
 5337 1ae1 0C       		.uleb128 0xc
 5338 1ae2 583200   		.ascii	"X2\000"
 5339 1ae5 03       		.byte	0x3
 5340 1ae6 3D       		.byte	0x3d
 5341 1ae7 9E1C0000 		.4byte	0x1c9e
 5342 1aeb 02       		.byte	0x2
 5343 1aec 23       		.byte	0x23
 5344 1aed 18       		.uleb128 0x18
 5345 1aee 0E       		.uleb128 0xe
 5346 1aef 10140000 		.4byte	.LASF412
 5347 1af3 03       		.byte	0x3
 5348 1af4 3E       		.byte	0x3e
 5349 1af5 9E1C0000 		.4byte	0x1c9e
 5350 1af9 02       		.byte	0x2
 5351 1afa 23       		.byte	0x23
 5352 1afb 1C       		.uleb128 0x1c
 5353 1afc 0E       		.uleb128 0xe
 5354 1afd DE030000 		.4byte	.LASF413
 5355 1b01 03       		.byte	0x3
 5356 1b02 3F       		.byte	0x3f
 5357 1b03 9E1C0000 		.4byte	0x1c9e
 5358 1b07 02       		.byte	0x2
 5359 1b08 23       		.byte	0x23
 5360 1b09 20       		.uleb128 0x20
 5361 1b0a 0C       		.uleb128 0xc
 5362 1b0b 5300     		.ascii	"S\000"
 5363 1b0d 03       		.byte	0x3
 5364 1b0e 40       		.byte	0x40
 5365 1b0f 16040000 		.4byte	0x416
 5366 1b13 02       		.byte	0x2
 5367 1b14 23       		.byte	0x23
 5368 1b15 24       		.uleb128 0x24
ARM GAS  /tmp/ccNOn6pJ.s 			page 104


 5369 1b16 0C       		.uleb128 0xc
 5370 1b17 444200   		.ascii	"DB\000"
 5371 1b1a 03       		.byte	0x3
 5372 1b1b 41       		.byte	0x41
 5373 1b1c 16040000 		.4byte	0x416
 5374 1b20 02       		.byte	0x2
 5375 1b21 23       		.byte	0x23
 5376 1b22 28       		.uleb128 0x28
 5377 1b23 0E       		.uleb128 0xe
 5378 1b24 F6170000 		.4byte	.LASF304
 5379 1b28 03       		.byte	0x3
 5380 1b29 42       		.byte	0x42
 5381 1b2a 31040000 		.4byte	0x431
 5382 1b2e 02       		.byte	0x2
 5383 1b2f 23       		.byte	0x23
 5384 1b30 2C       		.uleb128 0x2c
 5385 1b31 0E       		.uleb128 0xe
 5386 1b32 060E0000 		.4byte	.LASF414
 5387 1b36 03       		.byte	0x3
 5388 1b37 43       		.byte	0x43
 5389 1b38 31040000 		.4byte	0x431
 5390 1b3c 02       		.byte	0x2
 5391 1b3d 23       		.byte	0x23
 5392 1b3e 30       		.uleb128 0x30
 5393 1b3f 0E       		.uleb128 0xe
 5394 1b40 E5020000 		.4byte	.LASF415
 5395 1b44 03       		.byte	0x3
 5396 1b45 44       		.byte	0x44
 5397 1b46 C8000000 		.4byte	0xc8
 5398 1b4a 02       		.byte	0x2
 5399 1b4b 23       		.byte	0x23
 5400 1b4c 34       		.uleb128 0x34
 5401 1b4d 0E       		.uleb128 0xe
 5402 1b4e DE170000 		.4byte	.LASF416
 5403 1b52 03       		.byte	0x3
 5404 1b53 45       		.byte	0x45
 5405 1b54 C8000000 		.4byte	0xc8
 5406 1b58 02       		.byte	0x2
 5407 1b59 23       		.byte	0x23
 5408 1b5a 38       		.uleb128 0x38
 5409 1b5b 0E       		.uleb128 0xe
 5410 1b5c F5120000 		.4byte	.LASF417
 5411 1b60 03       		.byte	0x3
 5412 1b61 46       		.byte	0x46
 5413 1b62 C8000000 		.4byte	0xc8
 5414 1b66 02       		.byte	0x2
 5415 1b67 23       		.byte	0x23
 5416 1b68 3C       		.uleb128 0x3c
 5417 1b69 0C       		.uleb128 0xc
 5418 1b6a 5A3100   		.ascii	"Z1\000"
 5419 1b6d 03       		.byte	0x3
 5420 1b6e 47       		.byte	0x47
 5421 1b6f A7000000 		.4byte	0xa7
 5422 1b73 02       		.byte	0x2
 5423 1b74 23       		.byte	0x23
 5424 1b75 40       		.uleb128 0x40
 5425 1b76 0C       		.uleb128 0xc
ARM GAS  /tmp/ccNOn6pJ.s 			page 105


 5426 1b77 5A3200   		.ascii	"Z2\000"
 5427 1b7a 03       		.byte	0x3
 5428 1b7b 48       		.byte	0x48
 5429 1b7c A7000000 		.4byte	0xa7
 5430 1b80 02       		.byte	0x2
 5431 1b81 23       		.byte	0x23
 5432 1b82 41       		.uleb128 0x41
 5433 1b83 0E       		.uleb128 0xe
 5434 1b84 F8050000 		.4byte	.LASF418
 5435 1b88 03       		.byte	0x3
 5436 1b89 49       		.byte	0x49
 5437 1b8a C8000000 		.4byte	0xc8
 5438 1b8e 02       		.byte	0x2
 5439 1b8f 23       		.byte	0x23
 5440 1b90 44       		.uleb128 0x44
 5441 1b91 0E       		.uleb128 0xe
 5442 1b92 04060000 		.4byte	.LASF419
 5443 1b96 03       		.byte	0x3
 5444 1b97 4A       		.byte	0x4a
 5445 1b98 C8000000 		.4byte	0xc8
 5446 1b9c 02       		.byte	0x2
 5447 1b9d 23       		.byte	0x23
 5448 1b9e 48       		.uleb128 0x48
 5449 1b9f 0E       		.uleb128 0xe
 5450 1ba0 C4090000 		.4byte	.LASF420
 5451 1ba4 03       		.byte	0x3
 5452 1ba5 4B       		.byte	0x4b
 5453 1ba6 C8000000 		.4byte	0xc8
 5454 1baa 02       		.byte	0x2
 5455 1bab 23       		.byte	0x23
 5456 1bac 4C       		.uleb128 0x4c
 5457 1bad 0E       		.uleb128 0xe
 5458 1bae 24010000 		.4byte	.LASF421
 5459 1bb2 03       		.byte	0x3
 5460 1bb3 4C       		.byte	0x4c
 5461 1bb4 A41C0000 		.4byte	0x1ca4
 5462 1bb8 02       		.byte	0x2
 5463 1bb9 23       		.byte	0x23
 5464 1bba 50       		.uleb128 0x50
 5465 1bbb 0E       		.uleb128 0xe
 5466 1bbc 75120000 		.4byte	.LASF422
 5467 1bc0 03       		.byte	0x3
 5468 1bc1 4D       		.byte	0x4d
 5469 1bc2 C8000000 		.4byte	0xc8
 5470 1bc6 02       		.byte	0x2
 5471 1bc7 23       		.byte	0x23
 5472 1bc8 54       		.uleb128 0x54
 5473 1bc9 0E       		.uleb128 0xe
 5474 1bca 73050000 		.4byte	.LASF423
 5475 1bce 03       		.byte	0x3
 5476 1bcf 4E       		.byte	0x4e
 5477 1bd0 C8000000 		.4byte	0xc8
 5478 1bd4 02       		.byte	0x2
 5479 1bd5 23       		.byte	0x23
 5480 1bd6 58       		.uleb128 0x58
 5481 1bd7 0E       		.uleb128 0xe
 5482 1bd8 18010000 		.4byte	.LASF424
ARM GAS  /tmp/ccNOn6pJ.s 			page 106


 5483 1bdc 03       		.byte	0x3
 5484 1bdd 50       		.byte	0x50
 5485 1bde A7000000 		.4byte	0xa7
 5486 1be2 02       		.byte	0x2
 5487 1be3 23       		.byte	0x23
 5488 1be4 5C       		.uleb128 0x5c
 5489 1be5 0E       		.uleb128 0xe
 5490 1be6 2E0F0000 		.4byte	.LASF425
 5491 1bea 03       		.byte	0x3
 5492 1beb 51       		.byte	0x51
 5493 1bec A7000000 		.4byte	0xa7
 5494 1bf0 02       		.byte	0x2
 5495 1bf1 23       		.byte	0x23
 5496 1bf2 5D       		.uleb128 0x5d
 5497 1bf3 0E       		.uleb128 0xe
 5498 1bf4 1E010000 		.4byte	.LASF426
 5499 1bf8 03       		.byte	0x3
 5500 1bf9 52       		.byte	0x52
 5501 1bfa A7000000 		.4byte	0xa7
 5502 1bfe 02       		.byte	0x2
 5503 1bff 23       		.byte	0x23
 5504 1c00 5E       		.uleb128 0x5e
 5505 1c01 0E       		.uleb128 0xe
 5506 1c02 AC000000 		.4byte	.LASF427
 5507 1c06 03       		.byte	0x3
 5508 1c07 53       		.byte	0x53
 5509 1c08 A7000000 		.4byte	0xa7
 5510 1c0c 02       		.byte	0x2
 5511 1c0d 23       		.byte	0x23
 5512 1c0e 5F       		.uleb128 0x5f
 5513 1c0f 0E       		.uleb128 0xe
 5514 1c10 9D0B0000 		.4byte	.LASF428
 5515 1c14 03       		.byte	0x3
 5516 1c15 54       		.byte	0x54
 5517 1c16 A7000000 		.4byte	0xa7
 5518 1c1a 02       		.byte	0x2
 5519 1c1b 23       		.byte	0x23
 5520 1c1c 60       		.uleb128 0x60
 5521 1c1d 0E       		.uleb128 0xe
 5522 1c1e 97120000 		.4byte	.LASF429
 5523 1c22 03       		.byte	0x3
 5524 1c23 55       		.byte	0x55
 5525 1c24 A7000000 		.4byte	0xa7
 5526 1c28 02       		.byte	0x2
 5527 1c29 23       		.byte	0x23
 5528 1c2a 61       		.uleb128 0x61
 5529 1c2b 0E       		.uleb128 0xe
 5530 1c2c C80B0000 		.4byte	.LASF430
 5531 1c30 03       		.byte	0x3
 5532 1c31 56       		.byte	0x56
 5533 1c32 A7000000 		.4byte	0xa7
 5534 1c36 02       		.byte	0x2
 5535 1c37 23       		.byte	0x23
 5536 1c38 62       		.uleb128 0x62
 5537 1c39 0E       		.uleb128 0xe
 5538 1c3a FA080000 		.4byte	.LASF431
 5539 1c3e 03       		.byte	0x3
ARM GAS  /tmp/ccNOn6pJ.s 			page 107


 5540 1c3f 57       		.byte	0x57
 5541 1c40 A7000000 		.4byte	0xa7
 5542 1c44 02       		.byte	0x2
 5543 1c45 23       		.byte	0x23
 5544 1c46 63       		.uleb128 0x63
 5545 1c47 0E       		.uleb128 0xe
 5546 1c48 7F0D0000 		.4byte	.LASF432
 5547 1c4c 03       		.byte	0x3
 5548 1c4d 58       		.byte	0x58
 5549 1c4e A7000000 		.4byte	0xa7
 5550 1c52 02       		.byte	0x2
 5551 1c53 23       		.byte	0x23
 5552 1c54 64       		.uleb128 0x64
 5553 1c55 0E       		.uleb128 0xe
 5554 1c56 0B060000 		.4byte	.LASF433
 5555 1c5a 03       		.byte	0x3
 5556 1c5b 59       		.byte	0x59
 5557 1c5c A7000000 		.4byte	0xa7
 5558 1c60 02       		.byte	0x2
 5559 1c61 23       		.byte	0x23
 5560 1c62 65       		.uleb128 0x65
 5561 1c63 0E       		.uleb128 0xe
 5562 1c64 21030000 		.4byte	.LASF434
 5563 1c68 03       		.byte	0x3
 5564 1c69 5A       		.byte	0x5a
 5565 1c6a 9C000000 		.4byte	0x9c
 5566 1c6e 02       		.byte	0x2
 5567 1c6f 23       		.byte	0x23
 5568 1c70 66       		.uleb128 0x66
 5569 1c71 0E       		.uleb128 0xe
 5570 1c72 14150000 		.4byte	.LASF435
 5571 1c76 03       		.byte	0x3
 5572 1c77 5C       		.byte	0x5c
 5573 1c78 AA1C0000 		.4byte	0x1caa
 5574 1c7c 02       		.byte	0x2
 5575 1c7d 23       		.byte	0x23
 5576 1c7e 68       		.uleb128 0x68
 5577 1c7f 0E       		.uleb128 0xe
 5578 1c80 21110000 		.4byte	.LASF436
 5579 1c84 03       		.byte	0x3
 5580 1c85 5D       		.byte	0x5d
 5581 1c86 BA1C0000 		.4byte	0x1cba
 5582 1c8a 03       		.byte	0x3
 5583 1c8b 23       		.byte	0x23
 5584 1c8c EC04     		.uleb128 0x26c
 5585 1c8e 0E       		.uleb128 0xe
 5586 1c8f 7E0B0000 		.4byte	.LASF437
 5587 1c93 03       		.byte	0x3
 5588 1c94 5E       		.byte	0x5e
 5589 1c95 AA1C0000 		.4byte	0x1caa
 5590 1c99 03       		.byte	0x3
 5591 1c9a 23       		.byte	0x23
 5592 1c9b F008     		.uleb128 0x470
 5593 1c9d 00       		.byte	0x0
 5594 1c9e 06       		.uleb128 0x6
 5595 1c9f 04       		.byte	0x4
 5596 1ca0 B2000000 		.4byte	0xb2
ARM GAS  /tmp/ccNOn6pJ.s 			page 108


 5597 1ca4 06       		.uleb128 0x6
 5598 1ca5 04       		.byte	0x4
 5599 1ca6 CF110000 		.4byte	0x11cf
 5600 1caa 04       		.uleb128 0x4
 5601 1cab BA1C0000 		.4byte	0x1cba
 5602 1caf 4F000000 		.4byte	0x4f
 5603 1cb3 05       		.uleb128 0x5
 5604 1cb4 7B000000 		.4byte	0x7b
 5605 1cb8 80       		.byte	0x80
 5606 1cb9 00       		.byte	0x0
 5607 1cba 04       		.uleb128 0x4
 5608 1cbb CA1C0000 		.4byte	0x1cca
 5609 1cbf C8000000 		.4byte	0xc8
 5610 1cc3 05       		.uleb128 0x5
 5611 1cc4 7B000000 		.4byte	0x7b
 5612 1cc8 80       		.byte	0x80
 5613 1cc9 00       		.byte	0x0
 5614 1cca 0B       		.uleb128 0xb
 5615 1ccb 0D1D0000 		.4byte	0x1d0d
 5616 1ccf 0B000000 		.4byte	.LASF438
 5617 1cd3 10       		.byte	0x10
 5618 1cd4 03       		.byte	0x3
 5619 1cd5 68       		.byte	0x68
 5620 1cd6 0B       		.uleb128 0xb
 5621 1cd7 FF1C0000 		.4byte	0x1cff
 5622 1cdb 5A040000 		.4byte	.LASF439
 5623 1cdf 04       		.byte	0x4
 5624 1ce0 03       		.byte	0x3
 5625 1ce1 69       		.byte	0x69
 5626 1ce2 0E       		.uleb128 0xe
 5627 1ce3 3A050000 		.4byte	.LASF330
 5628 1ce7 03       		.byte	0x3
 5629 1ce8 6A       		.byte	0x6a
 5630 1ce9 B2000000 		.4byte	0xb2
 5631 1ced 02       		.byte	0x2
 5632 1cee 23       		.byte	0x23
 5633 1cef 00       		.uleb128 0x0
 5634 1cf0 0E       		.uleb128 0xe
 5635 1cf1 BB0F0000 		.4byte	.LASF331
 5636 1cf5 03       		.byte	0x3
 5637 1cf6 6B       		.byte	0x6b
 5638 1cf7 B2000000 		.4byte	0xb2
 5639 1cfb 02       		.byte	0x2
 5640 1cfc 23       		.byte	0x23
 5641 1cfd 02       		.uleb128 0x2
 5642 1cfe 00       		.byte	0x0
 5643 1cff 0C       		.uleb128 0xc
 5644 1d00 424700   		.ascii	"BG\000"
 5645 1d03 03       		.byte	0x3
 5646 1d04 6C       		.byte	0x6c
 5647 1d05 0D1D0000 		.4byte	0x1d0d
 5648 1d09 02       		.byte	0x2
 5649 1d0a 23       		.byte	0x23
 5650 1d0b 00       		.uleb128 0x0
 5651 1d0c 00       		.byte	0x0
 5652 1d0d 04       		.uleb128 0x4
 5653 1d0e 1D1D0000 		.4byte	0x1d1d
ARM GAS  /tmp/ccNOn6pJ.s 			page 109


 5654 1d12 D61C0000 		.4byte	0x1cd6
 5655 1d16 05       		.uleb128 0x5
 5656 1d17 7B000000 		.4byte	0x7b
 5657 1d1b 03       		.byte	0x3
 5658 1d1c 00       		.byte	0x0
 5659 1d1d 0B       		.uleb128 0xb
 5660 1d1e 7E1D0000 		.4byte	0x1d7e
 5661 1d22 16040000 		.4byte	.LASF440
 5662 1d26 0C       		.byte	0xc
 5663 1d27 03       		.byte	0x3
 5664 1d28 86       		.byte	0x86
 5665 1d29 0E       		.uleb128 0xe
 5666 1d2a 9B050000 		.4byte	.LASF354
 5667 1d2e 03       		.byte	0x3
 5668 1d2f 87       		.byte	0x87
 5669 1d30 48000000 		.4byte	0x48
 5670 1d34 02       		.byte	0x2
 5671 1d35 23       		.byte	0x23
 5672 1d36 00       		.uleb128 0x0
 5673 1d37 0E       		.uleb128 0xe
 5674 1d38 DC0E0000 		.4byte	.LASF355
 5675 1d3c 03       		.byte	0x3
 5676 1d3d 88       		.byte	0x88
 5677 1d3e 48000000 		.4byte	0x48
 5678 1d42 02       		.byte	0x2
 5679 1d43 23       		.byte	0x23
 5680 1d44 02       		.uleb128 0x2
 5681 1d45 0E       		.uleb128 0xe
 5682 1d46 F9130000 		.4byte	.LASF356
 5683 1d4a 03       		.byte	0x3
 5684 1d4b 89       		.byte	0x89
 5685 1d4c 48000000 		.4byte	0x48
 5686 1d50 02       		.byte	0x2
 5687 1d51 23       		.byte	0x23
 5688 1d52 04       		.uleb128 0x4
 5689 1d53 0E       		.uleb128 0xe
 5690 1d54 E40F0000 		.4byte	.LASF357
 5691 1d58 03       		.byte	0x3
 5692 1d59 8A       		.byte	0x8a
 5693 1d5a 48000000 		.4byte	0x48
 5694 1d5e 02       		.byte	0x2
 5695 1d5f 23       		.byte	0x23
 5696 1d60 06       		.uleb128 0x6
 5697 1d61 0E       		.uleb128 0xe
 5698 1d62 28140000 		.4byte	.LASF358
 5699 1d66 03       		.byte	0x3
 5700 1d67 8B       		.byte	0x8b
 5701 1d68 48000000 		.4byte	0x48
 5702 1d6c 02       		.byte	0x2
 5703 1d6d 23       		.byte	0x23
 5704 1d6e 08       		.uleb128 0x8
 5705 1d6f 0E       		.uleb128 0xe
 5706 1d70 00080000 		.4byte	.LASF359
 5707 1d74 03       		.byte	0x3
 5708 1d75 8C       		.byte	0x8c
 5709 1d76 48000000 		.4byte	0x48
 5710 1d7a 02       		.byte	0x2
ARM GAS  /tmp/ccNOn6pJ.s 			page 110


 5711 1d7b 23       		.byte	0x23
 5712 1d7c 0A       		.uleb128 0xa
 5713 1d7d 00       		.byte	0x0
 5714 1d7e 0B       		.uleb128 0xb
 5715 1d7f 991D0000 		.4byte	0x1d99
 5716 1d83 D60B0000 		.4byte	.LASF441
 5717 1d87 04       		.byte	0x4
 5718 1d88 0A       		.byte	0xa
 5719 1d89 33       		.byte	0x33
 5720 1d8a 0E       		.uleb128 0xe
 5721 1d8b 33100000 		.4byte	.LASF442
 5722 1d8f 0A       		.byte	0xa
 5723 1d90 37       		.byte	0x37
 5724 1d91 9A1D0000 		.4byte	0x1d9a
 5725 1d95 02       		.byte	0x2
 5726 1d96 23       		.byte	0x23
 5727 1d97 00       		.uleb128 0x0
 5728 1d98 00       		.byte	0x0
 5729 1d99 1C       		.uleb128 0x1c
 5730 1d9a 06       		.uleb128 0x6
 5731 1d9b 04       		.byte	0x4
 5732 1d9c 991D0000 		.4byte	0x1d99
 5733 1da0 0B       		.uleb128 0xb
 5734 1da1 551E0000 		.4byte	0x1e55
 5735 1da5 91120000 		.4byte	.LASF443
 5736 1da9 24       		.byte	0x24
 5737 1daa 0A       		.byte	0xa
 5738 1dab 3C       		.byte	0x3c
 5739 1dac 0E       		.uleb128 0xe
 5740 1dad 13160000 		.4byte	.LASF256
 5741 1db1 0A       		.byte	0xa
 5742 1db2 3D       		.byte	0x3d
 5743 1db3 16040000 		.4byte	0x416
 5744 1db7 02       		.byte	0x2
 5745 1db8 23       		.byte	0x23
 5746 1db9 00       		.uleb128 0x0
 5747 1dba 0E       		.uleb128 0xe
 5748 1dbb B90C0000 		.4byte	.LASF444
 5749 1dbf 0A       		.byte	0xa
 5750 1dc0 3E       		.byte	0x3e
 5751 1dc1 551E0000 		.4byte	0x1e55
 5752 1dc5 02       		.byte	0x2
 5753 1dc6 23       		.byte	0x23
 5754 1dc7 04       		.uleb128 0x4
 5755 1dc8 0E       		.uleb128 0xe
 5756 1dc9 3F060000 		.4byte	.LASF445
 5757 1dcd 0A       		.byte	0xa
 5758 1dce 3F       		.byte	0x3f
 5759 1dcf A7000000 		.4byte	0xa7
 5760 1dd3 02       		.byte	0x2
 5761 1dd4 23       		.byte	0x23
 5762 1dd5 08       		.uleb128 0x8
 5763 1dd6 0E       		.uleb128 0xe
 5764 1dd7 B4000000 		.4byte	.LASF446
 5765 1ddb 0A       		.byte	0xa
 5766 1ddc 40       		.byte	0x40
 5767 1ddd A7000000 		.4byte	0xa7
ARM GAS  /tmp/ccNOn6pJ.s 			page 111


 5768 1de1 02       		.byte	0x2
 5769 1de2 23       		.byte	0x23
 5770 1de3 09       		.uleb128 0x9
 5771 1de4 0E       		.uleb128 0xe
 5772 1de5 E60A0000 		.4byte	.LASF447
 5773 1de9 0A       		.byte	0xa
 5774 1dea 41       		.byte	0x41
 5775 1deb A7000000 		.4byte	0xa7
 5776 1def 02       		.byte	0x2
 5777 1df0 23       		.byte	0x23
 5778 1df1 0A       		.uleb128 0xa
 5779 1df2 0E       		.uleb128 0xe
 5780 1df3 A4150000 		.4byte	.LASF448
 5781 1df7 0A       		.byte	0xa
 5782 1df8 42       		.byte	0x42
 5783 1df9 A7000000 		.4byte	0xa7
 5784 1dfd 02       		.byte	0x2
 5785 1dfe 23       		.byte	0x23
 5786 1dff 0B       		.uleb128 0xb
 5787 1e00 0E       		.uleb128 0xe
 5788 1e01 42130000 		.4byte	.LASF449
 5789 1e05 0A       		.byte	0xa
 5790 1e06 43       		.byte	0x43
 5791 1e07 9C000000 		.4byte	0x9c
 5792 1e0b 02       		.byte	0x2
 5793 1e0c 23       		.byte	0x23
 5794 1e0d 0C       		.uleb128 0xc
 5795 1e0e 0E       		.uleb128 0xe
 5796 1e0f 30040000 		.4byte	.LASF450
 5797 1e13 0A       		.byte	0xa
 5798 1e14 44       		.byte	0x44
 5799 1e15 C8000000 		.4byte	0xc8
 5800 1e19 02       		.byte	0x2
 5801 1e1a 23       		.byte	0x23
 5802 1e1b 10       		.uleb128 0x10
 5803 1e1c 0E       		.uleb128 0xe
 5804 1e1d FA040000 		.4byte	.LASF451
 5805 1e21 0A       		.byte	0xa
 5806 1e22 45       		.byte	0x45
 5807 1e23 C8000000 		.4byte	0xc8
 5808 1e27 02       		.byte	0x2
 5809 1e28 23       		.byte	0x23
 5810 1e29 14       		.uleb128 0x14
 5811 1e2a 0E       		.uleb128 0xe
 5812 1e2b 0A190000 		.4byte	.LASF452
 5813 1e2f 0A       		.byte	0xa
 5814 1e30 46       		.byte	0x46
 5815 1e31 C8000000 		.4byte	0xc8
 5816 1e35 02       		.byte	0x2
 5817 1e36 23       		.byte	0x23
 5818 1e37 18       		.uleb128 0x18
 5819 1e38 0E       		.uleb128 0xe
 5820 1e39 4C080000 		.4byte	.LASF453
 5821 1e3d 0A       		.byte	0xa
 5822 1e3e 47       		.byte	0x47
 5823 1e3f C8000000 		.4byte	0xc8
 5824 1e43 02       		.byte	0x2
ARM GAS  /tmp/ccNOn6pJ.s 			page 112


 5825 1e44 23       		.byte	0x23
 5826 1e45 1C       		.uleb128 0x1c
 5827 1e46 0E       		.uleb128 0xe
 5828 1e47 7A0F0000 		.4byte	.LASF454
 5829 1e4b 0A       		.byte	0xa
 5830 1e4c 48       		.byte	0x48
 5831 1e4d C8000000 		.4byte	0xc8
 5832 1e51 02       		.byte	0x2
 5833 1e52 23       		.byte	0x23
 5834 1e53 20       		.uleb128 0x20
 5835 1e54 00       		.byte	0x0
 5836 1e55 06       		.uleb128 0x6
 5837 1e56 04       		.byte	0x4
 5838 1e57 7E1D0000 		.4byte	0x1d7e
 5839 1e5b 0A       		.uleb128 0xa
 5840 1e5c AA1E0000 		.4byte	0x1eaa
 5841 1e60 68040000 		.4byte	.LASF456
 5842 1e64 04       		.byte	0x4
 5843 1e65 0C       		.byte	0xc
 5844 1e66 58       		.byte	0x58
 5845 1e67 0B       		.uleb128 0xb
 5846 1e68 8C1E0000 		.4byte	0x1e8c
 5847 1e6c A9070000 		.4byte	.LASF457
 5848 1e70 04       		.byte	0x4
 5849 1e71 0C       		.byte	0xc
 5850 1e72 5A       		.byte	0x5a
 5851 1e73 0C       		.uleb128 0xc
 5852 1e74 4100     		.ascii	"A\000"
 5853 1e76 0C       		.byte	0xc
 5854 1e77 5A       		.byte	0x5a
 5855 1e78 A7000000 		.4byte	0xa7
 5856 1e7c 02       		.byte	0x2
 5857 1e7d 23       		.byte	0x23
 5858 1e7e 00       		.uleb128 0x0
 5859 1e7f 0C       		.uleb128 0xc
 5860 1e80 5900     		.ascii	"Y\000"
 5861 1e82 0C       		.byte	0xc
 5862 1e83 5A       		.byte	0x5a
 5863 1e84 A7000000 		.4byte	0xa7
 5864 1e88 02       		.byte	0x2
 5865 1e89 23       		.byte	0x23
 5866 1e8a 01       		.uleb128 0x1
 5867 1e8b 00       		.byte	0x0
 5868 1e8c 0D       		.uleb128 0xd
 5869 1e8d 4200     		.ascii	"B\000"
 5870 1e8f 0C       		.byte	0xc
 5871 1e90 5A       		.byte	0x5a
 5872 1e91 671E0000 		.4byte	0x1e67
 5873 1e95 0D       		.uleb128 0xd
 5874 1e96 5700     		.ascii	"W\000"
 5875 1e98 0C       		.byte	0xc
 5876 1e99 5E       		.byte	0x5e
 5877 1e9a B2000000 		.4byte	0xb2
 5878 1e9e 1D       		.uleb128 0x1d
 5879 1e9f D6030000 		.4byte	.LASF458
 5880 1ea3 0C       		.byte	0xc
 5881 1ea4 5F       		.byte	0x5f
ARM GAS  /tmp/ccNOn6pJ.s 			page 113


 5882 1ea5 C8000000 		.4byte	0xc8
 5883 1ea9 00       		.byte	0x0
 5884 1eaa 0B       		.uleb128 0xb
 5885 1eab 29200000 		.4byte	0x2029
 5886 1eaf 55080000 		.4byte	.LASF459
 5887 1eb3 4C       		.byte	0x4c
 5888 1eb4 0B       		.byte	0xb
 5889 1eb5 46       		.byte	0x46
 5890 1eb6 0E       		.uleb128 0xe
 5891 1eb7 AE150000 		.4byte	.LASF460
 5892 1ebb 0B       		.byte	0xb
 5893 1ebc 47       		.byte	0x47
 5894 1ebd 16040000 		.4byte	0x416
 5895 1ec1 02       		.byte	0x2
 5896 1ec2 23       		.byte	0x23
 5897 1ec3 00       		.uleb128 0x0
 5898 1ec4 0E       		.uleb128 0xe
 5899 1ec5 B1090000 		.4byte	.LASF324
 5900 1ec9 0B       		.byte	0xb
 5901 1eca 48       		.byte	0x48
 5902 1ecb C8000000 		.4byte	0xc8
 5903 1ecf 02       		.byte	0x2
 5904 1ed0 23       		.byte	0x23
 5905 1ed1 04       		.uleb128 0x4
 5906 1ed2 0E       		.uleb128 0xe
 5907 1ed3 10190000 		.4byte	.LASF461
 5908 1ed7 0B       		.byte	0xb
 5909 1ed8 49       		.byte	0x49
 5910 1ed9 16040000 		.4byte	0x416
 5911 1edd 02       		.byte	0x2
 5912 1ede 23       		.byte	0x23
 5913 1edf 08       		.uleb128 0x8
 5914 1ee0 0E       		.uleb128 0xe
 5915 1ee1 170A0000 		.4byte	.LASF462
 5916 1ee5 0B       		.byte	0xb
 5917 1ee6 4A       		.byte	0x4a
 5918 1ee7 16040000 		.4byte	0x416
 5919 1eeb 02       		.byte	0x2
 5920 1eec 23       		.byte	0x23
 5921 1eed 0C       		.uleb128 0xc
 5922 1eee 0E       		.uleb128 0xe
 5923 1eef 4D150000 		.4byte	.LASF30
 5924 1ef3 0B       		.byte	0xb
 5925 1ef4 4B       		.byte	0x4b
 5926 1ef5 C8000000 		.4byte	0xc8
 5927 1ef9 02       		.byte	0x2
 5928 1efa 23       		.byte	0x23
 5929 1efb 10       		.uleb128 0x10
 5930 1efc 0E       		.uleb128 0xe
 5931 1efd 0F020000 		.4byte	.LASF463
 5932 1f01 0B       		.byte	0xb
 5933 1f02 4C       		.byte	0x4c
 5934 1f03 16040000 		.4byte	0x416
 5935 1f07 02       		.byte	0x2
 5936 1f08 23       		.byte	0x23
 5937 1f09 14       		.uleb128 0x14
 5938 1f0a 0E       		.uleb128 0xe
ARM GAS  /tmp/ccNOn6pJ.s 			page 114


 5939 1f0b A0010000 		.4byte	.LASF464
 5940 1f0f 0B       		.byte	0xb
 5941 1f10 4D       		.byte	0x4d
 5942 1f11 16040000 		.4byte	0x416
 5943 1f15 02       		.byte	0x2
 5944 1f16 23       		.byte	0x23
 5945 1f17 18       		.uleb128 0x18
 5946 1f18 0E       		.uleb128 0xe
 5947 1f19 3F060000 		.4byte	.LASF445
 5948 1f1d 0B       		.byte	0xb
 5949 1f1e 4E       		.byte	0x4e
 5950 1f1f A7000000 		.4byte	0xa7
 5951 1f23 02       		.byte	0x2
 5952 1f24 23       		.byte	0x23
 5953 1f25 1C       		.uleb128 0x1c
 5954 1f26 0E       		.uleb128 0xe
 5955 1f27 A4150000 		.4byte	.LASF448
 5956 1f2b 0B       		.byte	0xb
 5957 1f2c 4F       		.byte	0x4f
 5958 1f2d A7000000 		.4byte	0xa7
 5959 1f31 02       		.byte	0x2
 5960 1f32 23       		.byte	0x23
 5961 1f33 1D       		.uleb128 0x1d
 5962 1f34 0C       		.uleb128 0xc
 5963 1f35 42697400 		.ascii	"Bit\000"
 5964 1f39 0B       		.byte	0xb
 5965 1f3a 50       		.byte	0x50
 5966 1f3b A7000000 		.4byte	0xa7
 5967 1f3f 02       		.byte	0x2
 5968 1f40 23       		.byte	0x23
 5969 1f41 1E       		.uleb128 0x1e
 5970 1f42 0E       		.uleb128 0xe
 5971 1f43 0B0C0000 		.4byte	.LASF465
 5972 1f47 0B       		.byte	0xb
 5973 1f48 51       		.byte	0x51
 5974 1f49 A7000000 		.4byte	0xa7
 5975 1f4d 02       		.byte	0x2
 5976 1f4e 23       		.byte	0x23
 5977 1f4f 1F       		.uleb128 0x1f
 5978 1f50 0E       		.uleb128 0xe
 5979 1f51 F8140000 		.4byte	.LASF466
 5980 1f55 0B       		.byte	0xb
 5981 1f56 52       		.byte	0x52
 5982 1f57 C8000000 		.4byte	0xc8
 5983 1f5b 02       		.byte	0x2
 5984 1f5c 23       		.byte	0x23
 5985 1f5d 20       		.uleb128 0x20
 5986 1f5e 0E       		.uleb128 0xe
 5987 1f5f 4C080000 		.4byte	.LASF453
 5988 1f63 0B       		.byte	0xb
 5989 1f64 53       		.byte	0x53
 5990 1f65 C8000000 		.4byte	0xc8
 5991 1f69 02       		.byte	0x2
 5992 1f6a 23       		.byte	0x23
 5993 1f6b 24       		.uleb128 0x24
 5994 1f6c 0E       		.uleb128 0xe
 5995 1f6d 51040000 		.4byte	.LASF467
ARM GAS  /tmp/ccNOn6pJ.s 			page 115


 5996 1f71 0B       		.byte	0xb
 5997 1f72 54       		.byte	0x54
 5998 1f73 D3000000 		.4byte	0xd3
 5999 1f77 02       		.byte	0x2
 6000 1f78 23       		.byte	0x23
 6001 1f79 28       		.uleb128 0x28
 6002 1f7a 0E       		.uleb128 0xe
 6003 1f7b 04120000 		.4byte	.LASF468
 6004 1f7f 0B       		.byte	0xb
 6005 1f80 55       		.byte	0x55
 6006 1f81 D3000000 		.4byte	0xd3
 6007 1f85 02       		.byte	0x2
 6008 1f86 23       		.byte	0x23
 6009 1f87 2C       		.uleb128 0x2c
 6010 1f88 0E       		.uleb128 0xe
 6011 1f89 9A020000 		.4byte	.LASF469
 6012 1f8d 0B       		.byte	0xb
 6013 1f8e 57       		.byte	0x57
 6014 1f8f 31040000 		.4byte	0x431
 6015 1f93 02       		.byte	0x2
 6016 1f94 23       		.byte	0x23
 6017 1f95 30       		.uleb128 0x30
 6018 1f96 0C       		.uleb128 0xc
 6019 1f97 504300   		.ascii	"PC\000"
 6020 1f9a 0B       		.byte	0xb
 6021 1f9b 58       		.byte	0x58
 6022 1f9c 16040000 		.4byte	0x416
 6023 1fa0 02       		.byte	0x2
 6024 1fa1 23       		.byte	0x23
 6025 1fa2 34       		.uleb128 0x34
 6026 1fa3 0C       		.uleb128 0xc
 6027 1fa4 594100   		.ascii	"YA\000"
 6028 1fa7 0B       		.byte	0xb
 6029 1fa8 59       		.byte	0x59
 6030 1fa9 5B1E0000 		.4byte	0x1e5b
 6031 1fad 02       		.byte	0x2
 6032 1fae 23       		.byte	0x23
 6033 1faf 38       		.uleb128 0x38
 6034 1fb0 0C       		.uleb128 0xc
 6035 1fb1 5000     		.ascii	"P\000"
 6036 1fb3 0B       		.byte	0xb
 6037 1fb4 5A       		.byte	0x5a
 6038 1fb5 A7000000 		.4byte	0xa7
 6039 1fb9 02       		.byte	0x2
 6040 1fba 23       		.byte	0x23
 6041 1fbb 3C       		.uleb128 0x3c
 6042 1fbc 0E       		.uleb128 0xe
 6043 1fbd 100C0000 		.4byte	.LASF470
 6044 1fc1 0B       		.byte	0xb
 6045 1fc2 5B       		.byte	0x5b
 6046 1fc3 A7000000 		.4byte	0xa7
 6047 1fc7 02       		.byte	0x2
 6048 1fc8 23       		.byte	0x23
 6049 1fc9 3D       		.uleb128 0x3d
 6050 1fca 0E       		.uleb128 0xe
 6051 1fcb EC050000 		.4byte	.LASF471
 6052 1fcf 0B       		.byte	0xb
ARM GAS  /tmp/ccNOn6pJ.s 			page 116


 6053 1fd0 5C       		.byte	0x5c
 6054 1fd1 A7000000 		.4byte	0xa7
 6055 1fd5 02       		.byte	0x2
 6056 1fd6 23       		.byte	0x23
 6057 1fd7 3E       		.uleb128 0x3e
 6058 1fd8 0E       		.uleb128 0xe
 6059 1fd9 B4000000 		.4byte	.LASF446
 6060 1fdd 0B       		.byte	0xb
 6061 1fde 5D       		.byte	0x5d
 6062 1fdf A7000000 		.4byte	0xa7
 6063 1fe3 02       		.byte	0x2
 6064 1fe4 23       		.byte	0x23
 6065 1fe5 3F       		.uleb128 0x3f
 6066 1fe6 0C       		.uleb128 0xc
 6067 1fe7 5800     		.ascii	"X\000"
 6068 1fe9 0B       		.byte	0xb
 6069 1fea 5E       		.byte	0x5e
 6070 1feb A7000000 		.4byte	0xa7
 6071 1fef 02       		.byte	0x2
 6072 1ff0 23       		.byte	0x23
 6073 1ff1 40       		.uleb128 0x40
 6074 1ff2 0C       		.uleb128 0xc
 6075 1ff3 5300     		.ascii	"S\000"
 6076 1ff5 0B       		.byte	0xb
 6077 1ff6 5F       		.byte	0x5f
 6078 1ff7 A7000000 		.4byte	0xa7
 6079 1ffb 02       		.byte	0x2
 6080 1ffc 23       		.byte	0x23
 6081 1ffd 41       		.uleb128 0x41
 6082 1ffe 0E       		.uleb128 0xe
 6083 1fff 460F0000 		.4byte	.LASF472
 6084 2003 0B       		.byte	0xb
 6085 2004 60       		.byte	0x60
 6086 2005 B2000000 		.4byte	0xb2
 6087 2009 02       		.byte	0x2
 6088 200a 23       		.byte	0x23
 6089 200b 42       		.uleb128 0x42
 6090 200c 0C       		.uleb128 0xc
 6091 200d 52414D00 		.ascii	"RAM\000"
 6092 2011 0B       		.byte	0xb
 6093 2012 61       		.byte	0x61
 6094 2013 16040000 		.4byte	0x416
 6095 2017 02       		.byte	0x2
 6096 2018 23       		.byte	0x23
 6097 2019 44       		.uleb128 0x44
 6098 201a 0E       		.uleb128 0xe
 6099 201b 510D0000 		.4byte	.LASF473
 6100 201f 0B       		.byte	0xb
 6101 2020 63       		.byte	0x63
 6102 2021 16040000 		.4byte	0x416
 6103 2025 02       		.byte	0x2
 6104 2026 23       		.byte	0x23
 6105 2027 48       		.uleb128 0x48
 6106 2028 00       		.byte	0x0
 6107 2029 1E       		.uleb128 0x1e
 6108 202a A2210000 		.4byte	0x21a2
 6109 202e 01       		.byte	0x1
ARM GAS  /tmp/ccNOn6pJ.s 			page 117


 6110 202f 150D0000 		.4byte	.LASF474
 6111 2033 01       		.byte	0x1
 6112 2034 3A       		.byte	0x3a
 6113 2035 53120000 		.4byte	.LASF475
 6114 2039 00000000 		.4byte	.LFB29
 6115 203d AC030000 		.4byte	.LFE29
 6116 2041 00000000 		.4byte	.LLST0
 6117 2045 1F       		.uleb128 0x1f
 6118 2046 A3040000 		.4byte	.LASF406
 6119 204a 01       		.byte	0x1
 6120 204b 3A       		.byte	0x3a
 6121 204c 16040000 		.4byte	0x416
 6122 2050 2C000000 		.4byte	.LLST1
 6123 2054 20       		.uleb128 0x20
 6124 2055 626700   		.ascii	"bg\000"
 6125 2058 01       		.byte	0x1
 6126 2059 3A       		.byte	0x3a
 6127 205a 4F000000 		.4byte	0x4f
 6128 205e 56000000 		.4byte	.LLST2
 6129 2062 1F       		.uleb128 0x1f
 6130 2063 E90C0000 		.4byte	.LASF476
 6131 2067 01       		.byte	0x1
 6132 2068 3A       		.byte	0x3a
 6133 2069 4F000000 		.4byte	0x4f
 6134 206d 69000000 		.4byte	.LLST3
 6135 2071 21       		.uleb128 0x21
 6136 2072 616100   		.ascii	"aa\000"
 6137 2075 01       		.byte	0x1
 6138 2076 3C       		.byte	0x3c
 6139 2077 4F000000 		.4byte	0x4f
 6140 207b 02       		.byte	0x2
 6141 207c 91       		.byte	0x91
 6142 207d 74       		.sleb128 -12
 6143 207e 21       		.uleb128 0x21
 6144 207f 636300   		.ascii	"cc\000"
 6145 2082 01       		.byte	0x1
 6146 2083 3C       		.byte	0x3c
 6147 2084 4F000000 		.4byte	0x4f
 6148 2088 02       		.byte	0x2
 6149 2089 91       		.byte	0x91
 6150 208a 70       		.sleb128 -16
 6151 208b 22       		.uleb128 0x22
 6152 208c 4A020000 		.4byte	.LASF477
 6153 2090 01       		.byte	0x1
 6154 2091 3D       		.byte	0x3d
 6155 2092 4F000000 		.4byte	0x4f
 6156 2096 89000000 		.4byte	.LLST4
 6157 209a 23       		.uleb128 0x23
 6158 209b 42050000 		.4byte	.LASF279
 6159 209f 01       		.byte	0x1
 6160 20a0 3E       		.byte	0x3e
 6161 20a1 C8000000 		.4byte	0xc8
 6162 20a5 02       		.byte	0x2
 6163 20a6 91       		.byte	0x91
 6164 20a7 48       		.sleb128 -56
 6165 20a8 23       		.uleb128 0x23
 6166 20a9 8F0A0000 		.4byte	.LASF280
ARM GAS  /tmp/ccNOn6pJ.s 			page 118


 6167 20ad 01       		.byte	0x1
 6168 20ae 3F       		.byte	0x3f
 6169 20af C8000000 		.4byte	0xc8
 6170 20b3 02       		.byte	0x2
 6171 20b4 91       		.byte	0x91
 6172 20b5 4C       		.sleb128 -52
 6173 20b6 23       		.uleb128 0x23
 6174 20b7 B1130000 		.4byte	.LASF478
 6175 20bb 01       		.byte	0x1
 6176 20bc 40       		.byte	0x40
 6177 20bd C8000000 		.4byte	0xc8
 6178 20c1 02       		.byte	0x2
 6179 20c2 91       		.byte	0x91
 6180 20c3 50       		.sleb128 -48
 6181 20c4 23       		.uleb128 0x23
 6182 20c5 BB0F0000 		.4byte	.LASF331
 6183 20c9 01       		.byte	0x1
 6184 20ca 42       		.byte	0x42
 6185 20cb D3000000 		.4byte	0xd3
 6186 20cf 02       		.byte	0x2
 6187 20d0 91       		.byte	0x91
 6188 20d1 54       		.sleb128 -44
 6189 20d2 24       		.uleb128 0x24
 6190 20d3 3A050000 		.4byte	.LASF330
 6191 20d7 01       		.byte	0x1
 6192 20d8 43       		.byte	0x43
 6193 20d9 D3000000 		.4byte	0xd3
 6194 20dd 22       		.uleb128 0x22
 6195 20de 28140000 		.4byte	.LASF358
 6196 20e2 01       		.byte	0x1
 6197 20e3 44       		.byte	0x44
 6198 20e4 D3000000 		.4byte	0xd3
 6199 20e8 9C000000 		.4byte	.LLST5
 6200 20ec 22       		.uleb128 0x22
 6201 20ed 00080000 		.4byte	.LASF359
 6202 20f1 01       		.byte	0x1
 6203 20f2 45       		.byte	0x45
 6204 20f3 D3000000 		.4byte	0xd3
 6205 20f7 AF000000 		.4byte	.LLST6
 6206 20fb 25       		.uleb128 0x25
 6207 20fc 6400     		.ascii	"d\000"
 6208 20fe 01       		.byte	0x1
 6209 20ff 46       		.byte	0x46
 6210 2100 16040000 		.4byte	0x416
 6211 2104 25       		.uleb128 0x25
 6212 2105 7000     		.ascii	"p\000"
 6213 2107 01       		.byte	0x1
 6214 2108 47       		.byte	0x47
 6215 2109 9E1C0000 		.4byte	0x1c9e
 6216 210d 21       		.uleb128 0x21
 6217 210e 64697200 		.ascii	"dir\000"
 6218 2112 01       		.byte	0x1
 6219 2113 48       		.byte	0x48
 6220 2114 4F000000 		.4byte	0x4f
 6221 2118 03       		.byte	0x3
 6222 2119 91       		.byte	0x91
 6223 211a 847F     		.sleb128 -124
ARM GAS  /tmp/ccNOn6pJ.s 			page 119


 6224 211c 26       		.uleb128 0x26
 6225 211d 797900   		.ascii	"yy\000"
 6226 2120 01       		.byte	0x1
 6227 2121 49       		.byte	0x49
 6228 2122 4F000000 		.4byte	0x4f
 6229 2126 C2000000 		.4byte	.LLST7
 6230 212a 21       		.uleb128 0x21
 6231 212b 787800   		.ascii	"xx\000"
 6232 212e 01       		.byte	0x1
 6233 212f 4A       		.byte	0x4a
 6234 2130 4F000000 		.4byte	0x4f
 6235 2134 02       		.byte	0x2
 6236 2135 91       		.byte	0x91
 6237 2136 58       		.sleb128 -40
 6238 2137 21       		.uleb128 0x21
 6239 2138 79793300 		.ascii	"yy3\000"
 6240 213c 01       		.byte	0x1
 6241 213d 4B       		.byte	0x4b
 6242 213e 4F000000 		.4byte	0x4f
 6243 2142 02       		.byte	0x2
 6244 2143 91       		.byte	0x91
 6245 2144 5C       		.sleb128 -36
 6246 2145 25       		.uleb128 0x25
 6247 2146 78783300 		.ascii	"xx3\000"
 6248 214a 01       		.byte	0x1
 6249 214b 4C       		.byte	0x4c
 6250 214c 4F000000 		.4byte	0x4f
 6251 2150 25       		.uleb128 0x25
 6252 2151 424200   		.ascii	"BB\000"
 6253 2154 01       		.byte	0x1
 6254 2155 4D       		.byte	0x4d
 6255 2156 4F000000 		.4byte	0x4f
 6256 215a 25       		.uleb128 0x25
 6257 215b 444400   		.ascii	"DD\000"
 6258 215e 01       		.byte	0x1
 6259 215f 4E       		.byte	0x4e
 6260 2160 4F000000 		.4byte	0x4f
 6261 2164 23       		.uleb128 0x23
 6262 2165 91070000 		.4byte	.LASF479
 6263 2169 01       		.byte	0x1
 6264 216a 4F       		.byte	0x4f
 6265 216b C8000000 		.4byte	0xc8
 6266 216f 03       		.byte	0x3
 6267 2170 91       		.byte	0x91
 6268 2171 F07E     		.sleb128 -144
 6269 2173 23       		.uleb128 0x23
 6270 2174 25080000 		.4byte	.LASF480
 6271 2178 01       		.byte	0x1
 6272 2179 50       		.byte	0x50
 6273 217a C8000000 		.4byte	0xc8
 6274 217e 02       		.byte	0x2
 6275 217f 91       		.byte	0x91
 6276 2180 60       		.sleb128 -32
 6277 2181 25       		.uleb128 0x25
 6278 2182 6200     		.ascii	"b\000"
 6279 2184 01       		.byte	0x1
 6280 2185 51       		.byte	0x51
ARM GAS  /tmp/ccNOn6pJ.s 			page 120


 6281 2186 A7000000 		.4byte	0xa7
 6282 218a 23       		.uleb128 0x23
 6283 218b 65180000 		.4byte	.LASF481
 6284 218f 01       		.byte	0x1
 6285 2190 52       		.byte	0x52
 6286 2191 16040000 		.4byte	0x416
 6287 2195 02       		.byte	0x2
 6288 2196 91       		.byte	0x91
 6289 2197 64       		.sleb128 -28
 6290 2198 25       		.uleb128 0x25
 6291 2199 6C00     		.ascii	"l\000"
 6292 219b 01       		.byte	0x1
 6293 219c 58       		.byte	0x58
 6294 219d A2210000 		.4byte	0x21a2
 6295 21a1 00       		.byte	0x0
 6296 21a2 06       		.uleb128 0x6
 6297 21a3 04       		.byte	0x4
 6298 21a4 1D1D0000 		.4byte	0x1d1d
 6299 21a8 1E       		.uleb128 0x1e
 6300 21a9 14230000 		.4byte	0x2314
 6301 21ad 01       		.byte	0x1
 6302 21ae D3000000 		.4byte	.LASF482
 6303 21b2 01       		.byte	0x1
 6304 21b3 D7       		.byte	0xd7
 6305 21b4 2F120000 		.4byte	.LASF483
 6306 21b8 C0030000 		.4byte	.LFB30
 6307 21bc 5C070000 		.4byte	.LFE30
 6308 21c0 E0000000 		.4byte	.LLST8
 6309 21c4 1F       		.uleb128 0x1f
 6310 21c5 A3040000 		.4byte	.LASF406
 6311 21c9 01       		.byte	0x1
 6312 21ca D7       		.byte	0xd7
 6313 21cb 16040000 		.4byte	0x416
 6314 21cf 0C010000 		.4byte	.LLST9
 6315 21d3 20       		.uleb128 0x20
 6316 21d4 626700   		.ascii	"bg\000"
 6317 21d7 01       		.byte	0x1
 6318 21d8 D7       		.byte	0xd7
 6319 21d9 4F000000 		.4byte	0x4f
 6320 21dd 41010000 		.4byte	.LLST10
 6321 21e1 1F       		.uleb128 0x1f
 6322 21e2 E90C0000 		.4byte	.LASF476
 6323 21e6 01       		.byte	0x1
 6324 21e7 D7       		.byte	0xd7
 6325 21e8 4F000000 		.4byte	0x4f
 6326 21ec 54010000 		.4byte	.LLST11
 6327 21f0 21       		.uleb128 0x21
 6328 21f1 616100   		.ascii	"aa\000"
 6329 21f4 01       		.byte	0x1
 6330 21f5 D9       		.byte	0xd9
 6331 21f6 4F000000 		.4byte	0x4f
 6332 21fa 03       		.byte	0x3
 6333 21fb 91       		.byte	0x91
 6334 21fc 807F     		.sleb128 -128
 6335 21fe 21       		.uleb128 0x21
 6336 21ff 636300   		.ascii	"cc\000"
 6337 2202 01       		.byte	0x1
ARM GAS  /tmp/ccNOn6pJ.s 			page 121


 6338 2203 D9       		.byte	0xd9
 6339 2204 4F000000 		.4byte	0x4f
 6340 2208 03       		.byte	0x3
 6341 2209 91       		.byte	0x91
 6342 220a 947F     		.sleb128 -108
 6343 220c 22       		.uleb128 0x22
 6344 220d 4A020000 		.4byte	.LASF477
 6345 2211 01       		.byte	0x1
 6346 2212 DA       		.byte	0xda
 6347 2213 4F000000 		.4byte	0x4f
 6348 2217 74010000 		.4byte	.LLST12
 6349 221b 23       		.uleb128 0x23
 6350 221c 42050000 		.4byte	.LASF279
 6351 2220 01       		.byte	0x1
 6352 2221 DB       		.byte	0xdb
 6353 2222 C8000000 		.4byte	0xc8
 6354 2226 02       		.byte	0x2
 6355 2227 91       		.byte	0x91
 6356 2228 50       		.sleb128 -48
 6357 2229 23       		.uleb128 0x23
 6358 222a 8F0A0000 		.4byte	.LASF280
 6359 222e 01       		.byte	0x1
 6360 222f DC       		.byte	0xdc
 6361 2230 C8000000 		.4byte	0xc8
 6362 2234 02       		.byte	0x2
 6363 2235 91       		.byte	0x91
 6364 2236 54       		.sleb128 -44
 6365 2237 23       		.uleb128 0x23
 6366 2238 B1130000 		.4byte	.LASF478
 6367 223c 01       		.byte	0x1
 6368 223d DD       		.byte	0xdd
 6369 223e C8000000 		.4byte	0xc8
 6370 2242 02       		.byte	0x2
 6371 2243 91       		.byte	0x91
 6372 2244 58       		.sleb128 -40
 6373 2245 24       		.uleb128 0x24
 6374 2246 BB0F0000 		.4byte	.LASF331
 6375 224a 01       		.byte	0x1
 6376 224b DF       		.byte	0xdf
 6377 224c D3000000 		.4byte	0xd3
 6378 2250 24       		.uleb128 0x24
 6379 2251 3A050000 		.4byte	.LASF330
 6380 2255 01       		.byte	0x1
 6381 2256 E0       		.byte	0xe0
 6382 2257 D3000000 		.4byte	0xd3
 6383 225b 22       		.uleb128 0x22
 6384 225c 28140000 		.4byte	.LASF358
 6385 2260 01       		.byte	0x1
 6386 2261 E1       		.byte	0xe1
 6387 2262 D3000000 		.4byte	0xd3
 6388 2266 87010000 		.4byte	.LLST13
 6389 226a 22       		.uleb128 0x22
 6390 226b 00080000 		.4byte	.LASF359
 6391 226f 01       		.byte	0x1
 6392 2270 E2       		.byte	0xe2
 6393 2271 D3000000 		.4byte	0xd3
 6394 2275 9A010000 		.4byte	.LLST14
ARM GAS  /tmp/ccNOn6pJ.s 			page 122


 6395 2279 25       		.uleb128 0x25
 6396 227a 6400     		.ascii	"d\000"
 6397 227c 01       		.byte	0x1
 6398 227d E3       		.byte	0xe3
 6399 227e 16040000 		.4byte	0x416
 6400 2282 25       		.uleb128 0x25
 6401 2283 7000     		.ascii	"p\000"
 6402 2285 01       		.byte	0x1
 6403 2286 E4       		.byte	0xe4
 6404 2287 9E1C0000 		.4byte	0x1c9e
 6405 228b 26       		.uleb128 0x26
 6406 228c 797900   		.ascii	"yy\000"
 6407 228f 01       		.byte	0x1
 6408 2290 E5       		.byte	0xe5
 6409 2291 4F000000 		.4byte	0x4f
 6410 2295 AD010000 		.4byte	.LLST15
 6411 2299 21       		.uleb128 0x21
 6412 229a 787800   		.ascii	"xx\000"
 6413 229d 01       		.byte	0x1
 6414 229e E6       		.byte	0xe6
 6415 229f 4F000000 		.4byte	0x4f
 6416 22a3 02       		.byte	0x2
 6417 22a4 91       		.byte	0x91
 6418 22a5 5C       		.sleb128 -36
 6419 22a6 25       		.uleb128 0x25
 6420 22a7 424200   		.ascii	"BB\000"
 6421 22aa 01       		.byte	0x1
 6422 22ab E7       		.byte	0xe7
 6423 22ac 4F000000 		.4byte	0x4f
 6424 22b0 25       		.uleb128 0x25
 6425 22b1 444400   		.ascii	"DD\000"
 6426 22b4 01       		.byte	0x1
 6427 22b5 E8       		.byte	0xe8
 6428 22b6 4F000000 		.4byte	0x4f
 6429 22ba 23       		.uleb128 0x23
 6430 22bb 91070000 		.4byte	.LASF479
 6431 22bf 01       		.byte	0x1
 6432 22c0 E9       		.byte	0xe9
 6433 22c1 C8000000 		.4byte	0xc8
 6434 22c5 03       		.byte	0x3
 6435 22c6 91       		.byte	0x91
 6436 22c7 FC7E     		.sleb128 -132
 6437 22c9 23       		.uleb128 0x23
 6438 22ca 25080000 		.4byte	.LASF480
 6439 22ce 01       		.byte	0x1
 6440 22cf EA       		.byte	0xea
 6441 22d0 C8000000 		.4byte	0xc8
 6442 22d4 02       		.byte	0x2
 6443 22d5 91       		.byte	0x91
 6444 22d6 60       		.sleb128 -32
 6445 22d7 25       		.uleb128 0x25
 6446 22d8 6200     		.ascii	"b\000"
 6447 22da 01       		.byte	0x1
 6448 22db EB       		.byte	0xeb
 6449 22dc A7000000 		.4byte	0xa7
 6450 22e0 23       		.uleb128 0x23
 6451 22e1 F1050000 		.4byte	.LASF484
ARM GAS  /tmp/ccNOn6pJ.s 			page 123


 6452 22e5 01       		.byte	0x1
 6453 22e6 EC       		.byte	0xec
 6454 22e7 C8000000 		.4byte	0xc8
 6455 22eb 02       		.byte	0x2
 6456 22ec 91       		.byte	0x91
 6457 22ed 74       		.sleb128 -12
 6458 22ee 23       		.uleb128 0x23
 6459 22ef E5050000 		.4byte	.LASF485
 6460 22f3 01       		.byte	0x1
 6461 22f4 ED       		.byte	0xed
 6462 22f5 C8000000 		.4byte	0xc8
 6463 22f9 02       		.byte	0x2
 6464 22fa 91       		.byte	0x91
 6465 22fb 70       		.sleb128 -16
 6466 22fc 23       		.uleb128 0x23
 6467 22fd 65180000 		.4byte	.LASF481
 6468 2301 01       		.byte	0x1
 6469 2302 F1       		.byte	0xf1
 6470 2303 16040000 		.4byte	0x416
 6471 2307 02       		.byte	0x2
 6472 2308 91       		.byte	0x91
 6473 2309 64       		.sleb128 -28
 6474 230a 25       		.uleb128 0x25
 6475 230b 6C00     		.ascii	"l\000"
 6476 230d 01       		.byte	0x1
 6477 230e F8       		.byte	0xf8
 6478 230f A2210000 		.4byte	0x21a2
 6479 2313 00       		.byte	0x0
 6480 2314 27       		.uleb128 0x27
 6481 2315 74240000 		.4byte	0x2474
 6482 2319 01       		.byte	0x1
 6483 231a 6F000000 		.4byte	.LASF486
 6484 231e 01       		.byte	0x1
 6485 231f 6001     		.2byte	0x160
 6486 2321 6B140000 		.4byte	.LASF510
 6487 2325 60070000 		.4byte	.LFB31
 6488 2329 8C0A0000 		.4byte	.LFE31
 6489 232d CB010000 		.4byte	.LLST16
 6490 2331 28       		.uleb128 0x28
 6491 2332 A3040000 		.4byte	.LASF406
 6492 2336 01       		.byte	0x1
 6493 2337 6001     		.2byte	0x160
 6494 2339 16040000 		.4byte	0x416
 6495 233d F7010000 		.4byte	.LLST17
 6496 2341 29       		.uleb128 0x29
 6497 2342 626700   		.ascii	"bg\000"
 6498 2345 01       		.byte	0x1
 6499 2346 6001     		.2byte	0x160
 6500 2348 4F000000 		.4byte	0x4f
 6501 234c 16020000 		.4byte	.LLST18
 6502 2350 28       		.uleb128 0x28
 6503 2351 E90C0000 		.4byte	.LASF476
 6504 2355 01       		.byte	0x1
 6505 2356 6001     		.2byte	0x160
 6506 2358 4F000000 		.4byte	0x4f
 6507 235c 29020000 		.4byte	.LLST19
 6508 2360 2A       		.uleb128 0x2a
ARM GAS  /tmp/ccNOn6pJ.s 			page 124


 6509 2361 616100   		.ascii	"aa\000"
 6510 2364 01       		.byte	0x1
 6511 2365 6201     		.2byte	0x162
 6512 2367 4F000000 		.4byte	0x4f
 6513 236b 03       		.byte	0x3
 6514 236c 91       		.byte	0x91
 6515 236d 847F     		.sleb128 -124
 6516 236f 2A       		.uleb128 0x2a
 6517 2370 636300   		.ascii	"cc\000"
 6518 2373 01       		.byte	0x1
 6519 2374 6201     		.2byte	0x162
 6520 2376 4F000000 		.4byte	0x4f
 6521 237a 03       		.byte	0x3
 6522 237b 91       		.byte	0x91
 6523 237c 987F     		.sleb128 -104
 6524 237e 2B       		.uleb128 0x2b
 6525 237f 4A020000 		.4byte	.LASF477
 6526 2383 01       		.byte	0x1
 6527 2384 6301     		.2byte	0x163
 6528 2386 4F000000 		.4byte	0x4f
 6529 238a 49020000 		.4byte	.LLST20
 6530 238e 2C       		.uleb128 0x2c
 6531 238f 42050000 		.4byte	.LASF279
 6532 2393 01       		.byte	0x1
 6533 2394 6401     		.2byte	0x164
 6534 2396 C8000000 		.4byte	0xc8
 6535 239a 02       		.byte	0x2
 6536 239b 91       		.byte	0x91
 6537 239c 54       		.sleb128 -44
 6538 239d 2C       		.uleb128 0x2c
 6539 239e 8F0A0000 		.4byte	.LASF280
 6540 23a2 01       		.byte	0x1
 6541 23a3 6501     		.2byte	0x165
 6542 23a5 C8000000 		.4byte	0xc8
 6543 23a9 02       		.byte	0x2
 6544 23aa 91       		.byte	0x91
 6545 23ab 58       		.sleb128 -40
 6546 23ac 2B       		.uleb128 0x2b
 6547 23ad B1130000 		.4byte	.LASF478
 6548 23b1 01       		.byte	0x1
 6549 23b2 6601     		.2byte	0x166
 6550 23b4 C8000000 		.4byte	0xc8
 6551 23b8 5C020000 		.4byte	.LLST21
 6552 23bc 2D       		.uleb128 0x2d
 6553 23bd BB0F0000 		.4byte	.LASF331
 6554 23c1 01       		.byte	0x1
 6555 23c2 6801     		.2byte	0x168
 6556 23c4 D3000000 		.4byte	0xd3
 6557 23c8 2D       		.uleb128 0x2d
 6558 23c9 3A050000 		.4byte	.LASF330
 6559 23cd 01       		.byte	0x1
 6560 23ce 6901     		.2byte	0x169
 6561 23d0 D3000000 		.4byte	0xd3
 6562 23d4 2B       		.uleb128 0x2b
 6563 23d5 28140000 		.4byte	.LASF358
 6564 23d9 01       		.byte	0x1
 6565 23da 6A01     		.2byte	0x16a
ARM GAS  /tmp/ccNOn6pJ.s 			page 125


 6566 23dc D3000000 		.4byte	0xd3
 6567 23e0 7C020000 		.4byte	.LLST22
 6568 23e4 2B       		.uleb128 0x2b
 6569 23e5 00080000 		.4byte	.LASF359
 6570 23e9 01       		.byte	0x1
 6571 23ea 6B01     		.2byte	0x16b
 6572 23ec D3000000 		.4byte	0xd3
 6573 23f0 8F020000 		.4byte	.LLST23
 6574 23f4 2E       		.uleb128 0x2e
 6575 23f5 7000     		.ascii	"p\000"
 6576 23f7 01       		.byte	0x1
 6577 23f8 6C01     		.2byte	0x16c
 6578 23fa 9E1C0000 		.4byte	0x1c9e
 6579 23fe 2E       		.uleb128 0x2e
 6580 23ff 6400     		.ascii	"d\000"
 6581 2401 01       		.byte	0x1
 6582 2402 6D01     		.2byte	0x16d
 6583 2404 16040000 		.4byte	0x416
 6584 2408 2F       		.uleb128 0x2f
 6585 2409 797900   		.ascii	"yy\000"
 6586 240c 01       		.byte	0x1
 6587 240d 6E01     		.2byte	0x16e
 6588 240f 4F000000 		.4byte	0x4f
 6589 2413 A2020000 		.4byte	.LLST24
 6590 2417 2A       		.uleb128 0x2a
 6591 2418 787800   		.ascii	"xx\000"
 6592 241b 01       		.byte	0x1
 6593 241c 6F01     		.2byte	0x16f
 6594 241e 4F000000 		.4byte	0x4f
 6595 2422 02       		.byte	0x2
 6596 2423 91       		.byte	0x91
 6597 2424 60       		.sleb128 -32
 6598 2425 2E       		.uleb128 0x2e
 6599 2426 424200   		.ascii	"BB\000"
 6600 2429 01       		.byte	0x1
 6601 242a 7001     		.2byte	0x170
 6602 242c 4F000000 		.4byte	0x4f
 6603 2430 2E       		.uleb128 0x2e
 6604 2431 444400   		.ascii	"DD\000"
 6605 2434 01       		.byte	0x1
 6606 2435 7101     		.2byte	0x171
 6607 2437 4F000000 		.4byte	0x4f
 6608 243b 2C       		.uleb128 0x2c
 6609 243c 91070000 		.4byte	.LASF479
 6610 2440 01       		.byte	0x1
 6611 2441 7201     		.2byte	0x172
 6612 2443 C8000000 		.4byte	0xc8
 6613 2447 03       		.byte	0x3
 6614 2448 91       		.byte	0x91
 6615 2449 807F     		.sleb128 -128
 6616 244b 2C       		.uleb128 0x2c
 6617 244c 25080000 		.4byte	.LASF480
 6618 2450 01       		.byte	0x1
 6619 2451 7301     		.2byte	0x173
 6620 2453 C8000000 		.4byte	0xc8
 6621 2457 02       		.byte	0x2
 6622 2458 91       		.byte	0x91
ARM GAS  /tmp/ccNOn6pJ.s 			page 126


 6623 2459 64       		.sleb128 -28
 6624 245a 2E       		.uleb128 0x2e
 6625 245b 6C00     		.ascii	"l\000"
 6626 245d 01       		.byte	0x1
 6627 245e 7401     		.2byte	0x174
 6628 2460 A2210000 		.4byte	0x21a2
 6629 2464 2C       		.uleb128 0x2c
 6630 2465 65180000 		.4byte	.LASF481
 6631 2469 01       		.byte	0x1
 6632 246a 7501     		.2byte	0x175
 6633 246c 16040000 		.4byte	0x416
 6634 2470 02       		.byte	0x2
 6635 2471 91       		.byte	0x91
 6636 2472 68       		.sleb128 -24
 6637 2473 00       		.byte	0x0
 6638 2474 1E       		.uleb128 0x1e
 6639 2475 BD240000 		.4byte	0x24bd
 6640 2479 01       		.byte	0x1
 6641 247a 5F070000 		.4byte	.LASF487
 6642 247e 01       		.byte	0x1
 6643 247f 21       		.byte	0x21
 6644 2480 F9060000 		.4byte	.LASF488
 6645 2484 A00A0000 		.4byte	.LFB28
 6646 2488 4C0B0000 		.4byte	.LFE28
 6647 248c CB020000 		.4byte	.LLST25
 6648 2490 1F       		.uleb128 0x1f
 6649 2491 A3040000 		.4byte	.LASF406
 6650 2495 01       		.byte	0x1
 6651 2496 21       		.byte	0x21
 6652 2497 16040000 		.4byte	0x416
 6653 249b EA020000 		.4byte	.LLST26
 6654 249f 20       		.uleb128 0x20
 6655 24a0 626700   		.ascii	"bg\000"
 6656 24a3 01       		.byte	0x1
 6657 24a4 21       		.byte	0x21
 6658 24a5 4F000000 		.4byte	0x4f
 6659 24a9 08030000 		.4byte	.LLST27
 6660 24ad 1F       		.uleb128 0x1f
 6661 24ae E90C0000 		.4byte	.LASF476
 6662 24b2 01       		.byte	0x1
 6663 24b3 21       		.byte	0x21
 6664 24b4 4F000000 		.4byte	0x4f
 6665 24b8 26030000 		.4byte	.LLST28
 6666 24bc 00       		.byte	0x0
 6667 24bd 30       		.uleb128 0x30
 6668 24be C3250000 		.4byte	0x25c3
 6669 24c2 3A3A00   		.ascii	"::\000"
 6670 24c5 04       		.byte	0x4
 6671 24c6 00       		.byte	0x0
 6672 24c7 31       		.uleb128 0x31
 6673 24c8 B0020000 		.4byte	.LASF489
 6674 24cc 05       		.byte	0x5
 6675 24cd A001     		.2byte	0x1a0
 6676 24cf 37040000 		.4byte	0x437
 6677 24d3 01       		.byte	0x1
 6678 24d4 01       		.byte	0x1
 6679 24d5 32       		.uleb128 0x32
ARM GAS  /tmp/ccNOn6pJ.s 			page 127


 6680 24d6 43505500 		.ascii	"CPU\000"
 6681 24da 05       		.byte	0x5
 6682 24db A101     		.2byte	0x1a1
 6683 24dd A9010000 		.4byte	0x1a9
 6684 24e1 01       		.byte	0x1
 6685 24e2 01       		.byte	0x1
 6686 24e3 33       		.uleb128 0x33
 6687 24e4 58160000 		.4byte	.LASF490
 6688 24e8 07       		.byte	0x7
 6689 24e9 B9       		.byte	0xb9
 6690 24ea 9F0A0000 		.4byte	0xa9f
 6691 24ee 01       		.byte	0x1
 6692 24ef 01       		.byte	0x1
 6693 24f0 33       		.uleb128 0x33
 6694 24f1 10170000 		.4byte	.LASF491
 6695 24f5 08       		.byte	0x8
 6696 24f6 83       		.byte	0x83
 6697 24f7 EC250000 		.4byte	0x25ec
 6698 24fb 01       		.byte	0x1
 6699 24fc 01       		.byte	0x1
 6700 24fd 33       		.uleb128 0x33
 6701 24fe FA0C0000 		.4byte	.LASF492
 6702 2502 08       		.byte	0x8
 6703 2503 84       		.byte	0x84
 6704 2504 25000000 		.4byte	0x25
 6705 2508 01       		.byte	0x1
 6706 2509 01       		.byte	0x1
 6707 250a 33       		.uleb128 0x33
 6708 250b 56110000 		.4byte	.LASF493
 6709 250f 09       		.byte	0x9
 6710 2510 31       		.byte	0x31
 6711 2511 A7000000 		.4byte	0xa7
 6712 2515 01       		.byte	0x1
 6713 2516 01       		.byte	0x1
 6714 2517 33       		.uleb128 0x33
 6715 2518 EF110000 		.4byte	.LASF494
 6716 251c 09       		.byte	0x9
 6717 251d 32       		.byte	0x32
 6718 251e 24260000 		.4byte	0x2624
 6719 2522 01       		.byte	0x1
 6720 2523 01       		.byte	0x1
 6721 2524 32       		.uleb128 0x32
 6722 2525 50505500 		.ascii	"PPU\000"
 6723 2529 09       		.byte	0x9
 6724 252a 0901     		.2byte	0x109
 6725 252c F1140000 		.4byte	0x14f1
 6726 2530 01       		.byte	0x1
 6727 2531 01       		.byte	0x1
 6728 2532 31       		.uleb128 0x31
 6729 2533 AD110000 		.4byte	.LASF495
 6730 2537 09       		.byte	0x9
 6731 2538 0B01     		.2byte	0x10b
 6732 253a 2E120000 		.4byte	0x122e
 6733 253e 01       		.byte	0x1
 6734 253f 01       		.byte	0x1
 6735 2540 33       		.uleb128 0x33
 6736 2541 4F130000 		.4byte	.LASF496
ARM GAS  /tmp/ccNOn6pJ.s 			page 128


 6737 2545 03       		.byte	0x3
 6738 2546 94       		.byte	0x94
 6739 2547 5D260000 		.4byte	0x265d
 6740 254b 01       		.byte	0x1
 6741 254c 01       		.byte	0x1
 6742 254d 34       		.uleb128 0x34
 6743 254e 47465800 		.ascii	"GFX\000"
 6744 2552 03       		.byte	0x3
 6745 2553 FF       		.byte	0xff
 6746 2554 801A0000 		.4byte	0x1a80
 6747 2558 01       		.byte	0x1
 6748 2559 01       		.byte	0x1
 6749 255a 33       		.uleb128 0x33
 6750 255b AF160000 		.4byte	.LASF497
 6751 255f 0A       		.byte	0xa
 6752 2560 52       		.byte	0x52
 6753 2561 8D260000 		.4byte	0x268d
 6754 2565 01       		.byte	0x1
 6755 2566 01       		.byte	0x1
 6756 2567 33       		.uleb128 0x33
 6757 2568 A0160000 		.4byte	.LASF498
 6758 256c 0A       		.byte	0xa
 6759 256d 53       		.byte	0x53
 6760 256e 8D260000 		.4byte	0x268d
 6761 2572 01       		.byte	0x1
 6762 2573 01       		.byte	0x1
 6763 2574 33       		.uleb128 0x33
 6764 2575 F00A0000 		.4byte	.LASF499
 6765 2579 0A       		.byte	0xa
 6766 257a 54       		.byte	0x54
 6767 257b 8D260000 		.4byte	0x268d
 6768 257f 01       		.byte	0x1
 6769 2580 01       		.byte	0x1
 6770 2581 33       		.uleb128 0x33
 6771 2582 05130000 		.4byte	.LASF500
 6772 2586 0A       		.byte	0xa
 6773 2587 55       		.byte	0x55
 6774 2588 8D260000 		.4byte	0x268d
 6775 258c 01       		.byte	0x1
 6776 258d 01       		.byte	0x1
 6777 258e 33       		.uleb128 0x33
 6778 258f 85040000 		.4byte	.LASF501
 6779 2593 0A       		.byte	0xa
 6780 2594 5F       		.byte	0x5f
 6781 2595 A01D0000 		.4byte	0x1da0
 6782 2599 01       		.byte	0x1
 6783 259a 01       		.byte	0x1
 6784 259b 33       		.uleb128 0x33
 6785 259c B60F0000 		.4byte	.LASF502
 6786 25a0 0B       		.byte	0xb
 6787 25a1 68       		.byte	0x68
 6788 25a2 AA1E0000 		.4byte	0x1eaa
 6789 25a6 01       		.byte	0x1
 6790 25a7 01       		.byte	0x1
 6791 25a8 33       		.uleb128 0x33
 6792 25a9 520F0000 		.4byte	.LASF503
 6793 25ad 01       		.byte	0x1
ARM GAS  /tmp/ccNOn6pJ.s 			page 129


 6794 25ae 09       		.byte	0x9
 6795 25af EB260000 		.4byte	0x26eb
 6796 25b3 01       		.byte	0x1
 6797 25b4 01       		.byte	0x1
 6798 25b5 33       		.uleb128 0x33
 6799 25b6 8C110000 		.4byte	.LASF504
 6800 25ba 01       		.byte	0x1
 6801 25bb 0A       		.byte	0xa
 6802 25bc 08270000 		.4byte	0x2708
 6803 25c0 01       		.byte	0x1
 6804 25c1 01       		.byte	0x1
 6805 25c2 00       		.byte	0x0
 6806 25c3 31       		.uleb128 0x31
 6807 25c4 B0020000 		.4byte	.LASF489
 6808 25c8 05       		.byte	0x5
 6809 25c9 A001     		.2byte	0x1a0
 6810 25cb 37040000 		.4byte	0x437
 6811 25cf 01       		.byte	0x1
 6812 25d0 01       		.byte	0x1
 6813 25d1 32       		.uleb128 0x32
 6814 25d2 43505500 		.ascii	"CPU\000"
 6815 25d6 05       		.byte	0x5
 6816 25d7 A101     		.2byte	0x1a1
 6817 25d9 A9010000 		.4byte	0x1a9
 6818 25dd 01       		.byte	0x1
 6819 25de 01       		.byte	0x1
 6820 25df 33       		.uleb128 0x33
 6821 25e0 58160000 		.4byte	.LASF490
 6822 25e4 07       		.byte	0x7
 6823 25e5 B9       		.byte	0xb9
 6824 25e6 9F0A0000 		.4byte	0xa9f
 6825 25ea 01       		.byte	0x1
 6826 25eb 01       		.byte	0x1
 6827 25ec 04       		.uleb128 0x4
 6828 25ed FD250000 		.4byte	0x25fd
 6829 25f1 98110000 		.4byte	0x1198
 6830 25f5 19       		.uleb128 0x19
 6831 25f6 7B000000 		.4byte	0x7b
 6832 25fa FFFF     		.2byte	0xffff
 6833 25fc 00       		.byte	0x0
 6834 25fd 33       		.uleb128 0x33
 6835 25fe 10170000 		.4byte	.LASF491
 6836 2602 08       		.byte	0x8
 6837 2603 83       		.byte	0x83
 6838 2604 EC250000 		.4byte	0x25ec
 6839 2608 01       		.byte	0x1
 6840 2609 01       		.byte	0x1
 6841 260a 33       		.uleb128 0x33
 6842 260b FA0C0000 		.4byte	.LASF492
 6843 260f 08       		.byte	0x8
 6844 2610 84       		.byte	0x84
 6845 2611 25000000 		.4byte	0x25
 6846 2615 01       		.byte	0x1
 6847 2616 01       		.byte	0x1
 6848 2617 33       		.uleb128 0x33
 6849 2618 56110000 		.4byte	.LASF493
 6850 261c 09       		.byte	0x9
ARM GAS  /tmp/ccNOn6pJ.s 			page 130


 6851 261d 31       		.byte	0x31
 6852 261e A7000000 		.4byte	0xa7
 6853 2622 01       		.byte	0x1
 6854 2623 01       		.byte	0x1
 6855 2624 04       		.uleb128 0x4
 6856 2625 34260000 		.4byte	0x2634
 6857 2629 B2000000 		.4byte	0xb2
 6858 262d 05       		.uleb128 0x5
 6859 262e 7B000000 		.4byte	0x7b
 6860 2632 01       		.byte	0x1
 6861 2633 00       		.byte	0x0
 6862 2634 33       		.uleb128 0x33
 6863 2635 EF110000 		.4byte	.LASF494
 6864 2639 09       		.byte	0x9
 6865 263a 32       		.byte	0x32
 6866 263b 24260000 		.4byte	0x2624
 6867 263f 01       		.byte	0x1
 6868 2640 01       		.byte	0x1
 6869 2641 32       		.uleb128 0x32
 6870 2642 50505500 		.ascii	"PPU\000"
 6871 2646 09       		.byte	0x9
 6872 2647 0901     		.2byte	0x109
 6873 2649 F1140000 		.4byte	0x14f1
 6874 264d 01       		.byte	0x1
 6875 264e 01       		.byte	0x1
 6876 264f 31       		.uleb128 0x31
 6877 2650 AD110000 		.4byte	.LASF495
 6878 2654 09       		.byte	0x9
 6879 2655 0B01     		.2byte	0x10b
 6880 2657 2E120000 		.4byte	0x122e
 6881 265b 01       		.byte	0x1
 6882 265c 01       		.byte	0x1
 6883 265d 04       		.uleb128 0x4
 6884 265e 73260000 		.4byte	0x2673
 6885 2662 C8000000 		.4byte	0xc8
 6886 2666 05       		.uleb128 0x5
 6887 2667 7B000000 		.4byte	0x7b
 6888 266b 07       		.byte	0x7
 6889 266c 05       		.uleb128 0x5
 6890 266d 7B000000 		.4byte	0x7b
 6891 2671 FF       		.byte	0xff
 6892 2672 00       		.byte	0x0
 6893 2673 33       		.uleb128 0x33
 6894 2674 4F130000 		.4byte	.LASF496
 6895 2678 03       		.byte	0x3
 6896 2679 94       		.byte	0x94
 6897 267a 5D260000 		.4byte	0x265d
 6898 267e 01       		.byte	0x1
 6899 267f 01       		.byte	0x1
 6900 2680 34       		.uleb128 0x34
 6901 2681 47465800 		.ascii	"GFX\000"
 6902 2685 03       		.byte	0x3
 6903 2686 FF       		.byte	0xff
 6904 2687 801A0000 		.4byte	0x1a80
 6905 268b 01       		.byte	0x1
 6906 268c 01       		.byte	0x1
 6907 268d 04       		.uleb128 0x4
ARM GAS  /tmp/ccNOn6pJ.s 			page 131


 6908 268e 9D260000 		.4byte	0x269d
 6909 2692 7E1D0000 		.4byte	0x1d7e
 6910 2696 05       		.uleb128 0x5
 6911 2697 7B000000 		.4byte	0x7b
 6912 269b FF       		.byte	0xff
 6913 269c 00       		.byte	0x0
 6914 269d 33       		.uleb128 0x33
 6915 269e AF160000 		.4byte	.LASF497
 6916 26a2 0A       		.byte	0xa
 6917 26a3 52       		.byte	0x52
 6918 26a4 8D260000 		.4byte	0x268d
 6919 26a8 01       		.byte	0x1
 6920 26a9 01       		.byte	0x1
 6921 26aa 33       		.uleb128 0x33
 6922 26ab A0160000 		.4byte	.LASF498
 6923 26af 0A       		.byte	0xa
 6924 26b0 53       		.byte	0x53
 6925 26b1 8D260000 		.4byte	0x268d
 6926 26b5 01       		.byte	0x1
 6927 26b6 01       		.byte	0x1
 6928 26b7 33       		.uleb128 0x33
 6929 26b8 F00A0000 		.4byte	.LASF499
 6930 26bc 0A       		.byte	0xa
 6931 26bd 54       		.byte	0x54
 6932 26be 8D260000 		.4byte	0x268d
 6933 26c2 01       		.byte	0x1
 6934 26c3 01       		.byte	0x1
 6935 26c4 33       		.uleb128 0x33
 6936 26c5 05130000 		.4byte	.LASF500
 6937 26c9 0A       		.byte	0xa
 6938 26ca 55       		.byte	0x55
 6939 26cb 8D260000 		.4byte	0x268d
 6940 26cf 01       		.byte	0x1
 6941 26d0 01       		.byte	0x1
 6942 26d1 33       		.uleb128 0x33
 6943 26d2 85040000 		.4byte	.LASF501
 6944 26d6 0A       		.byte	0xa
 6945 26d7 5F       		.byte	0x5f
 6946 26d8 A01D0000 		.4byte	0x1da0
 6947 26dc 01       		.byte	0x1
 6948 26dd 01       		.byte	0x1
 6949 26de 33       		.uleb128 0x33
 6950 26df B60F0000 		.4byte	.LASF502
 6951 26e3 0B       		.byte	0xb
 6952 26e4 68       		.byte	0x68
 6953 26e5 AA1E0000 		.4byte	0x1eaa
 6954 26e9 01       		.byte	0x1
 6955 26ea 01       		.byte	0x1
 6956 26eb 04       		.uleb128 0x4
 6957 26ec FB260000 		.4byte	0x26fb
 6958 26f0 CA1C0000 		.4byte	0x1cca
 6959 26f4 05       		.uleb128 0x5
 6960 26f5 7B000000 		.4byte	0x7b
 6961 26f9 EF       		.byte	0xef
 6962 26fa 00       		.byte	0x0
 6963 26fb 33       		.uleb128 0x33
 6964 26fc 520F0000 		.4byte	.LASF503
ARM GAS  /tmp/ccNOn6pJ.s 			page 132


 6965 2700 01       		.byte	0x1
 6966 2701 09       		.byte	0x9
 6967 2702 EB260000 		.4byte	0x26eb
 6968 2706 01       		.byte	0x1
 6969 2707 01       		.byte	0x1
 6970 2708 04       		.uleb128 0x4
 6971 2709 18270000 		.4byte	0x2718
 6972 270d 1D1D0000 		.4byte	0x1d1d
 6973 2711 05       		.uleb128 0x5
 6974 2712 7B000000 		.4byte	0x7b
 6975 2716 EF       		.byte	0xef
 6976 2717 00       		.byte	0x0
 6977 2718 33       		.uleb128 0x33
 6978 2719 8C110000 		.4byte	.LASF504
 6979 271d 01       		.byte	0x1
 6980 271e 0A       		.byte	0xa
 6981 271f 08270000 		.4byte	0x2708
 6982 2723 01       		.byte	0x1
 6983 2724 01       		.byte	0x1
 6984 2725 00       		.byte	0x0
 6985              		.section	.debug_abbrev
 6986 0000 01       		.uleb128 0x1
 6987 0001 11       		.uleb128 0x11
 6988 0002 01       		.byte	0x1
 6989 0003 10       		.uleb128 0x10
 6990 0004 06       		.uleb128 0x6
 6991 0005 12       		.uleb128 0x12
 6992 0006 01       		.uleb128 0x1
 6993 0007 11       		.uleb128 0x11
 6994 0008 01       		.uleb128 0x1
 6995 0009 25       		.uleb128 0x25
 6996 000a 0E       		.uleb128 0xe
 6997 000b 13       		.uleb128 0x13
 6998 000c 0B       		.uleb128 0xb
 6999 000d 03       		.uleb128 0x3
 7000 000e 0E       		.uleb128 0xe
 7001 000f 1B       		.uleb128 0x1b
 7002 0010 0E       		.uleb128 0xe
 7003 0011 00       		.byte	0x0
 7004 0012 00       		.byte	0x0
 7005 0013 02       		.uleb128 0x2
 7006 0014 24       		.uleb128 0x24
 7007 0015 00       		.byte	0x0
 7008 0016 03       		.uleb128 0x3
 7009 0017 0E       		.uleb128 0xe
 7010 0018 0B       		.uleb128 0xb
 7011 0019 0B       		.uleb128 0xb
 7012 001a 3E       		.uleb128 0x3e
 7013 001b 0B       		.uleb128 0xb
 7014 001c 00       		.byte	0x0
 7015 001d 00       		.byte	0x0
 7016 001e 03       		.uleb128 0x3
 7017 001f 24       		.uleb128 0x24
 7018 0020 00       		.byte	0x0
 7019 0021 03       		.uleb128 0x3
 7020 0022 08       		.uleb128 0x8
 7021 0023 0B       		.uleb128 0xb
ARM GAS  /tmp/ccNOn6pJ.s 			page 133


 7022 0024 0B       		.uleb128 0xb
 7023 0025 3E       		.uleb128 0x3e
 7024 0026 0B       		.uleb128 0xb
 7025 0027 00       		.byte	0x0
 7026 0028 00       		.byte	0x0
 7027 0029 04       		.uleb128 0x4
 7028 002a 01       		.uleb128 0x1
 7029 002b 01       		.byte	0x1
 7030 002c 01       		.uleb128 0x1
 7031 002d 13       		.uleb128 0x13
 7032 002e 49       		.uleb128 0x49
 7033 002f 13       		.uleb128 0x13
 7034 0030 00       		.byte	0x0
 7035 0031 00       		.byte	0x0
 7036 0032 05       		.uleb128 0x5
 7037 0033 21       		.uleb128 0x21
 7038 0034 00       		.byte	0x0
 7039 0035 49       		.uleb128 0x49
 7040 0036 13       		.uleb128 0x13
 7041 0037 2F       		.uleb128 0x2f
 7042 0038 0B       		.uleb128 0xb
 7043 0039 00       		.byte	0x0
 7044 003a 00       		.byte	0x0
 7045 003b 06       		.uleb128 0x6
 7046 003c 0F       		.uleb128 0xf
 7047 003d 00       		.byte	0x0
 7048 003e 0B       		.uleb128 0xb
 7049 003f 0B       		.uleb128 0xb
 7050 0040 49       		.uleb128 0x49
 7051 0041 13       		.uleb128 0x13
 7052 0042 00       		.byte	0x0
 7053 0043 00       		.byte	0x0
 7054 0044 07       		.uleb128 0x7
 7055 0045 0F       		.uleb128 0xf
 7056 0046 00       		.byte	0x0
 7057 0047 0B       		.uleb128 0xb
 7058 0048 0B       		.uleb128 0xb
 7059 0049 00       		.byte	0x0
 7060 004a 00       		.byte	0x0
 7061 004b 08       		.uleb128 0x8
 7062 004c 26       		.uleb128 0x26
 7063 004d 00       		.byte	0x0
 7064 004e 49       		.uleb128 0x49
 7065 004f 13       		.uleb128 0x13
 7066 0050 00       		.byte	0x0
 7067 0051 00       		.byte	0x0
 7068 0052 09       		.uleb128 0x9
 7069 0053 16       		.uleb128 0x16
 7070 0054 00       		.byte	0x0
 7071 0055 03       		.uleb128 0x3
 7072 0056 0E       		.uleb128 0xe
 7073 0057 3A       		.uleb128 0x3a
 7074 0058 0B       		.uleb128 0xb
 7075 0059 3B       		.uleb128 0x3b
 7076 005a 0B       		.uleb128 0xb
 7077 005b 49       		.uleb128 0x49
 7078 005c 13       		.uleb128 0x13
ARM GAS  /tmp/ccNOn6pJ.s 			page 134


 7079 005d 00       		.byte	0x0
 7080 005e 00       		.byte	0x0
 7081 005f 0A       		.uleb128 0xa
 7082 0060 17       		.uleb128 0x17
 7083 0061 01       		.byte	0x1
 7084 0062 01       		.uleb128 0x1
 7085 0063 13       		.uleb128 0x13
 7086 0064 03       		.uleb128 0x3
 7087 0065 0E       		.uleb128 0xe
 7088 0066 0B       		.uleb128 0xb
 7089 0067 0B       		.uleb128 0xb
 7090 0068 3A       		.uleb128 0x3a
 7091 0069 0B       		.uleb128 0xb
 7092 006a 3B       		.uleb128 0x3b
 7093 006b 0B       		.uleb128 0xb
 7094 006c 00       		.byte	0x0
 7095 006d 00       		.byte	0x0
 7096 006e 0B       		.uleb128 0xb
 7097 006f 13       		.uleb128 0x13
 7098 0070 01       		.byte	0x1
 7099 0071 01       		.uleb128 0x1
 7100 0072 13       		.uleb128 0x13
 7101 0073 03       		.uleb128 0x3
 7102 0074 0E       		.uleb128 0xe
 7103 0075 0B       		.uleb128 0xb
 7104 0076 0B       		.uleb128 0xb
 7105 0077 3A       		.uleb128 0x3a
 7106 0078 0B       		.uleb128 0xb
 7107 0079 3B       		.uleb128 0x3b
 7108 007a 0B       		.uleb128 0xb
 7109 007b 00       		.byte	0x0
 7110 007c 00       		.byte	0x0
 7111 007d 0C       		.uleb128 0xc
 7112 007e 0D       		.uleb128 0xd
 7113 007f 00       		.byte	0x0
 7114 0080 03       		.uleb128 0x3
 7115 0081 08       		.uleb128 0x8
 7116 0082 3A       		.uleb128 0x3a
 7117 0083 0B       		.uleb128 0xb
 7118 0084 3B       		.uleb128 0x3b
 7119 0085 0B       		.uleb128 0xb
 7120 0086 49       		.uleb128 0x49
 7121 0087 13       		.uleb128 0x13
 7122 0088 38       		.uleb128 0x38
 7123 0089 0A       		.uleb128 0xa
 7124 008a 00       		.byte	0x0
 7125 008b 00       		.byte	0x0
 7126 008c 0D       		.uleb128 0xd
 7127 008d 0D       		.uleb128 0xd
 7128 008e 00       		.byte	0x0
 7129 008f 03       		.uleb128 0x3
 7130 0090 08       		.uleb128 0x8
 7131 0091 3A       		.uleb128 0x3a
 7132 0092 0B       		.uleb128 0xb
 7133 0093 3B       		.uleb128 0x3b
 7134 0094 0B       		.uleb128 0xb
 7135 0095 49       		.uleb128 0x49
ARM GAS  /tmp/ccNOn6pJ.s 			page 135


 7136 0096 13       		.uleb128 0x13
 7137 0097 00       		.byte	0x0
 7138 0098 00       		.byte	0x0
 7139 0099 0E       		.uleb128 0xe
 7140 009a 0D       		.uleb128 0xd
 7141 009b 00       		.byte	0x0
 7142 009c 03       		.uleb128 0x3
 7143 009d 0E       		.uleb128 0xe
 7144 009e 3A       		.uleb128 0x3a
 7145 009f 0B       		.uleb128 0xb
 7146 00a0 3B       		.uleb128 0x3b
 7147 00a1 0B       		.uleb128 0xb
 7148 00a2 49       		.uleb128 0x49
 7149 00a3 13       		.uleb128 0x13
 7150 00a4 38       		.uleb128 0x38
 7151 00a5 0A       		.uleb128 0xa
 7152 00a6 00       		.byte	0x0
 7153 00a7 00       		.byte	0x0
 7154 00a8 0F       		.uleb128 0xf
 7155 00a9 35       		.uleb128 0x35
 7156 00aa 00       		.byte	0x0
 7157 00ab 49       		.uleb128 0x49
 7158 00ac 13       		.uleb128 0x13
 7159 00ad 00       		.byte	0x0
 7160 00ae 00       		.byte	0x0
 7161 00af 10       		.uleb128 0x10
 7162 00b0 13       		.uleb128 0x13
 7163 00b1 01       		.byte	0x1
 7164 00b2 01       		.uleb128 0x1
 7165 00b3 13       		.uleb128 0x13
 7166 00b4 03       		.uleb128 0x3
 7167 00b5 0E       		.uleb128 0xe
 7168 00b6 0B       		.uleb128 0xb
 7169 00b7 05       		.uleb128 0x5
 7170 00b8 3A       		.uleb128 0x3a
 7171 00b9 0B       		.uleb128 0xb
 7172 00ba 3B       		.uleb128 0x3b
 7173 00bb 05       		.uleb128 0x5
 7174 00bc 00       		.byte	0x0
 7175 00bd 00       		.byte	0x0
 7176 00be 11       		.uleb128 0x11
 7177 00bf 0D       		.uleb128 0xd
 7178 00c0 00       		.byte	0x0
 7179 00c1 03       		.uleb128 0x3
 7180 00c2 0E       		.uleb128 0xe
 7181 00c3 3A       		.uleb128 0x3a
 7182 00c4 0B       		.uleb128 0xb
 7183 00c5 3B       		.uleb128 0x3b
 7184 00c6 05       		.uleb128 0x5
 7185 00c7 49       		.uleb128 0x49
 7186 00c8 13       		.uleb128 0x13
 7187 00c9 38       		.uleb128 0x38
 7188 00ca 0A       		.uleb128 0xa
 7189 00cb 00       		.byte	0x0
 7190 00cc 00       		.byte	0x0
 7191 00cd 12       		.uleb128 0x12
 7192 00ce 0D       		.uleb128 0xd
ARM GAS  /tmp/ccNOn6pJ.s 			page 136


 7193 00cf 00       		.byte	0x0
 7194 00d0 03       		.uleb128 0x3
 7195 00d1 08       		.uleb128 0x8
 7196 00d2 3A       		.uleb128 0x3a
 7197 00d3 0B       		.uleb128 0xb
 7198 00d4 3B       		.uleb128 0x3b
 7199 00d5 05       		.uleb128 0x5
 7200 00d6 49       		.uleb128 0x49
 7201 00d7 13       		.uleb128 0x13
 7202 00d8 38       		.uleb128 0x38
 7203 00d9 0A       		.uleb128 0xa
 7204 00da 00       		.byte	0x0
 7205 00db 00       		.byte	0x0
 7206 00dc 13       		.uleb128 0x13
 7207 00dd 13       		.uleb128 0x13
 7208 00de 01       		.byte	0x1
 7209 00df 01       		.uleb128 0x1
 7210 00e0 13       		.uleb128 0x13
 7211 00e1 03       		.uleb128 0x3
 7212 00e2 0E       		.uleb128 0xe
 7213 00e3 0B       		.uleb128 0xb
 7214 00e4 06       		.uleb128 0x6
 7215 00e5 3A       		.uleb128 0x3a
 7216 00e6 0B       		.uleb128 0xb
 7217 00e7 3B       		.uleb128 0x3b
 7218 00e8 0B       		.uleb128 0xb
 7219 00e9 00       		.byte	0x0
 7220 00ea 00       		.byte	0x0
 7221 00eb 14       		.uleb128 0x14
 7222 00ec 2E       		.uleb128 0x2e
 7223 00ed 01       		.byte	0x1
 7224 00ee 01       		.uleb128 0x1
 7225 00ef 13       		.uleb128 0x13
 7226 00f0 3F       		.uleb128 0x3f
 7227 00f1 0C       		.uleb128 0xc
 7228 00f2 03       		.uleb128 0x3
 7229 00f3 0E       		.uleb128 0xe
 7230 00f4 3A       		.uleb128 0x3a
 7231 00f5 0B       		.uleb128 0xb
 7232 00f6 3B       		.uleb128 0x3b
 7233 00f7 0B       		.uleb128 0xb
 7234 00f8 8740     		.uleb128 0x2007
 7235 00fa 0E       		.uleb128 0xe
 7236 00fb 49       		.uleb128 0x49
 7237 00fc 13       		.uleb128 0x13
 7238 00fd 3C       		.uleb128 0x3c
 7239 00fe 0C       		.uleb128 0xc
 7240 00ff 00       		.byte	0x0
 7241 0100 00       		.byte	0x0
 7242 0101 15       		.uleb128 0x15
 7243 0102 05       		.uleb128 0x5
 7244 0103 00       		.byte	0x0
 7245 0104 49       		.uleb128 0x49
 7246 0105 13       		.uleb128 0x13
 7247 0106 34       		.uleb128 0x34
 7248 0107 0C       		.uleb128 0xc
 7249 0108 00       		.byte	0x0
ARM GAS  /tmp/ccNOn6pJ.s 			page 137


 7250 0109 00       		.byte	0x0
 7251 010a 16       		.uleb128 0x16
 7252 010b 05       		.uleb128 0x5
 7253 010c 00       		.byte	0x0
 7254 010d 49       		.uleb128 0x49
 7255 010e 13       		.uleb128 0x13
 7256 010f 00       		.byte	0x0
 7257 0110 00       		.byte	0x0
 7258 0111 17       		.uleb128 0x17
 7259 0112 2E       		.uleb128 0x2e
 7260 0113 01       		.byte	0x1
 7261 0114 01       		.uleb128 0x1
 7262 0115 13       		.uleb128 0x13
 7263 0116 3F       		.uleb128 0x3f
 7264 0117 0C       		.uleb128 0xc
 7265 0118 03       		.uleb128 0x3
 7266 0119 0E       		.uleb128 0xe
 7267 011a 3A       		.uleb128 0x3a
 7268 011b 0B       		.uleb128 0xb
 7269 011c 3B       		.uleb128 0x3b
 7270 011d 0B       		.uleb128 0xb
 7271 011e 8740     		.uleb128 0x2007
 7272 0120 0E       		.uleb128 0xe
 7273 0121 3C       		.uleb128 0x3c
 7274 0122 0C       		.uleb128 0xc
 7275 0123 00       		.byte	0x0
 7276 0124 00       		.byte	0x0
 7277 0125 18       		.uleb128 0x18
 7278 0126 2E       		.uleb128 0x2e
 7279 0127 01       		.byte	0x1
 7280 0128 3F       		.uleb128 0x3f
 7281 0129 0C       		.uleb128 0xc
 7282 012a 03       		.uleb128 0x3
 7283 012b 0E       		.uleb128 0xe
 7284 012c 3A       		.uleb128 0x3a
 7285 012d 0B       		.uleb128 0xb
 7286 012e 3B       		.uleb128 0x3b
 7287 012f 0B       		.uleb128 0xb
 7288 0130 8740     		.uleb128 0x2007
 7289 0132 0E       		.uleb128 0xe
 7290 0133 49       		.uleb128 0x49
 7291 0134 13       		.uleb128 0x13
 7292 0135 3C       		.uleb128 0x3c
 7293 0136 0C       		.uleb128 0xc
 7294 0137 00       		.byte	0x0
 7295 0138 00       		.byte	0x0
 7296 0139 19       		.uleb128 0x19
 7297 013a 21       		.uleb128 0x21
 7298 013b 00       		.byte	0x0
 7299 013c 49       		.uleb128 0x49
 7300 013d 13       		.uleb128 0x13
 7301 013e 2F       		.uleb128 0x2f
 7302 013f 05       		.uleb128 0x5
 7303 0140 00       		.byte	0x0
 7304 0141 00       		.byte	0x0
 7305 0142 1A       		.uleb128 0x1a
 7306 0143 10       		.uleb128 0x10
ARM GAS  /tmp/ccNOn6pJ.s 			page 138


 7307 0144 00       		.byte	0x0
 7308 0145 0B       		.uleb128 0xb
 7309 0146 0B       		.uleb128 0xb
 7310 0147 49       		.uleb128 0x49
 7311 0148 13       		.uleb128 0x13
 7312 0149 00       		.byte	0x0
 7313 014a 00       		.byte	0x0
 7314 014b 1B       		.uleb128 0x1b
 7315 014c 13       		.uleb128 0x13
 7316 014d 01       		.byte	0x1
 7317 014e 01       		.uleb128 0x1
 7318 014f 13       		.uleb128 0x13
 7319 0150 03       		.uleb128 0x3
 7320 0151 0E       		.uleb128 0xe
 7321 0152 0B       		.uleb128 0xb
 7322 0153 05       		.uleb128 0x5
 7323 0154 3A       		.uleb128 0x3a
 7324 0155 0B       		.uleb128 0xb
 7325 0156 3B       		.uleb128 0x3b
 7326 0157 0B       		.uleb128 0xb
 7327 0158 00       		.byte	0x0
 7328 0159 00       		.byte	0x0
 7329 015a 1C       		.uleb128 0x1c
 7330 015b 15       		.uleb128 0x15
 7331 015c 00       		.byte	0x0
 7332 015d 00       		.byte	0x0
 7333 015e 00       		.byte	0x0
 7334 015f 1D       		.uleb128 0x1d
 7335 0160 0D       		.uleb128 0xd
 7336 0161 00       		.byte	0x0
 7337 0162 03       		.uleb128 0x3
 7338 0163 0E       		.uleb128 0xe
 7339 0164 3A       		.uleb128 0x3a
 7340 0165 0B       		.uleb128 0xb
 7341 0166 3B       		.uleb128 0x3b
 7342 0167 0B       		.uleb128 0xb
 7343 0168 49       		.uleb128 0x49
 7344 0169 13       		.uleb128 0x13
 7345 016a 00       		.byte	0x0
 7346 016b 00       		.byte	0x0
 7347 016c 1E       		.uleb128 0x1e
 7348 016d 2E       		.uleb128 0x2e
 7349 016e 01       		.byte	0x1
 7350 016f 01       		.uleb128 0x1
 7351 0170 13       		.uleb128 0x13
 7352 0171 3F       		.uleb128 0x3f
 7353 0172 0C       		.uleb128 0xc
 7354 0173 03       		.uleb128 0x3
 7355 0174 0E       		.uleb128 0xe
 7356 0175 3A       		.uleb128 0x3a
 7357 0176 0B       		.uleb128 0xb
 7358 0177 3B       		.uleb128 0x3b
 7359 0178 0B       		.uleb128 0xb
 7360 0179 8740     		.uleb128 0x2007
 7361 017b 0E       		.uleb128 0xe
 7362 017c 11       		.uleb128 0x11
 7363 017d 01       		.uleb128 0x1
ARM GAS  /tmp/ccNOn6pJ.s 			page 139


 7364 017e 12       		.uleb128 0x12
 7365 017f 01       		.uleb128 0x1
 7366 0180 40       		.uleb128 0x40
 7367 0181 06       		.uleb128 0x6
 7368 0182 00       		.byte	0x0
 7369 0183 00       		.byte	0x0
 7370 0184 1F       		.uleb128 0x1f
 7371 0185 05       		.uleb128 0x5
 7372 0186 00       		.byte	0x0
 7373 0187 03       		.uleb128 0x3
 7374 0188 0E       		.uleb128 0xe
 7375 0189 3A       		.uleb128 0x3a
 7376 018a 0B       		.uleb128 0xb
 7377 018b 3B       		.uleb128 0x3b
 7378 018c 0B       		.uleb128 0xb
 7379 018d 49       		.uleb128 0x49
 7380 018e 13       		.uleb128 0x13
 7381 018f 02       		.uleb128 0x2
 7382 0190 06       		.uleb128 0x6
 7383 0191 00       		.byte	0x0
 7384 0192 00       		.byte	0x0
 7385 0193 20       		.uleb128 0x20
 7386 0194 05       		.uleb128 0x5
 7387 0195 00       		.byte	0x0
 7388 0196 03       		.uleb128 0x3
 7389 0197 08       		.uleb128 0x8
 7390 0198 3A       		.uleb128 0x3a
 7391 0199 0B       		.uleb128 0xb
 7392 019a 3B       		.uleb128 0x3b
 7393 019b 0B       		.uleb128 0xb
 7394 019c 49       		.uleb128 0x49
 7395 019d 13       		.uleb128 0x13
 7396 019e 02       		.uleb128 0x2
 7397 019f 06       		.uleb128 0x6
 7398 01a0 00       		.byte	0x0
 7399 01a1 00       		.byte	0x0
 7400 01a2 21       		.uleb128 0x21
 7401 01a3 34       		.uleb128 0x34
 7402 01a4 00       		.byte	0x0
 7403 01a5 03       		.uleb128 0x3
 7404 01a6 08       		.uleb128 0x8
 7405 01a7 3A       		.uleb128 0x3a
 7406 01a8 0B       		.uleb128 0xb
 7407 01a9 3B       		.uleb128 0x3b
 7408 01aa 0B       		.uleb128 0xb
 7409 01ab 49       		.uleb128 0x49
 7410 01ac 13       		.uleb128 0x13
 7411 01ad 02       		.uleb128 0x2
 7412 01ae 0A       		.uleb128 0xa
 7413 01af 00       		.byte	0x0
 7414 01b0 00       		.byte	0x0
 7415 01b1 22       		.uleb128 0x22
 7416 01b2 34       		.uleb128 0x34
 7417 01b3 00       		.byte	0x0
 7418 01b4 03       		.uleb128 0x3
 7419 01b5 0E       		.uleb128 0xe
 7420 01b6 3A       		.uleb128 0x3a
ARM GAS  /tmp/ccNOn6pJ.s 			page 140


 7421 01b7 0B       		.uleb128 0xb
 7422 01b8 3B       		.uleb128 0x3b
 7423 01b9 0B       		.uleb128 0xb
 7424 01ba 49       		.uleb128 0x49
 7425 01bb 13       		.uleb128 0x13
 7426 01bc 02       		.uleb128 0x2
 7427 01bd 06       		.uleb128 0x6
 7428 01be 00       		.byte	0x0
 7429 01bf 00       		.byte	0x0
 7430 01c0 23       		.uleb128 0x23
 7431 01c1 34       		.uleb128 0x34
 7432 01c2 00       		.byte	0x0
 7433 01c3 03       		.uleb128 0x3
 7434 01c4 0E       		.uleb128 0xe
 7435 01c5 3A       		.uleb128 0x3a
 7436 01c6 0B       		.uleb128 0xb
 7437 01c7 3B       		.uleb128 0x3b
 7438 01c8 0B       		.uleb128 0xb
 7439 01c9 49       		.uleb128 0x49
 7440 01ca 13       		.uleb128 0x13
 7441 01cb 02       		.uleb128 0x2
 7442 01cc 0A       		.uleb128 0xa
 7443 01cd 00       		.byte	0x0
 7444 01ce 00       		.byte	0x0
 7445 01cf 24       		.uleb128 0x24
 7446 01d0 34       		.uleb128 0x34
 7447 01d1 00       		.byte	0x0
 7448 01d2 03       		.uleb128 0x3
 7449 01d3 0E       		.uleb128 0xe
 7450 01d4 3A       		.uleb128 0x3a
 7451 01d5 0B       		.uleb128 0xb
 7452 01d6 3B       		.uleb128 0x3b
 7453 01d7 0B       		.uleb128 0xb
 7454 01d8 49       		.uleb128 0x49
 7455 01d9 13       		.uleb128 0x13
 7456 01da 00       		.byte	0x0
 7457 01db 00       		.byte	0x0
 7458 01dc 25       		.uleb128 0x25
 7459 01dd 34       		.uleb128 0x34
 7460 01de 00       		.byte	0x0
 7461 01df 03       		.uleb128 0x3
 7462 01e0 08       		.uleb128 0x8
 7463 01e1 3A       		.uleb128 0x3a
 7464 01e2 0B       		.uleb128 0xb
 7465 01e3 3B       		.uleb128 0x3b
 7466 01e4 0B       		.uleb128 0xb
 7467 01e5 49       		.uleb128 0x49
 7468 01e6 13       		.uleb128 0x13
 7469 01e7 00       		.byte	0x0
 7470 01e8 00       		.byte	0x0
 7471 01e9 26       		.uleb128 0x26
 7472 01ea 34       		.uleb128 0x34
 7473 01eb 00       		.byte	0x0
 7474 01ec 03       		.uleb128 0x3
 7475 01ed 08       		.uleb128 0x8
 7476 01ee 3A       		.uleb128 0x3a
 7477 01ef 0B       		.uleb128 0xb
ARM GAS  /tmp/ccNOn6pJ.s 			page 141


 7478 01f0 3B       		.uleb128 0x3b
 7479 01f1 0B       		.uleb128 0xb
 7480 01f2 49       		.uleb128 0x49
 7481 01f3 13       		.uleb128 0x13
 7482 01f4 02       		.uleb128 0x2
 7483 01f5 06       		.uleb128 0x6
 7484 01f6 00       		.byte	0x0
 7485 01f7 00       		.byte	0x0
 7486 01f8 27       		.uleb128 0x27
 7487 01f9 2E       		.uleb128 0x2e
 7488 01fa 01       		.byte	0x1
 7489 01fb 01       		.uleb128 0x1
 7490 01fc 13       		.uleb128 0x13
 7491 01fd 3F       		.uleb128 0x3f
 7492 01fe 0C       		.uleb128 0xc
 7493 01ff 03       		.uleb128 0x3
 7494 0200 0E       		.uleb128 0xe
 7495 0201 3A       		.uleb128 0x3a
 7496 0202 0B       		.uleb128 0xb
 7497 0203 3B       		.uleb128 0x3b
 7498 0204 05       		.uleb128 0x5
 7499 0205 8740     		.uleb128 0x2007
 7500 0207 0E       		.uleb128 0xe
 7501 0208 11       		.uleb128 0x11
 7502 0209 01       		.uleb128 0x1
 7503 020a 12       		.uleb128 0x12
 7504 020b 01       		.uleb128 0x1
 7505 020c 40       		.uleb128 0x40
 7506 020d 06       		.uleb128 0x6
 7507 020e 00       		.byte	0x0
 7508 020f 00       		.byte	0x0
 7509 0210 28       		.uleb128 0x28
 7510 0211 05       		.uleb128 0x5
 7511 0212 00       		.byte	0x0
 7512 0213 03       		.uleb128 0x3
 7513 0214 0E       		.uleb128 0xe
 7514 0215 3A       		.uleb128 0x3a
 7515 0216 0B       		.uleb128 0xb
 7516 0217 3B       		.uleb128 0x3b
 7517 0218 05       		.uleb128 0x5
 7518 0219 49       		.uleb128 0x49
 7519 021a 13       		.uleb128 0x13
 7520 021b 02       		.uleb128 0x2
 7521 021c 06       		.uleb128 0x6
 7522 021d 00       		.byte	0x0
 7523 021e 00       		.byte	0x0
 7524 021f 29       		.uleb128 0x29
 7525 0220 05       		.uleb128 0x5
 7526 0221 00       		.byte	0x0
 7527 0222 03       		.uleb128 0x3
 7528 0223 08       		.uleb128 0x8
 7529 0224 3A       		.uleb128 0x3a
 7530 0225 0B       		.uleb128 0xb
 7531 0226 3B       		.uleb128 0x3b
 7532 0227 05       		.uleb128 0x5
 7533 0228 49       		.uleb128 0x49
 7534 0229 13       		.uleb128 0x13
ARM GAS  /tmp/ccNOn6pJ.s 			page 142


 7535 022a 02       		.uleb128 0x2
 7536 022b 06       		.uleb128 0x6
 7537 022c 00       		.byte	0x0
 7538 022d 00       		.byte	0x0
 7539 022e 2A       		.uleb128 0x2a
 7540 022f 34       		.uleb128 0x34
 7541 0230 00       		.byte	0x0
 7542 0231 03       		.uleb128 0x3
 7543 0232 08       		.uleb128 0x8
 7544 0233 3A       		.uleb128 0x3a
 7545 0234 0B       		.uleb128 0xb
 7546 0235 3B       		.uleb128 0x3b
 7547 0236 05       		.uleb128 0x5
 7548 0237 49       		.uleb128 0x49
 7549 0238 13       		.uleb128 0x13
 7550 0239 02       		.uleb128 0x2
 7551 023a 0A       		.uleb128 0xa
 7552 023b 00       		.byte	0x0
 7553 023c 00       		.byte	0x0
 7554 023d 2B       		.uleb128 0x2b
 7555 023e 34       		.uleb128 0x34
 7556 023f 00       		.byte	0x0
 7557 0240 03       		.uleb128 0x3
 7558 0241 0E       		.uleb128 0xe
 7559 0242 3A       		.uleb128 0x3a
 7560 0243 0B       		.uleb128 0xb
 7561 0244 3B       		.uleb128 0x3b
 7562 0245 05       		.uleb128 0x5
 7563 0246 49       		.uleb128 0x49
 7564 0247 13       		.uleb128 0x13
 7565 0248 02       		.uleb128 0x2
 7566 0249 06       		.uleb128 0x6
 7567 024a 00       		.byte	0x0
 7568 024b 00       		.byte	0x0
 7569 024c 2C       		.uleb128 0x2c
 7570 024d 34       		.uleb128 0x34
 7571 024e 00       		.byte	0x0
 7572 024f 03       		.uleb128 0x3
 7573 0250 0E       		.uleb128 0xe
 7574 0251 3A       		.uleb128 0x3a
 7575 0252 0B       		.uleb128 0xb
 7576 0253 3B       		.uleb128 0x3b
 7577 0254 05       		.uleb128 0x5
 7578 0255 49       		.uleb128 0x49
 7579 0256 13       		.uleb128 0x13
 7580 0257 02       		.uleb128 0x2
 7581 0258 0A       		.uleb128 0xa
 7582 0259 00       		.byte	0x0
 7583 025a 00       		.byte	0x0
 7584 025b 2D       		.uleb128 0x2d
 7585 025c 34       		.uleb128 0x34
 7586 025d 00       		.byte	0x0
 7587 025e 03       		.uleb128 0x3
 7588 025f 0E       		.uleb128 0xe
 7589 0260 3A       		.uleb128 0x3a
 7590 0261 0B       		.uleb128 0xb
 7591 0262 3B       		.uleb128 0x3b
ARM GAS  /tmp/ccNOn6pJ.s 			page 143


 7592 0263 05       		.uleb128 0x5
 7593 0264 49       		.uleb128 0x49
 7594 0265 13       		.uleb128 0x13
 7595 0266 00       		.byte	0x0
 7596 0267 00       		.byte	0x0
 7597 0268 2E       		.uleb128 0x2e
 7598 0269 34       		.uleb128 0x34
 7599 026a 00       		.byte	0x0
 7600 026b 03       		.uleb128 0x3
 7601 026c 08       		.uleb128 0x8
 7602 026d 3A       		.uleb128 0x3a
 7603 026e 0B       		.uleb128 0xb
 7604 026f 3B       		.uleb128 0x3b
 7605 0270 05       		.uleb128 0x5
 7606 0271 49       		.uleb128 0x49
 7607 0272 13       		.uleb128 0x13
 7608 0273 00       		.byte	0x0
 7609 0274 00       		.byte	0x0
 7610 0275 2F       		.uleb128 0x2f
 7611 0276 34       		.uleb128 0x34
 7612 0277 00       		.byte	0x0
 7613 0278 03       		.uleb128 0x3
 7614 0279 08       		.uleb128 0x8
 7615 027a 3A       		.uleb128 0x3a
 7616 027b 0B       		.uleb128 0xb
 7617 027c 3B       		.uleb128 0x3b
 7618 027d 05       		.uleb128 0x5
 7619 027e 49       		.uleb128 0x49
 7620 027f 13       		.uleb128 0x13
 7621 0280 02       		.uleb128 0x2
 7622 0281 06       		.uleb128 0x6
 7623 0282 00       		.byte	0x0
 7624 0283 00       		.byte	0x0
 7625 0284 30       		.uleb128 0x30
 7626 0285 39       		.uleb128 0x39
 7627 0286 01       		.byte	0x1
 7628 0287 01       		.uleb128 0x1
 7629 0288 13       		.uleb128 0x13
 7630 0289 03       		.uleb128 0x3
 7631 028a 08       		.uleb128 0x8
 7632 028b 3A       		.uleb128 0x3a
 7633 028c 0B       		.uleb128 0xb
 7634 028d 3B       		.uleb128 0x3b
 7635 028e 0B       		.uleb128 0xb
 7636 028f 00       		.byte	0x0
 7637 0290 00       		.byte	0x0
 7638 0291 31       		.uleb128 0x31
 7639 0292 34       		.uleb128 0x34
 7640 0293 00       		.byte	0x0
 7641 0294 03       		.uleb128 0x3
 7642 0295 0E       		.uleb128 0xe
 7643 0296 3A       		.uleb128 0x3a
 7644 0297 0B       		.uleb128 0xb
 7645 0298 3B       		.uleb128 0x3b
 7646 0299 05       		.uleb128 0x5
 7647 029a 49       		.uleb128 0x49
 7648 029b 13       		.uleb128 0x13
ARM GAS  /tmp/ccNOn6pJ.s 			page 144


 7649 029c 3F       		.uleb128 0x3f
 7650 029d 0C       		.uleb128 0xc
 7651 029e 3C       		.uleb128 0x3c
 7652 029f 0C       		.uleb128 0xc
 7653 02a0 00       		.byte	0x0
 7654 02a1 00       		.byte	0x0
 7655 02a2 32       		.uleb128 0x32
 7656 02a3 34       		.uleb128 0x34
 7657 02a4 00       		.byte	0x0
 7658 02a5 03       		.uleb128 0x3
 7659 02a6 08       		.uleb128 0x8
 7660 02a7 3A       		.uleb128 0x3a
 7661 02a8 0B       		.uleb128 0xb
 7662 02a9 3B       		.uleb128 0x3b
 7663 02aa 05       		.uleb128 0x5
 7664 02ab 49       		.uleb128 0x49
 7665 02ac 13       		.uleb128 0x13
 7666 02ad 3F       		.uleb128 0x3f
 7667 02ae 0C       		.uleb128 0xc
 7668 02af 3C       		.uleb128 0x3c
 7669 02b0 0C       		.uleb128 0xc
 7670 02b1 00       		.byte	0x0
 7671 02b2 00       		.byte	0x0
 7672 02b3 33       		.uleb128 0x33
 7673 02b4 34       		.uleb128 0x34
 7674 02b5 00       		.byte	0x0
 7675 02b6 03       		.uleb128 0x3
 7676 02b7 0E       		.uleb128 0xe
 7677 02b8 3A       		.uleb128 0x3a
 7678 02b9 0B       		.uleb128 0xb
 7679 02ba 3B       		.uleb128 0x3b
 7680 02bb 0B       		.uleb128 0xb
 7681 02bc 49       		.uleb128 0x49
 7682 02bd 13       		.uleb128 0x13
 7683 02be 3F       		.uleb128 0x3f
 7684 02bf 0C       		.uleb128 0xc
 7685 02c0 3C       		.uleb128 0x3c
 7686 02c1 0C       		.uleb128 0xc
 7687 02c2 00       		.byte	0x0
 7688 02c3 00       		.byte	0x0
 7689 02c4 34       		.uleb128 0x34
 7690 02c5 34       		.uleb128 0x34
 7691 02c6 00       		.byte	0x0
 7692 02c7 03       		.uleb128 0x3
 7693 02c8 08       		.uleb128 0x8
 7694 02c9 3A       		.uleb128 0x3a
 7695 02ca 0B       		.uleb128 0xb
 7696 02cb 3B       		.uleb128 0x3b
 7697 02cc 0B       		.uleb128 0xb
 7698 02cd 49       		.uleb128 0x49
 7699 02ce 13       		.uleb128 0x13
 7700 02cf 3F       		.uleb128 0x3f
 7701 02d0 0C       		.uleb128 0xc
 7702 02d1 3C       		.uleb128 0x3c
 7703 02d2 0C       		.uleb128 0xc
 7704 02d3 00       		.byte	0x0
 7705 02d4 00       		.byte	0x0
ARM GAS  /tmp/ccNOn6pJ.s 			page 145


 7706 02d5 00       		.byte	0x0
 7707              		.section	.debug_pubnames,"",%progbits
 7708 0000 86000000 		.4byte	0x86
 7709 0004 0200     		.2byte	0x2
 7710 0006 00000000 		.4byte	.Ldebug_info0
 7711 000a 26270000 		.4byte	0x2726
 7712 000e 29200000 		.4byte	0x2029
 7713 0012 44726177 		.ascii	"DrawBGMode7Background16R3\000"
 7713      42474D6F 
 7713      64653742 
 7713      61636B67 
 7713      726F756E 
 7714 002c A8210000 		.4byte	0x21a8
 7715 0030 44726177 		.ascii	"DrawBGMode7Background16R1R2\000"
 7715      42474D6F 
 7715      64653742 
 7715      61636B67 
 7715      726F756E 
 7716 004c 14230000 		.4byte	0x2314
 7717 0050 44726177 		.ascii	"DrawBGMode7Background16R0\000"
 7717      42474D6F 
 7717      64653742 
 7717      61636B67 
 7717      726F756E 
 7718 006a 74240000 		.4byte	0x2474
 7719 006e 44726177 		.ascii	"DrawBGMode7Background16\000"
 7719      42474D6F 
 7719      64653742 
 7719      61636B67 
 7719      726F756E 
 7720 0086 00000000 		.4byte	0x0
 7721              		.section	.debug_aranges,"",%progbits
 7722 0000 1C000000 		.4byte	0x1c
 7723 0004 0200     		.2byte	0x2
 7724 0006 00000000 		.4byte	.Ldebug_info0
 7725 000a 04       		.byte	0x4
 7726 000b 00       		.byte	0x0
 7727 000c 0000     		.2byte	0x0
 7728 000e 0000     		.2byte	0x0
 7729 0010 00000000 		.4byte	.Ltext0
 7730 0014 4C0B0000 		.4byte	.Letext0-.Ltext0
 7731 0018 00000000 		.4byte	0x0
 7732 001c 00000000 		.4byte	0x0
 7733              		.section	.debug_str,"MS",%progbits,1
 7734              	.LASF383:
 7735 0000 4D6F6465 		.ascii	"Mode7HFlip\000"
 7735      3748466C 
 7735      697000
 7736              	.LASF438:
 7737 000b 534C696E 		.ascii	"SLineData\000"
 7737      65446174 
 7737      6100
 7738              	.LASF183:
 7739 0015 524F4D54 		.ascii	"ROMType\000"
 7739      79706500 
 7740              	.LASF305:
 7741 001d 50726576 		.ascii	"PreviousLine\000"
ARM GAS  /tmp/ccNOn6pJ.s 			page 146


 7741      696F7573 
 7741      4C696E65 
 7741      00
 7742              	.LASF162:
 7743 002a 53444431 		.ascii	"SDD1Pack\000"
 7743      5061636B 
 7743      00
 7744              	.LASF241:
 7745 0033 5F5A4E37 		.ascii	"_ZN7CMemory9SA1ROMMapEv\000"
 7745      434D656D 
 7745      6F727939 
 7745      53413152 
 7745      4F4D4D61 
 7746              	.LASF296:
 7747 004b 54696C65 		.ascii	"TileCached\000"
 7747      43616368 
 7747      656400
 7748              	.LASF63:
 7749 0056 41505545 		.ascii	"APUEnabled\000"
 7749      6E61626C 
 7749      656400
 7750              	.LASF36:
 7751 0061 4175746F 		.ascii	"AutoSaveTimer\000"
 7751      53617665 
 7751      54696D65 
 7751      7200
 7752              	.LASF486:
 7753 006f 44726177 		.ascii	"DrawBGMode7Background16R0\000"
 7753      42474D6F 
 7753      64653742 
 7753      61636B67 
 7753      726F756E 
 7754              	.LASF117:
 7755 0089 53746572 		.ascii	"Stereo\000"
 7755      656F00
 7756              	.LASF265:
 7757 0090 5F5A4E37 		.ascii	"_ZN7CMemory12KartContentsEv\000"
 7757      434D656D 
 7757      6F727931 
 7757      324B6172 
 7757      74436F6E 
 7758              	.LASF427:
 7759 00ac 72323132 		.ascii	"r212d_s\000"
 7759      645F7300 
 7760              	.LASF446:
 7761 00b4 5F5A6572 		.ascii	"_Zero\000"
 7761      6F00
 7762              	.LASF173:
 7763 00ba 5352414D 		.ascii	"SRAMMask\000"
 7763      4D61736B 
 7763      00
 7764              	.LASF288:
 7765 00c3 52656E64 		.ascii	"RenderThisFrame\000"
 7765      65725468 
 7765      69734672 
 7765      616D6500 
 7766              	.LASF482:
ARM GAS  /tmp/ccNOn6pJ.s 			page 147


 7767 00d3 44726177 		.ascii	"DrawBGMode7Background16R1R2\000"
 7767      42474D6F 
 7767      64653742 
 7767      61636B67 
 7767      726F756E 
 7768              	.LASF369:
 7769 00ef 42475F46 		.ascii	"BG_Forced\000"
 7769      6F726365 
 7769      6400
 7770              	.LASF396:
 7771 00f9 5265636F 		.ascii	"RecomputeClipWindows\000"
 7771      6D707574 
 7771      65436C69 
 7771      7057696E 
 7771      646F7773 
 7772              	.LASF75:
 7773 010e 54726163 		.ascii	"TraceVRAM\000"
 7773      65565241 
 7773      4D00
 7774              	.LASF424:
 7775 0118 72323132 		.ascii	"r212c\000"
 7775      6300
 7776              	.LASF426:
 7777 011e 72323132 		.ascii	"r212d\000"
 7777      6400
 7778              	.LASF421:
 7779 0124 70437572 		.ascii	"pCurrentClip\000"
 7779      72656E74 
 7779      436C6970 
 7779      00
 7780              	.LASF14:
 7781 0131 75696E74 		.ascii	"uint32\000"
 7781      333200
 7782              	.LASF140:
 7783 0138 44697361 		.ascii	"DisableHDMA\000"
 7783      626C6548 
 7783      444D4100 
 7784              	.LASF376:
 7785 0144 4F414D52 		.ascii	"OAMReadFlip\000"
 7785      65616446 
 7785      6C697000 
 7786              	.LASF336:
 7787 0150 42474D6F 		.ascii	"BGMode\000"
 7787      646500
 7788              	.LASF248:
 7789 0157 53636F72 		.ascii	"ScoreLoROM\000"
 7789      654C6F52 
 7789      4F4D00
 7790              	.LASF303:
 7791 0162 426C7565 		.ascii	"Blue\000"
 7791      00
 7792              	.LASF363:
 7793 0167 46697865 		.ascii	"FixedColourRed\000"
 7793      64436F6C 
 7793      6F757252 
 7793      656400
 7794              	.LASF213:
ARM GAS  /tmp/ccNOn6pJ.s 			page 148


 7795 0176 5F5A4E37 		.ascii	"_ZN7CMemory15WriteProtectROMEv\000"
 7795      434D656D 
 7795      6F727931 
 7795      35577269 
 7795      74655072 
 7796              	.LASF58:
 7797 0195 4150555F 		.ascii	"APU_Cycles\000"
 7797      4379636C 
 7797      657300
 7798              	.LASF464:
 7799 01a0 43616368 		.ascii	"CachedSamples\000"
 7799      65645361 
 7799      6D706C65 
 7799      7300
 7800              	.LASF64:
 7801 01ae 53687574 		.ascii	"Shutdown\000"
 7801      646F776E 
 7801      00
 7802              	.LASF46:
 7803 01b7 5F41524D 		.ascii	"_ARM_asm_padding1\000"
 7803      5F61736D 
 7803      5F706164 
 7803      64696E67 
 7803      3100
 7804              	.LASF300:
 7805 01c9 52656E64 		.ascii	"RenderedScreenHeight\000"
 7805      65726564 
 7805      53637265 
 7805      656E4865 
 7805      69676874 
 7806              	.LASF194:
 7807 01de 53444431 		.ascii	"SDD1LoggedDataCountPrev\000"
 7807      4C6F6767 
 7807      65644461 
 7807      7461436F 
 7807      756E7450 
 7808              	.LASF205:
 7809 01f6 5F5A4E37 		.ascii	"_ZN7CMemory8SaveSRAMEPKc\000"
 7809      434D656D 
 7809      6F727938 
 7809      53617665 
 7809      5352414D 
 7810              	.LASF463:
 7811 020f 53686164 		.ascii	"ShadowRAM\000"
 7811      6F775241 
 7811      4D00
 7812              	.LASF200:
 7813 0219 5F5A4E37 		.ascii	"_ZN7CMemory7LoadROMEPKc\000"
 7813      434D656D 
 7813      6F727937 
 7813      4C6F6164 
 7813      524F4D45 
 7814              	.LASF96:
 7815 0231 466F7263 		.ascii	"ForceNoDSP1\000"
 7815      654E6F44 
 7815      53503100 
 7816              	.LASF325:
ARM GAS  /tmp/ccNOn6pJ.s 			page 149


 7817 023d 4D61736B 		.ascii	"Mask1\000"
 7817      3100
 7818              	.LASF216:
 7819 0243 4D617052 		.ascii	"MapRAM\000"
 7819      414D00
 7820              	.LASF477:
 7821 024a 73746172 		.ascii	"startx\000"
 7821      747800
 7822              	.LASF88:
 7823 0251 466F7263 		.ascii	"ForceHeader\000"
 7823      65486561 
 7823      64657200 
 7824              	.LASF40:
 7825 025d 496E444D 		.ascii	"InDMA\000"
 7825      4100
 7826              	.LASF235:
 7827 0263 5F5A4E37 		.ascii	"_ZN7CMemory13SuperFXROMMapEv\000"
 7827      434D656D 
 7827      6F727931 
 7827      33537570 
 7827      65724658 
 7828              	.LASF33:
 7829 0280 4D656D53 		.ascii	"MemSpeed\000"
 7829      70656564 
 7829      00
 7830              	.LASF135:
 7831 0289 4D6F6465 		.ascii	"Mode7Interpolate\000"
 7831      37496E74 
 7831      6572706F 
 7831      6C617465 
 7831      00
 7832              	.LASF469:
 7833 029a 61736D4A 		.ascii	"asmJumpTab\000"
 7833      756D7054 
 7833      616200
 7834              	.LASF409:
 7835 02a5 5375625A 		.ascii	"SubZBuffer\000"
 7835      42756666 
 7835      657200
 7836              	.LASF489:
 7837 02b0 53657474 		.ascii	"Settings\000"
 7837      696E6773 
 7837      00
 7838              	.LASF455:
 7839 02b9 2E5F3237 		.ascii	"._27\000"
 7839      00
 7840              	.LASF104:
 7841 02be 4D6F7573 		.ascii	"Mouse\000"
 7841      6500
 7842              	.LASF258:
 7843 02c4 53746174 		.ascii	"StaticRAMSize\000"
 7843      69635241 
 7843      4D53697A 
 7843      6500
 7844              	.LASF174:
 7845 02d2 5352414D 		.ascii	"SRAMSize\000"
 7845      53697A65 
ARM GAS  /tmp/ccNOn6pJ.s 			page 150


 7845      00
 7846              	.LASF84:
 7847 02db 4672616D 		.ascii	"FrameTime\000"
 7847      6554696D 
 7847      6500
 7848              	.LASF415:
 7849 02e5 50616C65 		.ascii	"PaletteMask\000"
 7849      7474654D 
 7849      61736B00 
 7850              	.LASF390:
 7851 02f1 436C6970 		.ascii	"ClipCounts\000"
 7851      436F756E 
 7851      747300
 7852              	.LASF215:
 7853 02fc 5F5A4E37 		.ascii	"_ZN7CMemory11FixROMSpeedEv\000"
 7853      434D656D 
 7853      6F727931 
 7853      31466978 
 7853      524F4D53 
 7854              	.LASF294:
 7855 0317 4672616D 		.ascii	"FrameSkip\000"
 7855      65536B69 
 7855      7000
 7856              	.LASF434:
 7857 0321 50736575 		.ascii	"Pseudo\000"
 7857      646F00
 7858              	.LASF237:
 7859 0328 5F5A4E37 		.ascii	"_ZN7CMemory11TalesROMMapEh\000"
 7859      434D656D 
 7859      6F727931 
 7859      3154616C 
 7859      6573524F 
 7860              	.LASF105:
 7861 0343 53757065 		.ascii	"SuperScope\000"
 7861      7253636F 
 7861      706500
 7862              	.LASF125:
 7863 034e 44697361 		.ascii	"DisableMasterVolume\000"
 7863      626C654D 
 7863      61737465 
 7863      72566F6C 
 7863      756D6500 
 7864              	.LASF274:
 7865 0362 2E5F3335 		.ascii	"._35\000"
 7865      00
 7866              	.LASF328:
 7867 0367 2E5F3339 		.ascii	"._39\000"
 7867      00
 7868              	.LASF155:
 7869 036c 43687563 		.ascii	"ChuckRock\000"
 7869      6B526F63 
 7869      6B00
 7870              	.LASF87:
 7871 0376 466F7263 		.ascii	"ForceHiROM\000"
 7871      65486952 
 7871      4F4D00
 7872              	.LASF85:
ARM GAS  /tmp/ccNOn6pJ.s 			page 151


 7873 0381 536B6970 		.ascii	"SkipFrames\000"
 7873      4672616D 
 7873      657300
 7874              	.LASF68:
 7875 038c 4379636C 		.ascii	"CyclesPercentage\000"
 7875      65735065 
 7875      7263656E 
 7875      74616765 
 7875      00
 7876              	.LASF373:
 7877 039d 4F424A53 		.ascii	"OBJSizeSelect\000"
 7877      697A6553 
 7877      656C6563 
 7877      7400
 7878              	.LASF8:
 7879 03ab 6C6F6E67 		.ascii	"long int\000"
 7879      20696E74 
 7879      00
 7880              	.LASF170:
 7881 03b4 43345241 		.ascii	"C4RAM\000"
 7881      4D00
 7882              	.LASF228:
 7883 03ba 5352414D 		.ascii	"SRAM1024KLoROMMap\000"
 7883      31303234 
 7883      4B4C6F52 
 7883      4F4D4D61 
 7883      7000
 7884              	.LASF101:
 7885 03cc 466F7263 		.ascii	"ForceSDD1\000"
 7885      65534444 
 7885      3100
 7886              	.LASF458:
 7887 03d6 5F706164 		.ascii	"_padder\000"
 7887      64657200 
 7888              	.LASF413:
 7889 03de 5A45524F 		.ascii	"ZERO\000"
 7889      00
 7890              	.LASF45:
 7891 03e3 54726965 		.ascii	"TriedInterleavedMode2\000"
 7891      64496E74 
 7891      65726C65 
 7891      61766564 
 7891      4D6F6465 
 7892              	.LASF333:
 7893 03f9 4E616D65 		.ascii	"NameBase\000"
 7893      42617365 
 7893      00
 7894              	.LASF24:
 7895 0402 57616974 		.ascii	"WaitingForInterrupt\000"
 7895      696E6746 
 7895      6F72496E 
 7895      74657272 
 7895      75707400 
 7896              	.LASF440:
 7897 0416 534C696E 		.ascii	"SLineMatrixData\000"
 7897      654D6174 
 7897      72697844 
ARM GAS  /tmp/ccNOn6pJ.s 			page 152


 7897      61746100 
 7898              	.LASF323:
 7899 0426 496E6372 		.ascii	"Increment\000"
 7899      656D656E 
 7899      7400
 7900              	.LASF450:
 7901 0430 53686966 		.ascii	"ShiftedPB\000"
 7901      74656450 
 7901      4200
 7902              	.LASF89:
 7903 043a 466F7263 		.ascii	"ForceNoHeader\000"
 7903      654E6F48 
 7903      65616465 
 7903      7200
 7904              	.LASF318:
 7905 0448 5072696F 		.ascii	"Priority\000"
 7905      72697479 
 7905      00
 7906              	.LASF467:
 7907 0451 4F6E6543 		.ascii	"OneCycle\000"
 7907      79636C65 
 7907      00
 7908              	.LASF439:
 7909 045a 2E5F3430 		.ascii	"._40\000"
 7909      00
 7910              	.LASF222:
 7911 045f 4C6F524F 		.ascii	"LoROMMap\000"
 7911      4D4D6170 
 7911      00
 7912              	.LASF456:
 7913 0468 2E5F3432 		.ascii	"._42\000"
 7913      00
 7914              	.LASF311:
 7915 046d 436C6970 		.ascii	"Clip\000"
 7915      00
 7916              	.LASF2:
 7917 0472 73686F72 		.ascii	"short unsigned int\000"
 7917      7420756E 
 7917      7369676E 
 7917      65642069 
 7917      6E7400
 7918              	.LASF501:
 7919 0485 49435055 		.ascii	"ICPU\000"
 7919      00
 7920              	.LASF245:
 7921 048a 5F5A4E37 		.ascii	"_ZN7CMemory8AllASCIIEPhi\000"
 7921      434D656D 
 7921      6F727938 
 7921      416C6C41 
 7921      53434949 
 7922              	.LASF406:
 7923 04a3 53637265 		.ascii	"Screen\000"
 7923      656E00
 7924              	.LASF56:
 7925 04aa 5F50414C 		.ascii	"_PALMSOS_R9\000"
 7925      4D534F53 
 7925      5F523900 
ARM GAS  /tmp/ccNOn6pJ.s 			page 153


 7926              	.LASF32:
 7927 04b6 565F436F 		.ascii	"V_Counter\000"
 7927      756E7465 
 7927      7200
 7928              	.LASF382:
 7929 04c0 42474D6F 		.ascii	"BGMosaic\000"
 7929      73616963 
 7929      00
 7930              	.LASF230:
 7931 04c9 53756661 		.ascii	"SufamiTurboLoROMMap\000"
 7931      6D695475 
 7931      72626F4C 
 7931      6F524F4D 
 7931      4D617000 
 7932              	.LASF266:
 7933 04dd 53697A65 		.ascii	"Size\000"
 7933      00
 7934              	.LASF185:
 7935 04e2 524F4D46 		.ascii	"ROMFramesPerSecond\000"
 7935      72616D65 
 7935      73506572 
 7935      5365636F 
 7935      6E6400
 7936              	.LASF166:
 7937 04f5 5652414D 		.ascii	"VRAM\000"
 7937      00
 7938              	.LASF451:
 7939 04fa 53686966 		.ascii	"ShiftedDB\000"
 7939      74656444 
 7939      4200
 7940              	.LASF154:
 7941 0504 53747269 		.ascii	"StrikeGunnerOffsetHack\000"
 7941      6B654775 
 7941      6E6E6572 
 7941      4F666673 
 7941      65744861 
 7942              	.LASF159:
 7943 051b 57726573 		.ascii	"WrestlemaniaArcade\000"
 7943      746C656D 
 7943      616E6961 
 7943      41726361 
 7943      646500
 7944              	.LASF4:
 7945 052e 7369676E 		.ascii	"signed char\000"
 7945      65642063 
 7945      68617200 
 7946              	.LASF330:
 7947 053a 564F6666 		.ascii	"VOffset\000"
 7947      73657400 
 7948              	.LASF279:
 7949 0542 4C656674 		.ascii	"Left\000"
 7949      00
 7950              	.LASF398:
 7951 0547 4F424A4E 		.ascii	"OBJNameSelect\000"
 7951      616D6553 
 7951      656C6563 
 7951      7400
ARM GAS  /tmp/ccNOn6pJ.s 			page 154


 7952              	.LASF344:
 7953 0555 4F414D41 		.ascii	"OAMAddr\000"
 7953      64647200 
 7954              	.LASF388:
 7955 055d 57696E64 		.ascii	"Window2Left\000"
 7955      6F77324C 
 7955      65667400 
 7956              	.LASF81:
 7957 0569 466F7263 		.ascii	"ForceNTSC\000"
 7957      654E5453 
 7957      4300
 7958              	.LASF423:
 7959 0573 4D6F6465 		.ascii	"Mode7PriorityMask\000"
 7959      37507269 
 7959      6F726974 
 7959      794D6173 
 7959      6B00
 7960              	.LASF1:
 7961 0585 756E7369 		.ascii	"unsigned char\000"
 7961      676E6564 
 7961      20636861 
 7961      7200
 7962              	.LASF268:
 7963 0593 48656164 		.ascii	"Headers\000"
 7963      65727300 
 7964              	.LASF354:
 7965 059b 4D617472 		.ascii	"MatrixA\000"
 7965      69784100 
 7966              	.LASF116:
 7967 05a3 54726163 		.ascii	"TraceSoundDSP\000"
 7967      65536F75 
 7967      6E644453 
 7967      5000
 7968              	.LASF199:
 7969 05b1 496E6974 		.ascii	"InitROM\000"
 7969      524F4D00 
 7970              	.LASF322:
 7971 05b9 48696768 		.ascii	"High\000"
 7971      00
 7972              	.LASF219:
 7973 05be 5F5A4E37 		.ascii	"_ZN7CMemory11MapExtraRAMEv\000"
 7973      434D656D 
 7973      6F727931 
 7973      314D6170 
 7973      45787472 
 7974              	.LASF102:
 7975 05d9 466F7263 		.ascii	"ForceNoSDD1\000"
 7975      654E6F53 
 7975      44443100 
 7976              	.LASF485:
 7977 05e5 416E6442 		.ascii	"AndByX\000"
 7977      795800
 7978              	.LASF471:
 7979 05ec 70616432 		.ascii	"pad2\000"
 7979      00
 7980              	.LASF484:
 7981 05f1 416E6442 		.ascii	"AndByY\000"
ARM GAS  /tmp/ccNOn6pJ.s 			page 155


 7981      795900
 7982              	.LASF418:
 7983 05f8 46697865 		.ascii	"FixedColour\000"
 7983      64436F6C 
 7983      6F757200 
 7984              	.LASF419:
 7985 0604 53746172 		.ascii	"StartY\000"
 7985      745900
 7986              	.LASF433:
 7987 060b 72323133 		.ascii	"r2131_s\000"
 7987      315F7300 
 7988              	.LASF345:
 7989 0613 4F414D46 		.ascii	"OAMFlip\000"
 7989      6C697000 
 7990              	.LASF35:
 7991 061b 46617374 		.ascii	"FastROMSpeed\000"
 7991      524F4D53 
 7991      70656564 
 7991      00
 7992              	.LASF192:
 7993 0628 53444431 		.ascii	"SDD1Data\000"
 7993      44617461 
 7993      00
 7994              	.LASF142:
 7995 0631 4E657450 		.ascii	"NetPlay\000"
 7995      6C617900 
 7996              	.LASF276:
 7997 0639 76616C75 		.ascii	"value\000"
 7997      6500
 7998              	.LASF445:
 7999 063f 5F436172 		.ascii	"_Carry\000"
 7999      727900
 8000              	.LASF238:
 8001 0646 416C7068 		.ascii	"AlphaROMMap\000"
 8001      61524F4D 
 8001      4D617000 
 8002              	.LASF157:
 8003 0652 57696E74 		.ascii	"WinterGold\000"
 8003      6572476F 
 8003      6C6400
 8004              	.LASF100:
 8005 065d 466F7263 		.ascii	"ForceNoC4\000"
 8005      654E6F43 
 8005      3400
 8006              	.LASF272:
 8007 0667 436F6D70 		.ascii	"CompanyID\000"
 8007      616E7949 
 8007      4400
 8008              	.LASF186:
 8009 0671 48656164 		.ascii	"HeaderCount\000"
 8009      6572436F 
 8009      756E7400 
 8010              	.LASF9:
 8011 067d 63686172 		.ascii	"char\000"
 8011      00
 8012              	.LASF158:
 8013 0682 44657A61 		.ascii	"Dezaemon\000"
ARM GAS  /tmp/ccNOn6pJ.s 			page 156


 8013      656D6F6E 
 8013      00
 8014              	.LASF290:
 8015 068b 4672616D 		.ascii	"FrameCount\000"
 8015      65436F75 
 8015      6E7400
 8016              	.LASF402:
 8017 0696 53617665 		.ascii	"SavedOAMAddr2\000"
 8017      644F414D 
 8017      41646472 
 8017      3200
 8018              	.LASF195:
 8019 06a4 53444431 		.ascii	"SDD1LoggedDataCount\000"
 8019      4C6F6767 
 8019      65644461 
 8019      7461436F 
 8019      756E7400 
 8020              	.LASF115:
 8021 06b8 536F756E 		.ascii	"SoundPlaybackRate\000"
 8021      64506C61 
 8021      79626163 
 8021      6B526174 
 8021      6500
 8022              	.LASF187:
 8023 06ca 43616C63 		.ascii	"CalculatedSize\000"
 8023      756C6174 
 8023      65645369 
 8023      7A6500
 8024              	.LASF275:
 8025 06d9 6C696E65 		.ascii	"line\000"
 8025      00
 8026              	.LASF130:
 8027 06de 416C7453 		.ascii	"AltSampleDecode\000"
 8027      616D706C 
 8027      65446563 
 8027      6F646500 
 8028              	.LASF342:
 8029 06ee 4C617374 		.ascii	"LastSprite\000"
 8029      53707269 
 8029      746500
 8030              	.LASF488:
 8031 06f9 5F5A3233 		.ascii	"_Z23DrawBGMode7Background16Phii\000"
 8031      44726177 
 8031      42474D6F 
 8031      64653742 
 8031      61636B67 
 8032              	.LASF400:
 8033 0719 4A6F7970 		.ascii	"Joypad3ButtonReadPos\000"
 8033      61643342 
 8033      7574746F 
 8033      6E526561 
 8033      64506F73 
 8034              	.LASF71:
 8035 072e 466F7263 		.ascii	"ForcedPause\000"
 8035      65645061 
 8035      75736500 
 8036              	.LASF44:
ARM GAS  /tmp/ccNOn6pJ.s 			page 157


 8037 073a 5F41524D 		.ascii	"_ARM_asm_reserved_1\000"
 8037      5F61736D 
 8037      5F726573 
 8037      65727665 
 8037      645F3100 
 8038              	.LASF106:
 8039 074e 53525443 		.ascii	"SRTC\000"
 8039      00
 8040              	.LASF314:
 8041 0753 56506F73 		.ascii	"VPos\000"
 8041      00
 8042              	.LASF208:
 8043 0758 4465696E 		.ascii	"Deinit\000"
 8043      697400
 8044              	.LASF487:
 8045 075f 44726177 		.ascii	"DrawBGMode7Background16\000"
 8045      42474D6F 
 8045      64653742 
 8045      61636B67 
 8045      726F756E 
 8046              	.LASF394:
 8047 0777 436C6970 		.ascii	"ClipWindow1Inside\000"
 8047      57696E64 
 8047      6F773149 
 8047      6E736964 
 8047      6500
 8048              	.LASF408:
 8049 0789 5A427566 		.ascii	"ZBuffer\000"
 8049      66657200 
 8050              	.LASF479:
 8051 0791 4C696E65 		.ascii	"Line\000"
 8051      00
 8052              	.LASF508:
 8053 0796 63614352 		.ascii	"caCRC32\000"
 8053      43333200 
 8054              	.LASF310:
 8055 079e 50726576 		.ascii	"PrevMouseY\000"
 8055      4D6F7573 
 8055      655900
 8056              	.LASF457:
 8057 07a9 2E5F3433 		.ascii	"._43\000"
 8057      00
 8058              	.LASF338:
 8059 07ae 42726967 		.ascii	"Brightness\000"
 8059      68746E65 
 8059      737300
 8060              	.LASF80:
 8061 07b9 466F7263 		.ascii	"ForcePAL\000"
 8061      6550414C 
 8061      00
 8062              	.LASF319:
 8063 07c2 50616C65 		.ascii	"Palette\000"
 8063      74746500 
 8064              	.LASF93:
 8065 07ca 466F7263 		.ascii	"ForceSuperFX\000"
 8065      65537570 
 8065      65724658 
ARM GAS  /tmp/ccNOn6pJ.s 			page 158


 8065      00
 8066              	.LASF234:
 8067 07d7 53757065 		.ascii	"SuperFXROMMap\000"
 8067      72465852 
 8067      4F4D4D61 
 8067      7000
 8068              	.LASF371:
 8069 07e5 4F424A54 		.ascii	"OBJThroughMain\000"
 8069      68726F75 
 8069      67684D61 
 8069      696E00
 8070              	.LASF149:
 8071 07f4 4170706C 		.ascii	"ApplyCheats\000"
 8071      79436865 
 8071      61747300 
 8072              	.LASF359:
 8073 0800 43656E74 		.ascii	"CentreY\000"
 8073      72655900 
 8074              	.LASF226:
 8075 0808 5352414D 		.ascii	"SRAM512KLoROMMap\000"
 8075      3531324B 
 8075      4C6F524F 
 8075      4D4D6170 
 8075      00
 8076              	.LASF348:
 8077 0819 49525148 		.ascii	"IRQHBeamPos\000"
 8077      4265616D 
 8077      506F7300 
 8078              	.LASF480:
 8079 0825 636C6970 		.ascii	"clip\000"
 8079      00
 8080              	.LASF375:
 8081 082a 4F424A41 		.ascii	"OBJAddition\000"
 8081      64646974 
 8081      696F6E00 
 8082              	.LASF156:
 8083 0836 53746172 		.ascii	"StarfoxHack\000"
 8083      666F7848 
 8083      61636B00 
 8084              	.LASF153:
 8085 0842 6F733978 		.ascii	"os9x_hack\000"
 8085      5F686163 
 8085      6B00
 8086              	.LASF453:
 8087 084c 5363616E 		.ascii	"Scanline\000"
 8087      6C696E65 
 8087      00
 8088              	.LASF459:
 8089 0855 53494150 		.ascii	"SIAPU\000"
 8089      5500
 8090              	.LASF326:
 8091 085b 46756C6C 		.ascii	"FullGraphicCount\000"
 8091      47726170 
 8091      68696343 
 8091      6F756E74 
 8091      00
 8092              	.LASF26:
ARM GAS  /tmp/ccNOn6pJ.s 			page 159


 8093 086c 4379636C 		.ascii	"Cycles\000"
 8093      657300
 8094              	.LASF505:
 8095 0873 474E5520 		.ascii	"GNU C++ 4.1.1\000"
 8095      432B2B20 
 8095      342E312E 
 8095      3100
 8096              	.LASF315:
 8097 0881 4E616D65 		.ascii	"Name\000"
 8097      00
 8098              	.LASF122:
 8099 0886 536F756E 		.ascii	"SoundEnvelopeHeightReading\000"
 8099      64456E76 
 8099      656C6F70 
 8099      65486569 
 8099      67687452 
 8100              	.LASF271:
 8101 08a1 5F5A4E37 		.ascii	"_ZN7CMemory5ROMIDEv\000"
 8101      434D656D 
 8101      6F727935 
 8101      524F4D49 
 8101      44457600 
 8102              	.LASF152:
 8103 08b5 4175746F 		.ascii	"AutoMaxSkipFrames\000"
 8103      4D617853 
 8103      6B697046 
 8103      72616D65 
 8103      7300
 8104              	.LASF210:
 8105 08c7 46726565 		.ascii	"FreeSDD1Data\000"
 8105      53444431 
 8105      44617461 
 8105      00
 8106              	.LASF217:
 8107 08d4 5F5A4E37 		.ascii	"_ZN7CMemory6MapRAMEv\000"
 8107      434D656D 
 8107      6F727936 
 8107      4D617052 
 8107      414D4576 
 8108              	.LASF191:
 8109 08e9 53444431 		.ascii	"SDD1Index\000"
 8109      496E6465 
 8109      7800
 8110              	.LASF13:
 8111 08f3 626F6F6C 		.ascii	"bool32\000"
 8111      333200
 8112              	.LASF431:
 8113 08fa 72323133 		.ascii	"r2130_s\000"
 8113      305F7300 
 8114              	.LASF253:
 8115 0902 5F5A4E37 		.ascii	"_ZN7CMemory16CheckForIPSPatchEPKchRi\000"
 8115      434D656D 
 8115      6F727931 
 8115      36436865 
 8115      636B466F 
 8116              	.LASF37:
 8117 0927 4E4D4954 		.ascii	"NMITriggerPoint\000"
ARM GAS  /tmp/ccNOn6pJ.s 			page 160


 8117      72696767 
 8117      6572506F 
 8117      696E7400 
 8118              	.LASF260:
 8119 0937 4D617054 		.ascii	"MapType\000"
 8119      79706500 
 8120              	.LASF111:
 8121 093f 4D6F7573 		.ascii	"MouseMaster\000"
 8121      654D6173 
 8121      74657200 
 8122              	.LASF365:
 8123 094b 46697865 		.ascii	"FixedColourBlue\000"
 8123      64436F6C 
 8123      6F757242 
 8123      6C756500 
 8124              	.LASF307:
 8125 095b 436F6E74 		.ascii	"Controller\000"
 8125      726F6C6C 
 8125      657200
 8126              	.LASF211:
 8127 0966 5F5A4E37 		.ascii	"_ZN7CMemory12FreeSDD1DataEv\000"
 8127      434D656D 
 8127      6F727931 
 8127      32467265 
 8127      65534444 
 8128              	.LASF16:
 8129 0982 626F6F6C 		.ascii	"bool8_32\000"
 8129      385F3332 
 8129      00
 8130              	.LASF407:
 8131 098b 53756253 		.ascii	"SubScreen\000"
 8131      63726565 
 8131      6E00
 8132              	.LASF169:
 8133 0995 46696C6C 		.ascii	"FillRAM\000"
 8133      52414D00 
 8134              	.LASF10:
 8135 099d 626F6F6C 		.ascii	"bool8\000"
 8135      3800
 8136              	.LASF39:
 8137 09a3 49525143 		.ascii	"IRQCycleCount\000"
 8137      79636C65 
 8137      436F756E 
 8137      7400
 8138              	.LASF324:
 8139 09b1 41646472 		.ascii	"Address\000"
 8139      65737300 
 8140              	.LASF254:
 8141 09b9 54565374 		.ascii	"TVStandard\000"
 8141      616E6461 
 8141      726400
 8142              	.LASF420:
 8143 09c4 456E6459 		.ascii	"EndY\000"
 8143      00
 8144              	.LASF54:
 8145 09c9 4150555F 		.ascii	"APU_APUExecuting\000"
 8145      41505545 
ARM GAS  /tmp/ccNOn6pJ.s 			page 161


 8145      78656375 
 8145      74696E67 
 8145      00
 8146              	.LASF197:
 8147 09da 524F4D46 		.ascii	"ROMFilename\000"
 8147      696C656E 
 8147      616D6500 
 8148              	.LASF133:
 8149 09e6 5472616E 		.ascii	"Transparency\000"
 8149      73706172 
 8149      656E6379 
 8149      00
 8150              	.LASF3:
 8151 09f3 6C6F6E67 		.ascii	"long unsigned int\000"
 8151      20756E73 
 8151      69676E65 
 8151      6420696E 
 8151      7400
 8152              	.LASF184:
 8153 0a05 524F4D53 		.ascii	"ROMSize\000"
 8153      697A6500 
 8154              	.LASF352:
 8155 0a0d 56426561 		.ascii	"VBeamFlip\000"
 8155      6D466C69 
 8155      7000
 8156              	.LASF462:
 8157 0a17 57616974 		.ascii	"WaitAddress2\000"
 8157      41646472 
 8157      65737332 
 8157      00
 8158              	.LASF249:
 8159 0a24 5F5A4E37 		.ascii	"_ZN7CMemory10ScoreLoROMEh\000"
 8159      434D656D 
 8159      6F727931 
 8159      3053636F 
 8159      72654C6F 
 8160              	.LASF209:
 8161 0a3e 5F5A4E37 		.ascii	"_ZN7CMemory6DeinitEv\000"
 8161      434D656D 
 8161      6F727936 
 8161      4465696E 
 8161      69744576 
 8162              	.LASF86:
 8163 0a53 466F7263 		.ascii	"ForceLoROM\000"
 8163      654C6F52 
 8163      4F4D00
 8164              	.LASF399:
 8165 0a5e 4E656564 		.ascii	"Need16x8Mulitply\000"
 8165      31367838 
 8165      4D756C69 
 8165      74706C79 
 8165      00
 8166              	.LASF337:
 8167 0a6f 42473350 		.ascii	"BG3Priority\000"
 8167      72696F72 
 8167      69747900 
 8168              	.LASF257:
ARM GAS  /tmp/ccNOn6pJ.s 			page 162


 8169 0a7b 5F5A4E37 		.ascii	"_ZN7CMemory5SpeedEv\000"
 8169      434D656D 
 8169      6F727935 
 8169      53706565 
 8169      64457600 
 8170              	.LASF280:
 8171 0a8f 52696768 		.ascii	"Right\000"
 8171      7400
 8172              	.LASF107:
 8173 0a95 436F6E74 		.ascii	"ControllerOption\000"
 8173      726F6C6C 
 8173      65724F70 
 8173      74696F6E 
 8173      00
 8174              	.LASF42:
 8175 0aa6 5352414D 		.ascii	"SRAMModified\000"
 8175      4D6F6469 
 8175      66696564 
 8175      00
 8176              	.LASF90:
 8177 0ab3 466F7263 		.ascii	"ForceInterleaved\000"
 8177      65496E74 
 8177      65726C65 
 8177      61766564 
 8177      00
 8178              	.LASF196:
 8179 0ac4 53444431 		.ascii	"SDD1LoggedData\000"
 8179      4C6F6767 
 8179      65644461 
 8179      746100
 8180              	.LASF267:
 8181 0ad3 5F5A4E37 		.ascii	"_ZN7CMemory4SizeEv\000"
 8181      434D656D 
 8181      6F727934 
 8181      53697A65 
 8181      457600
 8182              	.LASF447:
 8183 0ae6 5F4E6567 		.ascii	"_Negative\000"
 8183      61746976 
 8183      6500
 8184              	.LASF499:
 8185 0af0 5339784F 		.ascii	"S9xOpcodesM0X1\000"
 8185      70636F64 
 8185      65734D30 
 8185      583100
 8186              	.LASF118:
 8187 0aff 52657665 		.ascii	"ReverseStereo\000"
 8187      72736553 
 8187      74657265 
 8187      6F00
 8188              	.LASF262:
 8189 0b0d 4D61704D 		.ascii	"MapMode\000"
 8189      6F646500 
 8190              	.LASF232:
 8191 0b15 4869524F 		.ascii	"HiROMMap\000"
 8191      4D4D6170 
 8191      00
ARM GAS  /tmp/ccNOn6pJ.s 			page 163


 8192              	.LASF83:
 8193 0b1e 4672616D 		.ascii	"FrameTimeNTSC\000"
 8193      6554696D 
 8193      654E5453 
 8193      4300
 8194              	.LASF176:
 8195 0b2c 4D656D6F 		.ascii	"MemorySpeed\000"
 8195      72795370 
 8195      65656400 
 8196              	.LASF225:
 8197 0b38 5F5A4E37 		.ascii	"_ZN7CMemory13LoROM24MBSMapEv\000"
 8197      434D656D 
 8197      6F727931 
 8197      334C6F52 
 8197      4F4D3234 
 8198              	.LASF308:
 8199 0b55 4A6F7970 		.ascii	"Joypads\000"
 8199      61647300 
 8200              	.LASF362:
 8201 0b5d 43474144 		.ascii	"CGADD\000"
 8201      4400
 8202              	.LASF239:
 8203 0b63 5F5A4E37 		.ascii	"_ZN7CMemory11AlphaROMMapEv\000"
 8203      434D656D 
 8203      6F727931 
 8203      31416C70 
 8203      6861524F 
 8204              	.LASF437:
 8205 0b7e 56506F73 		.ascii	"VPositions\000"
 8205      6974696F 
 8205      6E7300
 8206              	.LASF343:
 8207 0b89 4F414D50 		.ascii	"OAMPriorityRotation\000"
 8207      72696F72 
 8207      69747952 
 8207      6F746174 
 8207      696F6E00 
 8208              	.LASF428:
 8209 0b9d 72323132 		.ascii	"r212e_s\000"
 8209      655F7300 
 8210              	.LASF51:
 8211 0ba5 4D656D6F 		.ascii	"Memory_SRAM\000"
 8211      72795F53 
 8211      52414D00 
 8212              	.LASF233:
 8213 0bb1 5F5A4E37 		.ascii	"_ZN7CMemory8HiROMMapEv\000"
 8213      434D656D 
 8213      6F727938 
 8213      4869524F 
 8213      4D4D6170 
 8214              	.LASF430:
 8215 0bc8 72323133 		.ascii	"r2130\000"
 8215      3000
 8216              	.LASF198:
 8217 0bce 4C6F6164 		.ascii	"LoadROM\000"
 8217      524F4D00 
 8218              	.LASF441:
ARM GAS  /tmp/ccNOn6pJ.s 			page 164


 8219 0bd6 534F7063 		.ascii	"SOpcodes\000"
 8219      6F646573 
 8219      00
 8220              	.LASF128:
 8221 0bdf 54687265 		.ascii	"ThreadSound\000"
 8221      6164536F 
 8221      756E6400 
 8222              	.LASF302:
 8223 0beb 47726565 		.ascii	"Green\000"
 8223      6E00
 8224              	.LASF151:
 8225 0bf1 54757262 		.ascii	"TurboSkipFrames\000"
 8225      6F536B69 
 8225      70467261 
 8225      6D657300 
 8226              	.LASF126:
 8227 0c01 536F756E 		.ascii	"SoundSync\000"
 8227      6453796E 
 8227      6300
 8228              	.LASF465:
 8229 0c0b 70616430 		.ascii	"pad0\000"
 8229      00
 8230              	.LASF470:
 8231 0c10 70616431 		.ascii	"pad1\000"
 8231      00
 8232              	.LASF289:
 8233 0c15 44697265 		.ascii	"DirectColourMapsNeedRebuild\000"
 8233      6374436F 
 8233      6C6F7572 
 8233      4D617073 
 8233      4E656564 
 8234              	.LASF119:
 8235 0c31 53697874 		.ascii	"SixteenBitSound\000"
 8235      65656E42 
 8235      6974536F 
 8235      756E6400 
 8236              	.LASF6:
 8237 0c41 6C6F6E67 		.ascii	"long long int\000"
 8237      206C6F6E 
 8237      6720696E 
 8237      7400
 8238              	.LASF273:
 8239 0c4f 5F5A4E37 		.ascii	"_ZN7CMemory9CompanyIDEv\000"
 8239      434D656D 
 8239      6F727939 
 8239      436F6D70 
 8239      616E7949 
 8240              	.LASF144:
 8241 0c67 53657276 		.ascii	"ServerName\000"
 8241      65724E61 
 8241      6D6500
 8242              	.LASF57:
 8243 0c72 5F50414C 		.ascii	"_PALMSOS_R10\000"
 8243      4D534F53 
 8243      5F523130 
 8243      00
 8244              	.LASF121:
ARM GAS  /tmp/ccNOn6pJ.s 			page 165


 8245 0c7f 536F756E 		.ascii	"SoundMixInterval\000"
 8245      644D6978 
 8245      496E7465 
 8245      7276616C 
 8245      00
 8246              	.LASF38:
 8247 0c90 4E4D4943 		.ascii	"NMICycleCount\000"
 8247      79636C65 
 8247      436F756E 
 8247      7400
 8248              	.LASF278:
 8249 0c9e 436F756E 		.ascii	"Count\000"
 8249      7400
 8250              	.LASF175:
 8251 0ca4 57726974 		.ascii	"WriteMap\000"
 8251      654D6170 
 8251      00
 8252              	.LASF341:
 8253 0cad 46697273 		.ascii	"FirstSprite\000"
 8253      74537072 
 8253      69746500 
 8254              	.LASF444:
 8255 0cb9 5339784F 		.ascii	"S9xOpcodes\000"
 8255      70636F64 
 8255      657300
 8256              	.LASF112:
 8257 0cc4 53757065 		.ascii	"SuperFX\000"
 8257      72465800 
 8258              	.LASF103:
 8259 0ccc 4D756C74 		.ascii	"MultiPlayer5\000"
 8259      69506C61 
 8259      79657235 
 8259      00
 8260              	.LASF206:
 8261 0cd9 496E6974 		.ascii	"Init\000"
 8261      00
 8262              	.LASF47:
 8263 0cde 4D656D6F 		.ascii	"Memory_Map\000"
 8263      72795F4D 
 8263      617000
 8264              	.LASF476:
 8265 0ce9 64657074 		.ascii	"depth\000"
 8265      6800
 8266              	.LASF132:
 8267 0cef 53697874 		.ascii	"SixteenBit\000"
 8267      65656E42 
 8267      697400
 8268              	.LASF492:
 8269 0cfa 524F7043 		.ascii	"ROpCount\000"
 8269      6F756E74 
 8269      00
 8270              	.LASF91:
 8271 0d03 466F7263 		.ascii	"ForceInterleaved2\000"
 8271      65496E74 
 8271      65726C65 
 8271      61766564 
 8271      3200
ARM GAS  /tmp/ccNOn6pJ.s 			page 166


 8272              	.LASF474:
 8273 0d15 44726177 		.ascii	"DrawBGMode7Background16R3\000"
 8273      42474D6F 
 8273      64653742 
 8273      61636B67 
 8273      726F756E 
 8274              	.LASF124:
 8275 0d2f 44697361 		.ascii	"DisableSampleCaching\000"
 8275      626C6553 
 8275      616D706C 
 8275      65436163 
 8275      68696E67 
 8276              	.LASF387:
 8277 0d44 57696E64 		.ascii	"Window1Right\000"
 8277      6F773152 
 8277      69676874 
 8277      00
 8278              	.LASF473:
 8279 0d51 45787472 		.ascii	"ExtraRAM\000"
 8279      6152414D 
 8279      00
 8280              	.LASF193:
 8281 0d5a 53444431 		.ascii	"SDD1Entries\000"
 8281      456E7472 
 8281      69657300 
 8282              	.LASF285:
 8283 0d66 4D617842 		.ascii	"MaxBrightness\000"
 8283      72696768 
 8283      746E6573 
 8283      7300
 8284              	.LASF21:
 8285 0d74 4272616E 		.ascii	"BranchSkip\000"
 8285      6368536B 
 8285      697000
 8286              	.LASF432:
 8287 0d7f 72323133 		.ascii	"r2131\000"
 8287      3100
 8288              	.LASF99:
 8289 0d85 466F7263 		.ascii	"ForceC4\000"
 8289      65433400 
 8290              	.LASF229:
 8291 0d8d 5F5A4E37 		.ascii	"_ZN7CMemory17SRAM1024KLoROMMapEv\000"
 8291      434D656D 
 8291      6F727931 
 8291      37535241 
 8291      4D313032 
 8292              	.LASF246:
 8293 0dae 53636F72 		.ascii	"ScoreHiROM\000"
 8293      65486952 
 8293      4F4D00
 8294              	.LASF34:
 8295 0db9 4D656D53 		.ascii	"MemSpeedx2\000"
 8295      70656564 
 8295      783200
 8296              	.LASF139:
 8297 0dc4 466F7263 		.ascii	"ForceNoTransparency\000"
 8297      654E6F54 
ARM GAS  /tmp/ccNOn6pJ.s 			page 167


 8297      72616E73 
 8297      70617265 
 8297      6E637900 
 8298              	.LASF59:
 8299 0dd8 44535047 		.ascii	"DSPGet\000"
 8299      657400
 8300              	.LASF395:
 8301 0ddf 436C6970 		.ascii	"ClipWindow2Inside\000"
 8301      57696E64 
 8301      6F773249 
 8301      6E736964 
 8301      6500
 8302              	.LASF221:
 8303 0df1 5F5A4E37 		.ascii	"_ZN7CMemory4SafeEPKc\000"
 8303      434D656D 
 8303      6F727934 
 8303      53616665 
 8303      45504B63 
 8304              	.LASF414:
 8305 0e06 53637265 		.ascii	"ScreenColorsPre\000"
 8305      656E436F 
 8305      6C6F7273 
 8305      50726500 
 8306              	.LASF0:
 8307 0e16 756E7369 		.ascii	"unsigned int\000"
 8307      676E6564 
 8307      20696E74 
 8307      00
 8308              	.LASF136:
 8309 0e23 42474C61 		.ascii	"BGLayering\000"
 8309      79657269 
 8309      6E6700
 8310              	.LASF165:
 8311 0e2e 434D656D 		.ascii	"CMemory\000"
 8311      6F727900 
 8312              	.LASF138:
 8313 0e36 466F7263 		.ascii	"ForceTransparency\000"
 8313      65547261 
 8313      6E737061 
 8313      72656E63 
 8313      7900
 8314              	.LASF306:
 8315 0e48 43757272 		.ascii	"CurrentLine\000"
 8315      656E744C 
 8315      696E6500 
 8316              	.LASF172:
 8317 0e54 4C6F524F 		.ascii	"LoROM\000"
 8317      4D00
 8318              	.LASF507:
 8319 0e5a 2F686F6D 		.ascii	"/home/bitrider/hd_bitrider/snes/asmpsnes\000"
 8319      652F6269 
 8319      74726964 
 8319      65722F68 
 8319      645F6269 
 8320              	.LASF223:
 8321 0e83 5F5A4E37 		.ascii	"_ZN7CMemory8LoROMMapEv\000"
 8321      434D656D 
ARM GAS  /tmp/ccNOn6pJ.s 			page 168


 8321      6F727938 
 8321      4C6F524F 
 8321      4D4D6170 
 8322              	.LASF189:
 8323 0e9a 524F4D43 		.ascii	"ROMChecksum\000"
 8323      6865636B 
 8323      73756D00 
 8324              	.LASF385:
 8325 0ea6 4D6F6465 		.ascii	"Mode7Repeat\000"
 8325      37526570 
 8325      65617400 
 8326              	.LASF378:
 8327 0eb2 5654696D 		.ascii	"VTimerEnabled\000"
 8327      6572456E 
 8327      61626C65 
 8327      6400
 8328              	.LASF224:
 8329 0ec0 4C6F524F 		.ascii	"LoROM24MBSMap\000"
 8329      4D32344D 
 8329      42534D61 
 8329      7000
 8330              	.LASF72:
 8331 0ece 53746F70 		.ascii	"StopEmulation\000"
 8331      456D756C 
 8331      6174696F 
 8331      6E00
 8332              	.LASF355:
 8333 0edc 4D617472 		.ascii	"MatrixB\000"
 8333      69784200 
 8334              	.LASF309:
 8335 0ee4 50726576 		.ascii	"PrevMouseX\000"
 8335      4D6F7573 
 8335      655800
 8336              	.LASF353:
 8337 0eef 48564265 		.ascii	"HVBeamCounterLatched\000"
 8337      616D436F 
 8337      756E7465 
 8337      724C6174 
 8337      63686564 
 8338              	.LASF329:
 8339 0f04 53434261 		.ascii	"SCBase\000"
 8339      736500
 8340              	.LASF150:
 8341 0f0b 54757262 		.ascii	"TurboMode\000"
 8341      6F4D6F64 
 8341      6500
 8342              	.LASF17:
 8343 0f15 2E5F3238 		.ascii	"._28\000"
 8343      00
 8344              	.LASF301:
 8345 0f1a 52656E64 		.ascii	"RenderedScreenWidth\000"
 8345      65726564 
 8345      53637265 
 8345      656E5769 
 8345      64746800 
 8346              	.LASF425:
 8347 0f2e 72323132 		.ascii	"r212c_s\000"
ARM GAS  /tmp/ccNOn6pJ.s 			page 169


 8347      635F7300 
 8348              	.LASF28:
 8349 0f36 50434174 		.ascii	"PCAtOpcodeStart\000"
 8349      4F70636F 
 8349      64655374 
 8349      61727400 
 8350              	.LASF472:
 8351 0f46 70616433 		.ascii	"pad3\000"
 8351      00
 8352              	.LASF70:
 8353 0f4b 50617573 		.ascii	"Paused\000"
 8353      656400
 8354              	.LASF503:
 8355 0f52 4C696E65 		.ascii	"LineData\000"
 8355      44617461 
 8355      00
 8356              	.LASF403:
 8357 0f5b 4F414D57 		.ascii	"OAMWriteRegister\000"
 8357      72697465 
 8357      52656769 
 8357      73746572 
 8357      00
 8358              	.LASF244:
 8359 0f6c 416C6C41 		.ascii	"AllASCII\000"
 8359      53434949 
 8359      00
 8360              	.LASF220:
 8361 0f75 53616665 		.ascii	"Safe\000"
 8361      00
 8362              	.LASF454:
 8363 0f7a 4672616D 		.ascii	"FrameAdvanceCount\000"
 8363      65416476 
 8363      616E6365 
 8363      436F756E 
 8363      7400
 8364              	.LASF377:
 8365 0f8c 4F414D44 		.ascii	"OAMData\000"
 8365      61746100 
 8366              	.LASF145:
 8367 0f94 506F7274 		.ascii	"Port\000"
 8367      00
 8368              	.LASF282:
 8369 0f99 436F6C6F 		.ascii	"ColorsChanged\000"
 8369      72734368 
 8369      616E6765 
 8369      6400
 8370              	.LASF94:
 8371 0fa7 466F7263 		.ascii	"ForceNoSuperFX\000"
 8371      654E6F53 
 8371      75706572 
 8371      465800
 8372              	.LASF502:
 8373 0fb6 49415055 		.ascii	"IAPU\000"
 8373      00
 8374              	.LASF331:
 8375 0fbb 484F6666 		.ascii	"HOffset\000"
 8375      73657400 
ARM GAS  /tmp/ccNOn6pJ.s 			page 170


 8376              	.LASF69:
 8377 0fc3 44697361 		.ascii	"DisableIRQ\000"
 8377      626C6549 
 8377      525100
 8378              	.LASF108:
 8379 0fce 53687574 		.ascii	"ShutdownMaster\000"
 8379      646F776E 
 8379      4D617374 
 8379      657200
 8380              	.LASF381:
 8381 0fdd 4D6F7361 		.ascii	"Mosaic\000"
 8381      696300
 8382              	.LASF357:
 8383 0fe4 4D617472 		.ascii	"MatrixD\000"
 8383      69784400 
 8384              	.LASF18:
 8385 0fec 53526567 		.ascii	"SRegisters\000"
 8385      69737465 
 8385      727300
 8386              	.LASF73:
 8387 0ff7 54726163 		.ascii	"TraceDMA\000"
 8387      65444D41 
 8387      00
 8388              	.LASF227:
 8389 1000 5F5A4E37 		.ascii	"_ZN7CMemory16SRAM512KLoROMMapEv\000"
 8389      434D656D 
 8389      6F727931 
 8389      36535241 
 8389      4D353132 
 8390              	.LASF97:
 8391 1020 466F7263 		.ascii	"ForceSA1\000"
 8391      65534131 
 8391      00
 8392              	.LASF22:
 8393 1029 4E4D4941 		.ascii	"NMIActive\000"
 8393      63746976 
 8393      6500
 8394              	.LASF442:
 8395 1033 5339784F 		.ascii	"S9xOpcode\000"
 8395      70636F64 
 8395      6500
 8396              	.LASF181:
 8397 103d 436F6D70 		.ascii	"CompanyId\000"
 8397      616E7949 
 8397      6400
 8398              	.LASF411:
 8399 1047 44656C74 		.ascii	"Delta\000"
 8399      6100
 8400              	.LASF134:
 8401 104d 53757070 		.ascii	"SupportHiRes\000"
 8401      6F727448 
 8401      69526573 
 8401      00
 8402              	.LASF188:
 8403 105a 43616C63 		.ascii	"CalculatedChecksum\000"
 8403      756C6174 
 8403      65644368 
ARM GAS  /tmp/ccNOn6pJ.s 			page 171


 8403      65636B73 
 8403      756D00
 8404              	.LASF167:
 8405 106d 5352414D 		.ascii	"SRAM\000"
 8405      00
 8406              	.LASF242:
 8407 1072 42534869 		.ascii	"BSHiROMMap\000"
 8407      524F4D4D 
 8407      617000
 8408              	.LASF60:
 8409 107d 44535053 		.ascii	"DSPSet\000"
 8409      657400
 8410              	.LASF321:
 8411 1084 2E5F3338 		.ascii	"._38\000"
 8411      00
 8412              	.LASF255:
 8413 1089 5F5A4E37 		.ascii	"_ZN7CMemory10TVStandardEv\000"
 8413      434D656D 
 8413      6F727931 
 8413      30545653 
 8413      74616E64 
 8414              	.LASF299:
 8415 10a3 446F7562 		.ascii	"DoubleWidthPixels\000"
 8415      6C655769 
 8415      64746850 
 8415      6978656C 
 8415      7300
 8416              	.LASF31:
 8417 10b5 4E657874 		.ascii	"NextEvent\000"
 8417      4576656E 
 8417      7400
 8418              	.LASF7:
 8419 10bf 6C6F6E67 		.ascii	"long long unsigned int\000"
 8419      206C6F6E 
 8419      6720756E 
 8419      7369676E 
 8419      65642069 
 8420              	.LASF283:
 8421 10d6 48444D41 		.ascii	"HDMA\000"
 8421      00
 8422              	.LASF207:
 8423 10db 5F5A4E37 		.ascii	"_ZN7CMemory4InitEv\000"
 8423      434D656D 
 8423      6F727934 
 8423      496E6974 
 8423      457600
 8424              	.LASF190:
 8425 10ee 524F4D43 		.ascii	"ROMComplementChecksum\000"
 8425      6F6D706C 
 8425      656D656E 
 8425      74436865 
 8425      636B7375 
 8426              	.LASF349:
 8427 1104 56426561 		.ascii	"VBeamPosLatched\000"
 8427      6D506F73 
 8427      4C617463 
 8427      68656400 
ARM GAS  /tmp/ccNOn6pJ.s 			page 172


 8428              	.LASF52:
 8429 1114 4D656D6F 		.ascii	"Memory_BWRAM\000"
 8429      72795F42 
 8429      5752414D 
 8429      00
 8430              	.LASF436:
 8431 1121 53697A65 		.ascii	"Sizes\000"
 8431      7300
 8432              	.LASF23:
 8433 1127 49525141 		.ascii	"IRQActive\000"
 8433      63746976 
 8433      6500
 8434              	.LASF361:
 8435 1131 4A6F7970 		.ascii	"Joypad2ButtonReadPos\000"
 8435      61643242 
 8435      7574746F 
 8435      6E526561 
 8435      64506F73 
 8436              	.LASF397:
 8437 1146 4347464C 		.ascii	"CGFLIPRead\000"
 8437      49505265 
 8437      616400
 8438              	.LASF368:
 8439 1151 5752414D 		.ascii	"WRAM\000"
 8439      00
 8440              	.LASF493:
 8441 1156 47657442 		.ascii	"GetBank\000"
 8441      616E6B00 
 8442              	.LASF401:
 8443 115e 4D6F7573 		.ascii	"MouseSpeed\000"
 8443      65537065 
 8443      656400
 8444              	.LASF391:
 8445 1169 436C6970 		.ascii	"ClipWindowOverlapLogic\000"
 8445      57696E64 
 8445      6F774F76 
 8445      65726C61 
 8445      704C6F67 
 8446              	.LASF374:
 8447 1180 4F424A4E 		.ascii	"OBJNameBase\000"
 8447      616D6542 
 8447      61736500 
 8448              	.LASF504:
 8449 118c 4C696E65 		.ascii	"LineMatrixData\000"
 8449      4D617472 
 8449      69784461 
 8449      746100
 8450              	.LASF131:
 8451 119b 46697846 		.ascii	"FixFrequency\000"
 8451      72657175 
 8451      656E6379 
 8451      00
 8452              	.LASF129:
 8453 11a8 4D757465 		.ascii	"Mute\000"
 8453      00
 8454              	.LASF495:
 8455 11ad 49505055 		.ascii	"IPPU\000"
ARM GAS  /tmp/ccNOn6pJ.s 			page 173


 8455      00
 8456              	.LASF367:
 8457 11b2 53637265 		.ascii	"ScreenHeight\000"
 8457      656E4865 
 8457      69676874 
 8457      00
 8458              	.LASF50:
 8459 11bf 4D656D6F 		.ascii	"Memory_BlockIsRAM\000"
 8459      72795F42 
 8459      6C6F636B 
 8459      49735241 
 8459      4D00
 8460              	.LASF180:
 8461 11d1 524F4D49 		.ascii	"ROMId\000"
 8461      6400
 8462              	.LASF19:
 8463 11d7 53435055 		.ascii	"SCPUState\000"
 8463      53746174 
 8463      6500
 8464              	.LASF293:
 8465 11e1 536B6970 		.ascii	"SkippedFrames\000"
 8465      70656446 
 8465      72616D65 
 8465      7300
 8466              	.LASF494:
 8467 11ef 5369676E 		.ascii	"SignExtend\000"
 8467      45787465 
 8467      6E6400
 8468              	.LASF74:
 8469 11fa 54726163 		.ascii	"TraceHDMA\000"
 8469      6548444D 
 8469      4100
 8470              	.LASF468:
 8471 1204 54776F43 		.ascii	"TwoCycles\000"
 8471      79636C65 
 8471      7300
 8472              	.LASF252:
 8473 120e 43686563 		.ascii	"CheckForIPSPatch\000"
 8473      6B466F72 
 8473      49505350 
 8473      61746368 
 8473      00
 8474              	.LASF48:
 8475 121f 4D656D6F 		.ascii	"Memory_WriteMap\000"
 8475      72795F57 
 8475      72697465 
 8475      4D617000 
 8476              	.LASF483:
 8477 122f 5F5A3237 		.ascii	"_Z27DrawBGMode7Background16R1R2Phii\000"
 8477      44726177 
 8477      42474D6F 
 8477      64653742 
 8477      61636B67 
 8478              	.LASF475:
 8479 1253 5F5A3235 		.ascii	"_Z25DrawBGMode7Background16R3Phii\000"
 8479      44726177 
 8479      42474D6F 
ARM GAS  /tmp/ccNOn6pJ.s 			page 174


 8479      64653742 
 8479      61636B67 
 8480              	.LASF422:
 8481 1275 4D6F6465 		.ascii	"Mode7Mask\000"
 8481      374D6173 
 8481      6B00
 8482              	.LASF393:
 8483 127f 436C6970 		.ascii	"ClipWindow2Enable\000"
 8483      57696E64 
 8483      6F773245 
 8483      6E61626C 
 8483      6500
 8484              	.LASF443:
 8485 1291 53494350 		.ascii	"SICPU\000"
 8485      5500
 8486              	.LASF429:
 8487 1297 72323132 		.ascii	"r212f_s\000"
 8487      665F7300 
 8488              	.LASF298:
 8489 129f 4C617463 		.ascii	"LatchedInterlace\000"
 8489      68656449 
 8489      6E746572 
 8489      6C616365 
 8489      00
 8490              	.LASF27:
 8491 12b0 50434261 		.ascii	"PCBase\000"
 8491      736500
 8492              	.LASF204:
 8493 12b7 53617665 		.ascii	"SaveSRAM\000"
 8493      5352414D 
 8493      00
 8494              	.LASF55:
 8495 12c0 5F41524D 		.ascii	"_ARM_asm_padding2\000"
 8495      5F61736D 
 8495      5F706164 
 8495      64696E67 
 8495      3200
 8496              	.LASF202:
 8497 12d2 4C6F6164 		.ascii	"LoadSRAM\000"
 8497      5352414D 
 8497      00
 8498              	.LASF270:
 8499 12db 524F4D49 		.ascii	"ROMID\000"
 8499      4400
 8500              	.LASF291:
 8501 12e1 52656E64 		.ascii	"RenderedFramesCount\000"
 8501      65726564 
 8501      4672616D 
 8501      6573436F 
 8501      756E7400 
 8502              	.LASF417:
 8503 12f5 44657074 		.ascii	"DepthDelta\000"
 8503      6844656C 
 8503      746100
 8504              	.LASF320:
 8505 1300 53505055 		.ascii	"SPPU\000"
 8505      00
ARM GAS  /tmp/ccNOn6pJ.s 			page 175


 8506              	.LASF500:
 8507 1305 5339784F 		.ascii	"S9xOpcodesM0X0\000"
 8507      70636F64 
 8507      65734D30 
 8507      583000
 8508              	.LASF389:
 8509 1314 57696E64 		.ascii	"Window2Right\000"
 8509      6F773252 
 8509      69676874 
 8509      00
 8510              	.LASF113:
 8511 1321 44535031 		.ascii	"DSP1Master\000"
 8511      4D617374 
 8511      657200
 8512              	.LASF62:
 8513 132c 53536574 		.ascii	"SSettings\000"
 8513      74696E67 
 8513      7300
 8514              	.LASF29:
 8515 1336 57616974 		.ascii	"WaitAddress\000"
 8515      41646472 
 8515      65737300 
 8516              	.LASF449:
 8517 1342 43505545 		.ascii	"CPUExecuting\000"
 8517      78656375 
 8517      74696E67 
 8517      00
 8518              	.LASF496:
 8519 134f 44697265 		.ascii	"DirectColourMaps\000"
 8519      6374436F 
 8519      6C6F7572 
 8519      4D617073 
 8519      00
 8520              	.LASF379:
 8521 1360 4854696D 		.ascii	"HTimerEnabled\000"
 8521      6572456E 
 8521      61626C65 
 8521      6400
 8522              	.LASF259:
 8523 136e 5F5A4E37 		.ascii	"_ZN7CMemory13StaticRAMSizeEv\000"
 8523      434D656D 
 8523      6F727931 
 8523      33537461 
 8523      74696352 
 8524              	.LASF360:
 8525 138b 4A6F7970 		.ascii	"Joypad1ButtonReadPos\000"
 8525      61643142 
 8525      7574746F 
 8525      6E526561 
 8525      64506F73 
 8526              	.LASF11:
 8527 13a0 75696E74 		.ascii	"uint8\000"
 8527      3800
 8528              	.LASF327:
 8529 13a6 53686966 		.ascii	"Shift\000"
 8529      7400
 8530              	.LASF313:
ARM GAS  /tmp/ccNOn6pJ.s 			page 176


 8531 13ac 48506F73 		.ascii	"HPos\000"
 8531      00
 8532              	.LASF478:
 8533 13b1 436C6970 		.ascii	"ClipCount\000"
 8533      436F756E 
 8533      7400
 8534              	.LASF141:
 8535 13bb 44697370 		.ascii	"DisplayFrameRate\000"
 8535      6C617946 
 8535      72616D65 
 8535      52617465 
 8535      00
 8536              	.LASF346:
 8537 13cc 4F414D54 		.ascii	"OAMTileAddress\000"
 8537      696C6541 
 8537      64647265 
 8537      737300
 8538              	.LASF5:
 8539 13db 73686F72 		.ascii	"short int\000"
 8539      7420696E 
 8539      7400
 8540              	.LASF92:
 8541 13e5 466F7263 		.ascii	"ForceNotInterleaved\000"
 8541      654E6F74 
 8541      496E7465 
 8541      726C6561 
 8541      76656400 
 8542              	.LASF356:
 8543 13f9 4D617472 		.ascii	"MatrixC\000"
 8543      69784300 
 8544              	.LASF339:
 8545 1401 4347464C 		.ascii	"CGFLIP\000"
 8545      495000
 8546              	.LASF61:
 8547 1408 72737461 		.ascii	"rstatus\000"
 8547      74757300 
 8548              	.LASF412:
 8549 1410 5A45524F 		.ascii	"ZERO_OR_X2\000"
 8549      5F4F525F 
 8549      583200
 8550              	.LASF147:
 8551 141b 4F70656E 		.ascii	"OpenGLEnable\000"
 8551      474C456E 
 8551      61626C65 
 8551      00
 8552              	.LASF358:
 8553 1428 43656E74 		.ascii	"CentreX\000"
 8553      72655800 
 8554              	.LASF146:
 8555 1430 476C6964 		.ascii	"GlideEnable\000"
 8555      65456E61 
 8555      626C6500 
 8556              	.LASF506:
 8557 143c 6D6F6465 		.ascii	"mode7.cpp\000"
 8557      372E6370 
 8557      7000
 8558              	.LASF384:
ARM GAS  /tmp/ccNOn6pJ.s 			page 177


 8559 1446 4D6F6465 		.ascii	"Mode7VFlip\000"
 8559      3756466C 
 8559      697000
 8560              	.LASF286:
 8561 1451 4C617463 		.ascii	"LatchedBlanking\000"
 8561      68656442 
 8561      6C616E6B 
 8561      696E6700 
 8562              	.LASF295:
 8563 1461 54696C65 		.ascii	"TileCache\000"
 8563      43616368 
 8563      6500
 8564              	.LASF510:
 8565 146b 5F5A3235 		.ascii	"_Z25DrawBGMode7Background16R0Phii\000"
 8565      44726177 
 8565      42474D6F 
 8565      64653742 
 8565      61636B67 
 8566              	.LASF263:
 8567 148d 5F5A4E37 		.ascii	"_ZN7CMemory7MapModeEv\000"
 8567      434D656D 
 8567      6F727937 
 8567      4D61704D 
 8567      6F646545 
 8568              	.LASF264:
 8569 14a3 4B617274 		.ascii	"KartContents\000"
 8569      436F6E74 
 8569      656E7473 
 8569      00
 8570              	.LASF179:
 8571 14b0 524F4D4E 		.ascii	"ROMName\000"
 8571      616D6500 
 8572              	.LASF509:
 8573 14b8 5F5A4E37 		.ascii	"_ZN7CMemory7caCRC32EPhjj\000"
 8573      434D656D 
 8573      6F727937 
 8573      63614352 
 8573      43333245 
 8574              	.LASF137:
 8575 14d1 44697361 		.ascii	"DisableGraphicWindows\000"
 8575      626C6547 
 8575      72617068 
 8575      69635769 
 8575      6E646F77 
 8576              	.LASF364:
 8577 14e7 46697865 		.ascii	"FixedColourGreen\000"
 8577      64436F6C 
 8577      6F757247 
 8577      7265656E 
 8577      00
 8578              	.LASF466:
 8579 14f8 54696D65 		.ascii	"TimerErrorCounter\000"
 8579      72457272 
 8579      6F72436F 
 8579      756E7465 
 8579      7200
 8580              	.LASF351:
ARM GAS  /tmp/ccNOn6pJ.s 			page 178


 8581 150a 48426561 		.ascii	"HBeamFlip\000"
 8581      6D466C69 
 8581      7000
 8582              	.LASF435:
 8583 1514 4F424A4C 		.ascii	"OBJList\000"
 8583      69737400 
 8584              	.LASF212:
 8585 151c 57726974 		.ascii	"WriteProtectROM\000"
 8585      6550726F 
 8585      74656374 
 8585      524F4D00 
 8586              	.LASF370:
 8587 152c 466F7263 		.ascii	"ForcedBlanking\000"
 8587      6564426C 
 8587      616E6B69 
 8587      6E6700
 8588              	.LASF392:
 8589 153b 436C6970 		.ascii	"ClipWindow1Enable\000"
 8589      57696E64 
 8589      6F773145 
 8589      6E61626C 
 8589      6500
 8590              	.LASF30:
 8591 154d 57616974 		.ascii	"WaitCounter\000"
 8591      436F756E 
 8591      74657200 
 8592              	.LASF77:
 8593 1559 54726163 		.ascii	"TraceDSP\000"
 8593      65445350 
 8593      00
 8594              	.LASF143:
 8595 1562 4E657450 		.ascii	"NetPlayServer\000"
 8595      6C617953 
 8595      65727665 
 8595      7200
 8596              	.LASF316:
 8597 1570 56466C69 		.ascii	"VFlip\000"
 8597      7000
 8598              	.LASF82:
 8599 1576 4672616D 		.ascii	"FrameTimePAL\000"
 8599      6554696D 
 8599      6550414C 
 8599      00
 8600              	.LASF297:
 8601 1583 46697273 		.ascii	"FirstVRAMRead\000"
 8601      74565241 
 8601      4D526561 
 8601      6400
 8602              	.LASF109:
 8603 1591 4D756C74 		.ascii	"MultiPlayer5Master\000"
 8603      69506C61 
 8603      79657235 
 8603      4D617374 
 8603      657200
 8604              	.LASF448:
 8605 15a4 5F4F7665 		.ascii	"_Overflow\000"
 8605      72666C6F 
ARM GAS  /tmp/ccNOn6pJ.s 			page 179


 8605      7700
 8606              	.LASF460:
 8607 15ae 44697265 		.ascii	"DirectPage\000"
 8607      63745061 
 8607      676500
 8608              	.LASF247:
 8609 15b9 5F5A4E37 		.ascii	"_ZN7CMemory10ScoreHiROMEh\000"
 8609      434D656D 
 8609      6F727931 
 8609      3053636F 
 8609      72654869 
 8610              	.LASF43:
 8611 15d3 42524B54 		.ascii	"BRKTriggered\000"
 8611      72696767 
 8611      65726564 
 8611      00
 8612              	.LASF261:
 8613 15e0 5F5A4E37 		.ascii	"_ZN7CMemory7MapTypeEv\000"
 8613      434D656D 
 8613      6F727937 
 8613      4D617054 
 8613      79706545 
 8614              	.LASF123:
 8615 15f6 44697361 		.ascii	"DisableSoundEcho\000"
 8615      626C6553 
 8615      6F756E64 
 8615      4563686F 
 8615      00
 8616              	.LASF218:
 8617 1607 4D617045 		.ascii	"MapExtraRAM\000"
 8617      78747261 
 8617      52414D00 
 8618              	.LASF256:
 8619 1613 53706565 		.ascii	"Speed\000"
 8619      6400
 8620              	.LASF251:
 8621 1619 5F5A4E37 		.ascii	"_ZN7CMemory13ApplyROMFixesEv\000"
 8621      434D656D 
 8621      6F727931 
 8621      33417070 
 8621      6C79524F 
 8622              	.LASF120:
 8623 1636 536F756E 		.ascii	"SoundBufferSize\000"
 8623      64427566 
 8623      66657253 
 8623      697A6500 
 8624              	.LASF410:
 8625 1646 50697463 		.ascii	"Pitch\000"
 8625      6800
 8626              	.LASF214:
 8627 164c 46697852 		.ascii	"FixROMSpeed\000"
 8627      4F4D5370 
 8627      65656400 
 8628              	.LASF490:
 8629 1658 4D656D6F 		.ascii	"Memory\000"
 8629      727900
 8630              	.LASF347:
ARM GAS  /tmp/ccNOn6pJ.s 			page 180


 8631 165f 49525156 		.ascii	"IRQVBeamPos\000"
 8631      4265616D 
 8631      506F7300 
 8632              	.LASF231:
 8633 166b 5F5A4E37 		.ascii	"_ZN7CMemory19SufamiTurboLoROMMapEv\000"
 8633      434D656D 
 8633      6F727931 
 8633      39537566 
 8633      616D6954 
 8634              	.LASF386:
 8635 168e 57696E64 		.ascii	"Window1Left\000"
 8635      6F77314C 
 8635      65667400 
 8636              	.LASF20:
 8637 169a 466C6167 		.ascii	"Flags\000"
 8637      7300
 8638              	.LASF498:
 8639 16a0 5339784F 		.ascii	"S9xOpcodesM1X0\000"
 8639      70636F64 
 8639      65734D31 
 8639      583000
 8640              	.LASF497:
 8641 16af 5339784F 		.ascii	"S9xOpcodesM1X1\000"
 8641      70636F64 
 8641      65734D31 
 8641      583100
 8642              	.LASF164:
 8643 16be 53706565 		.ascii	"SpeedHacks\000"
 8643      64486163 
 8643      6B7300
 8644              	.LASF350:
 8645 16c9 48426561 		.ascii	"HBeamPosLatched\000"
 8645      6D506F73 
 8645      4C617463 
 8645      68656400 
 8646              	.LASF203:
 8647 16d9 5F5A4E37 		.ascii	"_ZN7CMemory8LoadSRAMEPKc\000"
 8647      434D656D 
 8647      6F727938 
 8647      4C6F6164 
 8647      5352414D 
 8648              	.LASF161:
 8649 16f2 41505552 		.ascii	"APURAMInitialValue\000"
 8649      414D496E 
 8649      69746961 
 8649      6C56616C 
 8649      756500
 8650              	.LASF287:
 8651 1705 4F424A43 		.ascii	"OBJChanged\000"
 8651      68616E67 
 8651      656400
 8652              	.LASF491:
 8653 1710 726F7073 		.ascii	"rops\000"
 8653      00
 8654              	.LASF182:
 8655 1715 524F4D53 		.ascii	"ROMSpeed\000"
 8655      70656564 
ARM GAS  /tmp/ccNOn6pJ.s 			page 181


 8655      00
 8656              	.LASF65:
 8657 171e 536F756E 		.ascii	"SoundSkipMethod\000"
 8657      64536B69 
 8657      704D6574 
 8657      686F6400 
 8658              	.LASF177:
 8659 172e 426C6F63 		.ascii	"BlockIsRAM\000"
 8659      6B497352 
 8659      414D00
 8660              	.LASF250:
 8661 1739 4170706C 		.ascii	"ApplyROMFixes\000"
 8661      79524F4D 
 8661      46697865 
 8661      7300
 8662              	.LASF127:
 8663 1747 496E7465 		.ascii	"InterpolatedSound\000"
 8663      72706F6C 
 8663      61746564 
 8663      536F756E 
 8663      6400
 8664              	.LASF292:
 8665 1759 44697370 		.ascii	"DisplayedRenderedFrameCount\000"
 8665      6C617965 
 8665      6452656E 
 8665      64657265 
 8665      64467261 
 8666              	.LASF110:
 8667 1775 53757065 		.ascii	"SuperScopeMaster\000"
 8667      7253636F 
 8667      70654D61 
 8667      73746572 
 8667      00
 8668              	.LASF277:
 8669 1786 436C6970 		.ascii	"ClipData\000"
 8669      44617461 
 8669      00
 8670              	.LASF243:
 8671 178f 5F5A4E37 		.ascii	"_ZN7CMemory10BSHiROMMapEv\000"
 8671      434D656D 
 8671      6F727931 
 8671      30425348 
 8671      69524F4D 
 8672              	.LASF79:
 8673 17a9 4A6F7973 		.ascii	"JoystickEnabled\000"
 8673      7469636B 
 8673      456E6162 
 8673      6C656400 
 8674              	.LASF236:
 8675 17b9 54616C65 		.ascii	"TalesROMMap\000"
 8675      73524F4D 
 8675      4D617000 
 8676              	.LASF366:
 8677 17c5 53617665 		.ascii	"SavedOAMAddr\000"
 8677      644F414D 
 8677      41646472 
 8677      00
ARM GAS  /tmp/ccNOn6pJ.s 			page 182


 8678              	.LASF281:
 8679 17d2 496E7465 		.ascii	"InternalPPU\000"
 8679      726E616C 
 8679      50505500 
 8680              	.LASF416:
 8681 17de 50616C65 		.ascii	"PaletteShift\000"
 8681      74746553 
 8681      68696674 
 8681      00
 8682              	.LASF178:
 8683 17eb 426C6F63 		.ascii	"BlockIsROM\000"
 8683      6B497352 
 8683      4F4D00
 8684              	.LASF304:
 8685 17f6 53637265 		.ascii	"ScreenColors\000"
 8685      656E436F 
 8685      6C6F7273 
 8685      00
 8686              	.LASF312:
 8687 1803 534F424A 		.ascii	"SOBJ\000"
 8687      00
 8688              	.LASF114:
 8689 1808 53444431 		.ascii	"SDD1\000"
 8689      00
 8690              	.LASF67:
 8691 180d 48426C61 		.ascii	"HBlankStart\000"
 8691      6E6B5374 
 8691      61727400 
 8692              	.LASF334:
 8693 1819 53435369 		.ascii	"SCSize\000"
 8693      7A6500
 8694              	.LASF317:
 8695 1820 48466C69 		.ascii	"HFlip\000"
 8695      7000
 8696              	.LASF66:
 8697 1826 485F4D61 		.ascii	"H_Max\000"
 8697      7800
 8698              	.LASF340:
 8699 182c 43474441 		.ascii	"CGDATA\000"
 8699      544100
 8700              	.LASF148:
 8701 1833 4175746F 		.ascii	"AutoSaveDelay\000"
 8701      53617665 
 8701      44656C61 
 8701      7900
 8702              	.LASF240:
 8703 1841 53413152 		.ascii	"SA1ROMMap\000"
 8703      4F4D4D61 
 8703      7000
 8704              	.LASF372:
 8705 184b 4F424A54 		.ascii	"OBJThroughSub\000"
 8705      68726F75 
 8705      67685375 
 8705      6200
 8706              	.LASF78:
 8707 1859 53776170 		.ascii	"SwapJoypads\000"
 8707      4A6F7970 
ARM GAS  /tmp/ccNOn6pJ.s 			page 183


 8707      61647300 
 8708              	.LASF481:
 8709 1865 44657074 		.ascii	"Depth\000"
 8709      6800
 8710              	.LASF15:
 8711 186b 696E7433 		.ascii	"int32\000"
 8711      3200
 8712              	.LASF98:
 8713 1871 466F7263 		.ascii	"ForceNoSA1\000"
 8713      654E6F53 
 8713      413100
 8714              	.LASF284:
 8715 187c 48444D41 		.ascii	"HDMAStarted\000"
 8715      53746172 
 8715      74656400 
 8716              	.LASF160:
 8717 1888 44616666 		.ascii	"DaffyDuck\000"
 8717      79447563 
 8717      6B00
 8718              	.LASF269:
 8719 1892 5F5A4E37 		.ascii	"_ZN7CMemory7HeadersEv\000"
 8719      434D656D 
 8719      6F727937 
 8719      48656164 
 8719      65727345 
 8720              	.LASF404:
 8721 18a8 42476E78 		.ascii	"BGnxOFSbyte\000"
 8721      4F465362 
 8721      79746500 
 8722              	.LASF380:
 8723 18b4 4854696D 		.ascii	"HTimerPosition\000"
 8723      6572506F 
 8723      73697469 
 8723      6F6E00
 8724              	.LASF405:
 8725 18c3 53474658 		.ascii	"SGFX\000"
 8725      00
 8726              	.LASF335:
 8727 18c8 4F666673 		.ascii	"OffsetsChanged\000"
 8727      65747343 
 8727      68616E67 
 8727      656400
 8728              	.LASF41:
 8729 18d7 57686963 		.ascii	"WhichEvent\000"
 8729      68457665 
 8729      6E7400
 8730              	.LASF201:
 8731 18e2 5F5A4E37 		.ascii	"_ZN7CMemory7InitROMEh\000"
 8731      434D656D 
 8731      6F727937 
 8731      496E6974 
 8731      524F4D45 
 8732              	.LASF12:
 8733 18f8 75696E74 		.ascii	"uint16\000"
 8733      313600
 8734              	.LASF168:
 8735 18ff 42575241 		.ascii	"BWRAM\000"
ARM GAS  /tmp/ccNOn6pJ.s 			page 184


 8735      4D00
 8736              	.LASF25:
 8737 1905 52656773 		.ascii	"Regs\000"
 8737      00
 8738              	.LASF452:
 8739 190a 4672616D 		.ascii	"Frame\000"
 8739      6500
 8740              	.LASF461:
 8741 1910 57616974 		.ascii	"WaitAddress1\000"
 8741      41646472 
 8741      65737331 
 8741      00
 8742              	.LASF53:
 8743 191d 4D656D6F 		.ascii	"Memory_SRAMMask\000"
 8743      72795F53 
 8743      52414D4D 
 8743      61736B00 
 8744              	.LASF76:
 8745 192d 54726163 		.ascii	"TraceUnknownRegisters\000"
 8745      65556E6B 
 8745      6E6F776E 
 8745      52656769 
 8745      73746572 
 8746              	.LASF163:
 8747 1943 61736D73 		.ascii	"asmspc700\000"
 8747      70633730 
 8747      3000
 8748              	.LASF49:
 8749 194d 4D656D6F 		.ascii	"Memory_MemorySpeed\000"
 8749      72795F4D 
 8749      656D6F72 
 8749      79537065 
 8749      656400
 8750              	.LASF171:
 8751 1960 4869524F 		.ascii	"HiROM\000"
 8751      4D00
 8752              	.LASF95:
 8753 1966 466F7263 		.ascii	"ForceDSP1\000"
 8753      65445350 
 8753      3100
 8754              	.LASF332:
 8755 1970 42475369 		.ascii	"BGSize\000"
 8755      7A6500
 8756              		.ident	"GCC: (GNU) 4.1.1"
