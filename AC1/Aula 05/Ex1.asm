	.data
	
	.eqv SIZE 20
lista:	.space SIZE

	.align 2
str:	.asciiz "\nIntroduza um numero:"

	.text
	.globl main
	
main:	li $t0,0 # i
	la $t1,lista
	
for:	bge $t0,SIZE,end1

	la $a0,str
	li $v0,4
	syscall
	
	li $v0,5
	syscall

	addu $t2,$t1,$t0	
	sw $v0,0($t2)
	
	addiu $t0,$t0,4
	j for
	
end1:	jr $ra