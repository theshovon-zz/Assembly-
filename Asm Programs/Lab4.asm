prompt:	DC	"Enter x"		; user prompt
	addi 	x2, x0, 1600		; Initialize stack
	addi	gp, x0, prompt		; set GP
	ld	x28, 0(gp)
	ecall	x10, x28, 5		; x10 <-input
	addi	sp, sp, -8
	sd	x10, 0(sp)		; save x10 to stack
	jal	x1, nofact		; call nofact
	ld	x5, 0(sp)
	addi	sp,sp,8		; restore from the stack on x5
	ecall	x0, x5, 2		; Print argument to function
	ecall	x0, x10, 2		; Print return value
	ORG 96
nofact:	addi	sp,sp,-8
	sd	x1, 0(sp)
	addi	x5,x0,3
	bge	x5,x10, base		; if 3>=x10 goto base
	addi	x10,x10,-2		; i -= 2
	jal	x1, nofact		; call nofact
	slli	x10,x10,1		; 2*x10
	addi	x10,x10,1		; 2*x10+1
	ld	x1, 0(sp)		; restore ra
	addi	sp,sp,8
	jalr	x0,0(x1)
base:	addi	x10,x0,1
	ld	x1, 0(sp)		; restore ra
	addi	sp,sp,8
	jalr	x0,0(x1)
