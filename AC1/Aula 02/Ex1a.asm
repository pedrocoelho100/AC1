.text
.globl main

main:   li  $t0,0x762A5C1B
	li  $t1,0x89D5A3E4
	and $t2,$t0,$t1
	or  $t3,$t0,$t1
	nor $t4,$t0,$t1
	xor $t5,$t0,$t1
	
	jr $ra
