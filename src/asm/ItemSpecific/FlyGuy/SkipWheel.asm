#To be inserted at 80080ee0
#Check if it's a Fly Guy. If it is, skip Wheel
lis r4, 0x801D
ori r4, r4, 0x3F44
lbz r4, 0 (r4)

cmpwi r4, 0x1B
beq shyguy

b end

shyguy:
lis r4, 0x801D
ori r4, r4, 0x40CB
li r3, 5
stb r3, 0 (r4) #Swap the used item byte to a different one, to stop the warp space glitch

mr r3, r31 #Restore r3

#Let player pick a player to send into their space
   lis r4, 0x8008
   ori r4, r4, 0xF560
   mtctr r4
   bctrl

#Store target on 80071c3b
lis r4, 0x8007
ori r4, r4, 0x1c3b
stb r3, 0 (r4)


#Skip roulette
   lis r4, 0x8008
   ori r4, r4, 0x0EE8
   mtctr r4
   bctr
b end

end:
li r4, 3