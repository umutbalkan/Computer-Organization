# Sencer Umut Balkan - 21401911
# CS 224 - Section 3 / LAB02
# characterPattern.asm
# Computes the number of non over-lapping repetitions of a character pattern in a character string.


#########################################
##############	MACROS   ################
#########################################
        # system call "exit" operation	
	.macro 	done
	li 	$v0,10
	syscall
        .end_macro
        
        # ------------------
        # string print operation
	.macro 	print(%str)
	.data
	myLabel: .asciiz %str
	.text
	li 	$v0, 4
	la 	$a0, myLabel
	syscall
	.end_macro
	
	# ------------------
	# integer print operation
	.macro print_int (%x)
	li $v0, 1
	add $a0, $zero, %x
	syscall
	.end_macro
#########################################
#########################################
#########################################

	
			
           .data       # variable declarations follow this line
	myWord:		.space	20
	charPattern:	.space	6
	endline:	.byte	'\n'
																																																																																																																																																																																																																																																																																																																																																																														
           .text       # instructions follow this line                         											
main:
	print("Hello! Please enter the string: ")	#macro
	la 	$a0, myWord	# read the character string from user.
	li 	$a1, 10		# string max size 15 characters
	li 	$v0, 8		# syscall code for read string from console
	syscall
	
	print ("Good...\nNow please enter the character pattern: ")	#macro
	la	$a0, charPattern	# read the character string from user.
	li	$a1, 6			# string max size 5 characters
	li	$v0, 8			# syscall code for read string from console
	syscall
	
	
	# Setting these registers to 0.
	li	$t0, 0			# $t0 = i
	lb	$t3, endline		# $t3 = '\n'
	li	$t4, 0			# $t4 = j
	li	$t5, 0			# $t5 = number of patterns
		# $t1 = charPattern[0]	

sum:	
	addi $t5, $t5, 1

while1:	
	lb	$t1, charPattern($t4)
	lb	$t2, myWord($t0)
	addi	$t0, $t0, 1 # i++
	beq	$t1, $t2, while2
	j	while1
	while2:
		addi	$t4, $t4, 1	# j++
		beq	$t1, $zero, sum	
	
	
	
exit:
	print_int($t5)
	done	#macro
