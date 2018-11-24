	.data

str:	.asciiz "teste"

	.text
	.globl main

main:
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $s0,4($sp)
	
	la $a0,str
	move $s0,$a0
	
	jal strrev
	
	move $a0,$s0
	li $v0,4
	syscall
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	addi $sp,$sp,8
	
	jr $ra
	
	.text
	.globl strrev
	
strrev:	subu $sp,$sp,12			#char *strrev(char *str)
	sw $ra,0($sp)			#{
	sw $s0,4($sp)				
	sw $s1,8($sp)				
		
	move $s0,$a0			#	char *p1 = str;
	move $s1,$a0			#	char *p2 = str;
	
while1:	lb $t0,0($s1)			
	beq $t0,'\0',endw1		#	while(*p2 != '\0')
	addiu $s1,$s1,1			#		p2++;
	j while1

endw1:	subiu $s1,$s1,1			#	p2--;
	
while2:	bge $s0,$s1,endw2		#	while( p1 < p2 )					
					#	{
	move $a0,$s0			
	move $a1,$s1
	jal exchange			#		exchange(p1, p2);
	addiu $s0,$s0,1			#		p1++;
	subiu $s1,$s1,1			#		p2--;
	j while2

endw2:					#	}
	move $v0,$s0			#return str;	
					
	lw $ra,0($sp)				
	lw $s0,4($sp)				
	lw $s1,8($sp)
	addiu $sp,$sp,12
	
	jr $ra				#} 			
																																				
	.text
	.globl exchange			
		
exchange:				#void exchange(char *c1, char *c2)
					#{
	lb $t0,0($a0)			#char aux = *c1;
	lb $t1,0($a1)			# tmp = *c2;
	sb $t1,0($a0)			#*c1 = tmp;						
	sb $t0,0($a1)			#*c2 = aux;
					
	jr $ra				#} 