# Preliminary.asm
# author@ S. Umut Balkan



########## MACRO #####################
        # string print operation
	.macro 	print_str(%str)
	.data
	myLabel: .asciiz %str
	.text
	li 	$v0, 4
	la 	$a0, myLabel
	syscall
	.end_macro
	
	# integer print operation
	.macro print_int (%x)
	li $v0, 1
	add $a0, $zero, %x
	syscall
	.end_macro
######################################

.data       # variable declarations follow this line



.text       # instructions follow this line

main:	# receives two numbers and returns its multiplication by successive addition recursively.

	print_str("Hello, please enter the first number: ")
	li	$v0, 5
	syscall 
	move	$s0, $v0	# first number 'a' stored at register 16
	
	print_str("\nGreat! Now enter the second number: ")
	li	$v0, 5
	syscall
	move	$s1, $v0	# second number 'b' stored at register 17

SuccAdd:


