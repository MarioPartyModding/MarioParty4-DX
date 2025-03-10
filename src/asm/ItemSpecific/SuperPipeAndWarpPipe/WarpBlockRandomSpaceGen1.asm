#To be inserted at 80090474
#Check which item was used
lis r3, 0x801D
ori r3, r3, 0x40CB
lbz r3, 0 (r3)

cmpwi r3, 0x1A

bne end

#If it's warp block, get targetspace stored in free mem

lis r4, 0x8007
ori r4, r4, 0x1c40
lha r4, 0 (r4)

end:
rlwinm r0, r31, 2, 0, 29