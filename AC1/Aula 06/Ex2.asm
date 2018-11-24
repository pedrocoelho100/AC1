	.data

	.eqv SIZE 3

	.align 2
			
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"

array:	.word str1, str2, str3

	.text
	.globl main

main:	# p -> $t0
	# pultimo -> $t1
	# **p -> $t2

	la $t0,array
	
	
	addu $t9,$t0,SIZE
	la $t1,$t9