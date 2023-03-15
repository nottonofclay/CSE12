income_from_record:
#function to return numerical income from a specific record
#e.g. for record "Microsoft,34\r\n", income to return is 34(for which name is Microsoft)

#arguments:	a0 contains pointer to start of numerical income in record 

#function RETURNS income numerical value of the asci income in a0 (34 in our example)
	
# Start your coding from here!
	lwu a0, 0(a0)
	li a3, 0
	
	character_loop:
		lb a3,0(a0)
		beq 
	#if no student code entered, a0 just returns 0 always :(
	
# End your  coding  here!
	ret
	
#######################end of income_from_record###############################################	
