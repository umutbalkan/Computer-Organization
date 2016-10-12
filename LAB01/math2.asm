## Author: Sencer Umut Balkan
## Date: 11/10/2016
## Description: Math.asm - calculates x = X*y -z.


.data 
	str1:	.asciiz "Enter value for x: "
	str2:	.asciiz "Enter value for y: "
	str3:	.asciiz "Enter value for z: "
	
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
	
	li 	$v0,4 			#system call code for print string
	la 	$a0,str3		#address of prompt
	syscall	
	
	li 	$v0,5			#system call for read input
	syscall 			#read integer into $v0 from console.
	move 	$t3,$v0 		#move the number read into $t1	
	
		
	mul	$t4,$t1,$t2		# x= c-d
	sub 	$t4, $t4, $t3
	
	
	
	li	$v0, 1
	move	$a0, $t4
	syscall