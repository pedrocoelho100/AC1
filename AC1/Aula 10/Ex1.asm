	.data

num1:	.float 2.59375	
num2:	.float 0.0	
	
	.text
	.globl main
	
main:

do:	li $v0,5
	syscall
#	move $t0,$v0
	
	mtc1 $v0,$f0 
	cvt.s.w $f0,$f0
	
	l.s $f2,num1 # fazer o load do 2.59375
	mul.s $f2,$f0,$f2
	
	mov.s $f12,$f2
	li $v0,2
	syscall
	
	l.s $f4,num2
	
while:	c.eq.s $f2,$f4
	bc1f do

	li $v0,0
	
	jr $ra
