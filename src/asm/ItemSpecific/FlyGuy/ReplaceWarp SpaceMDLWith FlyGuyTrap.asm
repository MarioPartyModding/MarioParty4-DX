#To be inserted at 800810f8
#Check if the special item flag is active. 
lis r5, 0x8007
ori r5, r5, 0x1CA0
lbz r5, 0 (r5) #Load special item flag

#Continue if not Fly Guy
cmpwi r5, 2
bne end

lis r3, 7 #board.bin
ori r3, r3, 220 #Shy Guy Trap mdl

end:
li r5, 0