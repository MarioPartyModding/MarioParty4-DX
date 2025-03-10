#To be inserted at 800904cc
#Check which item was used
lis r3, 0x801D
ori r3, r3, 0x40CB
lbz r3, 0 (r3)

cmpwi r3, 0x1A
bne not_warpblock

#If it's warpblock, skip "Nothing happened..." message.
lis r29, 0x8009
ori r29, r29, 0x0550
mtctr r29
bctr

not_warpblock:
#If it's not warp block, load value into r3 normally
lwz r3, 0x005C (sp)