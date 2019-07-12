Programa pra testar o processador

Faz um multiplicação usando soma recursiva

Em C:

uint mult(uint a, uint b){
    if(b == 0){
        return 0;
    }
    else{
        return a + mult(a, b-1);
    }
}



Em assembly:

      addi $sp $zero 1028
      lui $t6 0xffff
      ori $t6 $t6 0xffff
      lui $t7 0xffff
      ori $t7 $t7 0xfff8
      addi $a0 $0 5
      addi $a1 $0 6
      jal mult
end:	j end
mult:	beq  $a1 $0 base
      add  $sp $sp $t7
      sw   $a1 0($sp)
      sw   $ra 4($sp)
      add  $a1 $a1 $t6
      jal  mult
      lw   $a1 0($sp)
      lw   $ra 4($sp)
      addi $sp $sp 8
      add  $v0 $v0 $a0
      jr   $ra
base:	addi $v0 $0 0
      jr   $ra


Instruções em hexa:

0x201d0404
0x3c0effff
0x35ceffff
0x3c0fffff
0x35effff8
0x20040005
0x20050006
0x0c000009
0x08000008
0x10a0000a
0x03afe820
0xafa50000
0xafbf0004
0x00ae2820
0x0c000009
0x8fa50000
0x8fbf0004
0x23bd0008
0x00441020
0x03e00008
0x20020000
0x03e00008



Como testar:
- Carregar as instruções na memória de instrução (Use o arquivo "logisimInstrucs" pra não ter erro - Clique com botão direito na ROM -> Edit Contents -> Load)
- "Tickar" o clock até que o programa entre em loop infinito e o valor do PC fique em 0x20 pra sempre (Uns 80 ticks clock já é suficiente)
- Após isso, o valor de $2 tem que ser igual a 30 (5x6).