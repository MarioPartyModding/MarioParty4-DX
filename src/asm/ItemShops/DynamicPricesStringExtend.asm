#To be inserted at 80043a08
lha r3, 0x002E (sp)

cmpwi r3, 0xE
blt end

#If the value exceeds message ID 0E, the subsequent message IDs are shop prices. Values 09 to 0D don't work, which is why we're starting from 0E
#1A to 25 and 29-2A don't work either

#26: Magic Lamp
#27: Item Bag
#28: Bowser Phone
#2B: Mushroom
#2C: Golden Shroom

#40: Mini Shroom
#41: Chomp Call
#42: Bowser Suit
#43: Boo Bell

#Check if it's MiniMega Hammer
cmpwi r3, 0x4C
beq hammer

#Check if it's Bowser Suit
cmpwi r3, 0x4D
beq suit

#Check if it's between 0x40 and 0x4B
cmpwi r3, 0x40
blt skip_vanilla

cmpwi r3, 0x4B
bgt skip_vanilla

subi r5, r3, 0x40 #Vanilla items before Magic Lamp will be using IDs 40 - 48. Because earlier ones are reserved characters.
b print_string

hammer:
li r5, 4
b print_string

suit:
li r5, 0xA
b print_string

skip_vanilla:

subi r5, r3, 0xE #Substract 0xE to it to get the current item ID, store that item ID in r5

cmpwi r3, 0x26
blt skip_id_decrease_lamp

subi r5, r5, 0xC #Substract 0xC for the gap after the Booie item

skip_id_decrease_lamp:

cmpwi r3, 0x2B
blt print_string

subi r5, r5, 2 #Substract 2 for the gap after the Bowser Phone

print_string:

# Put sprintf into the ctr
lis r3, 0x800E
ori r3, r3, 0x62C8
mtctr r3

# r3 is the location to store the string on (stealAmountStr)
lis r3, 0x801d
ori r3, r3, 0x421c

# r5 is the current item's price. First, we put the base price offset on r4, then we add to it the current item's id, and put the result on r5.
lis r4, 0x8007
ori r4, r4, 0x1F08 #Test price
add r5, r4, r5
lbz r5, 0 (r5) #Load the byte from the resulting address

# r4 is the location of "%d", which sprintf needs as arg
lis r4, 0x801D
ori r4, r4, 0x3838

bctrl #Run sprintf(stealAmountStr, %d, ItemPrice)

# Now insert that string on message ID 0x7
lis r3, 0x8007
ori r3, r3, 0x06D0 #BoardWinInsertMesSet
mtctr r3

lis r3, 0x801d
ori r3, r3, 0x421c #String location
li r4, 7 #String ID, 7
bctrl

li r3, 7 #Now make r3 become 7 (last InsertMes ID)

end: