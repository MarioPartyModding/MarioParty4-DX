#To be inserted at 80083cf0
lis r4, 0x817f
ori r4, r4, 0xfff0
lwz r4, 0 (r4) #load new item to give player

cmpwi r4, 0xD
bne not_bag

li r14, 0 #Iterator
repeat:
li r3, 0x24 #Pick random item between 0 and 23
lis r4, 0x8005
ori r4, r4, 0xFB40
mtctr r4
bctrl #Make a random item
mr r4, r3 #Put random item on r4

lis r3, 0x8007
ori r3, r3, 0x1C74 #AllowedMultiItemsStruct
add r3, r3, r4 #Now points to currently iterated item
lbz r3, 0 (r3)

cmpwi r3, 0 #If the currently iterated item is not allowed, repeat
beq repeat

lis r3, 0x8006
ori r3, r3, 0x2B74
mtctr r3
lis r3, 0x8018 
ori r3, r3, 0xFD02
lbz r3, 0 (r3)
bctrl #Give it to curplayer

addi r14, r14, 1

cmpwi r14, 3
bge exit_itembag

b repeat

exit_itembag:
li r14, 0
li r4, 0xFF

not_bag: