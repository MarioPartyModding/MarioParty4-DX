#To be inserted at 8009abdc
lis r14, 0x801D
ori r14, r14, 0x4170
lbz r14, 0 (r14)
cmpwi r14, 1
beq not_bowser_phone #If the character is KoopaKid, don't make him turn into Bowser

li r3, 0
lis r14, 0x8009
ori r14, r14, 0xabe8
mtctr r14
li r14, 0
bctr

not_bowser_phone:
li r14, 0
li r3, 0