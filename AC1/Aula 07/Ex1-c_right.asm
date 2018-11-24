	.data
	
msg:	.asciiz " - "

	.text
	.globl main
	
main:	subu $sp,$sp,16			#int main(int argc, char *argv[])
	sw $ra,0($sp)			#{
	sw $s0,4($sp)	
	sw $s1,8($sp)					
	sw $s2,12($sp)									
					#int i;
	move $s0,$a0
	move $s1,$a1
	li $s2,0
	
for1:	bge $s2,$s0,endf1		#for(i=0; i < argc; i++)
					#{
	li $a0,'\n'				
	li $v0,11			
	syscall				#print_char('\n');

	sll $t3,$s2,2
	addu $t4,$s1,$t3
	lw $t5,0($t4)
	move $a0,$t5
	li $v0,4				
	syscall				#print_str(argv[i]);
	
	la $a0,msg
	li $v0,4	
	syscall				#print_str(" - ");
	
	move $a0,$t5
	jal strlen
	move $a0,$v0
	li $v0,1
	syscall				#print_int10(strlen(argv[i]));
	
	addi $s2,$s2,1
	j for1
endf1:					#}
	li $v0,0			#return 0;
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	addu $sp,$sp,16
	
	jr $ra				#} 

	.text
	.globl strlen

strlen:					#int strlen(char *s)
					#{
	li $v0,0			#	int len=0;
while:	lb $t1,0($a0)				
	addu $a0,$a0,1
	beq $t1,'\0',endw1		#	while(*s++ != '\0')
	addiu $v0,$v0,1			#		len++;
	j while
endw1:					#	return len;
	jr $ra				#}
