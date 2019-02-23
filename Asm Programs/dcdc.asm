fct: 	addi x2,x2,-16
	sd x1, 0(x2)
	sd x10, 8(x2)
	addi x5, x10, -1
	//beq x5, , fct 
	

	add x6, x10, x0
	//ld x1, 0(x2)
	//ld x10, 8(x2)
	//addi x2, x2, 16
	//jalr x0, 0(x1)
	

addi x10,x0,31
//addi x5,x0, 15
ori x10,x10,15
xori x10, x10,15