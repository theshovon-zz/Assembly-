	.file	"exch.c"
	.option nopic
	.text
	.align	1
	.globl	exch
	.type	exch, @function
exch:
	slli	a1,a1,3		; a1 = k*8
	addi	a5,a1,8		; a5 = (k+1)*8
	add	a5,a0,a5	; a5 = &(V[k+1])
	ld	a3,0(a5)	; a3 = V[k+1]
	add	a0,a0,a1	; a0 = &(V[k])
	ld	a4,0(a0)	; a4 = V[k]
	sd	a3,0(a0)	; V[k] = a3
	sd	a4,0(a5)	; V[k+1] = a4
	ret
	.size	exch, .-exch
	.ident	"GCC: (GNU) 7.2.0"
