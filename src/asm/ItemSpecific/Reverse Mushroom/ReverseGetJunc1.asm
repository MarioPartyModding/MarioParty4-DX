#To be inserted at 80066374
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


#Check if has reverse shroom

lbz r15, 7 (r14)
cmpwi r15, 1
blt not_reverse

#Get junc count for reverse shroom

lis r14, 0x8007
ori r14, r14, 0x1c30 #Reverse array

lhz r0, 0 (r14)

b end

#Original instruction
not_reverse:
lhz r0, 0x002A (r26) #Remember to restore this for reverse code

end:
li r15, 0
li r14, 0
