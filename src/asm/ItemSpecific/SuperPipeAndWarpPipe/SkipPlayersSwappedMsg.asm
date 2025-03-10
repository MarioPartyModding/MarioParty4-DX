#To be inserted at 80090f18
#Check which item was used
lis r5, 0x801D
ori r5, r5, 0x40CB
lbz r5, 0 (r5)

cmpwi r5, 0x1A
bne not_warpblock

#If it's warpblock, skip "Player and Player switched places" message
lis r5, 0x8009
ori r5, r5, 0x0f78
mtctr r5
bctr

not_warpblock:
li r5, -1