#To be inserted at 80080ef8
#Check if the special item flag is active. If it is, switch user and target
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load special item flag

cmpwi r14, 2
bne end

mr r3, r31 #Put user on r3
lis r31, 0x8007
ori r31, r31, 0x1c3b
lbz r31, 0 (r31) #Put target on r31


end:
li r14, 0
extsb r0, r3