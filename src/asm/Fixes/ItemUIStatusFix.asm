#To be inserted at 8008af90
cmpwi r0, 0xE
beq end

cmpwi r0, 0x11
beq end

cmpwi r0, 0x12
beq end

cmpwi r0, 0x15
beq end

lis r4, 0x801d
ori r4, r4, 0x3f44
lbz r0, 0 (r4)
li r4, 0

cmpwi r0, 0x1B
beq end




lis r4, 0x8008
ori r4, r4, 0xC13C
mtctr r4
bctrl
b end


end: