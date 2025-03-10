#To be inserted at 80090568
#Check which item was used
lis r3, 0x801D
ori r3, r3, 0x40CB
lbz r3, 0 (r3)

cmpwi r3, 0x1A

bne end

#If it's warp block, get targetspace stored in free mem

lis r25, 0x8007
ori r25, r25, 0x1c40
lha r25, 0 (r25)

end:
li r3, 0