.data
.text

# $$a0 = val
# $a1 = low
# $a2 = high
between:
    blt  $a0, $a1, FALSE   # if val < low return false
    bgt  $a0, $a2, FALSE   # if val > high return false
    li   $v0, 1            # return true
    jr   $ra
    
FALSE:
    move $v0, $zero        # return false
    jr   $ra
	
# or I can do this way
between:
    slt  $t0, $a0, $a1     # $t0 = val < low checking if the value is inside the range
    slt  $t1, $a2, $a0     # $t1 = high < val checking if the value is inside the range
    or   $t0, $t0, $t1     # $t0 = (val < low) || (high < val) if 0 mean the value not out the range
    xori $v0, $t0, 1       # $v0 = !($t0)  flip the result
    jr   $ra