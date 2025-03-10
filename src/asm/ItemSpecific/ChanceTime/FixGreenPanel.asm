#To be inserted at 8009d254
#Don't change panel color if event was triggered by item
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load item flag

#Continue if Chance Time Item
cmpwi r14, 2
bge end

stb r0, 8 (r3)

end:
li r14, 0
