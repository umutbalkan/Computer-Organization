## Author: Sencer Umut Balkan
## Date: 11/10/2016
## Description: Palindrome.asm - Gets a input string and checks if it is a palindrome.

.data	# variable declarations follow this line
	IS_STRING: 	.asciiz		" is"
	NOT_STRING: 	.asciiz		" NOT"
	A_PAL_STRING:	 .asciiz	" a PALinDROME!"

	str3:		.asciiz 	"\nThe length of the string: "
	str4:		.asciiz		"\nEnter the string: "
	str5:		
	buffer:  	.space		40		# 40 character sized array.
.text	# instructions follow this line

	main:
	li		$v0, 4			# System call code for print string
	la		$a0, str4		# Welcome message
	syscall					
	addi		$v0, $0, 8   		# system call for read string from console
	la 		$a0, buffer 		# load byte space into address
	li 		$a1, 40			# allot the byte space for string  				
	move		$t3, $a0    		# input stored in $t3 (=$a0)
	syscall
	jal		getLength		# compute length.
	#  JAL(jump and link) saves return address in ra so that you can continue execution after your subroutine finishes
	jal		print	
	jal		isPalindrome
	add		$a0, $v0, $zero
	jal		printRes		# Print
	addi		$v0, $zero, 10
	syscall					# Exit
	
	getLength:
	li 		$t0, 0			# character counter, initially zero
	li		$t7, 64		
	loop:
	lb 		$t1, 0($a0) 		# load the next character(byte) into t1 ($t0 = string[i])
	blt 		$t1,$t7,exit		# check for misc. characters which is between 32-64
	addi		$a0, $a0, 1 		# increment the string pointer (i++)
	addi 		$t0, $t0, 1 		# increment the count ($t0 += 1)
	j		loop
	
	exit:					
	jr 		$ra			# jump-register. $ra = contains the return adress @ main.
	
	print:
	li 		$v0, 4			# system call for print string
  	la 		$a0, str3		# $a0 has the adress of str3
  	syscall					# print str3($a0)
  	
  	li 		$v0, 1			# system call for print int
  	move 		$a0, $t0		# $a0 gets the length of string from $t0
 	syscall					# print $a0
 	
 	jr 		$ra			# returns @ main.
 	
 	isPalindrome:
	# Check base case
	slti		$t0, $t3, 2
	bne		$t0, $zero, returnTrue
	
	# Make sure first and last are equal
	move		$t4, $t3
	lb		$t0, 0($t4)
	addi		$t1, $a0, -1
	add		$t1, $t1, $t4
	lb		$t1, 0($t1)
	bne		$t0, $t1, returnFalse
	
	# Shift pointer, length, recurse
	addi		$a0, $a0, -2
	addi		$a1, $a1, 1
	j		isPalindrome
	
	returnFalse:
	addi		$v0, $zero, 0
	jr		$ra


	returnTrue:
	addi		$v0, $zero, 1
	jr		$ra
	
	printRes:
	add		$t4, $a0, $zero	# Stash result
	la		$a0, IS_STRING
	syscall			# print "is"
	bne		$t4, $zero, printResCont
	la 		$a0, NOT_STRING  
	syscall		# print "not"
	printResCont:
	la		$a0, A_PAL_STRING
	syscall			# print "a palindrome."
	jr		$ra
