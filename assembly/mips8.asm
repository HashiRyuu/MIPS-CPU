.data
.text

shift_left:
	move $t0, $a0	# beg
	move $t1, $a1	# end
	
loop:
	bgt $t0, $t1, exit	# if beg > end got to exit
	
	lw $t2, 4($t0)		# Load value from (beg + 4) -> *(beg + 1)
	sw $t2, 0($t0)		# Store value to (beg)      -> *beg
	
	addi $t0, $t0, 4	# Move pointer forward 4 bytes (++beg)
	j loop

exit:
	addi $v0, $t1, -4	# Return (end - 4 bytes)
	jr $ra
	
	