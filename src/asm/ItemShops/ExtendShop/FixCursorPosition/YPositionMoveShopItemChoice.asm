#To be inserted at 8007a028
lis r3, 0x8007
ori r3, r3, 0x21a8 #New place to put the cursor float on

mulli r4, r28, 0x1A #Put the result of current choice ID x 0x1A in r4
addi r4, r4, 0x4310 #Y-Position base float (+0x1A added per choice)

cmpwi r28, 5
bne skip_substract
subi r4, r4, 0xa #Make the float smaller after the vanilla choice ids

skip_substract:

cmpwi r28, 6
bne skip_substract2
subi r4, r4, 0x16 #Make the float smaller after the vanilla choice ids

skip_substract2:

cmpwi r28, 7
bne skip_substract3
subi r4, r4, 0x22 #Make the float smaller after the vanilla choice ids

skip_substract3:

sth r4, 0 (r3)

lfs f0, 0 (r3)