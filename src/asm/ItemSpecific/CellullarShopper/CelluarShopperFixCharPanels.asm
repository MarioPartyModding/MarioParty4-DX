#To be inserted at 80077E48
li r3, 0 

#If the Shop Event was triggered with a cellullar shopper
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load cellullar shopper

#Don't continue if it's not a cellullar shopper
cmpwi r14, 2
bne end
li r3, 1

end: