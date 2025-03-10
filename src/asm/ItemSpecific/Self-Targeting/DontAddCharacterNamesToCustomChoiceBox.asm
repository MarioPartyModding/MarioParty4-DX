#To be inserted at 8008f6c0
#Load itemprev
lis r14, 0x801D
ori r14, r14, 0x3F44
lbz r14, 0 (r14)

cmpwi r14, 0x1F
beq skip_insertmess
lis r14, 0x8004
ori r14, r14, 0x630C #Only insert the chara names if not customdice
mtctr r14
bctrl


skip_insertmess:
li r14, 0