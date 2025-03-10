#To be inserted at 80096d9c
#For Plunder Chest: Load Plunder chest mdl

#Check which item was used
lis r5, 0x801D
ori r5, r5, 0x3F44
lbz r5, 0 (r5)

cmpwi r5, 0x17 #Plunder Chest ID
bne end

lis r3, 7
ori r3, r3, 182

b end

end:
li 5, 1