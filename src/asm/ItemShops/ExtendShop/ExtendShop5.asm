#To be inserted at 800781ac
#Hotswap Y-Position back to its original value
lis r29, 0x4300
ori r29, r29, 0 #Float value for Y-Position

lis r4, 0x8011
ori r4, r4, 0xDEA4 #Address where type 1 window Y-Position value is stored

stw r29, 0 (r4)

#Original instruction
mr r29, r3