#To be inserted at 80077ff4
##MP4DX Shop Odds Rework##
#Since the vanilla shop odds are difficult to extend without glitches and are rather flawed, MP4DX completely overrides the GetShopItems function.
#This approach will make MP4DX compatible with individual shop odds for 1ST, 2ND, 3RD and 4TH, and will make the relevant Gecko codes significantly more user friendly.
#The sum of all odds no longer has to be 100, and the player will be able to have less than 7 items on the shop.

#Initialize shop items table by making all its bytes 0xFF
lis r4, 0x801A
ori r4, r4, 0x4A60
li r3, 0xFF
stb r3, 0 (r4)
stb r3, 1 (r4)
stb r3, 2 (r4)
stb r3, 3 (r4)
stb r3, 4 (r4)
stb r3, 5 (r4)
stb r3, 6 (r4)

lis r4, 0x8007
ori r4, r4, 0x1f30

lbz r3, 0x1C2 (r4)
cmpwi r3, 0xFF
beq skip_first_hardcoded

lbz r3, 0x1C3 (r4)
cmpwi r3, 0xFF
beq skip_first_hardcoded #Skip first hardcoded item if either byte is FF

#Add the first hardcoded item
lis r3, 0x8005
ori r3, r3, 0xFB40
mtctr r3 #Store RNG function on the ctr
li r3, 2 #0-1 range
bctrl

lis r4, 0x8007
ori r4, r4, 0x1f30
add r4, r4, r3
lbz r3, 0x1C2 (r4)

lis r4, 0x801A
ori r4, r4, 0x4A60
stb r3, 0 (r4) #Add first hardcoded item ID to the items table

skip_first_hardcoded:
#Add the second hardcoded item

lis r4, 0x8007
ori r4, r4, 0x1f30
lbz r3, 0x1C4 (r4)

cmpwi r3, 0xFF
beq skip_second_hardcoded

lis r4, 0x801A
ori r4, r4, 0x4A60
stb r3, 1 (r4) #Add second hardcoded item ID to the items table

skip_second_hardcoded:
#Get turn data used for the code
lis r3, 0x8018 
ori r3, r3, 0xFCFC
lbz r4, 1 (r3) #Max Turn
lbz r3, 0 (r3) #Current Turn

li r5, 3
divw r4, r4, r5 #Divide Max Turn / 3.

li r5, 0 #Store the amount of bytes we'll be adding to the shop odds address in r5

cmpw r3, r4
ble calc_item #Do the calculation right away earlygame, using the first table.

li r5, 0x32 #Advance to the second table during midgame (1ST Place Midgame table)

mulli r4, r4, 2
cmpw r3, r4
ble calc_placement 

li r5, 0xFA #If it managed to get there, it's the lategame. Advance to the sixth table (1ST Place lategame table)

calc_placement:
lis r4, 0x8018
ori r4, r4, 0xFD02 
lbz r4, 0 (r4) #get current player index
mulli r4, r4, 0x30

lis r3, 0x8018
ori r3, r3, 0xFC38 #player structs start

add r4, r3, r4 #now points to cur player

lbzu r3, 0x0009 (r4) #cur player placement byte
andi. r3, r3, 0x60
srwi r3, r3, 5 #return player placement
mulli r3, r3, 0x32
add r5, r5, r3 #Use the placement byte to advance tables 

calc_item:
lis r6, 0x8007
ori r6, r6, 0x1f30
add r6, r6, r5 #Get current player's shop odds table according to placement and turn, put in on r6.

#Get the sum of all the item odds on that table, store it on r17
li r3, 0 #Iterator
li r17, 0
odds_sum_loop:
lbzx r4, r6, r3
add r17, r17, r4 

addi r3, r3, 1
cmpwi r3, 0x32 #Odds table size
bge exit_sum_loop
b odds_sum_loop



exit_sum_loop:
lis r3, 0x8005
ori r3, r3, 0xFB40
mtctr r3 #Store RNG function on the ctr
cmpwi r3, 0
beq zero_odds_fill

items_add_loop:
mr r3, r17 
bctrl #Run RNG function, the range will be (0-Sum of Item Odds on the table)

mr r5, r3 #Store the RNG result on r5
li r3, 0 #Iterator and item ID
li r11, 0 #Where to store the sum of currently iterated odds
   new_item_loop:
   lbzx r4, r6, r3
   add r11, r11, r4
   cmpw r11, r5
   bgt check_store
   
   cmpw r11, r17
   beq check_store #If it got to the max odds, check to store that last iterated item
   
   addi r3, r3, 1
   b new_item_loop
   
b items_add_loop

check_store: #Check where to store the iterated item. If an item with an identical ID is found there, reiterate.

lis r4, 0x801A
ori r4, r4, 0x4A60

check_store_loop:
lbz r11, 0 (r4)

#Check how many items have non-zero odds
   li r21, 0 #Iterator
   li r18, 0 #Zero counter
   non_zero_check:
     lbzx r5, r6, r21
     cmpwi r5, 0
	 beq is_zero
	   addi r18, r18, 1
	 is_zero:
     addi r21, r21, 1
     cmpwi r21, 0x32 
     bge exit_non_zero_check
   b non_zero_check
   
exit_non_zero_check:

li r21, 0 #Iterator
allow_repeat_check:
lis r5, 0x801A
ori r5, r5, 0x4A60
add r5, r5, r21
lbz r5, 0 (r5)

cmpwi r5, 0xFF
beq allow_repeat_select

addi r21, r21, 1

cmpwi r21, 7
bge exit_allow_repeat_check

b allow_repeat_check

exit_allow_repeat_check:
cmpw r11, r3
beq items_add_loop #Identical item found. Repeat. Shop can't have identical items.

allow_repeat:
cmpwi r11, 0xFF
beq store_item #Store the item if an empty spot is detected

addi r4, r4, 1
b check_store_loop

allow_repeat_select:
cmpw r21, r18
bge allow_repeat #Allow repeat if all the items are already there
b exit_allow_repeat_check


store_item:
stb r3, 0 (r4) #Add item to item table

lis r4, 0x801A
ori r4, r4, 0x4A60
lbz r4, 6 (r4)

cmpwi r4, 0xFF
bne end #End the function once the last element is not 0xFF

b items_add_loop

zero_odds_fill: #In the event all the shop odds are zero, just fill the shop with a randomly-chosen non-rare item

li r3, 0x24
bctrl #Run RNG function which is still stored in the ctr. Get a value from 0 to 0x23
lis r4, 0x801A
ori r4, r4, 0x4A60 #Shop items table

cmpwi r3, 0x11
beq zero_odds_fill #Redo until it outputs a non-rare item

cmpwi r3, 0x13
beq zero_odds_fill

cmpwi r3, 0x14
beq zero_odds_fill

cmpwi r3, 0x15
beq zero_odds_fill

cmpwi r3, 0x16
beq zero_odds_fill

stb r3, 0 (r4)
stb r3, 1 (r4)
stb r3, 2 (r4)
stb r3, 3 (r4)
stb r3, 4 (r4)
stb r3, 5 (r4)
stb r3, 6 (r4)
stb r3, 7 (r4)

end: