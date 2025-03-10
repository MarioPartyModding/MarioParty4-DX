#To be inserted at 80078ce8
# MP4 ITEM EXPANSION MOD GECKO CODE 8 - Model Loading Code (Shop)
# This code changes the directory/mainFS file from where the item models are loaded if it exceeds Item Bag.
# The value of r0 is 4 * item ID. It's higher than 0x34 for all custom items.
cmpwi r28, 0x5 
beq is_pipe

cmpwi r28, 0x7 
beq is_spark

cmpwi r28, 0xD
ble end

mr r3, r28 # Get item ID

cmpwi r28, 0x17 
beq is_chest

subi r3, r3, 0xE
mulli r3, r3, 2 # Subtract 0xE and multiply the result by 2, this will be used to tell which file to load

addi r3, r3, 0xA4 # ID of the first custom MDL. It goes as follow: 0xA4 = Custom Item 1, 0xA6 = Custom Item 2, 0xA8 = Custom Item 3...

addis r3, r3, 7 # Mainfs directory 7, board.bin

b end

is_pipe:
lis r3, 7 
ori r3, r3, 0xCF # Load alt model with a different translate value
b end

is_spark:
lis r3, 7 
ori r3, r3, 221 # Load alt model with a different translate value
b end

is_chest:
lis r3, 7 
ori r3, r3, 222 # Load alt model with a different translate value
b end

end:
# Original instruction
li r5, 0