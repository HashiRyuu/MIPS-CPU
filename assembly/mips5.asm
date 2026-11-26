.data
.text

sum:
	addi $sp, $sp, -8
	sw $s0, 4($sp)	#store int sum in stack frame
	
	move $s0, $zero
	move $t0, $zero
	
loop:
	bge $t0, $a1, exit
	
	sll $t1, $t0, 2		# i * 4
	addu $t2, $a0, $t1	# a + (i * 4)
	lw $t3, 0($t2)		#a[i]
	
	add $s0, $s0, $t3	#sum += a[i]
	sw $t3, 0($t2)		
	
	addi $t0, $t0, 1
	j loop

exit:
	move $v0, $s0
	
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	