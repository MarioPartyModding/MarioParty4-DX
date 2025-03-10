#To be inserted at 800976d8
#If the Bowser Event was triggered with a phone, don't make the player's panel red
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load Bowser Phone flag

#Don't continue if it's a Bowser Phone
cmpwi r14, 2
beq end

stb r0, 0x0008 (r4)

end:
li r14, 0