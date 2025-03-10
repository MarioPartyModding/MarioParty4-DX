#To be inserted at 80090590
#Check which item was used
lis r6, 0x801D
ori r6, r6, 0x40CB
lbz r6, 0 (r6)

cmpwi r6, 0x1A

bne end

#If it's warp block, skip pos lerp
li r6, 20

lis r3, 0x8009
ori r3, r3, 0x05a0
mtctr r3
bctr

end:
li r6, 20