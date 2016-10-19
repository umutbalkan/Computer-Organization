# Sencer Umut Balkan - 21401911
# CS 224 - Section 3 / LAB02
# Translation.asm

############# MACROS ##############
###################################
        # string print operation
	.macro 	print(%str)
	.data
	myLabel: .asciiz %str
	.text
	li 	$v0, 4
	la 	$a0, myLabel
	syscall
	.end_macro
	
	
	# exit macro
	.macro 	done
	li 	$v0,10
	syscall
        .end_macro
        
###################################
	
	
	

	.data
	original:	.space		10
	code:		.space		10
	decoded:	.byte		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	str:		.space		10
	
	.text
	print("Enter original array: ") # macro
	la 	$a0, original	# read the character string from user.
	li 	$a1, 10		# string max size 10 characters
	li 	$v0, 8		# syscall code for read string from console
	syscall
	
	print("Great!\nNow enter the coded array: ")	#macro
	la 	$a0, code	# read the character string from user.
	li 	$a1, 10		# string max size 10 characters
	li 	$v0, 8		# syscall code for read string from console
	syscall
	
	print("Enter the string: ")	#macro
	la 	$a0, str	# read the character string from user.
	li 	$a1, 10		# string max size 10 characters
	li 	$v0, 8		# syscall code for read string from console
	syscall
	
	
computeSize:
	li	$t7, 10
	lb	$t1, original($t0)
	subi	$t1, $t1, 97	# converting them to original alphabetical values
	blt	$t1, $t7, encode
	sb	$t1, original($t0)
	addi 	$t0, $t0, 1
	
encode:
	lb	$t1, original($t0)	# original[i]
	lb	$t2, code($t0)		# code[i]
	bge   	$t0, $t7, manipulateStr	# if (original[i] == '\n
	subi	$t1, $t1, 97
	sb	$t2, decoded($t1)	# 
	addi	$t0, $t0, 1		# i++
	j	encode
	
manipulateStr:
	li	$t6, 10
	lb	$t1, str($t5)
	subi	$t1, $t1, 97
	lb	$t2, decoded($t1)
	sb	$t2, str($t5)
	beq     $t5, $t6, exit  #str[i] > 0 continue loops
	addi	$t5, $t5, 1	
	j manipulateStr
	
	
	
	
	
	
exit:
	li 	$v0, 4
	la 	$a0, str
	syscall
	done	#macro
	
	
