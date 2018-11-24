	.data
	.align 2
	
stg:	.word 72343 # id_number
	 
	.asciiz "Maria" # first_name
	.space 12
	    
	.asciiz "Simplesmente" # last_name
	.space 5
	    
	.float 17.9 # grade

str1:	.asciiz "\nN.Mec: "
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "	
	
	.text
	.globl main
	
main:	la $a0,str1 # "\nN.Mec: "
	li $v0,4
	syscall
	
	la $t0,stg  # print id_number
	lw $a0,0($t0)
	li $v0,1
	syscall
	
	la $a0, str2  # "\nNome:  "
	li $v0,4
	syscall
	
	addiu $a0,$t0,22  # print last_name
	li $v0,4
	syscall
	
	la $a0,','
	li $v0,11
	syscall
	
	addiu $a0,$t0,4
	li $v0,4
	syscall
	
	la $a0,str3
	li $v0,4
	syscall
	
	lw $a0,40($t0)
	mtc1 $a0,$f12
	li $v0,2
	syscall
	
	li $v0,0
	
	jr $ra