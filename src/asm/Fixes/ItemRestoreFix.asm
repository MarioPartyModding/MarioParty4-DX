#To be inserted at 8008efb0
# MP4 ITEM EXPANSION MOD GECKO CODE - Item Restore Fix
# Original instruction
lwz r31, 0 (r3)

# The value of r4 is 4 * item ID. It's higher than 0x34 for all custom items.
cmpwi r4, 0x34
ble is_not_custom_item

# If it's a custom item, make the item restore funct 8009725c (Normal Item Restore) to prevent the game from crashing when landing on a space.
lis r31, 0x8009
ori r31, r31, 0x725c


is_not_custom_item:


#If player has Bowser Suit active, make the Item Restore func the Bowser Suit one (so the transformation goes away)
# Get current player, multiply by 0x30 (player struct size)
  lis r14, 0x8018
  ori r14, r14, 0xFD02
  lbz r15, 0 (r14)
  mulli r15, r15, 0x30

# Get current player struct
  lis r14, 0x8018
  ori r14, r14, 0xFC38
  add r14, r14, r15

lbz r15, 0x0009 (r14) #Load bitfield with Bowser suit flag
rlwinm r15, r15, 28, 31, 31
rlwinm r15, r15, 0, 24, 31 #Get Bowser Suit Flag

cmpwi r15, 0
beq end   

lis r31, 0x8009
ori r31, r31, 0x7328 #Set Item Restore flag to Bowser Suit flag

end:
li r14, 0
li r15, 0




