	.text
	.globl main

main:   li $v0,5
	syscall
	move $t0,$a0
	
	li $t1,8	 # $t1 = 8
	add $t1,$t0,$t0	 # $t1 = x + x = 2 * x
	add $t3,$t1,$t2	 # $t1 = y = 2 * x + 8
	
	move $a0,$t3
	li $v0,1
	syscall
	
	jr  $ra 	 # fim do programa