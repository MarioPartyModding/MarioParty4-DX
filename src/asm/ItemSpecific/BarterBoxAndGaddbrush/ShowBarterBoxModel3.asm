#To be inserted at 8009154c
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

#Set ID of MDL to show
   lis r3, 7
   ori r3, r3, 209
   b end

not_gaddbrush:
lwz r3, 0 (r3)

end:
li r14, 0