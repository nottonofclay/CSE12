length_of_file:
#function to find length of data read from file
#arguments: a1=bufferAdress holding file data
#return file length in a0
	
#Start your coding here
addi sp,sp,-16
sd s1, 0 (sp)
sd ra, 8 (sp)

li a0, 0

	loop_body:
		lb s1, 0(a1)
		beq s1, zero, loop_end
		addi a1,a1,1
		addi a0,a0,1
		j loop_body
	loop_end:
		sub a1, a1, a0
		ret

ld s1, 0(sp)
ld ra, 8(sp)
addi sp, sp, 8
	

#######################end of length_of_file###############################################	
