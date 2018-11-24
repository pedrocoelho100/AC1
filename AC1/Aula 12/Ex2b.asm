# st -> $a0
# ns -> $a1
# i -> $t1
# &st[i] -> $t0

	.text
	.globl read_data
	
for0:	li $t1,0 # i=0
test0:	bge $t1,$a1,end0

body0:	la $a0,str2
	li $v0,5
	syscall
	
	li $v0,5
	syscall
	mul $t0,$t1,44 # i x 44
	addu $t0,$a0,$t0 # &st[i]
	sw $v0,0($t0)
	
	la $a0,str3
	li $v0,5
	syscall
	
	addu $a0,$t0,4
	li $a1,18
	li $v0,8
	syscallx\
	
	addu $a0,$t0,22
	li $a1,15
	li $v0,8
	syscall
	
	li $v0,6
	syscall
	s.s $f0,40($t0)
	
next0:	addi $t1.$t1.1
	j test0
	
end0:	jr $ra