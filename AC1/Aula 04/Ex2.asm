	.data

str:	.space 20

	.text
	.globl main

main:	# num -> $t0
	# p -> $t1
	# *p -> $t2
	
	li $t0,0
	
	la $a0,str
	li $a1,20
	li $v0,8
	syscall
	
	la $t1,str # p = str
	
while:	lb $t2,0($t1) # *p ou str[0]

	beq $t2,$0,end0
	
if:	blt $t2,'0',then
	bgt $t2,'9',then
	
	addi $t0,$t0,1
	
then:	addi $t1,$t1,1
	j while
	
end0:	move $a0,$t0
	li $v0,1
	syscall
	
	jr $ra