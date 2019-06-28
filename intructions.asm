# Aritmética
add   $d $s $t  # $d = $s + $t
000000 
sub   $d $s $t  # $d = $s - $t
addu  $d $s $t  # $d = $s + $t
subu  $d $s $t  # $d = $s - $t
addi  $d $s 24  # $d = $s + 24
addiu $d $s 24  # $d = $s + 24

# Lógica
and   $d $s $t  # $d = $s & $t
or    $d $s $t  # $d = $s | $t
nor   $d $s $t  # $d = ¬($s | $t)
andi  $d $s 24  # $d = $s & 24
ori   $d $s 24  # $d = $s | 24


# Memória
lw    $d 24($s) # $d = mem[$s + 24]
sw    $d 24($s) # mem[$s + 24] = $d
lhu   $d 24($s) # $d = mem[$s + 24]
sh    $d 24($s) # mem[$s + 24] = $d
lbu   $d 24($s) # $d = mem[$s + 24]
sb    $d 24($s) # mem[$s + 24] = $d
lui   $d 24     # $d = 24*(2^16)

# Desvio condicional
beq   $d $s 24  # IF $d==$s THEN goto PC+4+24
bne   $d $s 24  # IF $d!=$s THEN goto PC+4+24