.data
.text

#$a0 = base address of array
#$s1 = size 

times_two:
	move $t0, $zero	#i = 0
	
loop:
	bge $t0, $a1, exit
	
	sll $t1, $t0, 2		# i * 4
	addu $t2, $a0, $t1	# a + (i * 4)
	
	lw $t3, 0($t2)		#a[i]
	sll $t3, $t3, 1		#a[1] * 2
	sw $t3, 0($t2)		
	
	addi $t0, $t0, 1
	j loop
	
exit:
	jr $ra