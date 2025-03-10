#To be inserted at 8008b8d4
# Get current player, multiply by 0x30 (player struct size)
  lis r4, 0x8018
  ori r4, r4, 0xFD02
  lbz r4, 0 (r4)
  mulli r4, r4, 0x30

# Get current player struct
  lis r5, 0x8018
  ori r5, r5, 0xFC38
  add r5, r5, r4

lbz r4, 7 (r5)

#Ignore all the code if one of the items is a lamp
lbz r4, 5 (r5)
cmpwi r4, 0xC
beq end

lbz r4, 6 (r5)
cmpwi r4, 0xC
beq end

lbz r4, 7 (r5)
cmpwi r4, 0xC
beq end

#Plunder Chest/Barter Box/Swap Card/Gaddbrush Assessment: Always prioritize the steal if a valuable item exists!
lis r4, 0x8007
ori r4, r4, 0x1CA1
lbz r4, 0 (r4)

cmpwi r4, 1
bne not_chest

li r5, 0
lis r4, 0x8007
ori r4, r4, 0x1CA1
stb r5, 0 (r4) #Reset ShouldChest flag

# Get current player, multiply by 0x30 (player struct size)
  lis r4, 0x8018
  ori r4, r4, 0xFD02
  lbz r4, 0 (r4)
  mulli r4, r4, 0x30

# Get current player struct
  lis r5, 0x8018
  ori r5, r5, 0xFC38
  add r5, r5, r4

#Priority order = Chest, Barter, Brush, Swap

#Check if one of the items is a chest, and use it
lbz r4, 5 (r5)
cmpwi r4, 0x17
beq use_first

lbz r4, 6 (r5)
cmpwi r4, 0x17
beq use_second

lbz r4, 7 (r5)
cmpwi r4, 0x17
beq use_third

#Check if one of the items is a Swap Box, and use it
lbz r4, 5 (r5)
cmpwi r4, 0x13
beq use_first

lbz r4, 6 (r5)
cmpwi r4, 0x13
beq use_second

lbz r4, 7 (r5)
cmpwi r4, 0x13
beq use_third

#Check if one of the items is a Brush, and use it
lbz r4, 5 (r5)
cmpwi r4, 0x18
beq use_first

lbz r4, 6 (r5)
cmpwi r4, 0x18
beq use_second

lbz r4, 7 (r5)
cmpwi r4, 0x18
beq use_third

#Check if one of the items is a Swap Card, and use it
lbz r4, 5 (r5)
cmpwi r4, 0x6
beq use_first

lbz r4, 6 (r5)
cmpwi r4, 0x6
beq use_second

lbz r4, 7 (r5)
cmpwi r4, 0x6
beq use_third


not_chest:
lbz r4, 7 (r5)
cmpwi r4, 0xFF
beq end

#Check if one of the items is a doubledip, and use it
lbz r4, 5 (r5)
cmpwi r4, 0x22
beq use_first

lbz r4, 6 (r5)
cmpwi r4, 0x22
beq use_second

lbz r4, 7 (r5)
cmpwi r4, 0x22
beq use_third

b end

use_first:
li r3, 0
b end

use_second:
li r3, 1
b end

use_third:
li r3, 2

end:
stw r3, 0x0018 (sp)