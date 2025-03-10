#To be inserted at 80079eb0
lis r3, 0x8007
ori r3, r3, 0x21a8 #New place to put the cursor float on

lis r4, 0x433E
ori r4, r4, 0 #X-Position float for cursor is always 433E0000

stw r4, 0 (r3)

lfs f0, 0 (r3)