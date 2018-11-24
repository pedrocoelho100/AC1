	.data

str:	.space 20 # 5 x 4

	.text
	.globl main
	
main:	# num -> $t0
	# i -> $t1
	# str[0] -> $t2
	# str[i] -> $t3
	# Conteudo str[i] -> $t4

	la $a0,str
	li $a1,20
	li $v0,8
	syscall
	
	li $t0,0
	li $t1,0
	
while:	la $t2,str # str[0]
	addu $t2,$t2,$t1 # str[i]
	lb $t3,0($t2) # $t3 = str[i]
	
	beq $t3,$0,end0
	
if:	blt $t3,'0',endif
	bgt $t3,'9',endif

then1:	addi $t0,$t0,1
	
endif:	addi $t1,$t1,1	
	j while
	
end0:	move $a0,$t0
	li $v0,1
	syscall
	
	jr $ra