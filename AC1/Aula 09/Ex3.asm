strcpy:	# dst -> $a0
	# src -> $a1
	
	li $t0,0
	
do:	la $t1,$a0
	addi $t1,$t0,1
	