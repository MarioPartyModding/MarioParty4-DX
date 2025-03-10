#To be inserted at 8008f5e4
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
beq slow_target

cmpwi r14, 0x20 #Poison Shroom
beq can_selftarget

cmpwi r14, 0x23 #Reverse Shroom
beq can_selftarget

b end


can_selftarget:
lis r5, 0x0037
ori r5, r5, 0x007A #Change messageid with the one that has the 4 targets
b end

slow_target:
lis r5, 0x0037
ori r5, r5, 0x007B #Change messageid with the one that has custom dice stuff

end:
li r14, 0
crclr 6