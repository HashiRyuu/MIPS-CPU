.text
remove_between:
    # ------------------------------------------------------------------
    # Stack Frame: 32 Bytes
    #   $sp+24: RA
    #   $sp+20: Current 'a' (Local Var)
    #   $sp+16: End Pointer (Local Var)
    #   $sp+0 : Arg Build Area
    #
    # Caller's Shadow Space (Where we save original args):
    #   $sp+44: High
    #   $sp+40: Low
    #   $sp+36: Length (Unused after calc, but saved)
    #   $sp+32: Original 'a' (Unused after copy, but saved)
    # ------------------------------------------------------------------
    
    addi    $sp, $sp, -32
    sw      $ra, 24($sp)

    # 1. Save Arguments to Caller's Shadow Space
    sw      $a0, 32($sp)        # Save Original a
    sw      $a1, 36($sp)        # Save length
    sw      $a2, 40($sp)        # Save low
    sw      $a3, 44($sp)        # Save high

    # 2. Initialize Local Variables
    # Calculate end = a + (length * 4)
    sll     $t0, $a1, 2         
    add     $t1, $a0, $t0       
    sw      $t1, 16($sp)        # Save 'end' to local var
    
    # Save current 'a' to local var
    sw      $a0, 20($sp)        

loop:
    # 3. Reload Locals
    lw      $t0, 20($sp)        # $t0 = current a
    lw      $t1, 16($sp)        # $t1 = end
    bgt     $t0, $t1, exit      # while (a <= end)

    # 4. Check: between(*a, low, high)
    lw      $a0, 0($t0)         # Arg0: *a (Value)
    lw      $a1, 40($sp)        # Arg1: low
    lw      $a2, 44($sp)        # Arg2: high
    jal     between

    beq     $v0, $zero, else    # If false, skip

    # 5. Shift: shift_left(a, end)
    lw      $a0, 20($sp)        # Arg0: current a (Address)
    lw      $a1, 16($sp)        # Arg1: end (Address)
    jal     shift_left
    
    sw      $v0, 16($sp)        # Update 'end'
    j       loop                # Restart

else:
    # 6. Increment
    lw      $t0, 20($sp)        # Load 'a'
    addi    $t0, $t0, 4         # a++
    sw      $t0, 20($sp)        # Save 'a'
    j       loop

exit:
    lw      $ra, 24($sp)
    addi    $sp, $sp, 32
    jr      $ra