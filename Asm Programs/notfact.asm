	.file	"notfact.c"
	.option nopic
	.text
	.align	1
	.globl	notfact
	.type	notfact, @function
notfact:
	li	a5,3
	ble	a0,a5,BASE
	li	a5,1
	li	a4,0
	li	a3,3
ITER:
	addi	a0,a0,-2	; i  -= 2
	add	a4,a4,a5	; a4 -= a5
	slli	a5,a5,1		; a5 *= 2
	bgt	a0,a3,ITER	; if (i>3) goto ITER
	add	a0,a4,a5	; return a4+a5
	ret
BASE:
	li	a0,1
	ret
	.size	notfact, .-notfact
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	ld	a0,8(a1)
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	atoi
	li	a5,3
	ble	a0,a5,.L10	; in-line the notfact
	li	a5,0
	li	a1,1
	li	a4,3
.L9:
	addi	a0,a0,-2
	add	a5,a5,a1
	slli	a1,a1,1
	bgt	a0,a4,.L9
	add	a1,a1,a5
.L8:
	lui	a0,%hi(.LC0)	; a0 = address of "%d\n"
	sext.w	a1,a1		; sign-extend 32 LSB in a1
	addi	a0,a0,%lo(.LC0)
	call	printf
	ld	ra,8(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
.L10:
	li	a1,1
	j	.L8
	.size	main, .-main
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d\n"
	.ident	"GCC: (GNU) 7.2.0"
