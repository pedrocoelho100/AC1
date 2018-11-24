	.data
	
array:	.word 7692, 23, 5, 234

	.text
	.globl main
	
main:	# p -> $t0
	# pultimo -> $t1
	# *p -> $t2
	# soma -> $t3
	
	li $t3,0

	la $t0,array # p = array
	
	addi $t1,$t0,12 # cada word ocupa 4 bits, logo 3 x 4 = 12
	
while:	bgt $t0,$t1,end

	lw $t2,0($t0) # *p

	add $t3,$t3,$t2
	addi $t0,$t0,4 # 4 bits 1 word
	j while

end:	move $a0,$t3
	li $v0,1
	syscall
	
	jr $ra
