minIncome:
#finds the min income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0: heap memory pointer to actual  location of the record stock name in the file buffer

	#if empty file, return 0 for both a0, a1
	bnez a1, minIncome_fileNotEmpty
	li a0, 0
	ret

 minIncome_fileNotEmpty:
	addi sp, sp , -8					# putting return address into the stack
	sd ra, 0(sp)
	
	addi a0, a0, 4					# subsituting vars so you don't have to modify a0 and a1	
	addi s0, a0, 0					# s0 -- points to array
	addi s1, a1, 0					# s1 --  num of stocks
	li s2,  99999 						# s2 -- min val	
	li s3, 0							# s3 -- points to min stock
	
	minincome_body:
		jal income_from_record
		blt a0, s2, minreplace		# if numerical val < current min
		j minincome_check
	minreplace:
		addi s2, a0, 0				# setting max value (s2) to numerical sum
		addi s3, s0, -4				# setting max stock (s3) to new stock
	minincome_check:
		addi s1, s1, -1				# decrementing # of stocks
		addi a0, s0, 8				# incrementing a0  (address in array)
		addi s0, s0, 8				# setting s0 to a0
		beqz s1, minincome_done	# if done with all the stocks
		j minincome_body
	minincome_done:
		addi a0, s3, 0				# setting a0 to income
		ld ra, 0(sp)					# getting return address from stack
		addi sp, sp, 8				# moving stack pointer back
		ret
	# Start your coding from here!

	li a0, 0x10040010
	#if no student code entered, a0 just returns 0x10040010 always :(
	
# End your  coding  here!
	
	ret
#######################end of minIncome###############################################
