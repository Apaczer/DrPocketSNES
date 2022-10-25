	.file	"mode7.cpp"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.align	2
	.p2align 5,,31
	.global	_Z25DrawBGMode7Background16R3Phii
	.type	_Z25DrawBGMode7Background16R3Phii, %function
_Z25DrawBGMode7Background16R3Phii:
.LFB29:
	.file 1 "mode7.cpp"
	.loc 1 58 0
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
.LBB2:
	.loc 1 64 0
	ldr	ip, .L20
.LBE2:
	.loc 1 58 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI0:
.LBB3:
	.loc 1 86 0
	ldr	r1, [ip, #72]
.LVL1:
	.loc 1 64 0
	ldr	r3, [ip, #80]
.LBE3:
	.loc 1 58 0
	sub	sp, sp, #136
.LCFI1:
.LBB4:
	.loc 1 86 0
	str	r1, [sp, #0]
.LVL2:
	.loc 1 64 0
	str	r3, [sp, #48]
	.loc 1 209 0
	ldr	r5, [sp, #0]
	ldr	r3, .L20+4
	.loc 1 87 0
	ldr	lr, [ip, #40]
	.loc 1 209 0
	mov	r1, #12
	.loc 1 87 0
	ldr	r7, [sp, #0]
	.loc 1 209 0
	mla	r1, r5, r1, r3
	.loc 1 86 0
	mov	r3, #640
	mla	r5, r3, r5, r0
	.loc 1 87 0
	sub	r3, r3, #320
	mla	r7, r3, r7, lr
	.loc 1 209 0
	ldr	r3, .L20+8
	.loc 1 64 0
	ldr	r6, [sp, #48]
	.loc 1 209 0
	ldr	r3, [r3, #8]
	.loc 1 97 0
	ldr	r4, .L20+12
	.loc 1 64 0
	ldr	r6, [r6, #0]
	.loc 1 209 0
	ldr	sl, [sp, #0]
	str	r3, [sp, #80]
	ldr	r3, .L20+16
	ldr	r9, [ip, #44]
	.loc 1 90 0
	ldr	ip, [ip, #76]
	.loc 1 118 0
	ldrb	r8, [r4, #2743]	@ zero_extendqisi2
	.loc 1 97 0
	ldrb	r4, [r4, #2744]	@ zero_extendqisi2
	.loc 1 209 0
	add	r3, r3, sl, asl #4
	.loc 1 84 0
	cmp	r6, #0
	.loc 1 90 0
	str	ip, [sp, #52]
	.loc 1 84 0
	moveq	r6, #1
	.loc 1 209 0
	add	r1, r1, #12
	add	r3, r3, #2
	rsb	fp, sl, #255
	mov	ip, #0
	mov	lr, #256
	.loc 1 86 0
	str	r5, [sp, #124]
.LVL3:
	.loc 1 87 0
	str	r7, [sp, #116]
.LVL4:
	.loc 1 118 0
	str	r8, [sp, #76]
	.loc 1 209 0
	str	r9, [sp, #84]
	.loc 1 97 0
	str	r4, [sp, #56]
	.loc 1 84 0
	str	r6, [sp, #96]
.LVL5:
.LBE4:
	.loc 1 58 0
	str	r2, [sp, #44]
.LBB5:
	.loc 1 209 0
	stmib	sp, {r1, r3}	@ phole stm
	str	fp, [sp, #120]
	str	ip, [sp, #88]
.LVL6:
	str	lr, [sp, #92]
.LVL7:
	b	.L4
.LVL8:
.L5:
	.loc 1 95 0
.LVL9:
	ldmib	sp, {r0, r3}	@ phole ldm
	ldrsh	r1, [r0, #-2]
	.loc 1 92 0
	ldrh	r2, [r3, #-2]
	.loc 1 103 0
	ldr	r4, [sp, #4]
	.loc 1 97 0
	ldr	r6, [sp, #56]
	ldr	r5, [sp, #120]
	.loc 1 91 0
	ldrh	ip, [r3, #0]
	.loc 1 95 0
	mov	r1, r1, asl #19
	.loc 1 97 0
	ldr	r3, [sp, #0]
.LVL10:
	.loc 1 95 0
	mov	r1, r1, asr #19
.LVL11:
	.loc 1 103 0
	ldrsh	lr, [r4, #-10]
	.loc 1 100 0
	mov	r2, r2, asl #19
	.loc 1 94 0
	ldrsh	r0, [r0, #-4]
	.loc 1 104 0
	ldrsh	r4, [r4, #-6]
	.loc 1 97 0
	cmp	r6, #0
	.loc 1 100 0
	rsb	r2, r1, r2, asr #19
	.loc 1 97 0
	movne	r3, r5
	.loc 1 100 0
	add	r3, r3, r2
.LVL12:
	.loc 1 106 0
	add	r2, r3, r1
	.loc 1 91 0
	mov	ip, ip, asl #19
	.loc 1 94 0
	mov	r0, r0, asl #19
	.loc 1 103 0
	mul	lr, r3, lr
	.loc 1 104 0
	mul	r4, r3, r4
	.loc 1 106 0
	ldr	r8, [sp, #48]
	.loc 1 94 0
	mov	r0, r0, asr #19
.LVL13:
	.loc 1 91 0
	mov	ip, ip, asr #19
	.loc 1 106 0
	and	r2, r2, #7
	.loc 1 103 0
	mov	r7, r0, asl #8
	.loc 1 106 0
	mov	r2, r2, asl #4
	.loc 1 101 0
	rsb	r0, r0, ip
.LVL14:
	.loc 1 104 0
	mov	r1, r1, asl #8
.LVL15:
	.loc 1 106 0
	mov	r9, #0
	.loc 1 103 0
	str	lr, [sp, #60]
	.loc 1 104 0
	str	r4, [sp, #68]
	.loc 1 91 0
	str	ip, [sp, #100]
	.loc 1 103 0
	str	r7, [sp, #64]
	.loc 1 106 0
	str	r2, [sp, #108]
	.loc 1 101 0
	str	r0, [sp, #104]
	.loc 1 104 0
	str	r1, [sp, #72]
	.loc 1 106 0
	str	r8, [sp, #24]
	str	r9, [sp, #112]
	b	.L9
.LVL16:
.L10:
	.loc 1 110 0
	ldr	sl, [sp, #48]
	ldr	r3, [sl, #0]
	cmp	r3, #0
	beq	.L11
	.loc 1 111 0
	ldr	fp, [sp, #24]
	.loc 1 112 0
	ldr	ip, [sp, #24]
	.loc 1 111 0
	ldr	fp, [fp, #24]
	.loc 1 112 0
	ldr	ip, [ip, #168]
	.loc 1 111 0
	str	fp, [sp, #88]
	.loc 1 113 0
	cmp	ip, fp
	.loc 1 112 0
	str	ip, [sp, #92]
	.loc 1 113 0
	bls	.L13
.L11:
	ldr	r2, [sp, #4]
	.loc 1 118 0
	ldr	lr, [sp, #76]
	ldrsh	r3, [r2, #-12]
	.loc 1 119 0
	ldr	r0, [sp, #92]
	ldrsh	r2, [r2, #-8]
	.loc 1 209 0
	ldr	r4, [sp, #4]
	.loc 1 118 0
	cmp	lr, #0
	.loc 1 119 0
	sub	r6, r0, #1
.LVL17:
	.loc 1 121 0
	rsbne	r2, r2, #0
	.loc 1 124 0
	ldreq	r6, [sp, #88]
	.loc 1 209 0
	ldr	r5, [sp, #104]
	.loc 1 121 0
	strne	r2, [sp, #128]
	.loc 1 126 0
	streq	r2, [sp, #128]
	.loc 1 209 0
	ldr	ip, [sp, #72]
	ldrsh	r2, [r4, #-8]
	.loc 1 120 0
	rsbne	r3, r3, #0
	.loc 1 125 0
	streq	r3, [sp, #132]
	.loc 1 121 0
	mvn	r1, #0
	.loc 1 126 0
	moveq	r3, #1
	.loc 1 121 0
	str	r1, [sp, #20]
	.loc 1 120 0
	strne	r3, [sp, #132]
	.loc 1 126 0
	streq	r3, [sp, #20]
	.loc 1 209 0
	add	r3, r6, r5
	ldrsh	r1, [r4, #-12]
	mla	ip, r3, r2, ip
	ldr	r2, [sp, #64]
	ldr	r9, [sp, #88]
	ldr	r8, [sp, #92]
	ldr	sl, [sp, #124]
	ldr	fp, [sp, #116]
	ldr	r7, [sp, #100]
	ldr	lr, [sp, #68]
	mla	r2, r3, r1, r2
	ldr	r0, [sp, #60]
	rsb	r8, r9, r8
	add	sl, sl, r9, asl #1
	add	fp, fp, r9
	add	r6, r6, r7
.LVL18:
	add	ip, lr, ip
	str	r8, [sp, #16]
	str	sl, [sp, #32]
	str	fp, [sp, #28]
	add	r2, r0, r2
	ldr	r4, [sp, #80]
	ldr	r5, [sp, #84]
	ldr	r7, [sp, #44]
	ldr	r9, [sp, #20]
	ldr	lr, [sp, #108]
#APP
	1:						
	ldrb	r0, [fp], #1			
	add	sl, sl, #2			
	cmp	r7, r0			
	bls	4f				
	mov	r3, r2, asr #18		
	orrs	r3, r3, ip, asr #18		
	bne	2f				
						
	mov	r3, ip, asr #11		
	mov	r1, r2, asr #11		
	add	r3, r1, r3, lsl #7		
	ldrb	r3, [r4, r3, lsl #1]	
						
	and	r1, ip, #(7 << 8)		
	add	r3, r4, r3, lsl #7		
	and	r0, r2, #(7 << 8)		
	add	r3, r3, r1, asr #4 		
	add	r3, r3, r0, asr #7		
						
	ldr	r1, [sp, #132]			
	ldrb	r0, [r3, #1]			
	add	r2, r2, r1		
	cmp	r0, #0				
	ldrne	r1, [r5, r0, lsl #2]	
	add	r6, r6, r9		
	strneb	r7, [fp, #-1]		
	ldr	r0, [sp, #128]			
	strneh	r1, [sl, #-2]			
						
	add	ip, ip, r0		
	subs	r8, r8, #1			
	bne	1b				
	b	3f				
2:						
	and	r0, r6, #7			
	add	r3, lr, r0, lsl #1 		
						
	add	r3, r4, r3			
	ldrb	r0, [r3, #1]			
	cmp	r0, #0				
	ldrne	r1, [r5, r0, lsl #2]	
	strneb	r7, [fp, #-1]		
	strneh	r1, [sl, #-2]			
4:						
	ldr	r0, [sp, #132]			
	ldr	r1, [sp, #128]			
	add	r6, r6, r9		
	add	r2, r2, r0		
	add	ip, ip, r1		
	subs	r8, r8, #1			
	bne	1b				
3:						

.L13:
	.loc 1 108 0
	ldr	r0, [sp, #112]
	ldr	r1, [sp, #24]
	add	r0, r0, #1
	add	r1, r1, #24
	str	r0, [sp, #112]
	str	r1, [sp, #24]
.LVL19:
.L9:
	ldr	r2, [sp, #112]
	ldr	r3, [sp, #96]
.LVL20:
	cmp	r2, r3
	bne	.L10
	.loc 1 90 0
	ldr	r4, [sp, #0]
	ldr	r5, [sp, #124]
	ldr	r6, [sp, #116]
	ldr	r7, [sp, #4]
	ldr	r8, [sp, #120]
	ldr	r9, [sp, #8]
	add	r4, r4, #1
	add	r5, r5, #640
	add	r6, r6, #320
	add	r7, r7, #12
	sub	r8, r8, #1
	add	r9, r9, #16
	str	r4, [sp, #0]
	str	r5, [sp, #124]
	str	r6, [sp, #116]
	str	r7, [sp, #4]
	str	r8, [sp, #120]
	str	r9, [sp, #8]
.LVL21:
.L4:
	ldr	sl, [sp, #0]
	ldr	fp, [sp, #52]
	cmp	sl, fp
	bls	.L5
.LBE5:
	.loc 1 213 0
	add	sp, sp, #136
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L21:
	.align	2
.L20:
	.word	GFX
	.word	LineMatrixData
	.word	Memory
	.word	PPU
	.word	LineData
.LFE29:
	.size	_Z25DrawBGMode7Background16R3Phii, .-_Z25DrawBGMode7Background16R3Phii
	.global	__gxx_personality_sj0
	.align	2
	.p2align 5,,31
	.global	_Z27DrawBGMode7Background16R1R2Phii
	.type	_Z27DrawBGMode7Background16R1R2Phii, %function
_Z27DrawBGMode7Background16R1R2Phii:
.LFB30:
	.loc 1 215 0
	@ args = 0, pretend = 0, frame = 124
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL22:
.LBB6:
	.loc 1 238 0
	ldr	r3, .L44
.LBE6:
	.loc 1 215 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI2:
.LBB7:
	.loc 1 238 0
	ldrb	r1, [r3, #291]	@ zero_extendqisi2
.LVL23:
	.loc 1 221 0
	ldr	r3, .L44+4
.LBE7:
	.loc 1 215 0
	mov	r4, r0
.LBB8:
	.loc 1 221 0
	ldr	r3, [r3, #80]
.LBE8:
	.loc 1 215 0
	sub	sp, sp, #124
.LCFI3:
.LBB9:
	.loc 1 221 0
	ldr	r0, [r3, #0]
.LVL24:
	str	r3, [sp, #44]
	.loc 1 238 0
	cmp	r1, #0
	.loc 1 237 0
	mvn	r3, #0
.LBE9:
	.loc 1 215 0
	str	r2, [sp, #40]
.LBB10:
	.loc 1 221 0
	str	r0, [sp, #92]
.LVL25:
	.loc 1 237 0
	str	r3, [sp, #116]
.LVL26:
	.loc 1 238 0
	beq	.L23
.LVL27:
	ldr	r3, .L44+8
	ldrb	r3, [r3, #2745]	@ zero_extendqisi2
	cmp	r3, #2
	ldreq	r3, .L44+12
	streq	r3, [sp, #116]
.L23:
	.loc 1 245 0
	ldr	r1, .L44+4
	.loc 1 346 0
	ldr	r3, .L44+16
	.loc 1 245 0
	ldr	r2, [r1, #72]
	.loc 1 246 0
	ldr	r0, [r1, #40]
	.loc 1 245 0
	str	r2, [sp, #0]
.LVL28:
	.loc 1 346 0
	ldr	lr, [sp, #0]
	.loc 1 245 0
	ldr	r5, [sp, #0]
	.loc 1 346 0
	mov	r2, #12
	.loc 1 246 0
	ldr	r6, [sp, #0]
	.loc 1 346 0
	mla	lr, r2, lr, r3
	.loc 1 245 0
	mov	r3, #640
	mla	r5, r3, r5, r4
	.loc 1 246 0
	sub	r3, r3, #320
	mla	r6, r3, r6, r0
	.loc 1 346 0
	ldr	r3, .L44+20
	.loc 1 257 0
	ldr	ip, .L44+8
	.loc 1 346 0
	ldr	r3, [r3, #8]
	ldr	sl, [sp, #0]
	str	r3, [sp, #76]
	ldr	r3, .L44+24
	.loc 1 243 0
	ldr	fp, [sp, #92]
	.loc 1 239 0
	ldr	r2, [sp, #116]
	.loc 1 346 0
	ldr	r9, [r1, #44]
	.loc 1 250 0
	ldr	r1, [r1, #76]
	.loc 1 275 0
	ldrb	r7, [ip, #2743]	@ zero_extendqisi2
	.loc 1 346 0
	add	r3, r3, sl, asl #4
	.loc 1 257 0
	ldrb	ip, [ip, #2744]	@ zero_extendqisi2
	.loc 1 346 0
	add	r3, r3, #2
	.loc 1 243 0
	cmp	fp, #0
	.loc 1 250 0
	str	r1, [sp, #48]
	.loc 1 243 0
	moveq	fp, #1
	.loc 1 240 0
	mov	r1, r2, asl #1
	.loc 1 346 0
	add	r8, lr, #12
	str	r3, [sp, #12]
	.loc 1 239 0
	mov	r2, r2, asl #4
	.loc 1 346 0
	rsb	lr, sl, #255
	mov	r0, #0
	mov	r3, #256
	.loc 1 245 0
	str	r5, [sp, #112]
.LVL29:
	.loc 1 246 0
	str	r6, [sp, #104]
.LVL30:
	.loc 1 275 0
	str	r7, [sp, #72]
	.loc 1 346 0
	str	r9, [sp, #80]
	.loc 1 257 0
	str	ip, [sp, #52]
	.loc 1 243 0
	str	fp, [sp, #92]
	.loc 1 346 0
	str	lr, [sp, #108]
	str	r0, [sp, #84]
.LVL31:
	str	r3, [sp, #88]
.LVL32:
	.loc 1 239 0
	str	r2, [sp, #120]
.LVL33:
	.loc 1 240 0
	str	r1, [sp, #116]
	b	.L28
.LVL34:
.L29:
	.loc 1 252 0
	ldr	r4, [sp, #12]
.LVL35:
	.loc 1 255 0
	ldrsh	ip, [r8, #-2]
	.loc 1 252 0
	ldrh	r2, [r4, #-2]
	.loc 1 257 0
	ldr	r6, [sp, #52]
	ldr	r5, [sp, #108]
	.loc 1 251 0
	ldr	r7, [sp, #12]
	.loc 1 257 0
	ldr	r3, [sp, #0]
.LVL36:
	.loc 1 255 0
	mov	ip, ip, asl #19
	mov	ip, ip, asr #19
.LVL37:
	.loc 1 260 0
	mov	r2, r2, asl #19
	.loc 1 254 0
	ldrsh	r0, [r8, #-4]
	.loc 1 263 0
	ldrsh	r4, [r8, #-10]
	.loc 1 264 0
	ldrsh	lr, [r8, #-6]
	.loc 1 257 0
	cmp	r6, #0
	.loc 1 260 0
	rsb	r2, ip, r2, asr #19
	.loc 1 257 0
	movne	r3, r5
	.loc 1 251 0
	ldrh	r1, [r7, #0]
	.loc 1 260 0
	add	r3, r3, r2
.LVL38:
	.loc 1 264 0
	mul	lr, r3, lr
	.loc 1 254 0
	mov	r0, r0, asl #19
	.loc 1 263 0
	mul	r4, r3, r4
	.loc 1 264 0
	ldr	r9, [sp, #44]
	.loc 1 254 0
	mov	r0, r0, asr #19
.LVL39:
	.loc 1 261 0
	mov	r1, r1, asl #19
	rsb	r1, r0, r1, asr #19
	.loc 1 264 0
	mov	ip, ip, asl #8
.LVL40:
	.loc 1 263 0
	mov	r0, r0, asl #8
.LVL41:
	.loc 1 264 0
	mov	sl, #0
	str	lr, [sp, #64]
	.loc 1 263 0
	str	r4, [sp, #56]
	.loc 1 261 0
	str	r1, [sp, #96]
	.loc 1 263 0
	str	r0, [sp, #60]
	.loc 1 264 0
	str	ip, [sp, #68]
	str	r9, [sp, #8]
	str	sl, [sp, #100]
	b	.L33
.L34:
	.loc 1 267 0
	ldr	fp, [sp, #44]
	ldr	r3, [fp, #0]
.LVL42:
	cmp	r3, #0
	beq	.L35
	.loc 1 268 0
	ldr	ip, [sp, #8]
	.loc 1 269 0
	ldr	lr, [sp, #8]
	.loc 1 268 0
	ldr	ip, [ip, #24]
	.loc 1 269 0
	ldr	lr, [lr, #168]
	.loc 1 268 0
	str	ip, [sp, #84]
	.loc 1 270 0
	cmp	lr, ip
	.loc 1 269 0
	str	lr, [sp, #88]
	.loc 1 270 0
	bls	.L37
.L35:
	.loc 1 275 0
	ldr	r0, [sp, #72]
	ldrsh	r2, [r8, #-12]
	.loc 1 276 0
	ldr	r1, [sp, #88]
	.loc 1 275 0
	cmp	r0, #0
	.loc 1 276 0
	sub	r3, r1, #1
.LVL43:
	.loc 1 277 0
	rsbne	r2, r2, #0
	ldrsh	r1, [r8, #-8]
	.loc 1 346 0
	ldr	r4, [sp, #96]
	.loc 1 280 0
	ldreq	r3, [sp, #84]
	.loc 1 277 0
	strne	r2, [sp, #4]
	.loc 1 281 0
	streq	r2, [sp, #4]
	.loc 1 346 0
	ldr	ip, [sp, #68]
	ldrsh	r2, [r8, #-8]
	add	r3, r3, r4
.LVL44:
	.loc 1 278 0
	rsbne	r1, r1, #0
	strne	r1, [sp, #24]
	.loc 1 282 0
	streq	r1, [sp, #24]
	.loc 1 346 0
	mla	ip, r3, r2, ip
	ldrsh	r1, [r8, #-12]
	ldr	r2, [sp, #60]
	ldr	r6, [sp, #84]
	ldr	r5, [sp, #88]
	ldr	r7, [sp, #112]
	ldr	r9, [sp, #104]
	ldr	sl, [sp, #64]
	ldr	fp, [sp, #56]
	mla	r2, r3, r1, r2
	rsb	r5, r6, r5
	add	r7, r7, r6, asl #1
	add	r9, r9, r6
	add	ip, sl, ip
	add	r2, fp, r2
	str	r5, [sp, #20]
	str	r7, [sp, #16]
	str	r9, [sp, #28]
	ldr	lr, [sp, #4]
	ldr	r4, [sp, #24]
	ldr	r6, [sp, #76]
	ldr	sl, [sp, #80]
	ldr	fp, [sp, #40]
#APP
	1:						
	ldrb	r0, [r9], #1			
	add	r7, r7, #2			
	cmp	fp, r0			
	bls	2f				
	mov	r3, r2, asr #18		
	orrs	r3, r3, ip, asr #18		
	bne	2f				
						
	ldr	r1, [sp, #120]			
	ldr	r0, [sp, #116]			
	and	r1, r1, ip, asr #4		
	and	r0, r0, r2, asr #7		
						
	and	r3, r1, #0x7f			
	sub	r3, r1, r3			
	add	r3, r3, r0, asr #4		
	ldrb	r3, [r6, r3, lsl #1]	
	and	r1, r1, #0x70			
						
	add	r3, r6, r3, lsl #7		
						
	and	r0, r0, #14			
	add	r3, r3, r1			
	add	r3, r3, r0			
						
	ldrb	r0, [r3, #1]			
	add	r2, r2, lr		
	cmp	r0, #0				
	ldrne	r1, [sl, r0, lsl #2]	
	strneb	fp, [r9, #-1]		
	add	ip, ip, r4		
	strneh	r1, [r7, #-2]			
	subs	r5, r5, #1			
	bne	1b				
	b	3f				
2:						
	add	r2, r2, lr		
	add	ip, ip, r4		
	subs	r5, r5, #1			
	bne	1b				
3:						

.L37:
	.loc 1 266 0
	ldr	ip, [sp, #100]
	ldr	lr, [sp, #8]
	add	ip, ip, #1
	add	lr, lr, #24
	str	ip, [sp, #100]
	str	lr, [sp, #8]
.LVL45:
.L33:
	ldr	r0, [sp, #100]
	ldr	r1, [sp, #92]
	cmp	r0, r1
	bne	.L34
	.loc 1 250 0
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #112]
.LVL46:
	ldr	r4, [sp, #104]
	ldr	r5, [sp, #108]
	ldr	r6, [sp, #12]
	add	r2, r2, #1
	add	r3, r3, #640
	add	r4, r4, #320
	sub	r5, r5, #1
	add	r6, r6, #16
	add	r8, r8, #12
	str	r2, [sp, #0]
	str	r3, [sp, #112]
	str	r4, [sp, #104]
	str	r5, [sp, #108]
	str	r6, [sp, #12]
.LVL47:
.L28:
	ldr	r7, [sp, #0]
	ldr	r9, [sp, #48]
	cmp	r7, r9
	bls	.L29
.LBE10:
	.loc 1 349 0
	add	sp, sp, #124
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L45:
	.align	2
.L44:
	.word	Settings
	.word	GFX
	.word	PPU
	.word	2047
	.word	LineMatrixData
	.word	Memory
	.word	LineData
.LFE30:
	.size	_Z27DrawBGMode7Background16R1R2Phii, .-_Z27DrawBGMode7Background16R1R2Phii
	.align	2
	.p2align 5,,31
	.global	_Z25DrawBGMode7Background16R0Phii
	.type	_Z25DrawBGMode7Background16R0Phii, %function
_Z25DrawBGMode7Background16R0Phii:
.LFB31:
	.loc 1 352 0
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL48:
.LBB11:
	.loc 1 358 0
	ldr	ip, .L66
.LBE11:
	.loc 1 352 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI4:
.LBB12:
	.loc 1 383 0
	ldr	r3, [ip, #72]
.LBE12:
	.loc 1 352 0
	sub	sp, sp, #120
.LCFI5:
.LBB13:
	.loc 1 383 0
	str	r3, [sp, #0]
.LVL49:
	.loc 1 482 0
	ldr	r5, [sp, #0]
	ldr	r3, .L66+4
	.loc 1 385 0
	ldr	lr, [ip, #40]
	.loc 1 482 0
	mov	r1, #12
.LVL50:
	.loc 1 385 0
	ldr	r7, [sp, #0]
	.loc 1 482 0
	mla	r1, r5, r1, r3
	.loc 1 384 0
	mov	r3, #640
	.loc 1 358 0
	ldr	r4, [ip, #80]
	.loc 1 384 0
	mla	r5, r3, r5, r0
	.loc 1 385 0
	sub	r3, r3, #320
	mla	r7, r3, r7, lr
	.loc 1 482 0
	ldr	r3, .L66+8
	.loc 1 358 0
	str	r4, [sp, #44]
	.loc 1 482 0
	ldr	r3, [r3, #8]
	.loc 1 358 0
	ldr	r6, [sp, #44]
	.loc 1 394 0
	ldr	r4, .L66+12
	.loc 1 358 0
	ldr	r6, [r6, #0]
	.loc 1 482 0
	ldr	fp, [sp, #0]
	str	r3, [sp, #76]
	ldr	r3, .L66+16
	ldr	sl, [ip, #44]
	.loc 1 387 0
	ldr	ip, [ip, #76]
	.loc 1 418 0
	ldrb	r9, [r4, #2743]	@ zero_extendqisi2
	.loc 1 394 0
	ldrb	r4, [r4, #2744]	@ zero_extendqisi2
	.loc 1 482 0
	add	r3, r3, fp, asl #4
	.loc 1 380 0
	cmp	r6, #0
	.loc 1 358 0
	str	r6, [sp, #116]
.LVL51:
	.loc 1 387 0
	str	ip, [sp, #48]
	.loc 1 380 0
	moveq	r6, #1
	.loc 1 482 0
	add	r3, r3, #2
	rsb	ip, fp, #255
	mov	lr, #0
	mov	r0, #256
.LVL52:
	add	r8, r1, #12
	.loc 1 384 0
	str	r5, [sp, #112]
.LVL53:
	.loc 1 385 0
	str	r7, [sp, #104]
.LVL54:
	.loc 1 418 0
	str	r9, [sp, #72]
	.loc 1 482 0
	str	sl, [sp, #80]
	.loc 1 394 0
	str	r4, [sp, #52]
	.loc 1 380 0
	str	r6, [sp, #92]
.LVL55:
.LBE13:
	.loc 1 352 0
	str	r2, [sp, #40]
.LBB14:
	.loc 1 482 0
	str	r3, [sp, #12]
	str	ip, [sp, #108]
	str	lr, [sp, #84]
.LVL56:
	str	r0, [sp, #88]
.LVL57:
	b	.L50
.LVL58:
.L51:
	.loc 1 389 0
	ldr	r3, [sp, #12]
	.loc 1 392 0
	ldrsh	ip, [r8, #-2]
	.loc 1 389 0
	ldrh	r2, [r3, #-2]
	.loc 1 394 0
	ldr	r6, [sp, #52]
	.loc 1 392 0
	mov	ip, ip, asl #19
	.loc 1 391 0
	ldrsh	r0, [r8, #-4]
	.loc 1 394 0
	ldr	r5, [sp, #108]
	.loc 1 392 0
	mov	ip, ip, asr #19
.LVL59:
	.loc 1 388 0
	ldrh	r1, [r3, #0]
	.loc 1 394 0
	ldr	r3, [sp, #0]
.LVL60:
	.loc 1 401 0
	rsb	r2, ip, r2
	.loc 1 404 0
	ldrsh	r4, [r8, #-10]
	.loc 1 405 0
	ldrsh	lr, [r8, #-6]
	.loc 1 394 0
	cmp	r6, #0
	movne	r3, r5
	.loc 1 391 0
	mov	r0, r0, asl #19
	.loc 1 401 0
	mov	r2, r2, asl #23
	add	r3, r3, r2, asr #23
.LVL61:
	.loc 1 391 0
	mov	r0, r0, asr #19
.LVL62:
	.loc 1 402 0
	rsb	r1, r0, r1
	.loc 1 405 0
	mul	lr, r3, lr
	.loc 1 404 0
	mul	r4, r3, r4
	.loc 1 405 0
	ldr	r7, [sp, #44]
	.loc 1 402 0
	mov	r1, r1, asl #23
	mov	r1, r1, asr #23
	.loc 1 404 0
	mov	r0, r0, asl #8
.LVL63:
	.loc 1 405 0
	mov	ip, ip, asl #8
.LVL64:
	mov	r9, #0
	str	lr, [sp, #64]
	.loc 1 404 0
	str	r4, [sp, #56]
	.loc 1 402 0
	str	r1, [sp, #96]
	.loc 1 404 0
	str	r0, [sp, #60]
	.loc 1 405 0
	str	ip, [sp, #68]
	str	r7, [sp, #8]
	str	r9, [sp, #100]
	b	.L55
.L56:
	.loc 1 409 0
	ldr	sl, [sp, #116]
	cmp	sl, #0
	beq	.L57
	.loc 1 410 0
	ldr	fp, [sp, #8]
	.loc 1 411 0
	ldr	ip, [sp, #8]
	.loc 1 410 0
	ldr	fp, [fp, #24]
	.loc 1 411 0
	ldr	ip, [ip, #168]
	.loc 1 410 0
	str	fp, [sp, #84]
	.loc 1 412 0
	cmp	ip, fp
	.loc 1 411 0
	str	ip, [sp, #88]
	.loc 1 412 0
	bls	.L59
.L57:
	.loc 1 418 0
	ldr	lr, [sp, #72]
	ldrsh	r2, [r8, #-12]
	.loc 1 419 0
	ldr	r0, [sp, #88]
	.loc 1 418 0
	cmp	lr, #0
	ldrsh	r1, [r8, #-8]
	.loc 1 419 0
	sub	r3, r0, #1
.LVL65:
	.loc 1 420 0
	rsbne	r2, r2, #0
	.loc 1 482 0
	ldr	r4, [sp, #96]
	.loc 1 423 0
	ldreq	r3, [sp, #84]
	.loc 1 420 0
	strne	r2, [sp, #4]
	.loc 1 424 0
	streq	r2, [sp, #4]
	.loc 1 482 0
	ldr	ip, [sp, #68]
	ldrsh	r2, [r8, #-8]
	add	r3, r3, r4
.LVL66:
	.loc 1 421 0
	rsbne	r1, r1, #0
	strne	r1, [sp, #24]
	.loc 1 425 0
	streq	r1, [sp, #24]
	.loc 1 482 0
	mla	ip, r3, r2, ip
	ldrsh	r1, [r8, #-12]
	ldr	r2, [sp, #60]
	ldr	r6, [sp, #84]
	ldr	r5, [sp, #88]
	ldr	r7, [sp, #112]
	ldr	r9, [sp, #104]
	ldr	sl, [sp, #64]
	ldr	fp, [sp, #56]
	mla	r2, r3, r1, r2
	rsb	r5, r6, r5
	add	r7, r7, r6, asl #1
	add	r9, r9, r6
	add	ip, sl, ip
	add	r2, fp, r2
	str	r5, [sp, #20]
	str	r7, [sp, #16]
	str	r9, [sp, #28]
	ldr	lr, [sp, #4]
	ldr	r4, [sp, #24]
	ldr	r6, [sp, #76]
	ldr	sl, [sp, #80]
	ldr	fp, [sp, #40]
#APP
		b	1f				
8:						
	.word	(0x3ff << 4)                    
						
1:						
	ldrb	r0, [r9], #1			
	ldr	r3, 8b				
	add	r7, r7, #2			
	cmp	fp, r0			
	bls	2f				
	and	r1, r3, ip, asr #4		
	mov	r0, r3, asr #3			
	and	r3, r1, #0x7f			
	and	r0, r0, r2, asr #7		
	sub	r3, r1, r3			
	add	r3, r3, r0, asr #4		
	ldrb	r3, [r6, r3, lsl #1]	
						
	and	r1, r1, #0x70			
	add	r3, r6, r3, lsl #7		
						
	and	r0, r0, #14			
	add	r3, r3, r1			
	add	r3, r3, r0			
						
	ldrb	r0, [r3, #1]			
	cmp	r0, #0				
	ldrne	r1, [sl, r0, lsl #2]	
	strneb	fp, [r9, #-1]		
	strneh	r1, [r7, #-2]			
						
2:						
	add	r2, r2, lr		
	add	ip, ip, r4		
	subs	r5, r5, #1			
	bne	1b				

.LVL67:
.L59:
	.loc 1 407 0
	ldr	ip, [sp, #100]
	ldr	lr, [sp, #8]
	add	ip, ip, #1
	add	lr, lr, #24
	str	ip, [sp, #100]
	str	lr, [sp, #8]
.L55:
	ldr	r0, [sp, #100]
	ldr	r2, [sp, #92]
	cmp	r0, r2
	bne	.L56
	.loc 1 387 0
	ldr	r3, [sp, #0]
.LVL68:
	ldr	r4, [sp, #112]
	ldr	r5, [sp, #104]
	ldr	r6, [sp, #108]
	ldr	r7, [sp, #12]
	add	r3, r3, #1
	add	r4, r4, #640
	add	r5, r5, #320
	sub	r6, r6, #1
	add	r7, r7, #16
	add	r8, r8, #12
	str	r3, [sp, #0]
	str	r4, [sp, #112]
	str	r5, [sp, #104]
	str	r6, [sp, #108]
	str	r7, [sp, #12]
.LVL69:
.L50:
	ldr	r9, [sp, #0]
	ldr	sl, [sp, #48]
	cmp	r9, sl
	bls	.L51
.LBE14:
	.loc 1 487 0
	add	sp, sp, #120
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L67:
	.align	2
.L66:
	.word	GFX
	.word	LineMatrixData
	.word	Memory
	.word	PPU
	.word	LineData
.LFE31:
	.size	_Z25DrawBGMode7Background16R0Phii, .-_Z25DrawBGMode7Background16R0Phii
	.align	2
	.p2align 5,,31
	.global	_Z23DrawBGMode7Background16Phii
	.type	_Z23DrawBGMode7Background16Phii, %function
_Z23DrawBGMode7Background16Phii:
.LFB28:
	.loc 1 33 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL70:
	stmfd	sp!, {r4, r5, r6, r7, lr}
.LCFI6:
	.loc 1 38 0
	ldr	r7, .L81
	.loc 1 33 0
	mov	r4, r0
	.loc 1 38 0
	ldrb	r3, [r7, #98]	@ zero_extendqisi2
	.loc 1 33 0
	mov	r5, r1
	.loc 1 38 0
	tst	r3, #1
	.loc 1 33 0
	mov	r6, r2
	.loc 1 41 0
	ldreq	r3, .L81+4
	.loc 1 38 0
	beq	.L80
.LVL71:
	.loc 1 39 0
	ldr	r3, .L81+8
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L71
	bl	S9xBuildDirectColourMaps
.LVL72:
.L71:
	.loc 1 40 0
	ldr	r3, .L81+12
.L80:
	.loc 1 41 0
	str	r3, [r7, #44]
	.loc 1 43 0
	ldr	r3, .L81+16
	ldrb	r3, [r3, #2745]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L75
	cmp	r3, #3
	bne	.L79
	b	.L76
.L75:
	.loc 1 45 0
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	.loc 1 54 0
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	.loc 1 45 0
	b	_Z25DrawBGMode7Background16R0Phii
.LVL73:
.L76:
	.loc 1 48 0
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	.loc 1 54 0
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	.loc 1 48 0
	b	_Z25DrawBGMode7Background16R3Phii
.LVL74:
.L79:
	.loc 1 51 0
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	.loc 1 54 0
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	.loc 1 51 0
	b	_Z27DrawBGMode7Background16R1R2Phii
.L82:
	.align	2
.L81:
	.word	GFX
	.word	IPPU+3140
	.word	IPPU
	.word	DirectColourMaps
	.word	PPU
.LFE28:
	.size	_Z23DrawBGMode7Background16Phii, .-_Z23DrawBGMode7Background16Phii
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.byte	0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0x0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x4
	.4byte	.LCFI0-.LFB29
	.byte	0xe
	.uleb128 0x24
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0xac
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8b
	.uleb128 0x2
	.byte	0x8a
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x6
	.byte	0x86
	.uleb128 0x7
	.byte	0x85
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x9
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x4
	.4byte	.LCFI2-.LFB30
	.byte	0xe
	.uleb128 0x24
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8b
	.uleb128 0x2
	.byte	0x8a
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x6
	.byte	0x86
	.uleb128 0x7
	.byte	0x85
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x9
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0xa0
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x4
	.4byte	.LCFI4-.LFB31
	.byte	0xe
	.uleb128 0x24
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x9c
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8b
	.uleb128 0x2
	.byte	0x8a
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x6
	.byte	0x86
	.uleb128 0x7
	.byte	0x85
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x9
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x4
	.4byte	.LCFI6-.LFB28
	.byte	0xe
	.uleb128 0x14
	.byte	0x8e
	.uleb128 0x1
	.byte	0x87
	.uleb128 0x2
	.byte	0x86
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x5
	.align	2
.LEFDE6:
	.file 2 "port.h"
	.file 3 "gfx.h"
	.file 4 "<built-in>"
	.file 5 "snes9x.h"
	.file 6 "65c816.h"
	.file 7 "memmap.h"
	.file 8 "rops.h"
	.file 9 "ppu.h"
	.file 10 "cpuexec.h"
	.file 11 "apu.h"
	.file 12 "spc700.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB29-.Ltext0
	.4byte	.LCFI0-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI0-.Ltext0
	.4byte	.LCFI1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 36
	.4byte	.LCFI1-.Ltext0
	.4byte	.LFE29-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 172
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -20
	.4byte	.LVL21-.Ltext0
	.4byte	.LFE29-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL8-.Ltext0
	.4byte	.LFE29-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -100
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LFB30-.Ltext0
	.4byte	.LCFI2-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI2-.Ltext0
	.4byte	.LCFI3-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 36
	.4byte	.LCFI3-.Ltext0
	.4byte	.LFE30-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 160
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -20
	.4byte	.LVL47-.Ltext0
	.4byte	.LFE30-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL27-.Ltext0
	.4byte	.LFE30-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -92
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LFB31-.Ltext0
	.4byte	.LCFI4-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI4-.Ltext0
	.4byte	.LCFI5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 36
	.4byte	.LCFI5-.Ltext0
	.4byte	.LFE31-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 156
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL53-.Ltext0
	.4byte	.LFE31-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -16
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL58-.Ltext0
	.4byte	.LFE31-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 -88
	.4byte	0x0
	.4byte	0x0
.LLST20:
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST21:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL55-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -12
	.4byte	.LVL55-.Ltext0
	.4byte	.LFE31-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -36
	.4byte	0x0
	.4byte	0x0
.LLST22:
	.4byte	.LVL62-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST23:
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0x0
	.4byte	0x0
.LLST24:
	.4byte	.LVL60-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL65-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL67-.Ltext0
	.4byte	.LVL68-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST25:
	.4byte	.LFB28-.Ltext0
	.4byte	.LCFI6-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI6-.Ltext0
	.4byte	.LFE28-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 20
	.4byte	0x0
	.4byte	0x0
.LLST26:
	.4byte	.LVL70-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL71-.Ltext0
	.4byte	.LFE28-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST27:
	.4byte	.LVL70-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL71-.Ltext0
	.4byte	.LFE28-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST28:
	.4byte	.LVL70-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL71-.Ltext0
	.4byte	.LFE28-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x2722
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF505
	.byte	0x4
	.4byte	.LASF506
	.4byte	.LASF507
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x2
	.byte	0x7
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x2
	.byte	0x5
	.uleb128 0x3
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x8
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x8
	.byte	0x7
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x4
	.byte	0x5
	.uleb128 0x4
	.4byte	0x7b
	.4byte	0x4f
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x1
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.byte	0x4
	.4byte	0x88
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1
	.byte	0x8
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.4byte	0x97
	.uleb128 0x8
	.4byte	0x88
	.uleb128 0x9
	.4byte	.LASF10
	.byte	0x2
	.byte	0xb0
	.4byte	0x2c
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x2
	.byte	0xb1
	.4byte	0x2c
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x2
	.byte	0xb2
	.4byte	0x33
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x2
	.byte	0xb3
	.4byte	0x25
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x2
	.byte	0xb4
	.4byte	0x25
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x2
	.byte	0xb7
	.4byte	0x4f
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x2
	.byte	0xc3
	.4byte	0x2c
	.uleb128 0xa
	.4byte	0x12d
	.4byte	.LASF455
	.byte	0x2
	.byte	0x6
	.byte	0x63
	.uleb128 0xb
	.4byte	0x11a
	.4byte	.LASF17
	.byte	0x2
	.byte	0x6
	.byte	0x65
	.uleb128 0xc
	.ascii	"l\000"
	.byte	0x6
	.byte	0x65
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"h\000"
	.byte	0x6
	.byte	0x65
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0xd
	.ascii	"B\000"
	.byte	0x6
	.byte	0x65
	.4byte	0xf5
	.uleb128 0xd
	.ascii	"W\000"
	.byte	0x6
	.byte	0x69
	.4byte	0xb2
	.byte	0x0
	.uleb128 0xb
	.4byte	0x1a9
	.4byte	.LASF18
	.byte	0x10
	.byte	0x6
	.byte	0x6c
	.uleb128 0xc
	.ascii	"PB\000"
	.byte	0x6
	.byte	0x6d
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"DB\000"
	.byte	0x6
	.byte	0x6e
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xc
	.ascii	"P\000"
	.byte	0x6
	.byte	0x6f
	.4byte	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xc
	.ascii	"A\000"
	.byte	0x6
	.byte	0x70
	.4byte	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.ascii	"D\000"
	.byte	0x6
	.byte	0x71
	.4byte	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xc
	.ascii	"X\000"
	.byte	0x6
	.byte	0x72
	.4byte	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xc
	.ascii	"S\000"
	.byte	0x6
	.byte	0x73
	.4byte	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xc
	.ascii	"Y\000"
	.byte	0x6
	.byte	0x74
	.4byte	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xc
	.ascii	"PC\000"
	.byte	0x6
	.byte	0x75
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.byte	0x0
	.uleb128 0xb
	.4byte	0x416
	.4byte	.LASF19
	.byte	0x9c
	.byte	0x5
	.byte	0xc6
	.uleb128 0xe
	.4byte	.LASF20
	.byte	0x5
	.byte	0xc7
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF21
	.byte	0x5
	.byte	0xc8
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x5
	.byte	0xc9
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x5
	.byte	0xca
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x5
	.byte	0xcb
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x5
	.byte	0xcc
	.4byte	0x12d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xc
	.ascii	"PC\000"
	.byte	0x5
	.byte	0xd6
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x5
	.byte	0xd7
	.4byte	0xd3
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x5
	.byte	0xd8
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x5
	.byte	0xd9
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x5
	.byte	0xda
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x5
	.byte	0xdb
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x5
	.byte	0xdc
	.4byte	0x41c
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xe
	.4byte	.LASF32
	.byte	0x5
	.byte	0xdd
	.4byte	0xd3
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xe
	.4byte	.LASF33
	.byte	0x5
	.byte	0xde
	.4byte	0xd3
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xe
	.4byte	.LASF34
	.byte	0x5
	.byte	0xdf
	.4byte	0xd3
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xe
	.4byte	.LASF35
	.byte	0x5
	.byte	0xe0
	.4byte	0xd3
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x5
	.byte	0xe1
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0xe
	.4byte	.LASF37
	.byte	0x5
	.byte	0xe2
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x5
	.byte	0xe3
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xe
	.4byte	.LASF39
	.byte	0x5
	.byte	0xe4
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xe
	.4byte	.LASF40
	.byte	0x5
	.byte	0xe6
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0xe
	.4byte	.LASF41
	.byte	0x5
	.byte	0xe7
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x55
	.uleb128 0xe
	.4byte	.LASF42
	.byte	0x5
	.byte	0xe8
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0xe
	.4byte	.LASF43
	.byte	0x5
	.byte	0xe9
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x57
	.uleb128 0xe
	.4byte	.LASF44
	.byte	0x5
	.byte	0xea
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0xe
	.4byte	.LASF45
	.byte	0x5
	.byte	0xeb
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0xe
	.4byte	.LASF46
	.byte	0x5
	.byte	0xec
	.4byte	0x421
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x5
	.byte	0xee
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xe
	.4byte	.LASF48
	.byte	0x5
	.byte	0xef
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0xe
	.4byte	.LASF49
	.byte	0x5
	.byte	0xf0
	.4byte	0x431
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x5
	.byte	0xf1
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0xe
	.4byte	.LASF51
	.byte	0x5
	.byte	0xf2
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x5
	.byte	0xf3
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x5
	.byte	0xf4
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xe
	.4byte	.LASF54
	.byte	0x5
	.byte	0xf5
	.4byte	0xbd
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0xe
	.4byte	.LASF55
	.byte	0x5
	.byte	0xf6
	.4byte	0xbd
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xe
	.4byte	.LASF56
	.byte	0x5
	.byte	0xf7
	.4byte	0xc8
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0xe
	.4byte	.LASF57
	.byte	0x5
	.byte	0xf8
	.4byte	0xc8
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x5
	.byte	0xf9
	.4byte	0x41c
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x5
	.byte	0xfa
	.4byte	0x8f
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x5
	.byte	0xfb
	.4byte	0x8f
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x5
	.byte	0xfc
	.4byte	0xd3
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xa7
	.uleb128 0xf
	.4byte	0xd3
	.uleb128 0x4
	.4byte	0x431
	.4byte	0x9c
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x2
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc8
	.uleb128 0x10
	.4byte	0xa8f
	.4byte	.LASF62
	.2byte	0x12c
	.byte	0x5
	.2byte	0x106
	.uleb128 0x11
	.4byte	.LASF63
	.byte	0x5
	.2byte	0x108
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x5
	.2byte	0x109
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x11
	.4byte	.LASF65
	.byte	0x5
	.2byte	0x10b
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x11
	.4byte	.LASF66
	.byte	0x5
	.2byte	0x10c
	.4byte	0x64
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x11
	.4byte	.LASF67
	.byte	0x5
	.2byte	0x10d
	.4byte	0x64
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x11
	.4byte	.LASF68
	.byte	0x5
	.2byte	0x10e
	.4byte	0x64
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x11
	.4byte	.LASF69
	.byte	0x5
	.2byte	0x10f
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x11
	.4byte	.LASF70
	.byte	0x5
	.2byte	0x110
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0x11
	.4byte	.LASF71
	.byte	0x5
	.2byte	0x111
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x11
	.4byte	.LASF72
	.byte	0x5
	.2byte	0x112
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x11
	.4byte	.LASF73
	.byte	0x5
	.2byte	0x115
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x11
	.4byte	.LASF74
	.byte	0x5
	.2byte	0x116
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0x11
	.4byte	.LASF75
	.byte	0x5
	.2byte	0x117
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x11
	.4byte	.LASF76
	.byte	0x5
	.2byte	0x118
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0x11
	.4byte	.LASF77
	.byte	0x5
	.2byte	0x119
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x11
	.4byte	.LASF78
	.byte	0x5
	.2byte	0x11c
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x11
	.4byte	.LASF79
	.byte	0x5
	.2byte	0x11d
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x11
	.4byte	.LASF80
	.byte	0x5
	.2byte	0x120
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x11
	.4byte	.LASF81
	.byte	0x5
	.2byte	0x121
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x12
	.ascii	"PAL\000"
	.byte	0x5
	.2byte	0x122
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x11
	.4byte	.LASF82
	.byte	0x5
	.2byte	0x123
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x11
	.4byte	.LASF83
	.byte	0x5
	.2byte	0x124
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x11
	.4byte	.LASF84
	.byte	0x5
	.2byte	0x125
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x11
	.4byte	.LASF85
	.byte	0x5
	.2byte	0x126
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x11
	.4byte	.LASF86
	.byte	0x5
	.2byte	0x129
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x11
	.4byte	.LASF87
	.byte	0x5
	.2byte	0x12a
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x31
	.uleb128 0x11
	.4byte	.LASF88
	.byte	0x5
	.2byte	0x12b
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.uleb128 0x11
	.4byte	.LASF89
	.byte	0x5
	.2byte	0x12c
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x33
	.uleb128 0x11
	.4byte	.LASF90
	.byte	0x5
	.2byte	0x12d
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x11
	.4byte	.LASF91
	.byte	0x5
	.2byte	0x12e
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x35
	.uleb128 0x11
	.4byte	.LASF92
	.byte	0x5
	.2byte	0x12f
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x36
	.uleb128 0x11
	.4byte	.LASF93
	.byte	0x5
	.2byte	0x132
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x37
	.uleb128 0x11
	.4byte	.LASF94
	.byte	0x5
	.2byte	0x133
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x11
	.4byte	.LASF95
	.byte	0x5
	.2byte	0x134
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x39
	.uleb128 0x11
	.4byte	.LASF96
	.byte	0x5
	.2byte	0x135
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3a
	.uleb128 0x11
	.4byte	.LASF97
	.byte	0x5
	.2byte	0x136
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3b
	.uleb128 0x11
	.4byte	.LASF98
	.byte	0x5
	.2byte	0x137
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x11
	.4byte	.LASF99
	.byte	0x5
	.2byte	0x138
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0x11
	.4byte	.LASF100
	.byte	0x5
	.2byte	0x139
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x11
	.4byte	.LASF101
	.byte	0x5
	.2byte	0x13a
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0x11
	.4byte	.LASF102
	.byte	0x5
	.2byte	0x13b
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x11
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x13c
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0x11
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x13d
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0x11
	.4byte	.LASF105
	.byte	0x5
	.2byte	0x13e
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x43
	.uleb128 0x11
	.4byte	.LASF106
	.byte	0x5
	.2byte	0x13f
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x11
	.4byte	.LASF107
	.byte	0x5
	.2byte	0x140
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x11
	.4byte	.LASF108
	.byte	0x5
	.2byte	0x142
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x11
	.4byte	.LASF109
	.byte	0x5
	.2byte	0x143
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4d
	.uleb128 0x11
	.4byte	.LASF110
	.byte	0x5
	.2byte	0x144
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x11
	.4byte	.LASF111
	.byte	0x5
	.2byte	0x145
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4f
	.uleb128 0x11
	.4byte	.LASF112
	.byte	0x5
	.2byte	0x146
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x11
	.4byte	.LASF113
	.byte	0x5
	.2byte	0x147
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x51
	.uleb128 0x12
	.ascii	"SA1\000"
	.byte	0x5
	.2byte	0x148
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x12
	.ascii	"C4\000"
	.byte	0x5
	.2byte	0x149
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x53
	.uleb128 0x11
	.4byte	.LASF114
	.byte	0x5
	.2byte	0x14a
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x11
	.4byte	.LASF115
	.byte	0x5
	.2byte	0x14d
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x11
	.4byte	.LASF116
	.byte	0x5
	.2byte	0x14e
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x11
	.4byte	.LASF117
	.byte	0x5
	.2byte	0x14f
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0x11
	.4byte	.LASF118
	.byte	0x5
	.2byte	0x150
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x11
	.4byte	.LASF119
	.byte	0x5
	.2byte	0x151
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5f
	.uleb128 0x11
	.4byte	.LASF120
	.byte	0x5
	.2byte	0x152
	.4byte	0x4f
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x11
	.4byte	.LASF121
	.byte	0x5
	.2byte	0x153
	.4byte	0x4f
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x11
	.4byte	.LASF122
	.byte	0x5
	.2byte	0x154
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x11
	.4byte	.LASF123
	.byte	0x5
	.2byte	0x155
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x69
	.uleb128 0x11
	.4byte	.LASF124
	.byte	0x5
	.2byte	0x156
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6a
	.uleb128 0x11
	.4byte	.LASF125
	.byte	0x5
	.2byte	0x157
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0x11
	.4byte	.LASF126
	.byte	0x5
	.2byte	0x158
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x11
	.4byte	.LASF127
	.byte	0x5
	.2byte	0x159
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6d
	.uleb128 0x11
	.4byte	.LASF128
	.byte	0x5
	.2byte	0x15a
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6e
	.uleb128 0x11
	.4byte	.LASF129
	.byte	0x5
	.2byte	0x15b
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6f
	.uleb128 0x11
	.4byte	.LASF130
	.byte	0x5
	.2byte	0x15d
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x11
	.4byte	.LASF131
	.byte	0x5
	.2byte	0x15e
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0x11
	.4byte	.LASF132
	.byte	0x5
	.2byte	0x161
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0x11
	.4byte	.LASF133
	.byte	0x5
	.2byte	0x162
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x73
	.uleb128 0x11
	.4byte	.LASF134
	.byte	0x5
	.2byte	0x163
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x11
	.4byte	.LASF135
	.byte	0x5
	.2byte	0x164
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0x11
	.4byte	.LASF136
	.byte	0x5
	.2byte	0x167
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0x11
	.4byte	.LASF137
	.byte	0x5
	.2byte	0x168
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0x11
	.4byte	.LASF138
	.byte	0x5
	.2byte	0x169
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x11
	.4byte	.LASF139
	.byte	0x5
	.2byte	0x16a
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x79
	.uleb128 0x11
	.4byte	.LASF140
	.byte	0x5
	.2byte	0x16b
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x7a
	.uleb128 0x11
	.4byte	.LASF141
	.byte	0x5
	.2byte	0x16c
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x7b
	.uleb128 0x11
	.4byte	.LASF142
	.byte	0x5
	.2byte	0x16f
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x11
	.4byte	.LASF143
	.byte	0x5
	.2byte	0x170
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x7d
	.uleb128 0x11
	.4byte	.LASF144
	.byte	0x5
	.2byte	0x171
	.4byte	0xa8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x7e
	.uleb128 0x11
	.4byte	.LASF145
	.byte	0x5
	.2byte	0x172
	.4byte	0x4f
	.byte	0x3
	.byte	0x23
	.uleb128 0x100
	.uleb128 0x11
	.4byte	.LASF146
	.byte	0x5
	.2byte	0x173
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x104
	.uleb128 0x11
	.4byte	.LASF147
	.byte	0x5
	.2byte	0x174
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x105
	.uleb128 0x11
	.4byte	.LASF148
	.byte	0x5
	.2byte	0x175
	.4byte	0xd3
	.byte	0x3
	.byte	0x23
	.uleb128 0x108
	.uleb128 0x11
	.4byte	.LASF149
	.byte	0x5
	.2byte	0x176
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x10c
	.uleb128 0x11
	.4byte	.LASF150
	.byte	0x5
	.2byte	0x177
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x10d
	.uleb128 0x11
	.4byte	.LASF151
	.byte	0x5
	.2byte	0x178
	.4byte	0xc8
	.byte	0x3
	.byte	0x23
	.uleb128 0x110
	.uleb128 0x11
	.4byte	.LASF152
	.byte	0x5
	.2byte	0x179
	.4byte	0xc8
	.byte	0x3
	.byte	0x23
	.uleb128 0x114
	.uleb128 0x11
	.4byte	.LASF153
	.byte	0x5
	.2byte	0x17a
	.4byte	0xc8
	.byte	0x3
	.byte	0x23
	.uleb128 0x118
	.uleb128 0x11
	.4byte	.LASF154
	.byte	0x5
	.2byte	0x17d
	.4byte	0xc8
	.byte	0x3
	.byte	0x23
	.uleb128 0x11c
	.uleb128 0x11
	.4byte	.LASF155
	.byte	0x5
	.2byte	0x17e
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x120
	.uleb128 0x11
	.4byte	.LASF156
	.byte	0x5
	.2byte	0x17f
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0x11
	.4byte	.LASF157
	.byte	0x5
	.2byte	0x180
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0x11
	.4byte	.LASF158
	.byte	0x5
	.2byte	0x181
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x123
	.uleb128 0x11
	.4byte	.LASF159
	.byte	0x5
	.2byte	0x182
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x124
	.uleb128 0x12
	.ascii	"BS\000"
	.byte	0x5
	.2byte	0x183
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x125
	.uleb128 0x11
	.4byte	.LASF160
	.byte	0x5
	.2byte	0x184
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x126
	.uleb128 0x11
	.4byte	.LASF161
	.byte	0x5
	.2byte	0x185
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x127
	.uleb128 0x11
	.4byte	.LASF162
	.byte	0x5
	.2byte	0x186
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x128
	.uleb128 0x11
	.4byte	.LASF163
	.byte	0x5
	.2byte	0x188
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x129
	.uleb128 0x11
	.4byte	.LASF164
	.byte	0x5
	.2byte	0x189
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x12a
	.byte	0x0
	.uleb128 0x4
	.4byte	0xa9f
	.4byte	0x88
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x7f
	.byte	0x0
	.uleb128 0x13
	.4byte	0x1107
	.4byte	.LASF165
	.4byte	0x10474
	.byte	0x7
	.byte	0x5a
	.uleb128 0xc
	.ascii	"RAM\000"
	.byte	0x7
	.byte	0x8f
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"ROM\000"
	.byte	0x7
	.byte	0x90
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.4byte	.LASF166
	.byte	0x7
	.byte	0x91
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.4byte	.LASF167
	.byte	0x7
	.byte	0x92
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.4byte	.LASF168
	.byte	0x7
	.byte	0x93
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.4byte	.LASF169
	.byte	0x7
	.byte	0x94
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.4byte	.LASF170
	.byte	0x7
	.byte	0x95
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.4byte	.LASF171
	.byte	0x7
	.byte	0x96
	.4byte	0xde
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xe
	.4byte	.LASF172
	.byte	0x7
	.byte	0x97
	.4byte	0xde
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0xe
	.4byte	.LASF173
	.byte	0x7
	.byte	0x98
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xe
	.4byte	.LASF174
	.byte	0x7
	.byte	0x99
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xc
	.ascii	"Map\000"
	.byte	0x7
	.byte	0x9a
	.4byte	0x1107
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xe
	.4byte	.LASF175
	.byte	0x7
	.byte	0x9b
	.4byte	0x1107
	.byte	0x4
	.byte	0x23
	.uleb128 0x4024
	.uleb128 0xe
	.4byte	.LASF176
	.byte	0x7
	.byte	0x9c
	.4byte	0x1118
	.byte	0x4
	.byte	0x23
	.uleb128 0x8024
	.uleb128 0xe
	.4byte	.LASF177
	.byte	0x7
	.byte	0x9d
	.4byte	0x1129
	.byte	0x4
	.byte	0x23
	.uleb128 0xc024
	.uleb128 0xe
	.4byte	.LASF178
	.byte	0x7
	.byte	0x9e
	.4byte	0x1129
	.byte	0x4
	.byte	0x23
	.uleb128 0xd024
	.uleb128 0xe
	.4byte	.LASF179
	.byte	0x7
	.byte	0x9f
	.4byte	0x113a
	.byte	0x4
	.byte	0x23
	.uleb128 0xe024
	.uleb128 0xe
	.4byte	.LASF180
	.byte	0x7
	.byte	0xa0
	.4byte	0x114a
	.byte	0x4
	.byte	0x23
	.uleb128 0xe03b
	.uleb128 0xe
	.4byte	.LASF181
	.byte	0x7
	.byte	0xa1
	.4byte	0x115a
	.byte	0x4
	.byte	0x23
	.uleb128 0xe040
	.uleb128 0xe
	.4byte	.LASF182
	.byte	0x7
	.byte	0xa2
	.4byte	0xa7
	.byte	0x4
	.byte	0x23
	.uleb128 0xe043
	.uleb128 0xe
	.4byte	.LASF183
	.byte	0x7
	.byte	0xa3
	.4byte	0xa7
	.byte	0x4
	.byte	0x23
	.uleb128 0xe044
	.uleb128 0xe
	.4byte	.LASF184
	.byte	0x7
	.byte	0xa4
	.4byte	0xa7
	.byte	0x4
	.byte	0x23
	.uleb128 0xe045
	.uleb128 0xe
	.4byte	.LASF185
	.byte	0x7
	.byte	0xa5
	.4byte	0xd3
	.byte	0x4
	.byte	0x23
	.uleb128 0xe048
	.uleb128 0xe
	.4byte	.LASF186
	.byte	0x7
	.byte	0xa6
	.4byte	0xd3
	.byte	0x4
	.byte	0x23
	.uleb128 0xe04c
	.uleb128 0xe
	.4byte	.LASF187
	.byte	0x7
	.byte	0xa7
	.4byte	0xc8
	.byte	0x4
	.byte	0x23
	.uleb128 0xe050
	.uleb128 0xe
	.4byte	.LASF188
	.byte	0x7
	.byte	0xa8
	.4byte	0xc8
	.byte	0x4
	.byte	0x23
	.uleb128 0xe054
	.uleb128 0xe
	.4byte	.LASF189
	.byte	0x7
	.byte	0xa9
	.4byte	0xc8
	.byte	0x4
	.byte	0x23
	.uleb128 0xe058
	.uleb128 0xe
	.4byte	.LASF190
	.byte	0x7
	.byte	0xaa
	.4byte	0xc8
	.byte	0x4
	.byte	0x23
	.uleb128 0xe05c
	.uleb128 0xe
	.4byte	.LASF191
	.byte	0x7
	.byte	0xab
	.4byte	0x416
	.byte	0x4
	.byte	0x23
	.uleb128 0xe060
	.uleb128 0xe
	.4byte	.LASF192
	.byte	0x7
	.byte	0xac
	.4byte	0x416
	.byte	0x4
	.byte	0x23
	.uleb128 0xe064
	.uleb128 0xe
	.4byte	.LASF193
	.byte	0x7
	.byte	0xad
	.4byte	0xc8
	.byte	0x4
	.byte	0x23
	.uleb128 0xe068
	.uleb128 0xe
	.4byte	.LASF194
	.byte	0x7
	.byte	0xae
	.4byte	0xc8
	.byte	0x4
	.byte	0x23
	.uleb128 0xe06c
	.uleb128 0xe
	.4byte	.LASF195
	.byte	0x7
	.byte	0xaf
	.4byte	0xc8
	.byte	0x4
	.byte	0x23
	.uleb128 0xe070
	.uleb128 0xe
	.4byte	.LASF196
	.byte	0x7
	.byte	0xb0
	.4byte	0x116a
	.byte	0x4
	.byte	0x23
	.uleb128 0xe074
	.uleb128 0xe
	.4byte	.LASF197
	.byte	0x7
	.byte	0xb2
	.4byte	0x117b
	.byte	0x4
	.byte	0x23
	.uleb128 0x10074
	.uleb128 0x14
	.4byte	0xce7
	.byte	0x1
	.4byte	.LASF198
	.byte	0x7
	.byte	0x5c
	.4byte	.LASF200
	.4byte	0xde
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0x91
	.byte	0x0
	.uleb128 0x17
	.4byte	0xd04
	.byte	0x1
	.4byte	.LASF199
	.byte	0x7
	.byte	0x5d
	.4byte	.LASF201
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0xde
	.byte	0x0
	.uleb128 0x14
	.4byte	0xd25
	.byte	0x1
	.4byte	.LASF202
	.byte	0x7
	.byte	0x5e
	.4byte	.LASF203
	.4byte	0xde
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0x91
	.byte	0x0
	.uleb128 0x14
	.4byte	0xd46
	.byte	0x1
	.4byte	.LASF204
	.byte	0x7
	.byte	0x5f
	.4byte	.LASF205
	.4byte	0xde
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0x91
	.byte	0x0
	.uleb128 0x14
	.4byte	0xd62
	.byte	0x1
	.4byte	.LASF206
	.byte	0x7
	.byte	0x60
	.4byte	.LASF207
	.4byte	0xde
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xd7a
	.byte	0x1
	.4byte	.LASF208
	.byte	0x7
	.byte	0x61
	.4byte	.LASF209
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xd92
	.byte	0x1
	.4byte	.LASF210
	.byte	0x7
	.byte	0x62
	.4byte	.LASF211
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xdaa
	.byte	0x1
	.4byte	.LASF212
	.byte	0x7
	.byte	0x64
	.4byte	.LASF213
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xdc2
	.byte	0x1
	.4byte	.LASF214
	.byte	0x7
	.byte	0x65
	.4byte	.LASF215
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xdda
	.byte	0x1
	.4byte	.LASF216
	.byte	0x7
	.byte	0x66
	.4byte	.LASF217
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xdf2
	.byte	0x1
	.4byte	.LASF218
	.byte	0x7
	.byte	0x67
	.4byte	.LASF219
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0xe13
	.byte	0x1
	.4byte	.LASF220
	.byte	0x7
	.byte	0x68
	.4byte	.LASF221
	.4byte	0x82
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0x91
	.byte	0x0
	.uleb128 0x17
	.4byte	0xe2b
	.byte	0x1
	.4byte	.LASF222
	.byte	0x7
	.byte	0x6a
	.4byte	.LASF223
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xe43
	.byte	0x1
	.4byte	.LASF224
	.byte	0x7
	.byte	0x6b
	.4byte	.LASF225
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xe5b
	.byte	0x1
	.4byte	.LASF226
	.byte	0x7
	.byte	0x6c
	.4byte	.LASF227
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xe73
	.byte	0x1
	.4byte	.LASF228
	.byte	0x7
	.byte	0x6d
	.4byte	.LASF229
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xe8b
	.byte	0x1
	.4byte	.LASF230
	.byte	0x7
	.byte	0x6e
	.4byte	.LASF231
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xea3
	.byte	0x1
	.4byte	.LASF232
	.byte	0x7
	.byte	0x6f
	.4byte	.LASF233
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xebb
	.byte	0x1
	.4byte	.LASF234
	.byte	0x7
	.byte	0x70
	.4byte	.LASF235
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xed8
	.byte	0x1
	.4byte	.LASF236
	.byte	0x7
	.byte	0x71
	.4byte	.LASF237
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0xde
	.byte	0x0
	.uleb128 0x17
	.4byte	0xef0
	.byte	0x1
	.4byte	.LASF238
	.byte	0x7
	.byte	0x72
	.4byte	.LASF239
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xf08
	.byte	0x1
	.4byte	.LASF240
	.byte	0x7
	.byte	0x73
	.4byte	.LASF241
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xf20
	.byte	0x1
	.4byte	.LASF242
	.byte	0x7
	.byte	0x74
	.4byte	.LASF243
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0xf46
	.byte	0x1
	.4byte	.LASF244
	.byte	0x7
	.byte	0x75
	.4byte	.LASF245
	.4byte	0xde
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0x416
	.uleb128 0x16
	.4byte	0x4f
	.byte	0x0
	.uleb128 0x14
	.4byte	0xf67
	.byte	0x1
	.4byte	.LASF246
	.byte	0x7
	.byte	0x76
	.4byte	.LASF247
	.4byte	0x4f
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0xde
	.byte	0x0
	.uleb128 0x14
	.4byte	0xf88
	.byte	0x1
	.4byte	.LASF248
	.byte	0x7
	.byte	0x77
	.4byte	.LASF249
	.4byte	0x4f
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0xde
	.byte	0x0
	.uleb128 0x17
	.4byte	0xfa0
	.byte	0x1
	.4byte	.LASF250
	.byte	0x7
	.byte	0x78
	.4byte	.LASF251
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x17
	.4byte	0xfc7
	.byte	0x1
	.4byte	.LASF252
	.byte	0x7
	.byte	0x7a
	.4byte	.LASF253
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0x91
	.uleb128 0x16
	.4byte	0xde
	.uleb128 0x16
	.4byte	0x1192
	.byte	0x0
	.uleb128 0x14
	.4byte	0xfe3
	.byte	0x1
	.4byte	.LASF254
	.byte	0x7
	.byte	0x7c
	.4byte	.LASF255
	.4byte	0x91
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0xfff
	.byte	0x1
	.4byte	.LASF256
	.byte	0x7
	.byte	0x7d
	.4byte	.LASF257
	.4byte	0x91
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0x101b
	.byte	0x1
	.4byte	.LASF258
	.byte	0x7
	.byte	0x7e
	.4byte	.LASF259
	.4byte	0x91
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0x1037
	.byte	0x1
	.4byte	.LASF260
	.byte	0x7
	.byte	0x7f
	.4byte	.LASF261
	.4byte	0x91
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0x1053
	.byte	0x1
	.4byte	.LASF262
	.byte	0x7
	.byte	0x80
	.4byte	.LASF263
	.4byte	0x91
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0x106f
	.byte	0x1
	.4byte	.LASF264
	.byte	0x7
	.byte	0x81
	.4byte	.LASF265
	.4byte	0x91
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0x108b
	.byte	0x1
	.4byte	.LASF266
	.byte	0x7
	.byte	0x82
	.4byte	.LASF267
	.4byte	0x91
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0x10a7
	.byte	0x1
	.4byte	.LASF268
	.byte	0x7
	.byte	0x83
	.4byte	.LASF269
	.4byte	0x91
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0x10c3
	.byte	0x1
	.4byte	.LASF270
	.byte	0x7
	.byte	0x84
	.4byte	.LASF271
	.4byte	0x91
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x14
	.4byte	0x10df
	.byte	0x1
	.4byte	.LASF272
	.byte	0x7
	.byte	0x85
	.4byte	.LASF273
	.4byte	0x91
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.byte	0x0
	.uleb128 0x18
	.byte	0x1
	.4byte	.LASF508
	.byte	0x7
	.byte	0x86
	.4byte	.LASF509
	.4byte	0xc8
	.byte	0x1
	.uleb128 0x15
	.4byte	0x118c
	.byte	0x1
	.uleb128 0x16
	.4byte	0x416
	.uleb128 0x16
	.4byte	0xc8
	.uleb128 0x16
	.4byte	0xc8
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1118
	.4byte	0x416
	.uleb128 0x19
	.4byte	0x7b
	.2byte	0xfff
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1129
	.4byte	0xc8
	.uleb128 0x19
	.4byte	0x7b
	.2byte	0xfff
	.byte	0x0
	.uleb128 0x4
	.4byte	0x113a
	.4byte	0xa7
	.uleb128 0x19
	.4byte	0x7b
	.2byte	0xfff
	.byte	0x0
	.uleb128 0x4
	.4byte	0x114a
	.4byte	0x88
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x16
	.byte	0x0
	.uleb128 0x4
	.4byte	0x115a
	.4byte	0x88
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x4
	.byte	0x0
	.uleb128 0x4
	.4byte	0x116a
	.4byte	0x88
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x2
	.byte	0x0
	.uleb128 0x4
	.4byte	0x117b
	.4byte	0xa7
	.uleb128 0x19
	.4byte	0x7b
	.2byte	0x1fff
	.byte	0x0
	.uleb128 0x4
	.4byte	0x118c
	.4byte	0x88
	.uleb128 0x19
	.4byte	0x7b
	.2byte	0x3ff
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xa9f
	.uleb128 0x1a
	.byte	0x4
	.4byte	0xd3
	.uleb128 0xb
	.4byte	0x11cf
	.4byte	.LASF274
	.byte	0x8
	.byte	0x8
	.byte	0x7c
	.uleb128 0xe
	.4byte	.LASF275
	.byte	0x8
	.byte	0x7d
	.4byte	0x2c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"rop\000"
	.byte	0x8
	.byte	0x7e
	.4byte	0x2c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xe
	.4byte	.LASF276
	.byte	0x8
	.byte	0x7f
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x1b
	.4byte	0x1208
	.4byte	.LASF277
	.2byte	0x138
	.byte	0x9
	.byte	0x42
	.uleb128 0xe
	.4byte	.LASF278
	.byte	0x9
	.byte	0x43
	.4byte	0x1208
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF279
	.byte	0x9
	.byte	0x44
	.4byte	0x1218
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.4byte	.LASF280
	.byte	0x9
	.byte	0x45
	.4byte	0x1218
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1218
	.4byte	0xc8
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x5
	.byte	0x0
	.uleb128 0x4
	.4byte	0x122e
	.4byte	0xc8
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x5
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x5
	.byte	0x0
	.uleb128 0x1b
	.4byte	0x1424
	.4byte	.LASF281
	.2byte	0x12f0
	.byte	0x9
	.byte	0x48
	.uleb128 0xe
	.4byte	.LASF282
	.byte	0x9
	.byte	0x49
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF283
	.byte	0x9
	.byte	0x4a
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xe
	.4byte	.LASF284
	.byte	0x9
	.byte	0x4b
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.4byte	.LASF285
	.byte	0x9
	.byte	0x4c
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xe
	.4byte	.LASF286
	.byte	0x9
	.byte	0x4d
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.4byte	.LASF287
	.byte	0x9
	.byte	0x4e
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xe
	.4byte	.LASF288
	.byte	0x9
	.byte	0x4f
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xe
	.4byte	.LASF289
	.byte	0x9
	.byte	0x50
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xe
	.4byte	.LASF290
	.byte	0x9
	.byte	0x51
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.4byte	.LASF291
	.byte	0x9
	.byte	0x52
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.4byte	.LASF292
	.byte	0x9
	.byte	0x53
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.4byte	.LASF293
	.byte	0x9
	.byte	0x54
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.4byte	.LASF294
	.byte	0x9
	.byte	0x55
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.4byte	.LASF295
	.byte	0x9
	.byte	0x56
	.4byte	0x1424
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xe
	.4byte	.LASF296
	.byte	0x9
	.byte	0x57
	.4byte	0x1424
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xe
	.4byte	.LASF297
	.byte	0x9
	.byte	0x58
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xe
	.4byte	.LASF298
	.byte	0x9
	.byte	0x59
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x35
	.uleb128 0xe
	.4byte	.LASF299
	.byte	0x9
	.byte	0x5a
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x36
	.uleb128 0xe
	.4byte	.LASF300
	.byte	0x9
	.byte	0x5b
	.4byte	0x4f
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xe
	.4byte	.LASF301
	.byte	0x9
	.byte	0x5c
	.4byte	0x4f
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xc
	.ascii	"Red\000"
	.byte	0x9
	.byte	0x5d
	.4byte	0x1434
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xe
	.4byte	.LASF302
	.byte	0x9
	.byte	0x5e
	.4byte	0x1434
	.byte	0x3
	.byte	0x23
	.uleb128 0x440
	.uleb128 0xe
	.4byte	.LASF303
	.byte	0x9
	.byte	0x5f
	.4byte	0x1434
	.byte	0x3
	.byte	0x23
	.uleb128 0x840
	.uleb128 0xc
	.ascii	"XB\000"
	.byte	0x9
	.byte	0x60
	.4byte	0x416
	.byte	0x3
	.byte	0x23
	.uleb128 0xc40
	.uleb128 0xe
	.4byte	.LASF304
	.byte	0x9
	.byte	0x61
	.4byte	0x1434
	.byte	0x3
	.byte	0x23
	.uleb128 0xc44
	.uleb128 0xe
	.4byte	.LASF305
	.byte	0x9
	.byte	0x62
	.4byte	0x4f
	.byte	0x3
	.byte	0x23
	.uleb128 0x1044
	.uleb128 0xe
	.4byte	.LASF306
	.byte	0x9
	.byte	0x63
	.4byte	0x4f
	.byte	0x3
	.byte	0x23
	.uleb128 0x1048
	.uleb128 0xe
	.4byte	.LASF307
	.byte	0x9
	.byte	0x64
	.4byte	0x4f
	.byte	0x3
	.byte	0x23
	.uleb128 0x104c
	.uleb128 0xe
	.4byte	.LASF308
	.byte	0x9
	.byte	0x65
	.4byte	0x1444
	.byte	0x3
	.byte	0x23
	.uleb128 0x1050
	.uleb128 0xe
	.4byte	.LASF105
	.byte	0x9
	.byte	0x66
	.4byte	0xc8
	.byte	0x3
	.byte	0x23
	.uleb128 0x1064
	.uleb128 0xe
	.4byte	.LASF104
	.byte	0x9
	.byte	0x67
	.4byte	0x1454
	.byte	0x3
	.byte	0x23
	.uleb128 0x1068
	.uleb128 0xe
	.4byte	.LASF309
	.byte	0x9
	.byte	0x68
	.4byte	0x6b
	.byte	0x3
	.byte	0x23
	.uleb128 0x1070
	.uleb128 0xe
	.4byte	.LASF310
	.byte	0x9
	.byte	0x69
	.4byte	0x6b
	.byte	0x3
	.byte	0x23
	.uleb128 0x1078
	.uleb128 0xe
	.4byte	.LASF311
	.byte	0x9
	.byte	0x6a
	.4byte	0x1464
	.byte	0x3
	.byte	0x23
	.uleb128 0x1080
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1434
	.4byte	0x416
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x2
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1444
	.4byte	0xc8
	.uleb128 0x5
	.4byte	0x7b
	.byte	0xff
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1454
	.4byte	0xc8
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x4
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1464
	.4byte	0xc8
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x1
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1474
	.4byte	0x11cf
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x1
	.byte	0x0
	.uleb128 0xb
	.4byte	0x14f1
	.4byte	.LASF312
	.byte	0xc
	.byte	0x9
	.byte	0x6e
	.uleb128 0xe
	.4byte	.LASF313
	.byte	0x9
	.byte	0x6f
	.4byte	0x48
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF314
	.byte	0x9
	.byte	0x70
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.4byte	.LASF315
	.byte	0x9
	.byte	0x71
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.4byte	.LASF316
	.byte	0x9
	.byte	0x72
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xe
	.4byte	.LASF317
	.byte	0x9
	.byte	0x73
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xe
	.4byte	.LASF318
	.byte	0x9
	.byte	0x74
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.4byte	.LASF319
	.byte	0x9
	.byte	0x75
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xe
	.4byte	.LASF266
	.byte	0x9
	.byte	0x76
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x1b
	.4byte	0x19ff
	.4byte	.LASF320
	.2byte	0xaf0
	.byte	0x9
	.byte	0x79
	.uleb128 0xb
	.4byte	0x155f
	.4byte	.LASF321
	.byte	0xc
	.byte	0x9
	.byte	0x7e
	.uleb128 0xe
	.4byte	.LASF322
	.byte	0x9
	.byte	0x7f
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF323
	.byte	0x9
	.byte	0x80
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xe
	.4byte	.LASF324
	.byte	0x9
	.byte	0x81
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.4byte	.LASF325
	.byte	0x9
	.byte	0x82
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.4byte	.LASF326
	.byte	0x9
	.byte	0x83
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xe
	.4byte	.LASF327
	.byte	0x9
	.byte	0x84
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xb
	.4byte	0x15ce
	.4byte	.LASF328
	.byte	0x10
	.byte	0x9
	.byte	0x87
	.uleb128 0xe
	.4byte	.LASF329
	.byte	0x9
	.byte	0x88
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF330
	.byte	0x9
	.byte	0x89
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.4byte	.LASF331
	.byte	0x9
	.byte	0x8a
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.4byte	.LASF332
	.byte	0x9
	.byte	0x8b
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xe
	.4byte	.LASF333
	.byte	0x9
	.byte	0x8c
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.4byte	.LASF334
	.byte	0x9
	.byte	0x8d
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xe
	.4byte	.LASF335
	.byte	0x9
	.byte	0x8e
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xe
	.4byte	.LASF336
	.byte	0x9
	.byte	0x7a
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF337
	.byte	0x9
	.byte	0x7b
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xe
	.4byte	.LASF338
	.byte	0x9
	.byte	0x7c
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xc
	.ascii	"VMA\000"
	.byte	0x9
	.byte	0x85
	.4byte	0x14fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.ascii	"BG\000"
	.byte	0x9
	.byte	0x8f
	.4byte	0x19ff
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.4byte	.LASF339
	.byte	0x9
	.byte	0x91
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xe
	.4byte	.LASF340
	.byte	0x9
	.byte	0x92
	.4byte	0x1a0f
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0xe
	.4byte	.LASF341
	.byte	0x9
	.byte	0x93
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x252
	.uleb128 0xe
	.4byte	.LASF342
	.byte	0x9
	.byte	0x94
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x253
	.uleb128 0xc
	.ascii	"OBJ\000"
	.byte	0x9
	.byte	0x95
	.4byte	0x1a1f
	.byte	0x3
	.byte	0x23
	.uleb128 0x254
	.uleb128 0xe
	.4byte	.LASF343
	.byte	0x9
	.byte	0x96
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x854
	.uleb128 0xe
	.4byte	.LASF344
	.byte	0x9
	.byte	0x97
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0x856
	.uleb128 0xe
	.4byte	.LASF345
	.byte	0x9
	.byte	0x99
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x858
	.uleb128 0xe
	.4byte	.LASF346
	.byte	0x9
	.byte	0x9a
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0x85a
	.uleb128 0xe
	.4byte	.LASF347
	.byte	0x9
	.byte	0x9b
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0x85c
	.uleb128 0xe
	.4byte	.LASF348
	.byte	0x9
	.byte	0x9c
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0x85e
	.uleb128 0xe
	.4byte	.LASF349
	.byte	0x9
	.byte	0x9d
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0x860
	.uleb128 0xe
	.4byte	.LASF350
	.byte	0x9
	.byte	0x9e
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0x862
	.uleb128 0xe
	.4byte	.LASF351
	.byte	0x9
	.byte	0xa0
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x864
	.uleb128 0xe
	.4byte	.LASF352
	.byte	0x9
	.byte	0xa1
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x865
	.uleb128 0xe
	.4byte	.LASF353
	.byte	0x9
	.byte	0xa2
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x866
	.uleb128 0xe
	.4byte	.LASF354
	.byte	0x9
	.byte	0xa4
	.4byte	0x48
	.byte	0x3
	.byte	0x23
	.uleb128 0x868
	.uleb128 0xe
	.4byte	.LASF355
	.byte	0x9
	.byte	0xa5
	.4byte	0x48
	.byte	0x3
	.byte	0x23
	.uleb128 0x86a
	.uleb128 0xe
	.4byte	.LASF356
	.byte	0x9
	.byte	0xa6
	.4byte	0x48
	.byte	0x3
	.byte	0x23
	.uleb128 0x86c
	.uleb128 0xe
	.4byte	.LASF357
	.byte	0x9
	.byte	0xa7
	.4byte	0x48
	.byte	0x3
	.byte	0x23
	.uleb128 0x86e
	.uleb128 0xe
	.4byte	.LASF358
	.byte	0x9
	.byte	0xa8
	.4byte	0x48
	.byte	0x3
	.byte	0x23
	.uleb128 0x870
	.uleb128 0xe
	.4byte	.LASF359
	.byte	0x9
	.byte	0xa9
	.4byte	0x48
	.byte	0x3
	.byte	0x23
	.uleb128 0x872
	.uleb128 0xe
	.4byte	.LASF360
	.byte	0x9
	.byte	0xaa
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x874
	.uleb128 0xe
	.4byte	.LASF361
	.byte	0x9
	.byte	0xab
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x875
	.uleb128 0xe
	.4byte	.LASF362
	.byte	0x9
	.byte	0xad
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x876
	.uleb128 0xe
	.4byte	.LASF363
	.byte	0x9
	.byte	0xae
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x877
	.uleb128 0xe
	.4byte	.LASF364
	.byte	0x9
	.byte	0xaf
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x878
	.uleb128 0xe
	.4byte	.LASF365
	.byte	0x9
	.byte	0xb0
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x879
	.uleb128 0xe
	.4byte	.LASF366
	.byte	0x9
	.byte	0xb1
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0x87a
	.uleb128 0xe
	.4byte	.LASF367
	.byte	0x9
	.byte	0xb2
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0x87c
	.uleb128 0xe
	.4byte	.LASF368
	.byte	0x9
	.byte	0xb3
	.4byte	0xc8
	.byte	0x3
	.byte	0x23
	.uleb128 0x880
	.uleb128 0xe
	.4byte	.LASF369
	.byte	0x9
	.byte	0xb4
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x884
	.uleb128 0xe
	.4byte	.LASF370
	.byte	0x9
	.byte	0xb5
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x885
	.uleb128 0xe
	.4byte	.LASF371
	.byte	0x9
	.byte	0xb6
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x886
	.uleb128 0xe
	.4byte	.LASF372
	.byte	0x9
	.byte	0xb7
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x887
	.uleb128 0xe
	.4byte	.LASF373
	.byte	0x9
	.byte	0xb8
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x888
	.uleb128 0xe
	.4byte	.LASF374
	.byte	0x9
	.byte	0xb9
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0x88a
	.uleb128 0xe
	.4byte	.LASF375
	.byte	0x9
	.byte	0xba
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0x88c
	.uleb128 0xe
	.4byte	.LASF376
	.byte	0x9
	.byte	0xbb
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0x88d
	.uleb128 0xe
	.4byte	.LASF377
	.byte	0x9
	.byte	0xbc
	.4byte	0x1a2f
	.byte	0x3
	.byte	0x23
	.uleb128 0x88e
	.uleb128 0xe
	.4byte	.LASF378
	.byte	0x9
	.byte	0xbd
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0xaae
	.uleb128 0xe
	.4byte	.LASF379
	.byte	0x9
	.byte	0xbe
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0xaaf
	.uleb128 0xe
	.4byte	.LASF380
	.byte	0x9
	.byte	0xbf
	.4byte	0x48
	.byte	0x3
	.byte	0x23
	.uleb128 0xab0
	.uleb128 0xe
	.4byte	.LASF381
	.byte	0x9
	.byte	0xc0
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0xab2
	.uleb128 0xe
	.4byte	.LASF382
	.byte	0x9
	.byte	0xc1
	.4byte	0x1a40
	.byte	0x3
	.byte	0x23
	.uleb128 0xab3
	.uleb128 0xe
	.4byte	.LASF383
	.byte	0x9
	.byte	0xc2
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0xab7
	.uleb128 0xe
	.4byte	.LASF384
	.byte	0x9
	.byte	0xc3
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0xab8
	.uleb128 0xe
	.4byte	.LASF385
	.byte	0x9
	.byte	0xc4
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0xab9
	.uleb128 0xe
	.4byte	.LASF386
	.byte	0x9
	.byte	0xc5
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0xaba
	.uleb128 0xe
	.4byte	.LASF387
	.byte	0x9
	.byte	0xc6
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0xabb
	.uleb128 0xe
	.4byte	.LASF388
	.byte	0x9
	.byte	0xc7
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0xabc
	.uleb128 0xe
	.4byte	.LASF389
	.byte	0x9
	.byte	0xc8
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0xabd
	.uleb128 0xe
	.4byte	.LASF390
	.byte	0x9
	.byte	0xc9
	.4byte	0x1a50
	.byte	0x3
	.byte	0x23
	.uleb128 0xabe
	.uleb128 0xe
	.4byte	.LASF391
	.byte	0x9
	.byte	0xca
	.4byte	0x1a50
	.byte	0x3
	.byte	0x23
	.uleb128 0xac4
	.uleb128 0xe
	.4byte	.LASF392
	.byte	0x9
	.byte	0xcb
	.4byte	0x1a50
	.byte	0x3
	.byte	0x23
	.uleb128 0xaca
	.uleb128 0xe
	.4byte	.LASF393
	.byte	0x9
	.byte	0xcc
	.4byte	0x1a50
	.byte	0x3
	.byte	0x23
	.uleb128 0xad0
	.uleb128 0xe
	.4byte	.LASF394
	.byte	0x9
	.byte	0xcd
	.4byte	0x1a60
	.byte	0x3
	.byte	0x23
	.uleb128 0xad6
	.uleb128 0xe
	.4byte	.LASF395
	.byte	0x9
	.byte	0xce
	.4byte	0x1a60
	.byte	0x3
	.byte	0x23
	.uleb128 0xadc
	.uleb128 0xe
	.4byte	.LASF396
	.byte	0x9
	.byte	0xcf
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0xae2
	.uleb128 0xe
	.4byte	.LASF397
	.byte	0x9
	.byte	0xd0
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0xae3
	.uleb128 0xe
	.4byte	.LASF398
	.byte	0x9
	.byte	0xd1
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0xae4
	.uleb128 0xe
	.4byte	.LASF399
	.byte	0x9
	.byte	0xd2
	.4byte	0x9c
	.byte	0x3
	.byte	0x23
	.uleb128 0xae6
	.uleb128 0xe
	.4byte	.LASF400
	.byte	0x9
	.byte	0xd3
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0xae7
	.uleb128 0xe
	.4byte	.LASF401
	.byte	0x9
	.byte	0xd4
	.4byte	0x1a70
	.byte	0x3
	.byte	0x23
	.uleb128 0xae8
	.uleb128 0xe
	.4byte	.LASF402
	.byte	0x9
	.byte	0xd5
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaea
	.uleb128 0xe
	.4byte	.LASF403
	.byte	0x9
	.byte	0xd6
	.4byte	0xb2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaec
	.uleb128 0xe
	.4byte	.LASF404
	.byte	0x9
	.byte	0xd7
	.4byte	0xa7
	.byte	0x3
	.byte	0x23
	.uleb128 0xaee
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1a0f
	.4byte	0x155f
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x3
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1a1f
	.4byte	0xb2
	.uleb128 0x5
	.4byte	0x7b
	.byte	0xff
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1a2f
	.4byte	0x1474
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x7f
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1a40
	.4byte	0xa7
	.uleb128 0x19
	.4byte	0x7b
	.2byte	0x21f
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1a50
	.4byte	0x9c
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x3
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1a60
	.4byte	0xa7
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x5
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1a70
	.4byte	0x9c
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x5
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1a80
	.4byte	0xa7
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x1
	.byte	0x0
	.uleb128 0x1b
	.4byte	0x1c9e
	.4byte	.LASF405
	.2byte	0x674
	.byte	0x3
	.byte	0x33
	.uleb128 0xe
	.4byte	.LASF406
	.byte	0x3
	.byte	0x35
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF407
	.byte	0x3
	.byte	0x36
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.4byte	.LASF408
	.byte	0x3
	.byte	0x37
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.4byte	.LASF409
	.byte	0x3
	.byte	0x38
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.4byte	.LASF410
	.byte	0x3
	.byte	0x39
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.4byte	.LASF411
	.byte	0x3
	.byte	0x3c
	.4byte	0x4f
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xc
	.ascii	"X2\000"
	.byte	0x3
	.byte	0x3d
	.4byte	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.4byte	.LASF412
	.byte	0x3
	.byte	0x3e
	.4byte	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xe
	.4byte	.LASF413
	.byte	0x3
	.byte	0x3f
	.4byte	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xc
	.ascii	"S\000"
	.byte	0x3
	.byte	0x40
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xc
	.ascii	"DB\000"
	.byte	0x3
	.byte	0x41
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xe
	.4byte	.LASF304
	.byte	0x3
	.byte	0x42
	.4byte	0x431
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xe
	.4byte	.LASF414
	.byte	0x3
	.byte	0x43
	.4byte	0x431
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xe
	.4byte	.LASF415
	.byte	0x3
	.byte	0x44
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xe
	.4byte	.LASF416
	.byte	0x3
	.byte	0x45
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xe
	.4byte	.LASF417
	.byte	0x3
	.byte	0x46
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xc
	.ascii	"Z1\000"
	.byte	0x3
	.byte	0x47
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xc
	.ascii	"Z2\000"
	.byte	0x3
	.byte	0x48
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xe
	.4byte	.LASF418
	.byte	0x3
	.byte	0x49
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0xe
	.4byte	.LASF419
	.byte	0x3
	.byte	0x4a
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0xe
	.4byte	.LASF420
	.byte	0x3
	.byte	0x4b
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0xe
	.4byte	.LASF421
	.byte	0x3
	.byte	0x4c
	.4byte	0x1ca4
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xe
	.4byte	.LASF422
	.byte	0x3
	.byte	0x4d
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0xe
	.4byte	.LASF423
	.byte	0x3
	.byte	0x4e
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0xe
	.4byte	.LASF424
	.byte	0x3
	.byte	0x50
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0xe
	.4byte	.LASF425
	.byte	0x3
	.byte	0x51
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0xe
	.4byte	.LASF426
	.byte	0x3
	.byte	0x52
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0xe
	.4byte	.LASF427
	.byte	0x3
	.byte	0x53
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5f
	.uleb128 0xe
	.4byte	.LASF428
	.byte	0x3
	.byte	0x54
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xe
	.4byte	.LASF429
	.byte	0x3
	.byte	0x55
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x61
	.uleb128 0xe
	.4byte	.LASF430
	.byte	0x3
	.byte	0x56
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xe
	.4byte	.LASF431
	.byte	0x3
	.byte	0x57
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x63
	.uleb128 0xe
	.4byte	.LASF432
	.byte	0x3
	.byte	0x58
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0xe
	.4byte	.LASF433
	.byte	0x3
	.byte	0x59
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x65
	.uleb128 0xe
	.4byte	.LASF434
	.byte	0x3
	.byte	0x5a
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.uleb128 0xe
	.4byte	.LASF435
	.byte	0x3
	.byte	0x5c
	.4byte	0x1caa
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0xe
	.4byte	.LASF436
	.byte	0x3
	.byte	0x5d
	.4byte	0x1cba
	.byte	0x3
	.byte	0x23
	.uleb128 0x26c
	.uleb128 0xe
	.4byte	.LASF437
	.byte	0x3
	.byte	0x5e
	.4byte	0x1caa
	.byte	0x3
	.byte	0x23
	.uleb128 0x470
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xb2
	.uleb128 0x6
	.byte	0x4
	.4byte	0x11cf
	.uleb128 0x4
	.4byte	0x1cba
	.4byte	0x4f
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x80
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1cca
	.4byte	0xc8
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x80
	.byte	0x0
	.uleb128 0xb
	.4byte	0x1d0d
	.4byte	.LASF438
	.byte	0x10
	.byte	0x3
	.byte	0x68
	.uleb128 0xb
	.4byte	0x1cff
	.4byte	.LASF439
	.byte	0x4
	.byte	0x3
	.byte	0x69
	.uleb128 0xe
	.4byte	.LASF330
	.byte	0x3
	.byte	0x6a
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF331
	.byte	0x3
	.byte	0x6b
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xc
	.ascii	"BG\000"
	.byte	0x3
	.byte	0x6c
	.4byte	0x1d0d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x4
	.4byte	0x1d1d
	.4byte	0x1cd6
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x3
	.byte	0x0
	.uleb128 0xb
	.4byte	0x1d7e
	.4byte	.LASF440
	.byte	0xc
	.byte	0x3
	.byte	0x86
	.uleb128 0xe
	.4byte	.LASF354
	.byte	0x3
	.byte	0x87
	.4byte	0x48
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF355
	.byte	0x3
	.byte	0x88
	.4byte	0x48
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.4byte	.LASF356
	.byte	0x3
	.byte	0x89
	.4byte	0x48
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.4byte	.LASF357
	.byte	0x3
	.byte	0x8a
	.4byte	0x48
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xe
	.4byte	.LASF358
	.byte	0x3
	.byte	0x8b
	.4byte	0x48
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.4byte	.LASF359
	.byte	0x3
	.byte	0x8c
	.4byte	0x48
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0xb
	.4byte	0x1d99
	.4byte	.LASF441
	.byte	0x4
	.byte	0xa
	.byte	0x33
	.uleb128 0xe
	.4byte	.LASF442
	.byte	0xa
	.byte	0x37
	.4byte	0x1d9a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1d99
	.uleb128 0xb
	.4byte	0x1e55
	.4byte	.LASF443
	.byte	0x24
	.byte	0xa
	.byte	0x3c
	.uleb128 0xe
	.4byte	.LASF256
	.byte	0xa
	.byte	0x3d
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF444
	.byte	0xa
	.byte	0x3e
	.4byte	0x1e55
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.4byte	.LASF445
	.byte	0xa
	.byte	0x3f
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.4byte	.LASF446
	.byte	0xa
	.byte	0x40
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xe
	.4byte	.LASF447
	.byte	0xa
	.byte	0x41
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xe
	.4byte	.LASF448
	.byte	0xa
	.byte	0x42
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xe
	.4byte	.LASF449
	.byte	0xa
	.byte	0x43
	.4byte	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.4byte	.LASF450
	.byte	0xa
	.byte	0x44
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.4byte	.LASF451
	.byte	0xa
	.byte	0x45
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.4byte	.LASF452
	.byte	0xa
	.byte	0x46
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.4byte	.LASF453
	.byte	0xa
	.byte	0x47
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xe
	.4byte	.LASF454
	.byte	0xa
	.byte	0x48
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1d7e
	.uleb128 0xa
	.4byte	0x1eaa
	.4byte	.LASF456
	.byte	0x4
	.byte	0xc
	.byte	0x58
	.uleb128 0xb
	.4byte	0x1e8c
	.4byte	.LASF457
	.byte	0x4
	.byte	0xc
	.byte	0x5a
	.uleb128 0xc
	.ascii	"A\000"
	.byte	0xc
	.byte	0x5a
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"Y\000"
	.byte	0xc
	.byte	0x5a
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0xd
	.ascii	"B\000"
	.byte	0xc
	.byte	0x5a
	.4byte	0x1e67
	.uleb128 0xd
	.ascii	"W\000"
	.byte	0xc
	.byte	0x5e
	.4byte	0xb2
	.uleb128 0x1d
	.4byte	.LASF458
	.byte	0xc
	.byte	0x5f
	.4byte	0xc8
	.byte	0x0
	.uleb128 0xb
	.4byte	0x2029
	.4byte	.LASF459
	.byte	0x4c
	.byte	0xb
	.byte	0x46
	.uleb128 0xe
	.4byte	.LASF460
	.byte	0xb
	.byte	0x47
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.4byte	.LASF324
	.byte	0xb
	.byte	0x48
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.4byte	.LASF461
	.byte	0xb
	.byte	0x49
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.4byte	.LASF462
	.byte	0xb
	.byte	0x4a
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0xb
	.byte	0x4b
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.4byte	.LASF463
	.byte	0xb
	.byte	0x4c
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.4byte	.LASF464
	.byte	0xb
	.byte	0x4d
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.4byte	.LASF445
	.byte	0xb
	.byte	0x4e
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xe
	.4byte	.LASF448
	.byte	0xb
	.byte	0x4f
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0xc
	.ascii	"Bit\000"
	.byte	0xb
	.byte	0x50
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xe
	.4byte	.LASF465
	.byte	0xb
	.byte	0x51
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0xe
	.4byte	.LASF466
	.byte	0xb
	.byte	0x52
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xe
	.4byte	.LASF453
	.byte	0xb
	.byte	0x53
	.4byte	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xe
	.4byte	.LASF467
	.byte	0xb
	.byte	0x54
	.4byte	0xd3
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xe
	.4byte	.LASF468
	.byte	0xb
	.byte	0x55
	.4byte	0xd3
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xe
	.4byte	.LASF469
	.byte	0xb
	.byte	0x57
	.4byte	0x431
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xc
	.ascii	"PC\000"
	.byte	0xb
	.byte	0x58
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xc
	.ascii	"YA\000"
	.byte	0xb
	.byte	0x59
	.4byte	0x1e5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xc
	.ascii	"P\000"
	.byte	0xb
	.byte	0x5a
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xe
	.4byte	.LASF470
	.byte	0xb
	.byte	0x5b
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0xe
	.4byte	.LASF471
	.byte	0xb
	.byte	0x5c
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0xe
	.4byte	.LASF446
	.byte	0xb
	.byte	0x5d
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0xc
	.ascii	"X\000"
	.byte	0xb
	.byte	0x5e
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xc
	.ascii	"S\000"
	.byte	0xb
	.byte	0x5f
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0xe
	.4byte	.LASF472
	.byte	0xb
	.byte	0x60
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0xc
	.ascii	"RAM\000"
	.byte	0xb
	.byte	0x61
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0xe
	.4byte	.LASF473
	.byte	0xb
	.byte	0x63
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.byte	0x0
	.uleb128 0x1e
	.4byte	0x21a2
	.byte	0x1
	.4byte	.LASF474
	.byte	0x1
	.byte	0x3a
	.4byte	.LASF475
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	.LLST0
	.uleb128 0x1f
	.4byte	.LASF406
	.byte	0x1
	.byte	0x3a
	.4byte	0x416
	.4byte	.LLST1
	.uleb128 0x20
	.ascii	"bg\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x4f
	.4byte	.LLST2
	.uleb128 0x1f
	.4byte	.LASF476
	.byte	0x1
	.byte	0x3a
	.4byte	0x4f
	.4byte	.LLST3
	.uleb128 0x21
	.ascii	"aa\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.ascii	"cc\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x22
	.4byte	.LASF477
	.byte	0x1
	.byte	0x3d
	.4byte	0x4f
	.4byte	.LLST4
	.uleb128 0x23
	.4byte	.LASF279
	.byte	0x1
	.byte	0x3e
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x23
	.4byte	.LASF280
	.byte	0x1
	.byte	0x3f
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x23
	.4byte	.LASF478
	.byte	0x1
	.byte	0x40
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x23
	.4byte	.LASF331
	.byte	0x1
	.byte	0x42
	.4byte	0xd3
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x24
	.4byte	.LASF330
	.byte	0x1
	.byte	0x43
	.4byte	0xd3
	.uleb128 0x22
	.4byte	.LASF358
	.byte	0x1
	.byte	0x44
	.4byte	0xd3
	.4byte	.LLST5
	.uleb128 0x22
	.4byte	.LASF359
	.byte	0x1
	.byte	0x45
	.4byte	0xd3
	.4byte	.LLST6
	.uleb128 0x25
	.ascii	"d\000"
	.byte	0x1
	.byte	0x46
	.4byte	0x416
	.uleb128 0x25
	.ascii	"p\000"
	.byte	0x1
	.byte	0x47
	.4byte	0x1c9e
	.uleb128 0x21
	.ascii	"dir\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x26
	.ascii	"yy\000"
	.byte	0x1
	.byte	0x49
	.4byte	0x4f
	.4byte	.LLST7
	.uleb128 0x21
	.ascii	"xx\000"
	.byte	0x1
	.byte	0x4a
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.ascii	"yy3\000"
	.byte	0x1
	.byte	0x4b
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x25
	.ascii	"xx3\000"
	.byte	0x1
	.byte	0x4c
	.4byte	0x4f
	.uleb128 0x25
	.ascii	"BB\000"
	.byte	0x1
	.byte	0x4d
	.4byte	0x4f
	.uleb128 0x25
	.ascii	"DD\000"
	.byte	0x1
	.byte	0x4e
	.4byte	0x4f
	.uleb128 0x23
	.4byte	.LASF479
	.byte	0x1
	.byte	0x4f
	.4byte	0xc8
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x23
	.4byte	.LASF480
	.byte	0x1
	.byte	0x50
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x25
	.ascii	"b\000"
	.byte	0x1
	.byte	0x51
	.4byte	0xa7
	.uleb128 0x23
	.4byte	.LASF481
	.byte	0x1
	.byte	0x52
	.4byte	0x416
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.ascii	"l\000"
	.byte	0x1
	.byte	0x58
	.4byte	0x21a2
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1d1d
	.uleb128 0x1e
	.4byte	0x2314
	.byte	0x1
	.4byte	.LASF482
	.byte	0x1
	.byte	0xd7
	.4byte	.LASF483
	.4byte	.LFB30
	.4byte	.LFE30
	.4byte	.LLST8
	.uleb128 0x1f
	.4byte	.LASF406
	.byte	0x1
	.byte	0xd7
	.4byte	0x416
	.4byte	.LLST9
	.uleb128 0x20
	.ascii	"bg\000"
	.byte	0x1
	.byte	0xd7
	.4byte	0x4f
	.4byte	.LLST10
	.uleb128 0x1f
	.4byte	.LASF476
	.byte	0x1
	.byte	0xd7
	.4byte	0x4f
	.4byte	.LLST11
	.uleb128 0x21
	.ascii	"aa\000"
	.byte	0x1
	.byte	0xd9
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x21
	.ascii	"cc\000"
	.byte	0x1
	.byte	0xd9
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x22
	.4byte	.LASF477
	.byte	0x1
	.byte	0xda
	.4byte	0x4f
	.4byte	.LLST12
	.uleb128 0x23
	.4byte	.LASF279
	.byte	0x1
	.byte	0xdb
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x23
	.4byte	.LASF280
	.byte	0x1
	.byte	0xdc
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x23
	.4byte	.LASF478
	.byte	0x1
	.byte	0xdd
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x24
	.4byte	.LASF331
	.byte	0x1
	.byte	0xdf
	.4byte	0xd3
	.uleb128 0x24
	.4byte	.LASF330
	.byte	0x1
	.byte	0xe0
	.4byte	0xd3
	.uleb128 0x22
	.4byte	.LASF358
	.byte	0x1
	.byte	0xe1
	.4byte	0xd3
	.4byte	.LLST13
	.uleb128 0x22
	.4byte	.LASF359
	.byte	0x1
	.byte	0xe2
	.4byte	0xd3
	.4byte	.LLST14
	.uleb128 0x25
	.ascii	"d\000"
	.byte	0x1
	.byte	0xe3
	.4byte	0x416
	.uleb128 0x25
	.ascii	"p\000"
	.byte	0x1
	.byte	0xe4
	.4byte	0x1c9e
	.uleb128 0x26
	.ascii	"yy\000"
	.byte	0x1
	.byte	0xe5
	.4byte	0x4f
	.4byte	.LLST15
	.uleb128 0x21
	.ascii	"xx\000"
	.byte	0x1
	.byte	0xe6
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x25
	.ascii	"BB\000"
	.byte	0x1
	.byte	0xe7
	.4byte	0x4f
	.uleb128 0x25
	.ascii	"DD\000"
	.byte	0x1
	.byte	0xe8
	.4byte	0x4f
	.uleb128 0x23
	.4byte	.LASF479
	.byte	0x1
	.byte	0xe9
	.4byte	0xc8
	.byte	0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x23
	.4byte	.LASF480
	.byte	0x1
	.byte	0xea
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x25
	.ascii	"b\000"
	.byte	0x1
	.byte	0xeb
	.4byte	0xa7
	.uleb128 0x23
	.4byte	.LASF484
	.byte	0x1
	.byte	0xec
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x23
	.4byte	.LASF485
	.byte	0x1
	.byte	0xed
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x23
	.4byte	.LASF481
	.byte	0x1
	.byte	0xf1
	.4byte	0x416
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.ascii	"l\000"
	.byte	0x1
	.byte	0xf8
	.4byte	0x21a2
	.byte	0x0
	.uleb128 0x27
	.4byte	0x2474
	.byte	0x1
	.4byte	.LASF486
	.byte	0x1
	.2byte	0x160
	.4byte	.LASF510
	.4byte	.LFB31
	.4byte	.LFE31
	.4byte	.LLST16
	.uleb128 0x28
	.4byte	.LASF406
	.byte	0x1
	.2byte	0x160
	.4byte	0x416
	.4byte	.LLST17
	.uleb128 0x29
	.ascii	"bg\000"
	.byte	0x1
	.2byte	0x160
	.4byte	0x4f
	.4byte	.LLST18
	.uleb128 0x28
	.4byte	.LASF476
	.byte	0x1
	.2byte	0x160
	.4byte	0x4f
	.4byte	.LLST19
	.uleb128 0x2a
	.ascii	"aa\000"
	.byte	0x1
	.2byte	0x162
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x2a
	.ascii	"cc\000"
	.byte	0x1
	.2byte	0x162
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x2b
	.4byte	.LASF477
	.byte	0x1
	.2byte	0x163
	.4byte	0x4f
	.4byte	.LLST20
	.uleb128 0x2c
	.4byte	.LASF279
	.byte	0x1
	.2byte	0x164
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2c
	.4byte	.LASF280
	.byte	0x1
	.2byte	0x165
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2b
	.4byte	.LASF478
	.byte	0x1
	.2byte	0x166
	.4byte	0xc8
	.4byte	.LLST21
	.uleb128 0x2d
	.4byte	.LASF331
	.byte	0x1
	.2byte	0x168
	.4byte	0xd3
	.uleb128 0x2d
	.4byte	.LASF330
	.byte	0x1
	.2byte	0x169
	.4byte	0xd3
	.uleb128 0x2b
	.4byte	.LASF358
	.byte	0x1
	.2byte	0x16a
	.4byte	0xd3
	.4byte	.LLST22
	.uleb128 0x2b
	.4byte	.LASF359
	.byte	0x1
	.2byte	0x16b
	.4byte	0xd3
	.4byte	.LLST23
	.uleb128 0x2e
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x16c
	.4byte	0x1c9e
	.uleb128 0x2e
	.ascii	"d\000"
	.byte	0x1
	.2byte	0x16d
	.4byte	0x416
	.uleb128 0x2f
	.ascii	"yy\000"
	.byte	0x1
	.2byte	0x16e
	.4byte	0x4f
	.4byte	.LLST24
	.uleb128 0x2a
	.ascii	"xx\000"
	.byte	0x1
	.2byte	0x16f
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2e
	.ascii	"BB\000"
	.byte	0x1
	.2byte	0x170
	.4byte	0x4f
	.uleb128 0x2e
	.ascii	"DD\000"
	.byte	0x1
	.2byte	0x171
	.4byte	0x4f
	.uleb128 0x2c
	.4byte	.LASF479
	.byte	0x1
	.2byte	0x172
	.4byte	0xc8
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x2c
	.4byte	.LASF480
	.byte	0x1
	.2byte	0x173
	.4byte	0xc8
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2e
	.ascii	"l\000"
	.byte	0x1
	.2byte	0x174
	.4byte	0x21a2
	.uleb128 0x2c
	.4byte	.LASF481
	.byte	0x1
	.2byte	0x175
	.4byte	0x416
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0x0
	.uleb128 0x1e
	.4byte	0x24bd
	.byte	0x1
	.4byte	.LASF487
	.byte	0x1
	.byte	0x21
	.4byte	.LASF488
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	.LLST25
	.uleb128 0x1f
	.4byte	.LASF406
	.byte	0x1
	.byte	0x21
	.4byte	0x416
	.4byte	.LLST26
	.uleb128 0x20
	.ascii	"bg\000"
	.byte	0x1
	.byte	0x21
	.4byte	0x4f
	.4byte	.LLST27
	.uleb128 0x1f
	.4byte	.LASF476
	.byte	0x1
	.byte	0x21
	.4byte	0x4f
	.4byte	.LLST28
	.byte	0x0
	.uleb128 0x30
	.4byte	0x25c3
	.ascii	"::\000"
	.byte	0x4
	.byte	0x0
	.uleb128 0x31
	.4byte	.LASF489
	.byte	0x5
	.2byte	0x1a0
	.4byte	0x437
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.ascii	"CPU\000"
	.byte	0x5
	.2byte	0x1a1
	.4byte	0x1a9
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF490
	.byte	0x7
	.byte	0xb9
	.4byte	0xa9f
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF491
	.byte	0x8
	.byte	0x83
	.4byte	0x25ec
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF492
	.byte	0x8
	.byte	0x84
	.4byte	0x25
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF493
	.byte	0x9
	.byte	0x31
	.4byte	0xa7
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF494
	.byte	0x9
	.byte	0x32
	.4byte	0x2624
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.ascii	"PPU\000"
	.byte	0x9
	.2byte	0x109
	.4byte	0x14f1
	.byte	0x1
	.byte	0x1
	.uleb128 0x31
	.4byte	.LASF495
	.byte	0x9
	.2byte	0x10b
	.4byte	0x122e
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF496
	.byte	0x3
	.byte	0x94
	.4byte	0x265d
	.byte	0x1
	.byte	0x1
	.uleb128 0x34
	.ascii	"GFX\000"
	.byte	0x3
	.byte	0xff
	.4byte	0x1a80
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF497
	.byte	0xa
	.byte	0x52
	.4byte	0x268d
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF498
	.byte	0xa
	.byte	0x53
	.4byte	0x268d
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF499
	.byte	0xa
	.byte	0x54
	.4byte	0x268d
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF500
	.byte	0xa
	.byte	0x55
	.4byte	0x268d
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF501
	.byte	0xa
	.byte	0x5f
	.4byte	0x1da0
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF502
	.byte	0xb
	.byte	0x68
	.4byte	0x1eaa
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF503
	.byte	0x1
	.byte	0x9
	.4byte	0x26eb
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF504
	.byte	0x1
	.byte	0xa
	.4byte	0x2708
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x31
	.4byte	.LASF489
	.byte	0x5
	.2byte	0x1a0
	.4byte	0x437
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.ascii	"CPU\000"
	.byte	0x5
	.2byte	0x1a1
	.4byte	0x1a9
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF490
	.byte	0x7
	.byte	0xb9
	.4byte	0xa9f
	.byte	0x1
	.byte	0x1
	.uleb128 0x4
	.4byte	0x25fd
	.4byte	0x1198
	.uleb128 0x19
	.4byte	0x7b
	.2byte	0xffff
	.byte	0x0
	.uleb128 0x33
	.4byte	.LASF491
	.byte	0x8
	.byte	0x83
	.4byte	0x25ec
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF492
	.byte	0x8
	.byte	0x84
	.4byte	0x25
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF493
	.byte	0x9
	.byte	0x31
	.4byte	0xa7
	.byte	0x1
	.byte	0x1
	.uleb128 0x4
	.4byte	0x2634
	.4byte	0xb2
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x1
	.byte	0x0
	.uleb128 0x33
	.4byte	.LASF494
	.byte	0x9
	.byte	0x32
	.4byte	0x2624
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.ascii	"PPU\000"
	.byte	0x9
	.2byte	0x109
	.4byte	0x14f1
	.byte	0x1
	.byte	0x1
	.uleb128 0x31
	.4byte	.LASF495
	.byte	0x9
	.2byte	0x10b
	.4byte	0x122e
	.byte	0x1
	.byte	0x1
	.uleb128 0x4
	.4byte	0x2673
	.4byte	0xc8
	.uleb128 0x5
	.4byte	0x7b
	.byte	0x7
	.uleb128 0x5
	.4byte	0x7b
	.byte	0xff
	.byte	0x0
	.uleb128 0x33
	.4byte	.LASF496
	.byte	0x3
	.byte	0x94
	.4byte	0x265d
	.byte	0x1
	.byte	0x1
	.uleb128 0x34
	.ascii	"GFX\000"
	.byte	0x3
	.byte	0xff
	.4byte	0x1a80
	.byte	0x1
	.byte	0x1
	.uleb128 0x4
	.4byte	0x269d
	.4byte	0x1d7e
	.uleb128 0x5
	.4byte	0x7b
	.byte	0xff
	.byte	0x0
	.uleb128 0x33
	.4byte	.LASF497
	.byte	0xa
	.byte	0x52
	.4byte	0x268d
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF498
	.byte	0xa
	.byte	0x53
	.4byte	0x268d
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF499
	.byte	0xa
	.byte	0x54
	.4byte	0x268d
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF500
	.byte	0xa
	.byte	0x55
	.4byte	0x268d
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF501
	.byte	0xa
	.byte	0x5f
	.4byte	0x1da0
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.4byte	.LASF502
	.byte	0xb
	.byte	0x68
	.4byte	0x1eaa
	.byte	0x1
	.byte	0x1
	.uleb128 0x4
	.4byte	0x26fb
	.4byte	0x1cca
	.uleb128 0x5
	.4byte	0x7b
	.byte	0xef
	.byte	0x0
	.uleb128 0x33
	.4byte	.LASF503
	.byte	0x1
	.byte	0x9
	.4byte	0x26eb
	.byte	0x1
	.byte	0x1
	.uleb128 0x4
	.4byte	0x2718
	.4byte	0x1d1d
	.uleb128 0x5
	.4byte	0x7b
	.byte	0xef
	.byte	0x0
	.uleb128 0x33
	.4byte	.LASF504
	.byte	0x1
	.byte	0xa
	.4byte	0x2708
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x6
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x15
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x86
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2726
	.4byte	0x2029
	.ascii	"DrawBGMode7Background16R3\000"
	.4byte	0x21a8
	.ascii	"DrawBGMode7Background16R1R2\000"
	.4byte	0x2314
	.ascii	"DrawBGMode7Background16R0\000"
	.4byte	0x2474
	.ascii	"DrawBGMode7Background16\000"
	.4byte	0x0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF383:
	.ascii	"Mode7HFlip\000"
.LASF438:
	.ascii	"SLineData\000"
.LASF183:
	.ascii	"ROMType\000"
.LASF305:
	.ascii	"PreviousLine\000"
.LASF162:
	.ascii	"SDD1Pack\000"
.LASF241:
	.ascii	"_ZN7CMemory9SA1ROMMapEv\000"
.LASF296:
	.ascii	"TileCached\000"
.LASF63:
	.ascii	"APUEnabled\000"
.LASF36:
	.ascii	"AutoSaveTimer\000"
.LASF486:
	.ascii	"DrawBGMode7Background16R0\000"
.LASF117:
	.ascii	"Stereo\000"
.LASF265:
	.ascii	"_ZN7CMemory12KartContentsEv\000"
.LASF427:
	.ascii	"r212d_s\000"
.LASF446:
	.ascii	"_Zero\000"
.LASF173:
	.ascii	"SRAMMask\000"
.LASF288:
	.ascii	"RenderThisFrame\000"
.LASF482:
	.ascii	"DrawBGMode7Background16R1R2\000"
.LASF369:
	.ascii	"BG_Forced\000"
.LASF396:
	.ascii	"RecomputeClipWindows\000"
.LASF75:
	.ascii	"TraceVRAM\000"
.LASF424:
	.ascii	"r212c\000"
.LASF426:
	.ascii	"r212d\000"
.LASF421:
	.ascii	"pCurrentClip\000"
.LASF14:
	.ascii	"uint32\000"
.LASF140:
	.ascii	"DisableHDMA\000"
.LASF376:
	.ascii	"OAMReadFlip\000"
.LASF336:
	.ascii	"BGMode\000"
.LASF248:
	.ascii	"ScoreLoROM\000"
.LASF303:
	.ascii	"Blue\000"
.LASF363:
	.ascii	"FixedColourRed\000"
.LASF213:
	.ascii	"_ZN7CMemory15WriteProtectROMEv\000"
.LASF58:
	.ascii	"APU_Cycles\000"
.LASF464:
	.ascii	"CachedSamples\000"
.LASF64:
	.ascii	"Shutdown\000"
.LASF46:
	.ascii	"_ARM_asm_padding1\000"
.LASF300:
	.ascii	"RenderedScreenHeight\000"
.LASF194:
	.ascii	"SDD1LoggedDataCountPrev\000"
.LASF205:
	.ascii	"_ZN7CMemory8SaveSRAMEPKc\000"
.LASF463:
	.ascii	"ShadowRAM\000"
.LASF200:
	.ascii	"_ZN7CMemory7LoadROMEPKc\000"
.LASF96:
	.ascii	"ForceNoDSP1\000"
.LASF325:
	.ascii	"Mask1\000"
.LASF216:
	.ascii	"MapRAM\000"
.LASF477:
	.ascii	"startx\000"
.LASF88:
	.ascii	"ForceHeader\000"
.LASF40:
	.ascii	"InDMA\000"
.LASF235:
	.ascii	"_ZN7CMemory13SuperFXROMMapEv\000"
.LASF33:
	.ascii	"MemSpeed\000"
.LASF135:
	.ascii	"Mode7Interpolate\000"
.LASF469:
	.ascii	"asmJumpTab\000"
.LASF409:
	.ascii	"SubZBuffer\000"
.LASF489:
	.ascii	"Settings\000"
.LASF455:
	.ascii	"._27\000"
.LASF104:
	.ascii	"Mouse\000"
.LASF258:
	.ascii	"StaticRAMSize\000"
.LASF174:
	.ascii	"SRAMSize\000"
.LASF84:
	.ascii	"FrameTime\000"
.LASF415:
	.ascii	"PaletteMask\000"
.LASF390:
	.ascii	"ClipCounts\000"
.LASF215:
	.ascii	"_ZN7CMemory11FixROMSpeedEv\000"
.LASF294:
	.ascii	"FrameSkip\000"
.LASF434:
	.ascii	"Pseudo\000"
.LASF237:
	.ascii	"_ZN7CMemory11TalesROMMapEh\000"
.LASF105:
	.ascii	"SuperScope\000"
.LASF125:
	.ascii	"DisableMasterVolume\000"
.LASF274:
	.ascii	"._35\000"
.LASF328:
	.ascii	"._39\000"
.LASF155:
	.ascii	"ChuckRock\000"
.LASF87:
	.ascii	"ForceHiROM\000"
.LASF85:
	.ascii	"SkipFrames\000"
.LASF68:
	.ascii	"CyclesPercentage\000"
.LASF373:
	.ascii	"OBJSizeSelect\000"
.LASF8:
	.ascii	"long int\000"
.LASF170:
	.ascii	"C4RAM\000"
.LASF228:
	.ascii	"SRAM1024KLoROMMap\000"
.LASF101:
	.ascii	"ForceSDD1\000"
.LASF458:
	.ascii	"_padder\000"
.LASF413:
	.ascii	"ZERO\000"
.LASF45:
	.ascii	"TriedInterleavedMode2\000"
.LASF333:
	.ascii	"NameBase\000"
.LASF24:
	.ascii	"WaitingForInterrupt\000"
.LASF440:
	.ascii	"SLineMatrixData\000"
.LASF323:
	.ascii	"Increment\000"
.LASF450:
	.ascii	"ShiftedPB\000"
.LASF89:
	.ascii	"ForceNoHeader\000"
.LASF318:
	.ascii	"Priority\000"
.LASF467:
	.ascii	"OneCycle\000"
.LASF439:
	.ascii	"._40\000"
.LASF222:
	.ascii	"LoROMMap\000"
.LASF456:
	.ascii	"._42\000"
.LASF311:
	.ascii	"Clip\000"
.LASF2:
	.ascii	"short unsigned int\000"
.LASF501:
	.ascii	"ICPU\000"
.LASF245:
	.ascii	"_ZN7CMemory8AllASCIIEPhi\000"
.LASF406:
	.ascii	"Screen\000"
.LASF56:
	.ascii	"_PALMSOS_R9\000"
.LASF32:
	.ascii	"V_Counter\000"
.LASF382:
	.ascii	"BGMosaic\000"
.LASF230:
	.ascii	"SufamiTurboLoROMMap\000"
.LASF266:
	.ascii	"Size\000"
.LASF185:
	.ascii	"ROMFramesPerSecond\000"
.LASF166:
	.ascii	"VRAM\000"
.LASF451:
	.ascii	"ShiftedDB\000"
.LASF154:
	.ascii	"StrikeGunnerOffsetHack\000"
.LASF159:
	.ascii	"WrestlemaniaArcade\000"
.LASF4:
	.ascii	"signed char\000"
.LASF330:
	.ascii	"VOffset\000"
.LASF279:
	.ascii	"Left\000"
.LASF398:
	.ascii	"OBJNameSelect\000"
.LASF344:
	.ascii	"OAMAddr\000"
.LASF388:
	.ascii	"Window2Left\000"
.LASF81:
	.ascii	"ForceNTSC\000"
.LASF423:
	.ascii	"Mode7PriorityMask\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF268:
	.ascii	"Headers\000"
.LASF354:
	.ascii	"MatrixA\000"
.LASF116:
	.ascii	"TraceSoundDSP\000"
.LASF199:
	.ascii	"InitROM\000"
.LASF322:
	.ascii	"High\000"
.LASF219:
	.ascii	"_ZN7CMemory11MapExtraRAMEv\000"
.LASF102:
	.ascii	"ForceNoSDD1\000"
.LASF485:
	.ascii	"AndByX\000"
.LASF471:
	.ascii	"pad2\000"
.LASF484:
	.ascii	"AndByY\000"
.LASF418:
	.ascii	"FixedColour\000"
.LASF419:
	.ascii	"StartY\000"
.LASF433:
	.ascii	"r2131_s\000"
.LASF345:
	.ascii	"OAMFlip\000"
.LASF35:
	.ascii	"FastROMSpeed\000"
.LASF192:
	.ascii	"SDD1Data\000"
.LASF142:
	.ascii	"NetPlay\000"
.LASF276:
	.ascii	"value\000"
.LASF445:
	.ascii	"_Carry\000"
.LASF238:
	.ascii	"AlphaROMMap\000"
.LASF157:
	.ascii	"WinterGold\000"
.LASF100:
	.ascii	"ForceNoC4\000"
.LASF272:
	.ascii	"CompanyID\000"
.LASF186:
	.ascii	"HeaderCount\000"
.LASF9:
	.ascii	"char\000"
.LASF158:
	.ascii	"Dezaemon\000"
.LASF290:
	.ascii	"FrameCount\000"
.LASF402:
	.ascii	"SavedOAMAddr2\000"
.LASF195:
	.ascii	"SDD1LoggedDataCount\000"
.LASF115:
	.ascii	"SoundPlaybackRate\000"
.LASF187:
	.ascii	"CalculatedSize\000"
.LASF275:
	.ascii	"line\000"
.LASF130:
	.ascii	"AltSampleDecode\000"
.LASF342:
	.ascii	"LastSprite\000"
.LASF488:
	.ascii	"_Z23DrawBGMode7Background16Phii\000"
.LASF400:
	.ascii	"Joypad3ButtonReadPos\000"
.LASF71:
	.ascii	"ForcedPause\000"
.LASF44:
	.ascii	"_ARM_asm_reserved_1\000"
.LASF106:
	.ascii	"SRTC\000"
.LASF314:
	.ascii	"VPos\000"
.LASF208:
	.ascii	"Deinit\000"
.LASF487:
	.ascii	"DrawBGMode7Background16\000"
.LASF394:
	.ascii	"ClipWindow1Inside\000"
.LASF408:
	.ascii	"ZBuffer\000"
.LASF479:
	.ascii	"Line\000"
.LASF508:
	.ascii	"caCRC32\000"
.LASF310:
	.ascii	"PrevMouseY\000"
.LASF457:
	.ascii	"._43\000"
.LASF338:
	.ascii	"Brightness\000"
.LASF80:
	.ascii	"ForcePAL\000"
.LASF319:
	.ascii	"Palette\000"
.LASF93:
	.ascii	"ForceSuperFX\000"
.LASF234:
	.ascii	"SuperFXROMMap\000"
.LASF371:
	.ascii	"OBJThroughMain\000"
.LASF149:
	.ascii	"ApplyCheats\000"
.LASF359:
	.ascii	"CentreY\000"
.LASF226:
	.ascii	"SRAM512KLoROMMap\000"
.LASF348:
	.ascii	"IRQHBeamPos\000"
.LASF480:
	.ascii	"clip\000"
.LASF375:
	.ascii	"OBJAddition\000"
.LASF156:
	.ascii	"StarfoxHack\000"
.LASF153:
	.ascii	"os9x_hack\000"
.LASF453:
	.ascii	"Scanline\000"
.LASF459:
	.ascii	"SIAPU\000"
.LASF326:
	.ascii	"FullGraphicCount\000"
.LASF26:
	.ascii	"Cycles\000"
.LASF505:
	.ascii	"GNU C++ 4.1.1\000"
.LASF315:
	.ascii	"Name\000"
.LASF122:
	.ascii	"SoundEnvelopeHeightReading\000"
.LASF271:
	.ascii	"_ZN7CMemory5ROMIDEv\000"
.LASF152:
	.ascii	"AutoMaxSkipFrames\000"
.LASF210:
	.ascii	"FreeSDD1Data\000"
.LASF217:
	.ascii	"_ZN7CMemory6MapRAMEv\000"
.LASF191:
	.ascii	"SDD1Index\000"
.LASF13:
	.ascii	"bool32\000"
.LASF431:
	.ascii	"r2130_s\000"
.LASF253:
	.ascii	"_ZN7CMemory16CheckForIPSPatchEPKchRi\000"
.LASF37:
	.ascii	"NMITriggerPoint\000"
.LASF260:
	.ascii	"MapType\000"
.LASF111:
	.ascii	"MouseMaster\000"
.LASF365:
	.ascii	"FixedColourBlue\000"
.LASF307:
	.ascii	"Controller\000"
.LASF211:
	.ascii	"_ZN7CMemory12FreeSDD1DataEv\000"
.LASF16:
	.ascii	"bool8_32\000"
.LASF407:
	.ascii	"SubScreen\000"
.LASF169:
	.ascii	"FillRAM\000"
.LASF10:
	.ascii	"bool8\000"
.LASF39:
	.ascii	"IRQCycleCount\000"
.LASF324:
	.ascii	"Address\000"
.LASF254:
	.ascii	"TVStandard\000"
.LASF420:
	.ascii	"EndY\000"
.LASF54:
	.ascii	"APU_APUExecuting\000"
.LASF197:
	.ascii	"ROMFilename\000"
.LASF133:
	.ascii	"Transparency\000"
.LASF3:
	.ascii	"long unsigned int\000"
.LASF184:
	.ascii	"ROMSize\000"
.LASF352:
	.ascii	"VBeamFlip\000"
.LASF462:
	.ascii	"WaitAddress2\000"
.LASF249:
	.ascii	"_ZN7CMemory10ScoreLoROMEh\000"
.LASF209:
	.ascii	"_ZN7CMemory6DeinitEv\000"
.LASF86:
	.ascii	"ForceLoROM\000"
.LASF399:
	.ascii	"Need16x8Mulitply\000"
.LASF337:
	.ascii	"BG3Priority\000"
.LASF257:
	.ascii	"_ZN7CMemory5SpeedEv\000"
.LASF280:
	.ascii	"Right\000"
.LASF107:
	.ascii	"ControllerOption\000"
.LASF42:
	.ascii	"SRAMModified\000"
.LASF90:
	.ascii	"ForceInterleaved\000"
.LASF196:
	.ascii	"SDD1LoggedData\000"
.LASF267:
	.ascii	"_ZN7CMemory4SizeEv\000"
.LASF447:
	.ascii	"_Negative\000"
.LASF499:
	.ascii	"S9xOpcodesM0X1\000"
.LASF118:
	.ascii	"ReverseStereo\000"
.LASF262:
	.ascii	"MapMode\000"
.LASF232:
	.ascii	"HiROMMap\000"
.LASF83:
	.ascii	"FrameTimeNTSC\000"
.LASF176:
	.ascii	"MemorySpeed\000"
.LASF225:
	.ascii	"_ZN7CMemory13LoROM24MBSMapEv\000"
.LASF308:
	.ascii	"Joypads\000"
.LASF362:
	.ascii	"CGADD\000"
.LASF239:
	.ascii	"_ZN7CMemory11AlphaROMMapEv\000"
.LASF437:
	.ascii	"VPositions\000"
.LASF343:
	.ascii	"OAMPriorityRotation\000"
.LASF428:
	.ascii	"r212e_s\000"
.LASF51:
	.ascii	"Memory_SRAM\000"
.LASF233:
	.ascii	"_ZN7CMemory8HiROMMapEv\000"
.LASF430:
	.ascii	"r2130\000"
.LASF198:
	.ascii	"LoadROM\000"
.LASF441:
	.ascii	"SOpcodes\000"
.LASF128:
	.ascii	"ThreadSound\000"
.LASF302:
	.ascii	"Green\000"
.LASF151:
	.ascii	"TurboSkipFrames\000"
.LASF126:
	.ascii	"SoundSync\000"
.LASF465:
	.ascii	"pad0\000"
.LASF470:
	.ascii	"pad1\000"
.LASF289:
	.ascii	"DirectColourMapsNeedRebuild\000"
.LASF119:
	.ascii	"SixteenBitSound\000"
.LASF6:
	.ascii	"long long int\000"
.LASF273:
	.ascii	"_ZN7CMemory9CompanyIDEv\000"
.LASF144:
	.ascii	"ServerName\000"
.LASF57:
	.ascii	"_PALMSOS_R10\000"
.LASF121:
	.ascii	"SoundMixInterval\000"
.LASF38:
	.ascii	"NMICycleCount\000"
.LASF278:
	.ascii	"Count\000"
.LASF175:
	.ascii	"WriteMap\000"
.LASF341:
	.ascii	"FirstSprite\000"
.LASF444:
	.ascii	"S9xOpcodes\000"
.LASF112:
	.ascii	"SuperFX\000"
.LASF103:
	.ascii	"MultiPlayer5\000"
.LASF206:
	.ascii	"Init\000"
.LASF47:
	.ascii	"Memory_Map\000"
.LASF476:
	.ascii	"depth\000"
.LASF132:
	.ascii	"SixteenBit\000"
.LASF492:
	.ascii	"ROpCount\000"
.LASF91:
	.ascii	"ForceInterleaved2\000"
.LASF474:
	.ascii	"DrawBGMode7Background16R3\000"
.LASF124:
	.ascii	"DisableSampleCaching\000"
.LASF387:
	.ascii	"Window1Right\000"
.LASF473:
	.ascii	"ExtraRAM\000"
.LASF193:
	.ascii	"SDD1Entries\000"
.LASF285:
	.ascii	"MaxBrightness\000"
.LASF21:
	.ascii	"BranchSkip\000"
.LASF432:
	.ascii	"r2131\000"
.LASF99:
	.ascii	"ForceC4\000"
.LASF229:
	.ascii	"_ZN7CMemory17SRAM1024KLoROMMapEv\000"
.LASF246:
	.ascii	"ScoreHiROM\000"
.LASF34:
	.ascii	"MemSpeedx2\000"
.LASF139:
	.ascii	"ForceNoTransparency\000"
.LASF59:
	.ascii	"DSPGet\000"
.LASF395:
	.ascii	"ClipWindow2Inside\000"
.LASF221:
	.ascii	"_ZN7CMemory4SafeEPKc\000"
.LASF414:
	.ascii	"ScreenColorsPre\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF136:
	.ascii	"BGLayering\000"
.LASF165:
	.ascii	"CMemory\000"
.LASF138:
	.ascii	"ForceTransparency\000"
.LASF306:
	.ascii	"CurrentLine\000"
.LASF172:
	.ascii	"LoROM\000"
.LASF507:
	.ascii	"/home/bitrider/hd_bitrider/snes/asmpsnes\000"
.LASF223:
	.ascii	"_ZN7CMemory8LoROMMapEv\000"
.LASF189:
	.ascii	"ROMChecksum\000"
.LASF385:
	.ascii	"Mode7Repeat\000"
.LASF378:
	.ascii	"VTimerEnabled\000"
.LASF224:
	.ascii	"LoROM24MBSMap\000"
.LASF72:
	.ascii	"StopEmulation\000"
.LASF355:
	.ascii	"MatrixB\000"
.LASF309:
	.ascii	"PrevMouseX\000"
.LASF353:
	.ascii	"HVBeamCounterLatched\000"
.LASF329:
	.ascii	"SCBase\000"
.LASF150:
	.ascii	"TurboMode\000"
.LASF17:
	.ascii	"._28\000"
.LASF301:
	.ascii	"RenderedScreenWidth\000"
.LASF425:
	.ascii	"r212c_s\000"
.LASF28:
	.ascii	"PCAtOpcodeStart\000"
.LASF472:
	.ascii	"pad3\000"
.LASF70:
	.ascii	"Paused\000"
.LASF503:
	.ascii	"LineData\000"
.LASF403:
	.ascii	"OAMWriteRegister\000"
.LASF244:
	.ascii	"AllASCII\000"
.LASF220:
	.ascii	"Safe\000"
.LASF454:
	.ascii	"FrameAdvanceCount\000"
.LASF377:
	.ascii	"OAMData\000"
.LASF145:
	.ascii	"Port\000"
.LASF282:
	.ascii	"ColorsChanged\000"
.LASF94:
	.ascii	"ForceNoSuperFX\000"
.LASF502:
	.ascii	"IAPU\000"
.LASF331:
	.ascii	"HOffset\000"
.LASF69:
	.ascii	"DisableIRQ\000"
.LASF108:
	.ascii	"ShutdownMaster\000"
.LASF381:
	.ascii	"Mosaic\000"
.LASF357:
	.ascii	"MatrixD\000"
.LASF18:
	.ascii	"SRegisters\000"
.LASF73:
	.ascii	"TraceDMA\000"
.LASF227:
	.ascii	"_ZN7CMemory16SRAM512KLoROMMapEv\000"
.LASF97:
	.ascii	"ForceSA1\000"
.LASF22:
	.ascii	"NMIActive\000"
.LASF442:
	.ascii	"S9xOpcode\000"
.LASF181:
	.ascii	"CompanyId\000"
.LASF411:
	.ascii	"Delta\000"
.LASF134:
	.ascii	"SupportHiRes\000"
.LASF188:
	.ascii	"CalculatedChecksum\000"
.LASF167:
	.ascii	"SRAM\000"
.LASF242:
	.ascii	"BSHiROMMap\000"
.LASF60:
	.ascii	"DSPSet\000"
.LASF321:
	.ascii	"._38\000"
.LASF255:
	.ascii	"_ZN7CMemory10TVStandardEv\000"
.LASF299:
	.ascii	"DoubleWidthPixels\000"
.LASF31:
	.ascii	"NextEvent\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF283:
	.ascii	"HDMA\000"
.LASF207:
	.ascii	"_ZN7CMemory4InitEv\000"
.LASF190:
	.ascii	"ROMComplementChecksum\000"
.LASF349:
	.ascii	"VBeamPosLatched\000"
.LASF52:
	.ascii	"Memory_BWRAM\000"
.LASF436:
	.ascii	"Sizes\000"
.LASF23:
	.ascii	"IRQActive\000"
.LASF361:
	.ascii	"Joypad2ButtonReadPos\000"
.LASF397:
	.ascii	"CGFLIPRead\000"
.LASF368:
	.ascii	"WRAM\000"
.LASF493:
	.ascii	"GetBank\000"
.LASF401:
	.ascii	"MouseSpeed\000"
.LASF391:
	.ascii	"ClipWindowOverlapLogic\000"
.LASF374:
	.ascii	"OBJNameBase\000"
.LASF504:
	.ascii	"LineMatrixData\000"
.LASF131:
	.ascii	"FixFrequency\000"
.LASF129:
	.ascii	"Mute\000"
.LASF495:
	.ascii	"IPPU\000"
.LASF367:
	.ascii	"ScreenHeight\000"
.LASF50:
	.ascii	"Memory_BlockIsRAM\000"
.LASF180:
	.ascii	"ROMId\000"
.LASF19:
	.ascii	"SCPUState\000"
.LASF293:
	.ascii	"SkippedFrames\000"
.LASF494:
	.ascii	"SignExtend\000"
.LASF74:
	.ascii	"TraceHDMA\000"
.LASF468:
	.ascii	"TwoCycles\000"
.LASF252:
	.ascii	"CheckForIPSPatch\000"
.LASF48:
	.ascii	"Memory_WriteMap\000"
.LASF483:
	.ascii	"_Z27DrawBGMode7Background16R1R2Phii\000"
.LASF475:
	.ascii	"_Z25DrawBGMode7Background16R3Phii\000"
.LASF422:
	.ascii	"Mode7Mask\000"
.LASF393:
	.ascii	"ClipWindow2Enable\000"
.LASF443:
	.ascii	"SICPU\000"
.LASF429:
	.ascii	"r212f_s\000"
.LASF298:
	.ascii	"LatchedInterlace\000"
.LASF27:
	.ascii	"PCBase\000"
.LASF204:
	.ascii	"SaveSRAM\000"
.LASF55:
	.ascii	"_ARM_asm_padding2\000"
.LASF202:
	.ascii	"LoadSRAM\000"
.LASF270:
	.ascii	"ROMID\000"
.LASF291:
	.ascii	"RenderedFramesCount\000"
.LASF417:
	.ascii	"DepthDelta\000"
.LASF320:
	.ascii	"SPPU\000"
.LASF500:
	.ascii	"S9xOpcodesM0X0\000"
.LASF389:
	.ascii	"Window2Right\000"
.LASF113:
	.ascii	"DSP1Master\000"
.LASF62:
	.ascii	"SSettings\000"
.LASF29:
	.ascii	"WaitAddress\000"
.LASF449:
	.ascii	"CPUExecuting\000"
.LASF496:
	.ascii	"DirectColourMaps\000"
.LASF379:
	.ascii	"HTimerEnabled\000"
.LASF259:
	.ascii	"_ZN7CMemory13StaticRAMSizeEv\000"
.LASF360:
	.ascii	"Joypad1ButtonReadPos\000"
.LASF11:
	.ascii	"uint8\000"
.LASF327:
	.ascii	"Shift\000"
.LASF313:
	.ascii	"HPos\000"
.LASF478:
	.ascii	"ClipCount\000"
.LASF141:
	.ascii	"DisplayFrameRate\000"
.LASF346:
	.ascii	"OAMTileAddress\000"
.LASF5:
	.ascii	"short int\000"
.LASF92:
	.ascii	"ForceNotInterleaved\000"
.LASF356:
	.ascii	"MatrixC\000"
.LASF339:
	.ascii	"CGFLIP\000"
.LASF61:
	.ascii	"rstatus\000"
.LASF412:
	.ascii	"ZERO_OR_X2\000"
.LASF147:
	.ascii	"OpenGLEnable\000"
.LASF358:
	.ascii	"CentreX\000"
.LASF146:
	.ascii	"GlideEnable\000"
.LASF506:
	.ascii	"mode7.cpp\000"
.LASF384:
	.ascii	"Mode7VFlip\000"
.LASF286:
	.ascii	"LatchedBlanking\000"
.LASF295:
	.ascii	"TileCache\000"
.LASF510:
	.ascii	"_Z25DrawBGMode7Background16R0Phii\000"
.LASF263:
	.ascii	"_ZN7CMemory7MapModeEv\000"
.LASF264:
	.ascii	"KartContents\000"
.LASF179:
	.ascii	"ROMName\000"
.LASF509:
	.ascii	"_ZN7CMemory7caCRC32EPhjj\000"
.LASF137:
	.ascii	"DisableGraphicWindows\000"
.LASF364:
	.ascii	"FixedColourGreen\000"
.LASF466:
	.ascii	"TimerErrorCounter\000"
.LASF351:
	.ascii	"HBeamFlip\000"
.LASF435:
	.ascii	"OBJList\000"
.LASF212:
	.ascii	"WriteProtectROM\000"
.LASF370:
	.ascii	"ForcedBlanking\000"
.LASF392:
	.ascii	"ClipWindow1Enable\000"
.LASF30:
	.ascii	"WaitCounter\000"
.LASF77:
	.ascii	"TraceDSP\000"
.LASF143:
	.ascii	"NetPlayServer\000"
.LASF316:
	.ascii	"VFlip\000"
.LASF82:
	.ascii	"FrameTimePAL\000"
.LASF297:
	.ascii	"FirstVRAMRead\000"
.LASF109:
	.ascii	"MultiPlayer5Master\000"
.LASF448:
	.ascii	"_Overflow\000"
.LASF460:
	.ascii	"DirectPage\000"
.LASF247:
	.ascii	"_ZN7CMemory10ScoreHiROMEh\000"
.LASF43:
	.ascii	"BRKTriggered\000"
.LASF261:
	.ascii	"_ZN7CMemory7MapTypeEv\000"
.LASF123:
	.ascii	"DisableSoundEcho\000"
.LASF218:
	.ascii	"MapExtraRAM\000"
.LASF256:
	.ascii	"Speed\000"
.LASF251:
	.ascii	"_ZN7CMemory13ApplyROMFixesEv\000"
.LASF120:
	.ascii	"SoundBufferSize\000"
.LASF410:
	.ascii	"Pitch\000"
.LASF214:
	.ascii	"FixROMSpeed\000"
.LASF490:
	.ascii	"Memory\000"
.LASF347:
	.ascii	"IRQVBeamPos\000"
.LASF231:
	.ascii	"_ZN7CMemory19SufamiTurboLoROMMapEv\000"
.LASF386:
	.ascii	"Window1Left\000"
.LASF20:
	.ascii	"Flags\000"
.LASF498:
	.ascii	"S9xOpcodesM1X0\000"
.LASF497:
	.ascii	"S9xOpcodesM1X1\000"
.LASF164:
	.ascii	"SpeedHacks\000"
.LASF350:
	.ascii	"HBeamPosLatched\000"
.LASF203:
	.ascii	"_ZN7CMemory8LoadSRAMEPKc\000"
.LASF161:
	.ascii	"APURAMInitialValue\000"
.LASF287:
	.ascii	"OBJChanged\000"
.LASF491:
	.ascii	"rops\000"
.LASF182:
	.ascii	"ROMSpeed\000"
.LASF65:
	.ascii	"SoundSkipMethod\000"
.LASF177:
	.ascii	"BlockIsRAM\000"
.LASF250:
	.ascii	"ApplyROMFixes\000"
.LASF127:
	.ascii	"InterpolatedSound\000"
.LASF292:
	.ascii	"DisplayedRenderedFrameCount\000"
.LASF110:
	.ascii	"SuperScopeMaster\000"
.LASF277:
	.ascii	"ClipData\000"
.LASF243:
	.ascii	"_ZN7CMemory10BSHiROMMapEv\000"
.LASF79:
	.ascii	"JoystickEnabled\000"
.LASF236:
	.ascii	"TalesROMMap\000"
.LASF366:
	.ascii	"SavedOAMAddr\000"
.LASF281:
	.ascii	"InternalPPU\000"
.LASF416:
	.ascii	"PaletteShift\000"
.LASF178:
	.ascii	"BlockIsROM\000"
.LASF304:
	.ascii	"ScreenColors\000"
.LASF312:
	.ascii	"SOBJ\000"
.LASF114:
	.ascii	"SDD1\000"
.LASF67:
	.ascii	"HBlankStart\000"
.LASF334:
	.ascii	"SCSize\000"
.LASF317:
	.ascii	"HFlip\000"
.LASF66:
	.ascii	"H_Max\000"
.LASF340:
	.ascii	"CGDATA\000"
.LASF148:
	.ascii	"AutoSaveDelay\000"
.LASF240:
	.ascii	"SA1ROMMap\000"
.LASF372:
	.ascii	"OBJThroughSub\000"
.LASF78:
	.ascii	"SwapJoypads\000"
.LASF481:
	.ascii	"Depth\000"
.LASF15:
	.ascii	"int32\000"
.LASF98:
	.ascii	"ForceNoSA1\000"
.LASF284:
	.ascii	"HDMAStarted\000"
.LASF160:
	.ascii	"DaffyDuck\000"
.LASF269:
	.ascii	"_ZN7CMemory7HeadersEv\000"
.LASF404:
	.ascii	"BGnxOFSbyte\000"
.LASF380:
	.ascii	"HTimerPosition\000"
.LASF405:
	.ascii	"SGFX\000"
.LASF335:
	.ascii	"OffsetsChanged\000"
.LASF41:
	.ascii	"WhichEvent\000"
.LASF201:
	.ascii	"_ZN7CMemory7InitROMEh\000"
.LASF12:
	.ascii	"uint16\000"
.LASF168:
	.ascii	"BWRAM\000"
.LASF25:
	.ascii	"Regs\000"
.LASF452:
	.ascii	"Frame\000"
.LASF461:
	.ascii	"WaitAddress1\000"
.LASF53:
	.ascii	"Memory_SRAMMask\000"
.LASF76:
	.ascii	"TraceUnknownRegisters\000"
.LASF163:
	.ascii	"asmspc700\000"
.LASF49:
	.ascii	"Memory_MemorySpeed\000"
.LASF171:
	.ascii	"HiROM\000"
.LASF95:
	.ascii	"ForceDSP1\000"
.LASF332:
	.ascii	"BGSize\000"
	.ident	"GCC: (GNU) 4.1.1"
