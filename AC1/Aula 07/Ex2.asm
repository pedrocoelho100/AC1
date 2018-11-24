	  .text
	  .globl exchange
	
exchange: # *c1 -> $a0
	  # *c2 -> $a1
	  # aux -> $t0

	  lb $t0,0($a0)
	  lb $t1,0($a1)
	  sb $t1,0($a0)
	  sb $t0,0($a1)
	  
	  jr $ra

	.text
	.globl strrev
	  
strrev:	# *str -> $a0
	# p1 -> $s0
	# p2 -> $s1

	subiu $sp,$sp,16
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $ra,12($sp)

	move $s0,$a0
	move $s1,$a0
	move $s2,$a0
		
while1:	lb $t0,0($s1)
	beq $t0,$0,end1

	addiu $s1,$s1,1
	j while1
	
end1:	subiu $s1,$s1,1	

while2:	bge $s0,$s1,end2

	move $a0,$s0
	move $a1,$s1
	jal exchange
	
	addiu $s0,$s0,1
	subiu $s1,$s1,1
	j while2

end2:	move $v0,$s2

	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $ra,12($sp)
	addiu $sp,$sp,16
	
	jr $ra
	
	.globl main
	
main:	subiu $sp,$sp,4
	sw $ra,0($sp)
	
	la $a0,str
	jal strrev
	move $a0,$v0
	li $v0,4
	syscall
	
	li $v0,0
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	jr $ra
	
	.data
	
str:	.asciiz "String "
