## Author: Sencer Umut Balkan
## Date: 11/10/2016
## Description: Math.asm - calculates x = (c-d) % 2.


.data 
	str1:	.asciiz "Enter value for c: "
	str2:	.asciiz "Enter value for d: "
	
	str4:	.asciiz	"Result is: "
.text
	main:
	li 	$v0,4 			#system call code for print string
	la 	$a0,str1		#address of prompt
	syscall				#print prompt
	li 	$v0,5			#system call for read input
	syscall 			#read integer into $v0 from console.
	move 	$t1,$v0 		#move the number read into $t1
	li 	$v0,4 			#system call code for print string
	la 	$a0,str2		#address of prompt
	syscall	
	li 	$v0,5			#system call for read input
	syscall 			#read integer into $v0 from console.
	move 	$t2,$v0 		#move the number read into $t1	
	
	li	$t4, 2	
	sub	$t3,$t1,$t2		# x= c-d
	rem 	$t3, $t3, $t4
	
	
	
	li	$v0, 1
	move	$a0, $t3
	syscall