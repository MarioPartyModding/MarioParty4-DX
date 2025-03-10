#To be inserted at 8008d854
# MP4 ITEM EXPANSION MOD GECKO CODE 2 - Model Loading Code
# This code changes the directory/mainFS file from where the item models are loaded if it exceeds Item Bag.
# The value of r0 is 4 * item ID. It's higher than 0x34 for all custom items.
cmpwi r0, 0x34
ble is_not_custom_item

li r3, 4
divw r3, r0, r3 # Get Item ID
subi r3, r3, 0xE 
mulli r3, r3, 2 # Substract 0xE to that item ID and multiply the result by 2, this will be used to tell which file to load

addi r3, r3, 0xA4 # ID of the first custom MDL. It goes as follow: 0xA4 = Custom Item 1, 0xA6 = Custom Item 2, 0xA8 = Custom Item 3...

addis r3, r3, 7 # Mainfs directory 7, board.bin

is_not_custom_item:
# Original instruction
li r5, 0