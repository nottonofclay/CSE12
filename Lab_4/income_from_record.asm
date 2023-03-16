#.data
# incomeStr: .asciz "1\r"

# .text
# li a0 0x10040004
# la t1 incomeStr
# sw t1 (a0)


income_from_record:

addi sp,sp,-72
sd a3, 0(sp)
sd s1, 8(sp)
sd s2, 16(sp)
sd s3, 24(sp)
sd s4, 32(sp)
sd s5, 40(sp)
sd s6, 48(sp)
sd s7, 56(sp)
sd ra, 64(sp)
#function to return numerical income from a specific record
#e.g. for record "Microsoft,34\r\n", income to return is 34(for which name is Microsoft)

#arguments:	a0 contains pointer to start of numerical income in record 

#function RETURNS income numerical value of the asci income in a0 (34 in our example)
	
# Start your coding from here!

	#if no student code entered, a0 just returns 0 always :(
	# s2 is the thingy

li a3, 0x0d										# initialize with \r 
lw a0, (a0)
li s2, 0
li s3, 0
	
	char_start:
		lb s1, (a0)
		beq, s1, a3, char_end					# if byte is = \r
	char_body:
		addi a0,a0,1							# iterating to next byte of a0
		addi s2,s2,1							# counting # of char
		j char_start
	char_end:
		sub a0, a0, s2							# return a0 back to og position
		addi s2, s2, -1							# subtracting one from num of char
		li s3, 0								# initialize with 0
		
	num_start:
		li s4, 1								# initializes exponent vars
		li s5, 10
		
		lb s1, (a0)								# first byte in num
		beq s1, a3, num_end 					# stops when hit \r
		addi s6, s2, 0							# puts # of chars into s6

		exponent_check:
			beqz s6, num_body
		exponent_body:
			mul s4, s4, s5						# multiply s4 by 10
			addi s6, s6, -1						# deincrement s6
			j exponent_check
		
	num_body:
		addi s1, s1, -0x30						# convert ascii to dec
		mul s1, s1, s4							# multiplies by place
		add s7, s7, s1							# stores sum in s7
	num_update:
		addi a0,a0,1
		addi s2,s2,-1
		j num_start
	num_end:
		addi a0,s7,0
# End your  coding  here!

		ld a3, 0(sp)
		ld s1, 8(sp)
		ld s2, 16(sp)
		ld s3, 24(sp)
		ld s4, 32(sp)
		ld s5, 40(sp)
		ld s6, 48(sp)
		ld s7, 56(sp)
		ld ra, 64(sp)
		addi sp,sp,72
		ret
	
#######################end of income_from_record###############################################	
