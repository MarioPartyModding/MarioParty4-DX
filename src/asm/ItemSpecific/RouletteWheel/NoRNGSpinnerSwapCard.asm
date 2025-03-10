#To be inserted at 8008186c
lis r4, 0x8008
ori r4, r4, 0x0ef4

cmpw r0, r4
bne not_warpspace_start

lbz r0, -0x7CC8 (r13)

b end

not_warpspace_start:

mflr r16 #Store original LR on r16

not_warpspace:

lis r3, 0x8005
ori r3, r3, 0xFB40
mtctr r3
li r3, 4
bctrl

lis r24, 0x8018
ori r24, r24, 0xFCF8
lbz r24, 0xA (r24) #Current player index

cmpw r24, r3
beq not_warpspace #Reroll if self

lis r24, 0x801D
ori r24, r24, 0x40CB 
lbz r24, 0 (r24) #Get ItemUsed

cmpwi r24, 0x18
beq is_gaddbrush_or_swap

cmpwi r24, 0x6
beq is_gaddbrush_or_swap

b return

is_gaddbrush_or_swap: #Check if no one has items if the item happens to be GaddBrush or Swap Card

bl nobody_item_check

cmpwi r5, 0
beq return #If no one has items, don't reroll

lis r24, 0x8018
ori r24, r24, 0xFC38
mulli r4, r3, 0x30 
add r24, r24, r4 #Get player struct

lbz r24, 5 (r24) #Get player first item

cmpwi r24, 0xFF
beq not_warpspace #Reroll


return:
mtctr r16
li r16, 0
bctr #Branch back to the ctr stored on r16

nobody_item_check:

lis r24, 0x8018
ori r24, r24, 0xFC38
li r4, 0 #Iterator

nobody_item_check_loop:
lis r5, 0x8018
ori r5, r5, 0xFCF8
lbz r5, 0xA (r5) #Current player index

cmpw r5, r4
beq loop_increment 

lbz r5, 5 (r24) #Get player first item
cmpwi r5, 0xFF
bne has_item


loop_increment:
addi r4, r4, 1
addi r24, r24, 0x30
cmpwi r4, 4
bge lacks_item

b nobody_item_check_loop

has_item:
li r5, 1
blr

lacks_item:
li r5, 0
blr


end:








































