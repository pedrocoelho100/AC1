	.data

	.eqv SIZE 3

	.align 2
			
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"

array:	.word str1, str2, str3

	.text
	.globl main

main:	
	li $t0,0
	la $t1,array

for:	bgeu $t0,SIZE,endfor
	sll $t2,$t0,2
	addu $t2,$t2,$t1
	
	lw $a0,0($t2)
	li $v0,4
	syscall
	
	li $a0,'\n'
	li $v0,11
	syscall

	addiu $t0,$t0,1
	j for

endfor: jr $ra
