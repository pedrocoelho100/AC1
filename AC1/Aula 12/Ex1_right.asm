	.data					#typedef struct
						#{
stg:	.word 72343				#unsigned int id_number;
	
	.asciiz "Maria"				#char first_name[18];
	.space 12
	
	.asciiz "Simplesmente"			#char last_name[15]
	.space 2
	
	.align 2
	.float 17.9				#float grade;	
						#} student;	
						
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "		
																																														
	.text								
	.globl main

main:						#int main(void)
						#{
						#// define e inicializa a estrutura "stg" no segmen
						#to de dados
	la $t0,stg				#static student stg = {72343, "Maria", "Simplesmente", 17.9};
	
	la $a0,str1				
	li $v0,4
	syscall					#print_str("\nN. Mec: ");
	
	lw $a0,0($t0)
	li $v0,1
	syscall					#print_intu10(stg.id_number);
	
	la $a0,str2
	li $v0,4
	syscall					#print_str("\nNome: ");
	
	addiu $a0,$t0,22
	li $v0,4
	syscall					#print_str(stg.last_name);
	
	li $a0,','
	li $v0,11
	syscall					#print_char(',');
	
	addiu $a0,$t0,4
	li $v0,4
	syscall					#print_str(stg.first_name);
	
	la $a0,str3
	li $v0,4
	syscall					#print_str("\nNota: ");
	
	lw $a0,40($t0)
	mtc1 $a0,$f12
	li $v0,2
	syscall					#print_float(stg.grade);
	
	li $v0,0				#return 0;
			
	jr $ra					#} 
