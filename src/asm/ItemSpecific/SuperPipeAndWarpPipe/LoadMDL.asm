#To be inserted at 800903b0
#Check which item was used
lis r5, 0x801D
ori r5, r5, 0x40CB
lbz r5, 0 (r5)

cmpwi r5, 0x14 #Super Pipe ID
bne not_superpipe

lis r3, 7
ori r3, r3, 210

b end

not_superpipe:

cmpwi r5, 0x1A
bne end

lis r3, 7
ori r3, r3, 211

end:
li 5, 1