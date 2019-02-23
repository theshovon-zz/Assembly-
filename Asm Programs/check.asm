	.file	"check.c"
	.option nopic
	.text
	.align	1
	.globl	check
	.type	check, @function
check:
	slli	a5,a1,3		; a5 = k*3
	add	a5,a0,a5	; a5 = &(V[k])
	ld	a4,0(a5)	; a4 = V[k]
	ld	a5,8(a5)	; a5 = V[k+1]
	bgt	a4,a5,.L4	; if V[k]>V[k+1] go to .L4
	ret
.L4:
	tail	exch		; call exch
	.size	check, .-check
	.ident	"GCC: (GNU) 7.2.0"
