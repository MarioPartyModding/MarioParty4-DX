#To be inserted at 800643fc
#Substract 1 to curplayer if Chance Time
lis r3, 0x8007
ori r3, r3, 0x1CA0
lbz r3, 0 (r3) #Load item flag

#Don't continue if it's 3
cmpwi r3, 3
bne update_itemprev

li r14, 1
lis r3, 0x8007
ori r3, r3, 0x1CA0
stb r14, 0 (r3) #Return item flag to 1
li r14, 0

b end

update_itemprev:
stb r0, -0x74DC (r13)

end:
