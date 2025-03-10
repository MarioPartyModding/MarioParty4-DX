#To be inserted at 80090498
#Check which item was used
lis r14, 0x801D
ori r14, r14, 0x40CB
lbz r14, 0 (r14)

cmpwi r14, 0x1A

bne end

#If it's warp block, get targetspace stored in free mem

#Change space only on the first iteration
cmpwi r31, 0
bgt end

mr r4, r23

end:
add r5, r5, r0
li r14, 0