#To be inserted at 8008d6e4
# MP4 ITEM EXPANSION MOD GECKO CODE 5 - Name Window Size
# Loads the message ID of the custom item for the name window to be size adjusted accordingly.
# The value of r28 the item ID. It's higher than 0xD for all custom items.
cmpwi r28, 0xD
ble is_not_custom_item

mr r5, r28
subi r5, r5, 0xE
mulli r5, r5, 4 # Multiply the result by 4 between each item ID.

addi r5, r5, 0x22 # ID of the first custom name string

addis r5, r5, 0x37 # Board_e.dat messgroup 0x37

is_not_custom_item:
# Original instruction
crclr 6 