#To be inserted at 80079EC0
lis r3, 0x8007
ori r3, r3, 0x21a8 #New place to put the cursor float on

li r4, 0x4310 #Y-Position base float 

sth r4, 0 (r3)

lfs f0, 0 (r3)