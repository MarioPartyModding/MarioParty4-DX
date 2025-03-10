#To be inserted at 80077cf0
# Use RNG function with the range of 0-1 to hardcode the first item of the shop, barring shop odds. Store that value to 800721aC 
lis r3, 0x8005
ori r3, r3, 0xFB40
mtctr r3
li r3, 2
bctrl

#0 = First Hardcoded Item. 1 = Second Hardcoded Item

lis r4, 0x8007
ori r4, r4, 0x21aC 
stb r3, 0 (r4)

li r0, -1