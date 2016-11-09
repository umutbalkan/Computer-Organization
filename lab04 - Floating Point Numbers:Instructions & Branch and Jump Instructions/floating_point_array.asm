# floating_point_array.asm: Exercising MIPS floating point instructions & dynamic arrays
# author: S. Umut Balkan
# date: 11/9/16
# CS 224 - LAB04.

	###############
	# stop execution (MACRO)
	.macro done
	li $v0,10
	syscall
	.end_macro
	
	# string print operation (MACRO)
	.macro 	print_str(%str)
	.data
	myLabel: .asciiz %str
	.text
	li 	$v0, 4
	la 	$a0, myLabel
	syscall
	.end_macro
	
	# integer print operation (MACRO)
	.macro 	print_int(%int)
	.text
	add	$a0, $a0, $zero
	li 	$v0, 1
	move 	$a0, %int
	syscall
	.end_macro
	
	# floating-point number print operation (MACRO)
	.macro	print_float(%num)
	.text
	li	$v0, 2
	add 	$f12, $zero, %num
	syscall
	.end_macro
	
	.macro read_int(%register)
	li	$v0, 5	# read integer from console		
	syscall
	move	%register, $v0
	.end_macro
	###############
	.data
	
	.text
main:
	print_str("Hello!\nEnter the array size: ")
	li	$v0, 5  # Reading an integer from console
	syscall		# $v0 contains the array size
	
	move	$s7, $v0 # $s7 is the size of array.
	
	# Allocate Heap Memory ( DYNAMIC ARRAY )
	sll 	$a0, $v0, 2 # $a0 should contain the byte value. "sll by 2" multiplies the value in $v0 by 4 and stores at $a0
	li	$v0, 9	# $v0 contains the address of dynamically allocated memory
	syscall		# syscall 9 sbrk (allocate heap memory)
	
	move	$s6, $v0 # $s6 contains the address of dynamically allocated memory
	add	$s0, $s6, $s0 # $s0 contains the address of the dynamic array
	add	$s2, $s6, $s2
	add	$s3, $s6, $s3
	addi	$t0, $t0, 1
	print_str("Now, Enter the floating-point number for the index")
	
fillArr:
	bgt	$t0,$s7,menu
	print_str("\n(")
	print_int($t0) # Cosmetic index / useless
	print_str(" / ")
	print_int($s7) # Cosmetic size / useless
	print_str(") :")
	li	$v0, 6	# Reading float
	syscall		# Console input stored in $f0
	s.s	$f0, 0($s0) # Save $f0 at $s0[i]
	
	addi	$t0, $t0, 1 # incrementing our cosmetic index / useless
	addi	$s0, $s0, 4	# incrementing our offset.
	j 	fillArr

menu:	
	beq	$t0, -1,exit # if selection is 4 then terminate.
	#beq	$t0, 0, op0
	#beq	$t0, 1, op1
	#beq	$t0, 2, op2
	#beq	$t0, 3, op3
	print_str("Select operation:\n")
	print_str("(0) * Result of (max - min)\n(1) * Find Min\n(2) * Find Max\n(3) * Find Sum\n(-1) * Exit\nOPERATION : ")
	read_int($t0)
	j	menu

############ OPERATIONS ############
#op0:
#	j	menu
		
#op1:	bgt	$t0, $s7,menu
#	move	$s2, $s6	#address of the first index
#	l.s 	$f0, 0($s2)
	
	
	
#	addi	$s2, $s2, 4
	addi	$t0, $t0, 1
#	j	op1
#op2:
#	j	menu
#	
	
#op3:
#	j	menu	2

	
exit:
	print_str("bye!!")
	done	