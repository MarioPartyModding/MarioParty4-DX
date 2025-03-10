#To be inserted at 80079780
# Moves the shop ODDS to a different offset

lis r3, 0x8007
ori r3, r3, 0x1F30


lbzx r25, r3, r0
