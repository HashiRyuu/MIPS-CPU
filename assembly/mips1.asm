.data
.text

center:
	addi $sp, $sp, -24
	sw $a0, 24($sp)		# store address in arg0 in caller's stack frame
	sw $a1, 28($sp)		# store size in arg1 in caller's stack frane
	sw $ra, 16($sp)
	
	jal average		# call the function
	move $t1, $v0		# int avg = average()
	
	move $t2, $zero		# i = 0
    	lw   $a0, 24($sp)      # Restore array address
    	lw   $a1, 28($sp)      # Restore size

loop:
	bge $t2, $a1, exit 		# if i >= size got to exit
	
	# calulate the a[i]
	sll $t3, $t2, 2
	addu $t4, $a0, $t3
	lw $t5, 0($t4)
	
	# a[i] -= avg
	sub $t6, $t5, $t1
	sw $t6, 0($t4)
	
	addi $t2, $t2, 1
	j loop
	
exit:	
	lw $ra, 16($sp)
	addi $sp, $sp, 24
	jr $ra