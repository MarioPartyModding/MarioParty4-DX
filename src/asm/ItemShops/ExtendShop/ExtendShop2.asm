#To be inserted at 800780b0
#First, hotswap the value for type 01 window Y-Position
lis r4, 0x42B5
ori r4, r4, 0 #Float value for Y-Position

lis r5, 0x8011
ori r5, r5, 0xDEA4 #Address where type 1 window Y-Position value is stored

stw r4, 0 (r5)

lis r4, 0x0037
ori r4, r4, 0x0083 #Extended Items message ID. Will be the message ID to show.

mr r5, r26