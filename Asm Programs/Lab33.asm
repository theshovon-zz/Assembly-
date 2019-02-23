prmts:	DC	"Input A"
	DC	"Input B"
	DC	"Input C"

	addi	x3, x0, prmts	; set GP
	ld	x5, 0(x3)	; first prompt A
	ecall	x28, x5, 5	; x28 <- A
	ld	x5, 8(x3)	; Sec.  prompt B
	ecall	x29, x5, 5	; x29 <- B
	ld	x5, 8(x3)	; Third prompt C
	ecall	x30, x5, 5	; x30 <- C
	bge	x29,x28, ELSE1	; if B>=A go to else
	addi	x31,x0,5		; x31=5
	bne	x30,x31, ELSE1	; if C!=5 go to else
	addi	x1,x0,1		; Y=1
	addi	x2,x0,2		; Z=2
	jal	x0,FIN		;
ELSE1:	addi	x1,x0,0		; Y=0
	addi	x2,x0,0		; Z=0
FIN:	
	
