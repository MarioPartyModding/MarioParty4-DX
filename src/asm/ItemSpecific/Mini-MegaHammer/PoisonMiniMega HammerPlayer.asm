#To be inserted at 8008fdd4
mr r27, r3

#Load base status effect struct
lis r3, 0x8018
ori r3, r3, 0xFD62

#Multiply target player ID by 9
mulli r4, r27, 9 

#Add target player index to status effect struct
add r3, r3, r4

li r4, 1
#Poison that player
stb r4, 6 (r3)