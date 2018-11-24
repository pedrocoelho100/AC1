	.data
	
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em hexadecimal: "

	.text
	.globl main
	
main:	la $a0,str1
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	la $a0,str2
	li $v0,4
	syscall
	
	li $t1,8
	
while1:	andi $t2,$t0,0xF0000000
	bne $t2,0,do
	ble $t1,0,do
	
	sll $t0,$t0,4
	subiu $t1,$t1,1
	j while1
	
do:	andi $t3,$t0,0xF0000000
	srl $t4,$t3,28
	
if:	bgt $t4,9,else
	addi $t5,$t4,'0'
	move $a0,$t5
	li $v0,11
	syscall
	j end1
	
else:	addi $t5,$t4,'0'
	addi $t6,$t5,7
	move $a0,$t6
	li $v0,11
	syscall

end1:	sll $t0,$t0,4
	subiu $t1,$t1,1
	
while2:	bgt $t1,0,do

	jr $ra
