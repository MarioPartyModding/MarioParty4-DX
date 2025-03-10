#To be inserted at 80064e44
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

#Get junc count for reverse shroom, again

lis r14, 0x8007
ori r14, r14, 0x1c30 #Reverse array

lhz r0, 0 (r14)

# Get current overlay
lis r15, 0x801D
ori r15, r15, 0x3CE0
lwz r15, 0 (r15)

cmpwi r15, 0x5B
bne end 

#Shy Guy Jungle Jam 0x4D junction fix: Change the reverse array in memory so the game displays the arrow GFX. Because it doesn't display it when the space to draw GFX for is 0x4D.
#Target spaces will still be 0x4D and 0x4F

lhz r15, 2 (r14) #Reverse array first targetspace

cmpwi r15, 0x4D
bne end

li r15, 0x4A
sth r15, 2 (r14) #The reverse array now contains (2, 0x4A, 0x4F), this will allow the game to draw the direction arrows.

b end

not_reverse:

#Original instruction
lhz r0, 0x002A (r23) #Remember to restore this for reverse code
end:
li r14, 0
li r15, 0