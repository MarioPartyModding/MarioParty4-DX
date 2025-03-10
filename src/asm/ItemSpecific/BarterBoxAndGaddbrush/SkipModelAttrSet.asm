#To be inserted at 800910f0
#Check if it's a Barter Box or GaddBrush. If it is, skip mdl attribute set
lis r14, 0x801D
ori r14, r14, 0x40CB
lbz r14, 0 (r14)

cmpwi r14, 0x13
beq end

cmpwi r14, 0x18
beq end

#MDL attribute set
   lis r14, 0x8006
   ori r14, r14, 0xE5C4
   mtctr r14
   li r14, 0
   bctrl


end:
li r14, 0