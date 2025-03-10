#To be inserted at 80091bf8
#Check if it's a Gaddbrush. If it isn't, continue normally
lis r4, 0x801D
ori r4, r4, 0x40CB
lbz r4, 0 (r4)

cmpwi r4, 0x18
bne not_gaddbrush

#r3 = self;  r24 = targetpl;

mr r15, r3 #Move current player index to r15

#Remove all of self's items first
   lis r14, 0x8006
   ori r14, r14, 0x2C24 #Remove curplayer item
   li r23, 0 #Iterator

remove_item_loop:
   mr r3, r15 #ID of player who will lose the item (self)
   li r4, 0
   mtctr r14
   bctrl

addi r23, r23, 1
cmpwi r23, 3
bge exit_remove_item_loop

b remove_item_loop


exit_remove_item_loop:

#Get opponent's items now, without deleting them
   lis r14, 0x8018
   ori r14, r14, 0xfc38 
   mulli r4, r24, 0x30
   add r14, r14, r4 #Targetpl's struct

#Add items. Use r23 as iterator
li r23, 0

add_item_loop:
#First item
   lis r4, 0x8006
   ori r4, r4, 0x2B74
   mtctr r4
   mr r3, r15 #ID of player who will get the item
   lbz r4, 5 (r14) #Item ID

   cmpwi r4, 0x18
   bne skip_brush
   li r4, 0xF
   b copy_item
   
   
   skip_brush:
   cmpwi r4, 0x16 #Do not copy a Wacky Watch
   bne skip_watch
   li r4, 0xF
   b copy_item
   
   skip_watch:
   cmpwi r4, 0x13
   bne copy_item
   li r4, 0xF #Turn the item into a shroom if it's a Gaddbrush or Barter Box, for game balancing purposes

   copy_item:
   bctrl

addi r14, r14, 1
addi r23, r23, 1
cmpwi r23, 3
bge exit_add_item_loop

b add_item_loop

exit_add_item_loop:
#To end, skip vanilla item removal
   mr r3, r15
   mr r23, r24
   li r14, 0
   li r15, 0 #Restore hooks
   lis r4, 0x8009
   ori r4, r4, 0x1Ca4 
   mtctr r4
   bctr

not_gaddbrush:
li r4, 0