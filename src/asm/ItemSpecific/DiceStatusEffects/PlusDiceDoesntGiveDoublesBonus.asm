#To be inserted at 80087f70
#Load base status effect struct
lis r14, 0x8018
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

add r14, r14, r15 #Get current player's status effect struct

lbz r15, 2 (r14) #Load Plus Status

cmpwi r15, 1
bne skip_plusdice_fix

li r0, 1 #Change the value of r0 to 1, causing it to not detect identical rolls

skip_plusdice_fix:
li r14, 0
li r15, 0
cmpwi r0, 3