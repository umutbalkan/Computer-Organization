## Author: Sencer Umut Balkan
## Date: 11/10/2016
## Description: Preliminary1.asm - creates array by given inputs, displays in reverse order.
##

		.data		# variable declarations follow this line
	array:		.space	400 # declaring an array big enough for 100 integers.
	
	# string prompt constants
	prompt: .asciiz "\nEnter the size of the array: "
	enter:  .asciiz "Enter the value:"
	fancy:  .asciiz " "
	
		.text		# instructions follow this line
	main:			# indicates start of code (first instruction to execute)
	li 	$v0,4 			#system call code for print string
	la 	$a0,prompt		#address of prompt
	syscall				#print prompt
	
	#get the first number from the user, put into $s0
	li 	$v0,5			#system call for read input
	syscall 			#read integer into $v0 from console.
	move 	$t2,$v0 		#move the number read into $t2
	
	
	# $s0 = array base address, $s1 = i
	la 	$s0,array
	addi	$s1,$zero,0		# i = 0
	
	loop:
	slt	$t0,$s1,$t2		# i < t2
	beq	$t0,$zero, display	# if not then next.
	sll 	$t0,$s1,2		# $t0 = i*4 (byte offset)
	add 	$t0,$t0,$s0		# address of array[i]
	li 	$v0,4 			#system call code for print string
	la 	$a0,enter		#address of enter
	syscall				#print enter
	li 	$v0,5			# system call for read integer.
	syscall				# read integer into $v0 from console
	move 	$t1,$v0			# move the number read into $t1
	sw	$t1,($t0)		# store the value at $t1 at $t0(= array[i])
	addi 	$s1,$s1,1		# i += 1
	j loop				# repeat
	
	display:
	slt	$t0,$s2,$t2		# i < t2
	beq	$t0,$zero, reverse	# if not then next.
	sll 	$t0,$s2,2		# $t0 = i*4 (byte offset)
	add 	$t0,$t0,$s0		# address of array[i]
	addi 	$s2,$s2,1		# i += 1
	lw 	$a0,($t0)
	li	$v0,1			# system call code for printing integers
	syscall
	li 	$v0,4 			# system call code for print string
	la 	$a0,fancy		# address of str
	syscall				# print str
	j display			# repeat


	reverse:
	slt	$t0, $s3,$t2		
	beq	$t0,$zero, done	# if not then next.
	addi	$s3, $s3, 1		# i($s1 += 1
	sll 	$t0,$s2,2		# $t0 = i*4 (byte offset)
	add 	$t0,$t0,$s0		# address of array[i]
	addi 	$s2,$s2,-1		# i($s2) -= 1
	lw 	$a0,($t0)
	li	$v0,1			# system call code for printing integers
	syscall

	j display			# repeat
	
	done:
	
	