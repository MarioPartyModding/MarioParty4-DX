#To be inserted at 8009d71c
#Substract 1 to curplayer if Chance Time
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load item flag

#Don't continue if Chance Time Item
cmpwi r14, 2
bne end


lis r14, 0x8018
ori r14, r14, 0xFD02 
lbz r15, 0 (r14) #Get current player id
subi r15, r15, 1 #Substract 1
stb r15, 0 (r14) #Store result into current player address

li r15, 3

lis r14, 0x8007
ori r14, r14, 0x1CA0
stb r15, 0 (r14) #Set item flag to 0x3 (Don't update itemprev)

li r15, 0


end:
li r14, 0
addi sp, sp, 32