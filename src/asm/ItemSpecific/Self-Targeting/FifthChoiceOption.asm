#To be inserted at 8008f8b0
cmpwi r0, 0
bge skip_extra_option

#If r0 is negative, the fifth option was chosen. (ID 04)
li r22, 4

skip_extra_option:
mr r3, r29