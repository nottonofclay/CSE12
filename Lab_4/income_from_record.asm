
		
	
income_from_record:
#function to return numerical income from a specific record
#e.g. for record "Microsoft,34\r\n", income to return is 34(for which name is Microsoft)

#arguments:	a0 contains pointer to start of numerical income in record 

#function RETURNS income numerical value of the asci income in a0 (34 in our example)
	
# Start your coding from here!

	#if no student code entered, a0 just returns 0 always :(
	# s2 is the thingy
li s5, 0x0d
	
	char_start:
		lb a0, (s2)
		beq, a0, s5, char_end
	char_body:
		li a7,11
		ecall
	update:
		addi s2,s2,1
		addi a3,a3,1
		j char_start
	char_end:
		# print new line
		addi a0, s6, 0
		li a7, 4
		ecall
		addi a0, a3, 0
		li a7, 1
		sub s2, s2, a3
		ecall
	
	addi a3, a3, -1
	li t6, 0
# a3 is the num of char - 1
	num_start:
		# initializes exponent shit
		li t1, 1
		li t2, 10
		
		# first digit into t3
		lb t3, (s2)
		
		# stops when hit \r
		beq t3, s5, num_end 
		addi t4, a3, 0
		
		exponent_check:
			beqz t4, num_body
		exponent_body:
			mul t1, t1, t2
			addi t4, t4, -1
			j exponent_check
		
	num_body:
		# converts ascii to decimal
		addi t5, t3, -0x30
		# multiplies number by 10^place
		mul t5, t5, t1
		add t6, t6, t5
		# print new line 
		li a7, 4
		addi, a0, s6, 0
		ecall
	num_update:
		addi s2,s2,1
		addi a3,a3,-1
		j num_start
	num_end:
		# prints the sum of the numbers 
		addi a0,t6,0
		li a7,1 
		ecall
		# print new line 
		addi a0,s6,0
		li a7,4
		ecall
		# print num of characters after going thru (should be -1)
		addi a0,a3,0
		li a7,1
		ecall
	
# End your  coding  here!
	ret
	
#######################end of income_from_record###############################################	
