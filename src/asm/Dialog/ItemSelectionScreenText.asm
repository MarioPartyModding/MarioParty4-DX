#To be inserted at 8008d778
# MP4 ITEM EXPANSION MOD GECKO CODE 3 - Item Selection Screen Text Code
# This code changes the messgroup from where the item selection names are loaded if it exceeds Item Bag.
# The value of r28 the item ID. It's higher than 0xD for all custom items.
cmpwi r28, 0xD
ble is_not_custom_item

mr r4, r28
subi r4, r4, 0xE
mulli r4, r4, 4 # Multiply the result by 4 between each item ID.

addi r4, r4, 0x14 # ID of the first custom description string - 14 (original instruction will add 14 to it)

addis r4, r4, 0x37 # Board_e.dat messgroup 0x37

is_not_custom_item:
# Original instruction
addi r4, r4, 14
