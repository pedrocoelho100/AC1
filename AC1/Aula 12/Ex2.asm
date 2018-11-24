	.data
	.align 2
	
st_arr:	.space 4x44
media:	.float 0.0

	.text
	.globl main
	
main:	subiu $sp,$sp,4
	sw $ra,0($sp)
	
	la $a0,st_arr
	li $a1,4
	jal read_data
	
	la $a0,st_arr
	li $a1,4
	la $a2,media
	
	jal max
	move $t9,$v0 # pmax
	
	la $a0,str1
	li $v0, 
	syscall
	
	l.s $f12,media
	la $t0,media
	l.s $f12,0($t0)
	li $v0, 
	syscall
	
	move $a0,$t9
	jal print_student
	
	li $v0,0
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	jr $ra