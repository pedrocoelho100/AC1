	.data
	
	.eqv SIZE 3

	.align 2	
str1:	.asciiz "Array"
	.align 2
str2:	.asciiz "de"
	.align 2
str3:	.asciiz "ponteiros"
	.align 2

array:	.word str1, str2, str3

	.text
	.globl main
	
main:	li $t0,0 # i
	la $t1,array
	
for:	bge $t0,SIZE,end1
	
	sll $t2,$t0,2
	addu $t3,$t1,$t2	
	lw $t4,0($t3)
	
	move $a0,$t4
	li $v0,4
	syscall
	
	li $a0,'\n'
	li $v0,11
	syscall

	addiu $t0,$t0,1
	j for

end1:	jr $ra
