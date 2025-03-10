#To be inserted at 800910c8
#Check if it's a Barter Box. If it is, draw BarterBox MDL
lis r3, 0x801D
ori r3, r3, 0x40CB
lbz r3, 0 (r3)

cmpwi r3, 0x13
bne not_barterbox

#Set ID of MDL to show
   lis r3, 7
   ori r3, r3, 0xAE
   b end


not_barterbox:

cmpwi r3, 0x18
bne not_gaddbrush

#Set ID of MDL to show
   lis r3, 7
   ori r3, r3, 184
   b end

not_gaddbrush:

lwz r3, 0 (r5)

end: