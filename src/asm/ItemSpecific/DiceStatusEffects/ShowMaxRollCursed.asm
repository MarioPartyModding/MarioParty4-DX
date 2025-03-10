#To be inserted at 80085db4
#Load base status effect struct
lis r5, 0x8018
ori r5, r5, 0xFD62

#Load curplayer index, multiply by 9
lis r3, 0x8018 
ori r3, r3, 0xFD02
lbz r3, 0 (r3)

mulli r3, r3, 9

#Add curplayer index to status effect struct address
add r5, r5, r3

#Check if has Poison Mushroom
lbz r3, 6 (r5)

cmpwi r3, 0
beq not_poison

li r0, 3 #Make the max dice roll 3 if it detects a Poison shroom
stb r0, -0x7382 (r13)

not_poison:
lbz r0, -0x737F (r13)