#To be inserted at 8009b334
lis r14, 0x801D
ori r14, r14, 0x4170
lbz r14, 0 (r14)
cmpwi r14, 1
beq not_bowser_phone #If the character is KoopaKid, don't make him turn into Bowser

li r14, 0
blr #Exit SetMiniBowser func immediately

not_bowser_phone:
li r14, 0
mflr r0