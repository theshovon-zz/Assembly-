prompt:	DC	"First"		; first prompt
	DC	"Second"		; second prompt

	addi	gp, x0, prompt		; set gp
	ld	x5, 0(gp)		; get first prompt
	ecall	x6,x5,5		; x6 <- first
	ld	x5, 8(gp)	     	; get sec. prompt
	ecall	x7,x5,5		; x7 <- sec
	blt	x6,x7,prsec		; if (frst<sec) goto prsec
	addi	x7, x6, 0
prsec:	ecall	x0, x7, 2		; print x7 (hex)
