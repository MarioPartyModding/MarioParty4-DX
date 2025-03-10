#To be inserted at 80075ff0
#Check if player has Skeleton Key status effect
#Load base status effect struct
lis r4, 0x8018 
ori r4, r4, 0xFD62

#Load curplayer index, multiply by 9
lis r5, 0x8018 
ori r5, r5, 0xFD02
lbz r5, 0 (r5)

mulli r5, r5, 9

#Add curplayer index to status effect struct address
add r4, r4, r5

#Check if player has skeleton key status effect
lbz r5, 1 (r4)
cmpwi r5, 1
bne end

li r3, 1 #Change r3 to 1 (Mini Shroom size ID) if they do

end:
cmpwi r3, 2