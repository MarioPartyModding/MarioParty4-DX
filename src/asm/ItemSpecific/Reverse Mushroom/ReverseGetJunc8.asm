#To be inserted at 80064e74
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

#Get junc for reverse shroom

#Load amount of junctions into r0, from reverse array

lis r14, 0x8007
ori r14, r14, 0x1c30 #Reverse array

cmpwi r18, 0
bne is_not_first_junc
  lhz r4, 2 (r14) #For the first junction choice
b end

is_not_first_junc:
cmpwi r18, 1
bne is_not_second_junc #For the second junction choice
  lhz r4, 4 (r14)
b end

is_not_second_junc:
cmpwi r18, 2
bne end #For the second junction choice
  lhz r4, 6 (r14)
b end

not_reverse:
#Original instruction
lhzx r4, r23, r0 #Remember to restore this for reverse code

end:
li r15, 0
li r14, 0
