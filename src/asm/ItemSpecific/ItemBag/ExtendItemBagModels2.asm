#To be inserted at 80096e10
# MP4 ITEM EXPANSION MOD GECKO CODE - Model Loading Code (Item Bag)
# This code changes the directory/mainFS file from where the item models are loaded if it exceeds Item Bag.
cmpwi r5, 0xD
ble is_not_custom_item

mr r3, r5 # Get item ID
subi r3, r3, 0xE
mulli r3, r3, 2 # Subtract 0xE and multiply the result by 2, this will be used to tell which file to load

addi r3, r3, 0xA4 # ID of the first custom MDL. It goes as follow: 0xA4 = Custom Item 1, 0xA6 = Custom Item 2, 0xA8 = Custom Item 3...

addis r3, r3, 7 # Mainfs directory 7, board.bin

is_not_custom_item:
# Original instruction
li r5, 0