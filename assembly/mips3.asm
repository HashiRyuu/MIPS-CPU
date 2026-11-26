.data
.text

fact:
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	sw $s0, 16($sp)
	move $s0, $a0	#$a0 = n
	
	slti $t0, $s0, 2	#if n < 2 then $t0 = 1
	beq $t0, $zero, fact1	
	addi $v0, $zero, 1	#return base case
	
	lw $s0, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	jr $ra
	
fact1:
	addi $a0, $a0, -1
	jal fact	#call itself
	
	#return recurrsion
	lw $s0, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	
	mul $v0, $a0, $v0	#return n * fact(n-1)
	
	jr $ra