#To be inserted at 8008f7c0
# Get current player, multiply by 0x30 (player struct size)
  lis r15, 0x8018
  ori r15, r15, 0xFD02
  lbz r16, 0 (r15) #Current player ID is stored on r16
  mulli r15, r16, 0x30 

#Check which item was used
lis r14, 0x801D
ori r14, r14, 0x40CB
lbz r14, 0 (r14)

cmpwi r14, 0x13
beq steal_item

cmpwi r14, 0x14
beq super_pipe

cmpwi r14, 0x17
beq steal_item

cmpwi r14, 0x0E
beq check_bowser_phone

cmpwi r14, 0x1D
beq dont_target_self

cmpwi r14, 0x20
beq dont_target_self

cmpwi r14, 0x1E
beq only_target_self

cmpwi r14, 0x1F
beq slow_shroom

cmpwi r14, 0x23
beq only_target_self

b end

check_bowser_phone:
# If self has no coins, only target self, otherwise, target other players
# Get current player struct
   lis r14, 0x8018
   ori r14, r14, 0xFC38
   add r14, r14, r15

   lha r14, 0x1C (r14) #Load current player's coin amount

   cmpwi r14, 0
   beq only_target_self

b dont_target_self

slow_shroom:
# Iterator and choice ID: This determines which option the AI will pick
li r3, 0

# Get current player struct
   lis r14, 0x8018
   ori r14, r14, 0xFC38
   add r14, r14, r15

# Load spacedata initial address into r15
   lis r15, 0x8019
   ori r15, r15, 0xDA10

# Get current player space
  lbz r21, 0xD (r14)

# Get the space's address
  mulli r21, r21, 0x38
  subi r21, r21, 0x38 #Current space is 0x38 behind
  add r21, r21, r15

slow_shroom_loop:
# Get the next space's ID
  lha r21, 0x2C (r21)

# Get the next space's address
  mulli r21, r21, 0x38
  subi r21, r21, 0x38 #Current space is 0x38 behind
  add r21, r21, r15

# Get the space's type
  lbz r16, 0x29 (r21)

#Item, Battle, Chance Time, Happening and Star are considered desirable spaces to land on. If the spacetype is any of these, pick that one.
  cmpwi r16, 4
  beq end

  cmpwi r16, 5
  beq end
 
  cmpwi r16, 6
  beq end
  
  cmpwi r16, 7
  beq end

  cmpwi r16, 8
  beq end

addi r3, r3, 1
cmpwi r3, 4
bge end

b slow_shroom_loop

b end

super_pipe:  #Get Super Pipe Target

lis r3, 0x8007
ori r3, r3, 0x1c3b
lbz r3, 0 (r3)

b end

dont_target_self:

lis r14, 0x8018
ori r14, r14, 0xFD02
lbz r14, 0 (r14) #Load current player index

non_self_loop:

lis r3, 0x8005
ori r3, r3, 0xFB40
mtctr r3
li r3, 4 #Get Random Target from 00 to 03
bctrl

cmpw r3, r14
beq non_self_loop #Keep looping until it has targeted someone that is not self

b end


only_target_self:

lis r3, 0x8018
ori r3, r3, 0xFD02
lbz r3, 0 (r3) #Load current player index

b end


steal_item: #Logic for Plunder Chest and Barter Box targeting. 

#THEFT Priority goes as follow
#1. Magic Lamp owners:

lis r14, 0x8018
ori r14, r14, 0xFC38 #First Player struct

li r3, 0 #Iteration
li r15, 0 #Curr target (NOT the same as iteration, since the window only has 3 options!)

steal_target_loop_lamp:

cmpw r15, r16 #If self, skip
beq steal_target_loop_lamp_increment

lbz r21, 5 (r14)
  
  cmpwi r21, 0xC
  beq end

lbz r21, 6 (r14)
  
  cmpwi r21, 0xC
  beq end

lbz r21, 7 (r14)
  
  cmpwi r21, 0xC
  beq end

addi r3, r3, 1

steal_target_loop_lamp_increment:

addi r15, r15, 1
addi r14, r14, 0x30

cmpwi r3, 3
bge first_gaddlight_steal

b steal_target_loop_lamp

# 2. Gaddlight First Placers
first_gaddlight_steal:

lis r14, 0x8018
ori r14, r14, 0xFC38 #First Player struct

li r3, 0 #Iteration
li r15, 0 #Curr target (NOT the same as iteration, since the window only has 3 options!)

steal_target_1st_gaddlight:

cmpw r15, r16 #If self, skip
beq steal_target_1st_gaddlight_increment

lbz r21, 9 (r14) #player placement byte
andi. r21, r21, 0x60
srwi r21, r21, 5 #Get player placement

cmpwi r21, 0
bne not_first

#Prioritize robbing the 1ST Place Player of their Gaddlight

lbz r21, 5 (r14)

  cmpwi r21, 0x8
  beq end

lbz r21, 6 (r14)

  cmpwi r21, 0x8
  beq end

lbz r21, 7 (r14)

  cmpwi r21, 0x8
  beq end

not_first:
addi r3, r3, 1

steal_target_1st_gaddlight_increment:

addi r15, r15, 1
addi r14, r14, 0x30

cmpwi r3, 3
bge rare_steal_check

b steal_target_1st_gaddlight

#3. Rare Item owners:

rare_steal_check:
lis r14, 0x8018
ori r14, r14, 0xFC38 #First Player struct

li r3, 0 #Iteration
li r15, 0 #Curr target (NOT the same as iteration, since the window only has 3 options!)

steal_target_loop_rare:

cmpw r15, r16 #If self, skip
beq steal_target_loop_rare_increment

lbz r21, 5 (r14)
  
  cmpwi r21, 0x11
  beq end

  cmpwi r21, 0x13
  beq end

  cmpwi r21, 0x14
  beq end

  cmpwi r21, 0x15
  beq end

lbz r21, 6 (r14)
  
  cmpwi r21, 0x11
  beq end

  cmpwi r21, 0x13
  beq end

  cmpwi r21, 0x14
  beq end

  cmpwi r21, 0x15
  beq end

lbz r21, 7 (r14)
  
  cmpwi r21, 0x11
  beq end

  cmpwi r21, 0x13
  beq end

  cmpwi r21, 0x14
  beq end

  cmpwi r21, 0x15
  beq end

addi r3, r3, 1

steal_target_loop_rare_increment:

addi r15, r15, 1
addi r14, r14, 0x30

cmpwi r3, 3
bge bag_steal_check

b steal_target_loop_rare

# 3. Item Bag owners:

bag_steal_check:
lis r14, 0x8018
ori r14, r14, 0xFC38 #First Player struct

li r3, 0 #Iteration
li r15, 0 #Curr target (NOT the same as iteration, since the window only has 3 options!)

steal_target_loop_bag:

cmpw r15, r16 #If self, skip
beq steal_target_loop_bag_increment

lbz r21, 5 (r14)
  
  cmpwi r21, 0xD
  beq end

lbz r21, 6 (r14)
  
  cmpwi r21, 0xD
  beq end

lbz r21, 7 (r14)
  
  cmpwi r21, 0xD
  beq end

addi r3, r3, 1

steal_target_loop_bag_increment:

addi r15, r15, 1
addi r14, r14, 0x30

cmpwi r3, 3
bge booie_steal

b steal_target_loop_bag

# 4. Booie Ball owners:

booie_steal:
lis r14, 0x8018
ori r14, r14, 0xFC38 #First Player struct

li r3, 0 #Iteration
li r15, 0 #Curr target (NOT the same as iteration, since the window only has 3 options!)

steal_target_loop_booie:

cmpw r15, r16 #If self, skip
beq booie_increment

lbz r21, 5 (r14)

  cmpwi r21, 0xB
  beq end

lbz r21, 6 (r14)
 
  cmpwi r21, 0xB
  beq end 

lbz r21, 7 (r14)
 
  cmpwi r21, 0xB
  beq end
 
addi r3, r3, 1

booie_increment:

addi r15, r15, 1
addi r14, r14, 0x30

cmpwi r3, 3
bge gadd_steal

b steal_target_loop_booie


gadd_steal:
lis r14, 0x8018
ori r14, r14, 0xFC38 #First Player struct

li r3, 0 #Iteration
li r15, 0 #Curr target (NOT the same as iteration, since the window only has 3 options!)

steal_target_loop_gadd:

cmpw r15, r16 #If self, skip
beq gadd_increment

lbz r21, 5 (r14)

  cmpwi r21, 0x10
  beq end

  cmpwi r21, 0x8
  beq end

lbz r21, 6 (r14)
 
  cmpwi r21, 0x10
  beq end 

  cmpwi r21, 0x8
  beq end

lbz r21, 7 (r14)
 
  cmpwi r21, 0x10
  beq end

  cmpwi r21, 0x8
  beq end
 
addi r3, r3, 1

gadd_increment:

addi r15, r15, 1
addi r14, r14, 0x30

cmpwi r3, 3
bge chest_steal

b steal_target_loop_gadd

#5. Plunder Chest, Reverse Shroom and Swap Card owners:

chest_steal:
lis r14, 0x8018
ori r14, r14, 0xFC38 #First Player struct

li r3, 0 #Iteration
li r15, 0 #Curr target (NOT the same as iteration, since the window only has 3 options!)

steal_target_loop_stealbox:

cmpw r15, r16 #If self, skip
beq steal_target_loop_stealbox_increment

lbz r21, 5 (r14)
  
  cmpwi r21, 0x6
  beq end

  cmpwi r21, 0x17
  beq end

  cmpwi r21, 0x23
  beq end

lbz r21, 6 (r14)
  
  cmpwi r21, 0x6
  beq end

  cmpwi r21, 0x17
  beq end

  cmpwi r21, 0x23
  beq end

lbz r21, 7 (r14)
  
  cmpwi r21, 0x6
  beq end

  cmpwi r21, 0x17
  beq end

  cmpwi r21, 0x23
  beq end

addi r3, r3, 1

steal_target_loop_stealbox_increment:

addi r15, r15, 1
addi r14, r14, 0x30

cmpwi r3, 3
bge supershroom_steal

b steal_target_loop_stealbox


#6. Super Mega Shroom and Reverse Shroom owners

supershroom_steal:
lis r14, 0x8018
ori r14, r14, 0xFC38 #First Player struct

li r3, 0 #Iteration
li r15, 0 #Curr target (NOT the same as iteration, since the window only has 3 options!)

steal_target_loop_supermega:

cmpw r15, r16 #If self, skip
beq steal_target_loop_supermega_increment

lbz r21, 5 (r14)
  
  cmpwi r21, 0x23
  beq end

  cmpwi r21, 0x16
  beq end

lbz r21, 6 (r14)
  
  cmpwi r21, 0x23
  beq end

lbz r21, 7 (r14)
  
  cmpwi r21, 0x23
  beq end

   cmpwi r21, 0x16
  beq end

lbz r21, 5 (r14)
  
  cmpwi r21, 0x3
  beq end

lbz r21, 6 (r14)
  
  cmpwi r21, 0x3
  beq end

lbz r21, 7 (r14)
  
  cmpwi r21, 0x3
  beq end

addi r3, r3, 1

steal_target_loop_supermega_increment:

addi r15, r15, 1
addi r14, r14, 0x30

cmpwi r3, 3
bge end

b steal_target_loop_supermega

end:
mr r21, r3
li r14, 0
li r15, 0
li r16, 0




