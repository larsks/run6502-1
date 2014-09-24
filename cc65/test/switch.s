;
; File generated by cc65 v 2.13.9
;
	.fopt		compiler,"cc65 v 2.13.9"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_fprintf
	.export		_outfile
	.import		_run6502_putchar
	.import		_run6502_logerror
	.export		_result
	.export		_char0
	.export		_c_char_gte_lit1
	.export		_main

.segment	"DATA"

_outfile:
	.word	$0000

.segment	"RODATA"

L0041:
	.byte	$63,$68,$61,$72,$20,$25,$30,$32,$78,$20,$2D,$20,$72,$65,$73,$75
	.byte	$6C,$74,$3A,$20,$25,$30,$32,$78,$20,$65,$78,$70,$65,$63,$74,$65
	.byte	$64,$3A,$20,$25,$30,$32,$78,$20,$62,$72,$6F,$6B,$65,$6E,$3A,$20
	.byte	$25,$30,$32,$78,$0A,$00

.segment	"BSS"

_result:
	.res	1,$00
_char0:
	.res	1,$00

; ---------------------------------------------------------------
; void __near__ c_char_gte_lit1 (unsigned char)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_c_char_gte_lit1: near

.segment	"CODE"

;
; result = 0;
;
	lda     #$00
	sta     _result
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; if(char0 >= -0x7f)
;
	lda     _char0
	sec
	sbc     #$81
	bvs     L0020
	eor     #$80
L0020:	asl     a
	lda     #$00
	bcc     L004E
;
; result |= 1;
;
	lda     _result
	ora     #$01
	sta     _result
;
; run6502_putchar('0');
;
	lda     #$30
	jsr     _run6502_putchar
;
; run6502_logerror(0);
;
	lda     #$00
L004E:	jsr     _run6502_logerror
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; asm("nop");
;
	nop
;
; fprintf(outfile,"char %02x - result: %02x expected: %02x broken: %02x\n",char0,result,expected_result,result^expected_result);
;
	jsr     decsp4
	lda     _outfile
	ldy     #$02
	sta     (sp),y
	iny
	lda     _outfile+1
	sta     (sp),y
	lda     #<(L0041)
	ldy     #$00
	sta     (sp),y
	iny
	lda     #>(L0041)
	sta     (sp),y
	ldx     #$00
	lda     _char0
	bpl     L0044
	dex
L0044:	jsr     pushax
	lda     _result
	jsr     pusha0
	ldy     #$08
	lda     (sp),y
	jsr     pusha0
	ldy     #$0A
	lda     (sp),y
	eor     _result
	jsr     pusha0
	ldy     #$0C
	jsr     _fprintf
;
; }
;
	jmp     incsp1

.endproc

; ---------------------------------------------------------------
; int __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; char0=0x7f;
;
	lda     #$7F
	sta     _char0
;
; c_char_gte_lit1(0x3f);
;
	lda     #$3F
	jsr     pusha
	jsr     _c_char_gte_lit1
;
; return 0;
;
	ldx     #$00
	txa
;
; }
;
	rts

.endproc
