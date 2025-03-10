#To be inserted at 8007980c
cmpwi r28, 0
bne not_shroom

lis r30, 0x8007
ori r30, r30, 0x21aC 
lbz r30, 0 (r30) #Get random shroom byte (0: Normal, 1: Gold)

cmpwi r30, 0
bne gold
li r30, 0xF #Red Shroom ID
b end

gold:
li r30, 0x10 #Golden Shroom ID
b end
not_shroom: 

cmpwi r28, 1
bne end
li r30, 0x19 #Hardcode the second item to ALWAYS be a Skeleton Key

end:

add r3, r0, r4