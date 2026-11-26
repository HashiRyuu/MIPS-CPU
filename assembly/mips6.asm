.data
.text

#$a0 = array address
#$a1 = size

average:
	addi $sp, $sp, -24
	sw $ra, 16($sp)	#save return address
	sw $a1, 0($sp)	#save size
	
	jal sum		#call function sum
	move $t0, $v0	#int s = sum()
	
	lw $a1, 0($sp)
	div $t0, $a1	#int avg = s / size
	mflo $v0	#$v0 = the result from division from LO
	
	lw $ra, 16($sp)	#recover average's $ra
	addi $sp, $sp, 24
	jr $ra
	
	
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
	
	
	
	