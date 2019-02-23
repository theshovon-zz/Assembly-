	.file	"bubble.c"
	.option nopic
	.text
	.align	1
	.globl	bublesort
	.type	bublesort, @function
bublesort:
	addi	a1,a1,-1	; imax-=1;
	blez	a1,END		; if imax<0 goto END
	slli	a2,a1,3		; a2 = 8*imax
	add	a2,a0,a2	; a2 = &(V[imax])
OUTFOR:
	mv	a5,a0		; a5 = &(V[j])
INRFOR:
	ld	a4,0(a5)	; a4 = V[j]
	ld	a3,8(a5)	; a3 = V[j+1]
	ble	a4,a3,ENDIF	; if ~(V[j]>V[j+1]) goto ENDIF
	sd	a3,0(a5)	; exch V[j],V[j+1]
	sd	a4,8(a5)
ENDIF:
	addi	a5,a5,8		; a5 = &(V[j+1])
	bne	a2,a5,INRFOR	; if a2!=a5 goto INRFOR
	addi	a1,a1,-1	; a1--
	addi	a2,a2,-8	; a2--
	bnez	a1,OUTFOR	; if a1!=0 goto OUTFOR
END:
	ret
	.size	bublesort, .-bublesort
	.ident	"GCC: (GNU) 7.2.0"
