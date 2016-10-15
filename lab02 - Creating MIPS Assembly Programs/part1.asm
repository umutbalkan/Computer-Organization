# Preliminary Work of LAB02
# Part1.asm - calls three functions to manipulate data

           .data       # variable declarations follow this line
           str:  .asciiz "123" 
           
														
           .text       # instructions follow this line	
																	
main:                  # indicates start of code (first instruction to execute)
	lw $a0, str	# $a0 = "123"
	jal function1
	
	 
	
	li $v0, 10 # terminate program
	syscall
	
function1: 
	
	jr $ra
                     
									
# End of program, leave a blank line afterwards to make SPIM happy
