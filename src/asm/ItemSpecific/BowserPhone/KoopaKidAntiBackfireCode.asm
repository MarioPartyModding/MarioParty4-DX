#To be inserted at 8009a854
#If the Bowser Event was triggered with a phone, make it so Koopa Kid will never backfire (he'll only steal Coins from the target player)
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load Bowser Phone flag

#Don't continue if it isn't Bowser Phone
cmpwi r14, 2
bne end

li r3, 0

end:
li r14, 0
cmpwi r3, 70