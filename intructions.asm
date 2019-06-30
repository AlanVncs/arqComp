add   $d $s $t   # $d = $s + $t
000000 sssss ttttt ddddd 00000 100000

addu  $d $s $t   # $d = $s + $t
000000 sssss ttttt ddddd 00000 100001

sub   $d $s $t   # $d = $s - $t
000000 sssss ttttt ddddd 00000 100010

subu  $d $s $t   # $d = $s - $t
000000 sssss ttttt ddddd 00000 100011

addi  $t $s imm  # $t = $s + imm
001000 sssss ttttt iiiiiiiiiiiiiiii

addiu $t $s imm  # $t = $s + imm
001001 sssss ttttt iiiiiiiiiiiiiiii



# Lógica
and   $d $s $t   # $d = $s & $t
000000 sssss ttttt ddddd 00000 100100

nor   $d $s $t   # $d = ¬($s | $t)
000000 sssss ttttt ddddd 00000 100111

or    $d $s $t   # $d = $s | $t
000000 sssss ttttt ddddd 00000 100101

ori   $t $s imm  # $t = $s | imm
001101 sssss ttttt iiiiiiiiiiiiiiii

andi  $t $s imm  # $t = $s & imm
001100 sssss ttttt iiiiiiiiiiiiiiii



lui   $t imm     # $t = imm*(2^16)
001111 ----- ttttt iiiiiiiiiiiiiiii

lbu   $t imm($s) # $t = mem[$s + imm]
100100 sssss ttttt iiiiiiiiiiiiiiii

lhu   $t imm($s) # $t = mem[$s + imm]
100101 sssss ttttt iiiiiiiiiiiiiiii

lw    $t imm($s) # $t = mem[$s + imm]
100011 sssss ttttt iiiiiiiiiiiiiiii

sb    $t imm($s) # mem[$s + imm] = $t
101000 sssss ttttt iiiiiiiiiiiiiiii

sh    $t imm($s) # mem[$s + imm] = $t
101001 sssss ttttt iiiiiiiiiiiiiiii

sw    $t imm($s) # mem[$s + imm] = $t
101011 sssss ttttt iiiiiiiiiiiiiiii






# Desvio condicional
beq   $s $t imm  # IF $s==$t THEN goto PC+4+(imm*4)
000100 sssss ttttt iiiiiiiiiiiiiiii

bne   $s $t imm  # IF $d!=$s THEN goto PC+4+(imm*4)
000101 sssss ttttt iiiiiiiiiiiiiiii