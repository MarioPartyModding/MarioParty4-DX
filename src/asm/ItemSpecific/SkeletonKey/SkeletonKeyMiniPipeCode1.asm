#To be inserted at 80064ecc
#Check if player has Skeleton Key status effect
#Load base status effect struct
lis r14, 0x8018 
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

#Add curplayer index to status effect struct address
add r14, r14, r15

#Check if player has skeleton key status effect
lbz r15, 1 (r14)
cmpwi r15, 1
bne end

li r0, 1 #Let player pass if they do


end:
li r14, 0
li r15, 0
cmpwi r0, 1