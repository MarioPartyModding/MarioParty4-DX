#To be inserted at 80080de0
#If the Warp Event was triggered with a Shy Guy, don't make the panel green
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load Special Item flag

#Continue if it's a special item
cmpwi r14, 2
beq end

stb r0, 0x0008 (r3)

end:
li r14, 0