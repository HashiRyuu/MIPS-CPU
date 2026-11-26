.data
.text

g:
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	sw $a2, 32($sp)		# store c
	sw $a3, 36($sp)		# store d
	# e is already sitting at 40($sp) when the function starts 
	# don't need to save it just need to load it when you are ready to use it.
	
	jal f
	move $t1, $v0
	sw $t1, 16($sp)
	
	lw $a0, 32($sp)		# c
	lw $a1, 36($sp)		# d
	lw $a2, 40($sp)		# e
	jal h

	lw $t1, 16($sp)		# result of f (i)
	div $t1, $v0		# i / j
	mflo $v0		# return i / j
	
	# dont need to restore a, b, c, d, e because the caller dont need it
	lw $ra, 20($sp)		# restore $ra
	addi $sp, $sp, 24
	jr $ra
	