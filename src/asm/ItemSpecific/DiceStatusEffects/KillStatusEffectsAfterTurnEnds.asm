#To be inserted at 80064a44
#When a player's turn ends, kill all their status effects

lis r14, 0x8018
ori r14, r14, 0xFD02
lbz r14, 0 (r14) #Current player ID

mulli r14, r14, 9 #multiply by 9 (status effect struct size)

#Load base status effect struct
lis r15, 0x8018
ori r15, r15, 0xFD62

add r14, r15, r14 #Current player's status struct

li r15, 0
stb r15, 0 (r14)
stb r15, 1 (r14)
stb r15, 2 (r14)
stb r15, 3 (r14)
stb r15, 4 (r14)
stb r15, 5 (r14)
stb r15, 6 (r14)
stb r15, 7 (r14)
stb r15, 8 (r14) #Return all the status effects back to zero

li r14, 0
stwu sp, -0x0010 (sp)