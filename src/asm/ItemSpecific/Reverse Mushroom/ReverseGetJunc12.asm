#To be inserted at 80065368
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

cmpwi r27, 0
bne is_not_first_junc
  lhz r0, 2 (r14) #For the first junction choice
b end

is_not_first_junc:
cmpwi r27, 1
bne is_not_second_junc #For the second junction choice
  lhz r0, 4 (r14)
b end

is_not_second_junc:
cmpwi r27, 2
bne end #For the second junction choice
  lhz r0, 6 (r14)

cmpwi r0, 0xFF
bne end
li r0, 2 #Fix reverse bug

b end

not_reverse:
#Original instruction
lhz r0, 0x002A (r26) #Remember to restore this for reverse code

end:
li r15, 0
li r14, 0
