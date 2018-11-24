	.data
	
	.eqv SIZE 10
	
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15

	.align 2
str1:	.asciiz "\nConteudo do array:\n"
	.align 2
str2:	.asciiz " <-> "

	.text
	.globl main
	
main:	la $t0,lista # p

	la $a0,str1
	li $v0,4
	syscall
	
	li $t1,0 # i
for:	bge $t1,SIZE,end1

	lw $t2,0($t0)
	move $a0,$t2
	li $v0,1
	syscall
	
	la $a0,str2
	li $v0,4
	syscall
	
	addiu $t0,$t0,4
	addiu $t1,$t1,1
	j for

end1:	jr $ra
