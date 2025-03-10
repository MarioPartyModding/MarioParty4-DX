#To be inserted at 8008b1ec
#Make it impossible to get Rare Items from Item Bags that were earned from item spaces by changing the ID to 0xFF
#Still possible to get Rare Items from Item Bags only if you buy them at the shop.

retry:
#Kill Mini Shroom no matter what
cmpwi r30, 0x00
beq kill_rare_item

#Kill Wacky Watch no matter what
cmpwi r30, 0x16
beq kill_rare_item

#Kill Semi-Rare Items and Poison Shroom Bunch
cmpwi r30, 0x18
beq kill_rare_item

cmpwi r30, 0x1B
beq kill_rare_item

cmpwi r30, 0x21
beq kill_rare_item

cmpwi r30, 0x22
beq kill_rare_item

#Game replaces Item Bags with Mini Shrooms. So have it re-randomize if it gets Item Bag
cmpwi r30, 0xD
beq kill_rare_item


cmpwi r27, -1 #This value is always -1 when using an item bag outside of the shop, and always a pointer when buying an item bag on the shop.
bne skip_rare_item_kill

cmpwi r30, 0x11 #Hidden Block Card
beq kill_rare_item

cmpwi r30, 0x13 #Barter Box
beq kill_rare_item

cmpwi r30, 0x14 #Super Pipe
beq kill_rare_item

cmpwi r30, 0x15 #Chance Time
beq kill_rare_item

b skip_rare_item_kill

kill_rare_item:
#If player gets a forbidden item ID, run RNG function, then retry
# Run RNG function, the range will be 0-0x23
lis r30, 0x8005
ori r30, r30, 0xFB40
mtctr r30
li r3, 0x24
bctrl

mr r30, r3 #Put result on r30; this is the item id

b retry

skip_rare_item_kill:

cmpwi r27, -1
beq skip_make_lamp

#Double the odds of getting rare items and Magic Lamp off an Item Bag that was purchased on the shop
cmpwi r30, 7
bne skip_make_hidden
li r30, 0x11

skip_make_hidden:

cmpwi r30, 1
bne skip_make_barter
li r30, 0x13

skip_make_barter:

cmpwi r30, 0x1F
bne skip_make_super
li r30, 0x14

skip_make_super:

cmpwi r30, 0x22
bne skip_make_chance
li r30, 0x15

skip_make_chance:

cmpwi r30, 0x4
bne skip_make_lamp
li r30, 0xC

skip_make_lamp:


cmpwi r30, 0xFF