	.data

buf:	.space 11
	.align 2

str: .asciiz  "String"
	
	.text
	.globl main

main:
	subi $sp,$sp,8
	sw $ra,0($sp)
	sw $s0,4($sp)
	
	move $s0,$a1

	li $t0,1			
	
if2:
	li $t0,10
	
	bgt $v0,$t0,endif2	
	
	la $a0,buf
	lw $a1,0($s0)
	 
	jal strcpy
	
	move $a0,$v0
	li $v0,4
	syscall 

	j endif
	
endif2:

	la $a0,str
	li $v0,4
	syscall	
	
endif:
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	addi $sp,$sp,8
	
	la $v0,0		#return 0	
				
	jr $ra			
					
	.text
	.globl strcpy			
					
strcpy:	subu $sp,$sp,12		#char *strcpy(char *dst, char *src)
	sw $ra,0($sp)			#{
	sw $s0,4($sp)
	sw $s1,8($sp)			
	
	move $s0,$a0
	move $s1,$a1

if0:	lb $t0,0($s1)
	sb $t0,0($s0)
	beq $t0,'\0',endif0		#	if((*dst = *src) != '\0')
	
	addi $a0,$s0,1
	addi $a1,$s1,1
	jal strcpy			#		strcpy(dst + 1, src + 1);
endif0:	move $v0,$s0				#	return dst;
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addu $sp,$sp,12
	
	jr $ra				#} 
