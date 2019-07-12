add   $d $s $t   # $d = $s + $t
000000 sssss ttttt ddddd ----- 100000
100 0000 00010 (0 -> 0x802)

addu  $d $s $t   # $d = $s + $t
000000 sssss ttttt ddddd ----- 100001
100 0000 00010 (0 -> 0x802)

sub   $d $s $t   # $d = $s - $t
000000 sssss ttttt ddddd ----- 100010
100 0000 00010 (0 -> 0x802)

subu  $d $s $t   # $d = $s - $t
000000 sssss ttttt ddddd ----- 100011
100 0000 00010 (0 -> 0x802)

and   $d $s $t   # $d = $s & $t
000000 sssss ttttt ddddd ----- 100100
100 0000 00010 (0 -> 0x802)

or    $d $s $t   # $d = $s | $t
000000 sssss ttttt ddddd ----- 100101
100 0000 00010 (0 -> 0x802)

nor   $d $s $t   # $d = ¬($s | $t)
000000 sssss ttttt ddddd ----- 100111
100 0000 00010 (0 -> 0x802)




beq   $s $t imm  # IF $s==$t THEN goto PC+4+(imm*4)
000100 sssss ttttt iiiiiiiiiiiiiiii
000 0001 00100 (4 -> 0x24) 0x04

bne   $s $t imm  # IF $d!=$s THEN goto PC+4+(imm*4)
000101 sssss ttttt iiiiiiiiiiiiiiii
000 0010 00100 (5 -> 0x44) 0x05




addi  $t $s imm  # $t = $s + imm
001000 sssss ttttt iiiiiiiiiiiiiiii
110 0011 00000 (08 -> 0xC60) 0x08

addiu $t $s imm  # $t = $s + imm
001001 sssss ttttt iiiiiiiiiiiiiiii
110 0100 00000 (09 -> 0xC80) 0x09

andi  $t $s imm  # $t = $s & imm
001100 sssss ttttt iiiiiiiiiiiiiiii
110 0101 00000 (12 -> 0xCA0) 0x0c

ori   $t $s imm  # $t = $s | imm
001101 sssss ttttt iiiiiiiiiiiiiiii
110 0110 00000 (13 -> 0xCC0) 0x0d




lui   $t imm     # $t = imm*(2^16)
001111 ----- ttttt iiiiiiiiiiiiiiii
110 0111 00000 (15 -> 0xCE0) 0x0f




lw    $t imm($s) # $t = RAM[$s + imm]
100011 sssss ttttt iiiiiiiiiiiiiiii
110 1000 11000 (35 -> 0xD18) 0x23

lbu   $t imm($s) # $t = RAM[$s + imm]
100100 sssss ttttt iiiiiiiiiiiiiiii
110 1001 11000 (36 -> 0xD38) 0x24

lhu   $t imm($s) # $t = RAM[$s + imm]
100101 sssss ttttt iiiiiiiiiiiiiiii
110 1010 11000 (37 -> 0xD58) 0x25

sb    $t imm($s) # RAM[$s + imm] = $t
101000 sssss ttttt iiiiiiiiiiiiiiii
011 1011 00000 (40 -> 0x760) 0x28

sh    $t imm($s) # RAM[$s + imm] = $t
101001 sssss ttttt iiiiiiiiiiiiiiii
011 1100 00000 (41 -> 0x780) 0x29

sw    $t imm($s) # RAM[$s + imm] = $t
101011 sssss ttttt iiiiiiiiiiiiiiii
011 1101 00000 (43 -> 0x7a0) 0x2b


j     target
000010 00000000000000000000000111 (0x08000007)
000010 tttttttttttttttttttttttttt
000 1110 00001 (02 -> 0x1c1) 0x02

jal   target
000011 00000000000000000000000001 (0x0c000001)
000011 tttttttttttttttttttttttttt
100 1111 00001 (03 -> 0x9e1) 0x03

jr $s
000000 11111 000000000000000 001000 (0x03e00008)
000000 sssss 000000000000000 001000
100 0000 00010 (0 -> 0x802) 0x00





# Teste 4
addi $1 $0 0x # $1 = 42
001000 00000 00001 1010101111001101 (0x2001abcd)

sb    $t imm($s) # RAM[$s + imm] = $t
101000 00000 00001 0000000000000010 (0xa0010002)
101000 sssss ttttt iiiiiiiiiiiiiiii
011 1011 0000 (40 -> 0x3b0)

lw    $t imm($s) # $t = RAM[$s + imm]
100011 00000 00010 0000000000000000 (0x8c020000)
100011 sssss ttttt iiiiiiiiiiiiiiii
110 1000 1100 (35 -> 0x68c)



sh    $t imm($s) # RAM[$s + imm] = $t
101001 sssss ttttt iiiiiiiiiiiiiiii
011 1100 0000 (41 -> 0x3c0)

sw    $t imm($s) # RAM[$s + imm] = $t
101011 sssss ttttt iiiiiiiiiiiiiiii
011 1101 0000 (43 -> 0x3d0)

lw    $t imm($s) # $t = RAM[$s + imm]
100011 00000 00010 0000000000000000 (0x8c020000)
100011 sssss ttttt iiiiiiiiiiiiiiii
110 1000 1100 (35 -> 0x68c)

lbu   $t imm($s) # $t = RAM[$s + imm]
100100 sssss ttttt iiiiiiiiiiiiiiii
110 1001 1100 (36 -> 0x69c)

lhu   $t imm($s) # $t = RAM[$s + imm]
100101 sssss ttttt iiiiiiiiiiiiiiii
110 1010 1100 (37 -> 0x6ac)





# Teste 3
addi $1 $0 42 # $1 = 42
001000 00000 00001 0000000000101010   (0x2001002a)

addiu $2 $0 8 # $2 = 8
001001 00000 00010 0000000000001000   (0x24020008)

sb    $t imm($s) # RAM[$s + imm] = $t
101000 00000 00001 0000000000000001
101000 sssss ttttt iiiiiiiiiiiiiiii

1111101011001010
sb    $t imm($s) 1111101011001010# RAM[$s + imm] = $t
101000 00000 000011111010110010101 0000000000000007
101000 sssss tttt1111101011001010t iiiiiiiiiiiiiiii
1111101011001010
1111101011001010
sh    $t imm($s) 1111101011001010# RAM[$s + imm] = $t
101001 00000 000111111010110010100 0000000000001000
101001 sssss tttt1111101011001010t iiiiiiiiiiiiiiii
011 1100 0000 (411111101011001010 -> 0x3c0)
1111101011001010
sw    $t imm($s) 1111101011001010# RAM[$s + imm] = $t
101011 sssss ttttt iiiiiiiiiiiiiiii
011 1101 0000 (43 -> 0x3d0)

lw    $t imm($s) # $t = RAM[$s + imm]
100011 sssss ttttt iiiiiiiiiiiiiiii
110 1000 1100 (35 -> 0x68c)

lbu   $t imm($s) # $t = RAM[$s + imm]
100100 sssss ttttt iiiiiiiiiiiiiiii
110 1001 1100 (36 -> 0x69c)

lhu   $t imm($s) # $t = RAM[$s + imm]
100101 sssss ttttt iiiiiiiiiiiiiiii
110 1010 1100 (37 -> 0x6ac)




#Teste 2
beq   $s $t imm  # IF $s==$t THEN goto PC+4+(imm*4)
000100 00001 00010 0000000000000011   (0x10220003)
000100 sssss ttttt iiiiiiiiiiiiiiii
000 0001 0010 (4 -> 0x12)

bne   $s $t imm  # IF $d!=$s THEN goto PC+4+(imm*4)
000101 00001 00000 1111111111111011   (0x1420fffb)
000101 sssss ttttt iiiiiiiiiiiiiiii
010 0010 0010 (5 -> 0x222)

lui   $t imm     # $t = imm*(2^16)
001111 00000 11111 1111101011001010   (0x3c1ffaca)
001111 ----- ttttt iiiiiiiiiiiiiiii
110 0111 0000 (15 -> 0x670)







# Teste 1
addi $1 $0 42 # $1 = 42
001000 00000 00001 0000000000101010   (0x2001002a)

addiu $2 $0 8 # $2 = 8
001001 00000 00010 0000000000001000   (0x24020008)

sub   $3 $1 $2 # $3 = 34
000000 00001 00010 00011 00000 100010 (0x00221822)
000000 sssss ttttt ddddd ----- 100010

subu  $4 $3 $2   # $4 = 26
000000 00011 00010 00100 00000 100011 (0x00622023)
000000 sssss ttttt ddddd ----- 100011

and   $5 $1 $2   # $5 = 42 & 8
000000 00001 00010 00101 00000 100100 (0x00222824)
000000 sssss ttttt ddddd ----- 100100

or    $6 $1 $2   # $6 = 42 | 8
000000 00001 00010 00110 00000 100101 (0x00223025)
000000 sssss ttttt ddddd ----- 100101

nor   $7 $1 $2   # $7 = ¬(42 | 8)
000000 00001 00010 00111 00000 100111 (0x00223827)
000000 sssss ttttt ddddd ----- 100111

andi  $8 $1 69  # $t = 42 & 69
001100 00001 01000 0000000001000101   (0x30280045)
001100 sssss ttttt iiiiiiiiiiiiiiii

ori   $9 $1 69  # $9 = $1 | 69
001101 00001 01001 0000000001000101   (0x34290045)
001101 sssss ttttt iiiiiiiiiiiiiiii





#
unsigned int mult(unsigned int x, unsigned int y){
    if y == 0
        return 0
    else
        return x + mult(y-1)
}


# unsigned int mult(unsiged int a, unsigned int b){
#     if (b == 0) {
#         return 0;
#     else {
#         return a + mult(b-1);
#     }
# }


# Como não há addi com sinal, estes valores precisam ser carregados manualmente no respectivos registradores
# $t6 = -1
# $t7 = -4

mult:       beq  $a1 $0 base	# if b == 0 then goto base
            add  $sp $sp $t7	# "Aloca" 4 bytes na pilha
            sw   $a1 0($sp)		# Salva b ($a1) na pilha
            add  $a1 $a1 $t6	# Prepara $a1 pra próxima chamada ($a1--)
            jal  mult			# Chamada recursiva
			lw   $a1 0($sp)		# Restaura o valor de $a1
			addi $sp $sp 4		# Restaura o endereço da pilha
            add  $v0 $v0 $a0	# return = a + mult(b-1)
            jr   $ra			# return to caller
base:       addi $v0 $0 0		#
            jr   $ra			# return 0;
