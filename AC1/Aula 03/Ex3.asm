	.data
	
str1:	.asciiz "Introduza dois numeros: "
str2:	.asciiz "Resultado: "

	.text
	.globl main
	
main:	li $t0,0 # i
	li $t1,0 # res
	
	la $a0,str1
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0 # mdor
	
	li $v0,5
	syscall
	move $t3,$v0 # mdo
	
while:	beq $t2,0,end1
	addiu $t0,$t0,1
	bge $t0,4,end1

if:	andi $t4,$t2,0x00000001
	beq $t4,0,end2
	
	add $t1,$t1,$t3

end2:	sll $t3,$t3,1
	srl $t2,$t2,1
	j while

end1:	la $a0,str2
	li $v0,4
	syscall
	
	move $a0,$t1
	li $v0,1
	syscall