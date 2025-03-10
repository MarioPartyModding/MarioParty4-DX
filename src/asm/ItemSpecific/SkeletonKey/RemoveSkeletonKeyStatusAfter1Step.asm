#To be inserted at 800648c0
#Check if player has Skeleton Key status effect
#Load base status effect struct
lis r4, 0x8018 
ori r4, r4, 0xFD62

#Load curplayer index, multiply by 9
lis r3, 0x8018 
ori r3, r3, 0xFD02
lbz r3, 0 (r3)

mulli r3, r3, 9

#Add curplayer index to status effect struct address
add r4, r4, r3

#Remove Skeleton Key status effect
li r3, 0
stb r3, 1 (r4)

mulli r4, r31, 48