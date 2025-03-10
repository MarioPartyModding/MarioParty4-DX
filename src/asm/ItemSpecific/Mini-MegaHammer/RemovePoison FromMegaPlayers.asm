#To be inserted at 80085d98
mr r27, r3

#Load base status effect struct
lis r3, 0x8018
ori r3, r3, 0xFD62

#Load curplayer index, multiply by 9
lis r4, 0x8018 
ori r4, r4, 0xFD02
lbz r4, 0 (r4)

#Multiply target player ID by 9
mulli r4, r4, 9 

#Add target player index to status effect struct
add r3, r3, r4

#Remove poison from that player
li r4, 0
stb r4, 6 (r3)

#Original instruction & r3 restore
li r0, 10
li r3, 2