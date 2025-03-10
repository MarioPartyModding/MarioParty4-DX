#To be inserted at 80085cf0
#Add extra dices if so indicated by the status effect struct first byte
#Load base status effect struct
lis r14, 0x8018
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

#Add curplayer index to status effect struct address
add r14, r14, r15

lbz r15, 0 (r14)

add r0, r0, r15 #Add the amount of Extra Dices to r0

#Original instruction
stb r0, -0x7380 (r13)

end:
li r14, 0
li r15, 0