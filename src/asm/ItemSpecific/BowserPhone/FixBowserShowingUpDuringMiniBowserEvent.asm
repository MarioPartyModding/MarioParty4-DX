#To be inserted at 8009a870
#If the Bowser Event was triggered with a phone, and Bowser Minigame comes up, 
#Make Bowser steal coins as if he were KoopaKid
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load Bowser Phone flag

#Don't continue if it isn't Bowser Phone
cmpwi r14, 2
bne end

li r3, 96 #Ma

end:
li r14, 0

cmplwi r3, 5