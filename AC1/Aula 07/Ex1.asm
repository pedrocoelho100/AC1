	.text
	.globl strlen

	# *s -> $s0
					
strlen:	li $v0,0

while:	lb $t0,0($a0)
	addiu $t0,$t0,1
	beq $t0,'\0',end0
	
	addi $v0,$v0,1
	j while
	
end0:	jr $ra
	
	.data
	
str:	.asciiz "String de teste"	

	.text
	.globl main
	
main:	subiu $sp,$sp,4
	sw $ra,0($sp)

	la $a0,str
	jal strlen
	
	move $a0,$v0
	li $v0,1
	syscall
	
	li $v0,0
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	jr $ra