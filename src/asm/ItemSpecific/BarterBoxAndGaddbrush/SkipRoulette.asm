#To be inserted at 80091098
#Check if it's a Barter Box. If it is, skip wheel
lis r4, 0x801D
ori r4, r4, 0x40CB
lbz r4, 0 (r4)

cmpwi r4, 0x13
bne not_barterbox

#Let player pick a theft target
   lis r4, 0x8008
   ori r4, r4, 0xF560
   mtctr r4
   bctrl

#Skip roulette
   lis r4, 0x8009
   ori r4, r4, 0x10ac
   mtctr r4
   bctr

not_barterbox:
li r4, 3