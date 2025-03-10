#To be inserted at 80066d58
#Restore reverse shroom array to normal

lis r14, 0x8007
ori r14, r14, 0x1c30 #Reverse array

li r15, 0
sth r15, 0 (r14) #Junction count

li r15, 0xFF
sth r15, 2 (r14) #First destination

li r15, 0xFF
sth r15, 4 (r14) #Second destination

li r15, 0xFF
sth r15, 6 (r14) #Third destination

#Original instruction
lwz r0, 0x0244 (sp)
li r14, 0
li r15, 0