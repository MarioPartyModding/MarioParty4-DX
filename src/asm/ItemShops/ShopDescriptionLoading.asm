#To be inserted at 80078d0c
# MP4 ITEM EXPANSION MOD GECKO CODE 7 - Shop Description Loading Code
# This code changes the directory/mainFS file from where the item models are loaded if it exceeds Item Bag.
# The value of r3 is the item ID
cmpwi r28, 0xD
ble is_not_custom_item

mr r4, r28
subi r4, r4, 0xE 
mulli r4, r4, 4 # Substract 0xE to that item ID and multiply the result by 4, this will be used to tell which file to load

addi r4, r4, 0x23 # ID of the first custom description

addis r4, r4, 0x37 # Messgroup 0x37

is_not_custom_item:
# Original instruction
lha r3, 0x0006 (r29)