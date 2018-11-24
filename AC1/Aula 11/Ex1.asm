	.text
	.globl absol

absol:

if1:	bge $a0,0,end0
	neg $a0,$a0

end0:	move $v0,$a0

	jr $ra
	
	.data
	
num1:	.double 1.0
	
	.text
	.globl xtoy
	
xtoy:	subiu $sp,$sp,28
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $ra,8($sp)
	s.d $f20,12($sp)
	s.d $f22,20($sp)
	
	move $s0,$a0		# y
	mov.d  $f20,$f12	# x
	
	li $s1,0  # i -> $s1
	l.d $f22,num1 # result -> $f22

for:	move $a0,$s0
	jal absol
	
	bge $s1,$v0,endfor
	
if2:	ble $s0,0,else
	mul.d $f0,$f22,$f20
	j end2

else:	div.d $f0,$f22,$f20

end2:	addiu $s1,$s1,4
	j for
	
endfor:	mov.d $f0,$f22

	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $ra,8($sp)
	s.d $f20,12($sp)
	s.d $f22,20($sp)
	addiu $sp,$sp,28

	jr $ra

	.data
	.text
	.globl main
	
main:	subiu $sp,$sp,28
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $ra,8($sp)
	s.d $f20,12($sp)
	s.d $f22,20($sp)
	
	li $v0,7
	syscall
	mov.d $f12,$f0
	
	li $v0,5
	syscall
	move $a0,$v0
	
	jal xtoy
	
	li $v0,3
	syscall
	
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $ra,8($sp)
	s.d $f20,12($sp)
	s.d $f22,20($sp)
	addiu $sp,$sp,28
	
	jr $ra