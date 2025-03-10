#To be inserted at 800816CC
lis r5, 0x8008
ori r5, r5, 0x0eb8

cmpw r0, r5
bne not_warpspace

stwu sp, -0x0020 (sp)

b end

not_warpspace:
blr 

end: