.data
	testStr: .asciz "34/r"

.text

li t0, 1
li t1, 10
li t2, 0
loop_check:
	beqz t2, loop_end
loop_body:
	mul t0, t0, t1
	addi t2, t2, -1
	j loop_check

loop_end:
addi a0, t0, 0
li a7, 36
ecall
