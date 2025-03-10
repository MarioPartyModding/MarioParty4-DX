#To be inserted at 800971c4
#For Plunder Chest: only allow for 1 item get

#Check which item was used
lis r14, 0x801D
ori r14, r14, 0x3F44
lbz r14, 0 (r14)

cmpwi r14, 0x17 #Plunder Chest ID
bne end

li r0, 1

b end

end:
li r14, 0
cmpw r3, r0