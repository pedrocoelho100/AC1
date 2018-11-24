	.data
	
str:	.asciiz "2040, o ano do fim das PPP"	
	.align 2
	
	.text
	.globl main
	
main:	subu $sp,$sp,4			#int main(void)
	sw $ra,0($sp)			#{
	
	la $a0,str			#	static char str[]="2040, o ano do fim das PPP";
	jal atoi
	move $a0,$v0
	li $v0,1				
	syscall				#	print_int10( atoi(str) );
	li $v0,0			#	return 0;
	
	lw $ra,0($sp)
	addu $sp,$sp,4
	
	jr $ra				#}
	 
	.text
	.globl atoi			
									
atoi:					#unsigned int atoi(char *s)
					#{
	li $v0,0			#	unsigned int digit, res = 0;
	
while1:	lb $t1,0($a0)
	blt $t1,'0',endw1		#	while( (*s >= '0') && (*s <= '9') )
	bgt $t1,'9',endw1		#	{
	
	sub $t2,$t1,'0'			#		digit = *s++ - '0';
	
	mul $t3,$t3,10
	add $t3,$t3,$t2			#		res = 10 * res + digit;
	addu $a0,$a0,1
	j while1
endw1:					#	}
	move $v0,$t3
								#	return res;
	jr $ra				#} 