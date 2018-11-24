	.data
	
str:	.asciiz "String de teste"	
	
	.text
	.globl main
	
main:	subiu $sp,$sp,4			#int main(void)
	sw $ra,0($sp)			#{
	
	la $a0,str			#	static char str[]="String de teste";
	jal strlen
	move $a0,$v0
	li $v0,1
	syscall				#	print_int10(strlen(str));
	li $v0,0			#	return 0;
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	jr $ra				#} 
	
	.text
	.globl strlen

strlen:					#int strlen(char *s)
					#{
	li $v0,0			#	int len=0;
while:	lb $t1,0($a0)				
	beq $t1,'\0',endw1		#	while(*s++ != '\0')
	addiu $a0,$a0,1
	addiu $v0,$v0,1			#		len++;
	j while
endw1:					#	return len;
	jr $ra				#}
