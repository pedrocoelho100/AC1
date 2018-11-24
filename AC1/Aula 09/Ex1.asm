	.data
	
str:	.asciiz "apenas"	
	
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
	
	.text
	.globl strlen				
					
strlen:	subu $sp,$sp,8			#int strlen(char *s)
	sw $ra,0($sp)			#{
	sw $s0,4($sp)
	
	move $s0,$a0
	lb $t0,0($s0)	

if:	beq $t0,'\0',else		#	if(*s != '\0')
	addiu $a0,$s0,1
	jal strlen
	addiu $v0,$v0,1			#		return(1 + strlen(s + 1));
	j end1

else:					#	else
	li $v0,0			#		return 0;
	
end1:	lw $ra,0($sp)					
	lw $s0,4($sp)										
	addu $sp,$sp,8		
	
	jr $ra				#} 