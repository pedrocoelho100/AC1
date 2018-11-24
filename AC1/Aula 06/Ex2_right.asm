	.data
	
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
	
main:	la $t0,array # p
	addi $t1,$t0,12 # pultimo
	
for:	bge $t0,$t1,end1

	lw $t2,0($t0)
	
	move $a0,$t2
	li $v0,4
	syscall
	
	li $a0,'\n'
	li $v0,11
	syscall

	addiu $t0,$t0,4
	j for
	
end1:	jr $ra