//ecall x5, x2, 5
//srli x10, x5, 4
//slli x10, x10, 4
//addi x5, x0, 15
//add x10, x5, x10
//ecall x0,x10,0
main:
addi x2, x0, 1600     //Initialize the stack to 1600
ecall x5, x3, 5
//Input into x5
addi x2, x2, -8
//make space for x5
sd x5, 0(x2)
//store x5
addi x10, x5, 0        //x10 = input 
jal x1, rec_lin
//jump to rec_lin
ld x5, 0(x2)
addi x2, x2, 8
ecall x0, x5, 0
ecall x0, x10, 0

ORG 96 

rec_lin:addi x2, x2, -8
//make space for x1
sd x1, 0(x2)
//store x1 which is the return address
addi x7, x0, 9
//x7 = 9
bge x10, x7, L1
//Jumping to procedure L1 if x10 >= 9
addi x10, x0, 5
ld x1, 0(x2)
addi x2, x2, 8
jalr x0, 0(x1)

L1:
addi x10, x0, -5
//n-5
jal x1, rec_lin
//
addi x6, x0, 4
//x6=4
mul x10, x10, x6  //x10 = 4 * rec_lin(n-5)
add x10, x10, x5
//x10 = 4 * rec_lin(n-5) + n
ld x1, 0(x2)
addi x2, x2, 8
jalr x0, 0(x1