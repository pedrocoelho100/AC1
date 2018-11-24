	.data

lista:	.space 40		#array de ints, 1 int = 4 bits

	.align 2

q:	.asciiz "\nIntroduza um numero:"
sepa:   .asciiz " - "

	.text
	.globl main

main:
	li $t0,0
	li $t3,10		#$t3 contem o size do array
	la $t2,lista		#*p=lista

for:
	bge $t0,$t3,endfor  
		
	la $a0,q		#printstr		
	li $v0,4
	syscall
	
	li $v0,5		#read int
	syscall
	
	sw $v0,0($t2)
	addiu $t0,$t0,1		
	addiu $t2,$t2,4
	
	j for
	
endfor:
		#################NOTA#################
		#tudo acima foi so pegar no exer1#####
		#e converter de index para ponteiros##
		######################################
		
		#nesta altura ja foi feita a leitura dos numeros, vai come�ar a ordena�ao
		
		
do:		li $t0, 0	#houveTroca=FALSE

		la $t1, lista
	
		li $t2, 0

for2:		bge $t2, 9, endfor2

		lw $t3, 0($t1)		#lista[i]
		addiu $t4, $t1, 4	#i+1
		lw $t5, 0($t4)		#lista[i+1]

		ble $t3, $t5, notif

		move $t6, $t3		#aux
		sw $t5, 0($t1)
		sw $t6, 0($t4)

		li $t0, 1++
	
notif:		addi $t1, $t1, 4
		addi $t2, $t2, 1

		j for2

endfor2:

		beq $t0, 1, do

		#impressao do array

		la $t0, lista

		li $t1, 0
for3:		bge $t1, 10, endfor3

		lw $t2, 0($t0)

		move $a0, $t2
		li $v0, 1
		syscall

		j if

if:		bge $t1,9,endfor3
		la $a0, sepa
		li $v0, 4
		syscall

		addi $t0, $t0, 4

		addi $t1, $t1, 1

		j for3

endfor3:
		jr $ra

