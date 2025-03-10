#To be inserted at 8008d6cc
# MP4 ITEM EXPANSION MOD GECKO CODE 4 - Description Text Code
# This code changes the messgroup from where the item descriptions names are loaded if it exceeds Item Bag.
# The value of r28 the item ID. It's higher than 0xD for all custom items.
cmpwi r28, 0xD
ble is_not_custom_item

mr r4, r28
subi r4, r4, 0xE
mulli r4, r4, 4 # Multiply the result by 4 between each item ID.

addi r4, r4, 0x23 # ID of the first custom description string

addis r4, r4, 0x37 # Board_e.dat messgroup 0x37

# Value on r23 should be this too
mr r23, r4

# Don't do original instruction if it's a custom item
b end

is_not_custom_item:
# Original instruction
mr r4, r22

end: