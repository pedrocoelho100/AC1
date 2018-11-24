.data
.text
.globl main

main:   li   $t0,0x12345678

	andi $t1,$t0,0xF0000000
	srl  $a0,$t1,28
	li   $v0,34
	syscall
	
	andi $t1,$t0,0x0F000000
	srl  $a0,$t1,24
	li   $v0,34
	syscall
	
	andi $t1,$t0,0x00F00000
	srl  $a0,$t1,20
	li   $v0,34
	syscall
	
	andi $t1,$t0,0x000F0000
	srl  $a0,$t1,16
	li   $v0,34
	syscall
	
	andi $t1,$t0,0x0000F000
	srl  $a0,$t1,12
	li   $v0,34
	syscall
	
	andi $t1,$t0,0x00000F00
	srl  $a0,$t1,8
	li   $v0,34
	syscall
	
	andi $t1,$t0,0x000000F0
	srl  $a0,$t1,4
	li   $v0,34
	syscall
	
	andi $t1,$t0,0x0000000F
	srl  $a0,$t1,0
	li   $v0,34
	syscall
	
	jr $ra