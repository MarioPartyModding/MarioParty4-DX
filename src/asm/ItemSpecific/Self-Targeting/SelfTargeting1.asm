#To be inserted at 8008f58c
#Load itemprev
lis r14, 0x801D
ori r14, r14, 0x3F44
lbz r14, 0 (r14)

cmpwi r14, 0xE #Bowser Phone
beq can_selftarget

cmpwi r14, 0x1D #Minus Block
beq can_selftarget

cmpwi r14, 0x1E #Speed Block
beq can_selftarget

cmpwi r14, 0x1F #Slow Block
beq can_selftarget

cmpwi r14, 0x20 #Poison Shroom
beq can_selftarget

cmpwi r14, 0x23 #Reverse Shroom
beq can_selftarget

b end


can_selftarget:
li r0, 5 #Change currently iterated player to 5, so the target select window does not skip any player

end:
li r14, 0
cmpw r31, r0