#To be inserted at 80085fe0
#Apply any DiceRoll-modifying status effects
#PRIORITY ORDER is: Speed Dice, Slow Dice, Poison Shroom

#Load base status effect struct
lis r5, 0x8018
ori r5, r5, 0xFD62

#Load curplayer index, multiply by 9
lis r3, 0x8018 
ori r3, r3, 0xFD02
lbz r3, 0 (r3)

mulli r3, r3, 9

#Add curplayer index to status effect struct address
add r5, r5, r3


#Check if has double dip

lbz r3, 8 (r5)
cmpwi r3, 0
ble skip_doubledip

lis r3, 0x801D
ori r3, r3, 0x3F44 #Change item_prev to 0xFF
li r5, 0xFF
stb r5, 0 (r3)


skip_doubledip:
li r0, 0