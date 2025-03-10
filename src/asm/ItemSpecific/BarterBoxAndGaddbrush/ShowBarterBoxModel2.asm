#To be inserted at 800915c0
#Check if it's a Barter Box. If it is, draw BarterBox MDL
lis r14, 0x801D
ori r14, r14, 0x40CB
lbz r14, 0 (r14)

cmpwi r14, 0x13
bne not_barterbox

#Set ID of MDL to show
   lis r3, 7
   ori r3, r3, 0xD0
   b end


not_barterbox:

cmpwi r14, 0x18
bne not_gaddbrush

#If it's a Gaddbrush, don't show any mdl. Skip BoardModelCreate 
   lis r14, 0x8009
   ori r14, r14, 0x15D0
   mtctr r14
   li r14, 0
   bctr

not_gaddbrush:
lwz r3, 0 (r3)

end:
li r14, 0