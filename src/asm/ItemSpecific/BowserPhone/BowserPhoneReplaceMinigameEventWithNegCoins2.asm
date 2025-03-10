#To be inserted at 8009aaa8
#If the Bowser Event was triggered with a phone, and Bowser Minigame comes up, 
#Make Bowser steal coins as if he were KoopaKid
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load Bowser Phone flag

#Don't continue if it isn't Bowser Phone
cmpwi r14, 2
bne not_bowser_phone

lis r14, 0x801D
ori r14, r14, 0x4170
lbz r14, 0 (r14)
cmpwi r14, 1
beq not_bowser_phone #If the character is KoopaKid, don't make him turn into Bowser

li r3, 60 #Play Bowser voice instead of KoopaKid voice
b end

not_bowser_phone:
li r3, 62

end: