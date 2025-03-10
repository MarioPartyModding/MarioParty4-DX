#To be inserted at 8008130c
#Original instruction: Load pointer to position float
addi r4, r4, 19136

#Check if the special item flag is active. If it is, switch user and target
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load special item flag

#Continue if it's not Fly Guy
cmpwi r14, 2
bne end

#Load the first half on the position float as a halfword
lha r14, 0 (r4)

#Substract 0xA to it
subi r5, r14, 0xA

sth r5, 0 (r4) #Store the result back on the position float

end:
li r14, 0