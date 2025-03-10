#To be inserted at 800780e4
# MP4 ITEM EXPANSION MOD GECKO CODE 6 - ShopName Loading Code
# This code changes the directory/mainFS file from where the item models are loaded if it exceeds Item Bag.
# The value of r3 is the item ID
cmpwi r3, 0xD
ble is_not_custom_item

mr r30, r3
subi r30, r30, 0xE 
mulli r30, r30, 4 # Substract 0xE to that item ID and multiply the result by 4, this will be used to tell which file to load

addi r30, r30, 0x24 # ID of the first custom shopname

addis r30, r30, 0x37 # Messgroup 0x37

is_not_custom_item:
# Store the address where the custom price string will be located on the table of InsertMessages.
lis r3, 0x8007
ori r3, r3, 0x06D0 #BoardWinMesSet
mtctr r3

lis r3, 0x801d
ori r3, r3, 0x421c #String location
li r4, 7 #String ID, 7
bctrl

mr r3, r30