ORG 96
DD 20, 29, 13, 14

addi x10, x10, 96
addi x11, x11, 4
	
jal x1,sort,

beq x0,x0, exit

sort:
addi sp,sp,-40  // make room on stack for 5 regs

 sd   x1,32(sp)  // save x1 on stack
  sd   x22,24(sp) // save x22 on stack
  sd   x21,16(sp) // save x21 on stack
  sd   x20,8(sp)  // save x20 on stack
  sd   x19,0(sp)  

add x19,x19,x0
for1: 
bge  x19, x11, exit1
addi x20, x19, -1
for2:
blt x20,x0,exit2
slli x5,x20,3
add x5,x10,x5
ld x6,0(x5)
ld x7,8(x5)
bge x7,x6,exit2
add x21, x10, x0
add x22, x11, x0
add x10,x21, x0
add x11, x20, x0
jal x1,swap
addi x20,x20,-1
jal x0, for2

exit2:
addi x19,x19,1
jal x0, for1

swap:
  slli x6,x11,3    // reg x6 = k * 8
  add  x6,x10,x6   // reg x6 = v + (k * 8)
  ld   x5,0(x6)    // reg x5 (temp) = v[k]
  ld   x7,8(x6)    // reg x7 = v[k + 1]
  sd   x7,0(x6)    // v[k] = reg x7
  sd   x5,8(x6)    // v[k+1] = reg x5 (temp)
  jalr x0,0(x1)    // return to calling routine


exit1:
	sd   x19,0(sp) 	 // restore x19 from stack
	sd   x20,8(sp)  // restore x20 from stack
	sd   x21,16(sp) // restore x21 from stack
	sd   x22,24(sp) // restore x22 from stack
	sd   x1,32(sp)  // restore x1 from stack
	addi sp,sp, 40  // restore stack pointer
  jalr x0,0(x1)
exit:

