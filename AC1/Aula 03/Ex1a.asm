	.data

str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em binario: "	
	
	.text				# value -> $t0
	.globl main			# bit 	-> $t1
					# i	-> $t2
main:	la $a0,str1 #Lê Str1
	li $v0,4
	syscall
	
	li $v0,5 #lê value
	syscall
	move $t0,$v0
	
	la $a0,str2 #Lê str2
	li $v0,4
	syscall

for1:	li $t2,0 # i=0

test1:	bge $t2,32,end1	# i>=32

if3:	rem $t3,$t2,4 # espaço em cada 4 bits
	bne $t3,0,body1
	li $a0,' '
	li $v0,11
	syscall

body1:	andi $t1,$t0,0x80000000 # value & 0x80000000

if2:	bne $t1,$zero,else2 # bit != 0

then2:  li $a0,'0' # print char '0'
	li $v0,11
	syscall
	j end2

else2:	li $a0,'1' # print char '1'
	li $v0,11
	syscall

end2:	sll $t0,$t0,1 # value = value << 1

next1:	addi $t2,$t2,1 # i++   -> meter sempre antes do end
	j test1

end1:	jr $ra # fim do programa
