#To be inserted at 80077c64
#Fix the game defaulting to player 4 when calling the item shop remotely
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load Cellullar Shopper Flag

#Continue if it's a Cellullar Shopper
cmpwi r14, 2
bne end

lis r14, 0x8018
ori r14, r14, 0xFD02
lbz r0, 0 (r14)

end:
li r14, 0
stb r0, -0x7422 (r13)