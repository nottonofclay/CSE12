totalIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for  a0
	bnez a1, totalIncome_fileNotEmpty
	li a0, 0
	ret

totalIncome_fileNotEmpty:
	addi sp, sp , -8					# putting return address into the stack
	sd ra, 0(sp)
	
	addi a0, a0, 4					# subsituting vars so you don't have to modify a0 and a1	
	addi s0, a0, 0					# s0 points to array
	addi s1, a1, 0					# s1 has num of stocks
	addi s2, s2, 0 					# s2 sum of incomes		
	
	income_body:
		jal income_from_record
		add s2, a0, s2				# adding num val to sum
	income_check:
		addi s1, s1, -1				# decrementing # of stocks
		addi a0, s0, 8				# incrementing a0  (address in array)
		addi s0, s0, 8				# setting s0 to a0
		beqz s1, income_done		# if done with all the stocks
		j income_body
	income_done:
		addi a0, s2, 0				# setting a0 to income
		ld ra, 0(sp)					# getting return address from stack
		addi sp, sp, 8				# moving stack pointer back
		ret

	
#######################end of nameOfMaxIncome_totalIncome###############################################
