#To be inserted at 80097188
#Original instruction
lhax r4, r4, r0

#For Plunder Chest: 

#Check which item was used
lis r14, 0x801D
ori r14, r14, 0x3F44
lbz r14, 0 (r14)

cmpwi r14, 0x17 #Plunder Chest ID
bne end

#Get plunder target ID, mulli by 0x30
lis r15, 0x8007
ori r15, r15, 0x1c3b
lbz r15, 0 (r15)
mulli r15, r15, 0x30

#Get struct
lis r14, 0x8018
ori r14, r14, 0xfc38
add r14, r14, r15

addi r14, r14, 5 #Target's first item

lbz r15, 0 (r14) #Load target's first item
li r3, 0 #Current item location

cmpw r15, r4
beq delete_item

addi r14, r14, 1

lbz r15, 0 (r14) #Load target's second item
li r3, 1 #Current item location

cmpw r15, r4
beq delete_item

addi r14, r14, 1

lbz r15, 0 (r14) #Load target's third item
li r3, 2 #Current item location

cmpw r15, r4
beq delete_item

b end

delete_item:
#r3 is the player who loses an item, r4 is the item num they lose
mr r15, r4 #Move gain item to r15
mr r4, r3 #Move lost_item index to r4

lis r3, 0x8007
ori r3, r3, 0x1c3b
lbz r3, 0 (r3) #Plunder target

#Execute item loss function
   lis r14, 0x8006
   ori r14, r14, 0x2C24
   mtctr r14
   bctrl

#r3 is the player who earns an item, r4 is the item ID they earn

  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3) #Current player

mr r4, r15 #Move gain item back to r4


end:
li r14, 0
li r15, 0