	.data
	
str:	.space 20
msg:	.asciiz "Introduza uma string: "

	.text
	.globl main
	
main:	# p -> $t0
	# *p -> $t1
	
	la $a0,msg
	li $v0,4
	syscall
	
	la $a0,str
	li $a1,20
	li $v0,8
	syscall
	
	la $t0,str # p = str
	
while:	lb $t1,0($t0)

	beq $t1,$0,end
	
	subi $t1,$t1,'a'
	addi $t1,$t1,'A'
	sb $t1,0($t0)
	
	addi $t0,$t0,1
	j while
	
end:	la $a0,str
	li $v0,4
	syscall

	jr $ra