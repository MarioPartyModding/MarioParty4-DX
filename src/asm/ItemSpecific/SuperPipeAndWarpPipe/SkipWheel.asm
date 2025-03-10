#To be inserted at 80090428
#Check if it's a Super Pipe, if it is, skip wheel
lis r4, 0x801D
ori r4, r4, 0x40CB
lbz r4, 0 (r4)

cmpwi r4, 0x14
beq superpipe

cmpwi r4, 0x1A
beq warp

b end

superpipe:
#Let player pick a position theft target
   lis r4, 0x8008
   ori r4, r4, 0xF560
   mtctr r4
   bctrl

#Skip roulette
   lis r4, 0x8009
   ori r4, r4, 0x0438
   mtctr r4
   bctr
b end

warp:
#Make target self
# Get current player
  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3)

#Skip roulette
   lis r4, 0x8009
   ori r4, r4, 0x0438
   mtctr r4
   bctr

end:
li r4, 3