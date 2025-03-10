#To be inserted at 8007810c
# Moves the shop prices to a different offset

lis r0, 0x8007
ori r0, r0, 0x1F08
add r3, r0, r4

