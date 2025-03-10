#To be inserted at 80097f48
#If the Bowser Event was triggered with a phone, and Bowser Minigame comes up, 
#Make Bowser steal coins as if he were KoopaKid
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load Bowser Phone flag

#Don't continue if it isn't Bowser Phone
cmpwi r14, 2
bne end

lis r14, 0x8018
ori r14, r14, 0xFD29
lbz r14, 0 (r14)
rlwinm r14, r14, 0, 28, 31 #Get Bowser Event ID

#If zero (Bowser Game), summon the KoopaKid Coin Loss event
cmpwi r14, 0
bne end

   lis r14, 0x8009
   ori r14, r14, 0xA94C
   mtctr r14
   li r14, 0
   bctrl

#End the Bowser Event right after
   lis r14, 0x8009
   ori r14, r14, 0x8078
   mtctr r14
   li r14, 0
   bctr

end:
#Original Instruction
li r3, 857
li r14, 0