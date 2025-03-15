#To be inserted at 80066344
#Backup r3 to r15
mr r15, r3

#Check if the player got there while Mini. If they did, don't show the skeleton key popup, Mini Pipe functions as normal.
cmpwi r0, 1
beq end

#Check if player has Skeleton Key status effect. If they do, don't show skeleton key popup, and let them pass the minipipe
#Load base status effect struct
lis r14, 0x8018 
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r3, 0x8018 
ori r3, r3, 0xFD02
lbz r3, 0 (r3)

mulli r3, r3, 9

#Add curplayer index to status effect struct address
add r14, r14, r3

#Check if player has skeleton key status effect
lbz r3, 1 (r14)
cmpwi r3, 1
beq can_pass

#Check if player owns a Skeleton Key
# Get current player ID, multiply by 0x30 (player struct size)
  lis r14, 0x8018
  ori r14, r14, 0xFD02
  lbz r14, 0 (r14)
  mulli r14, r14, 0x30

# Get current player struct
  lis r3, 0x8018
  ori r3, r3, 0xFC38
  add r3, r3, r14  

lbz r14, 5 (r3)
cmpwi r14, 0x19 #Skeleton Key ID
beq has_key

lbz r14, 6 (r3)
cmpwi r14, 0x19 #Skeleton Key ID
beq has_key

lbz r14, 7 (r3)
cmpwi r14, 0x19 #Skeleton Key ID
beq has_key

b end

has_key:
#If the player owns a skeleton key, show Skeleton Key use Y/N message

lis r3, 0x8006
ori r3, r3, 0x7B98 #BoardPlayerIdleSet, makes player stop running
mtctr r3
# Get current player ID
  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3)
bctrl


lis r14, 0x8013
ori r14, r14, 0x0642
li r3, 0x21
sth r3, 0 (r14) #Hotswap Bob-Omb portrait with Skeleton Key portrait

lis r14, 0x8007
ori r14, r14, 0x0390 #Create choicebox
mtctr r14
li r3, 1
lis r4, 0x0037
ori r4, r4, 0x007C #Skeleton Key message index
li r5, 1 #Skeleton Key portrait
bctrl

#After creating the choicebox, set the default choice to 0 (First option)
lis r3, 0x801D
ori r3, r3, 0x3F80 #Default choice address, halfword
li r4, 0
sth r4, 0 (r3)

lis r3, 0x8007
ori r3, r3, 0x0a00 #BoardWinPlayerSet
mtctr r3
# Get current player ID
  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3)
bctrl

#CPU behavior: If the player is COM-controlled, press A
# Get current player, multiply by 0x30 (player struct size)
  lis r14, 0x8018
  ori r14, r14, 0xFD02
  lbz r14, 0 (r14)
  mulli r14, r14, 0x30

# Get current player struct
  lis r3, 0x8018
  ori r3, r3, 0xFC38
  add r3, r3, r14

# Get player struct first byte
  lbz r3, 0 (r3)

rlwinm r3, r3, 27, 31, 31
rlwinm r3, r3, 0, 24, 31 #Decode COM flag

cmpwi r3, 1 #If TRUE, the player is CPU-controlled, so execute CPU behavior
bne not_cpu_prompt

#First, check which overlay is it
lis r3, 0x801D
ori r3, r3, 0x3CE0
lwz r3, 0 (r3)

cmpwi r3, 0x5E
bne skip_bowser_check

#Special check for Bowser board
# Get current player struct
  lis r3, 0x8018
  ori r3, r3, 0xFC38
  add r3, r3, r14

# Get current player space
  lbz r3, 0xD (r3)
  
  cmpwi r3, 0x66
  bne skip_bowser_check
  
# If player is on space 0x66, check if the Star is on space 0x60. If it is, say no to the key prompt

  lis r3, 0x8007
  ori r3, r3, 0x59A4 #Check Star location
  mtctr r3
  bctrl
  
  cmpwi r3, 0x60
  beq refuse_key_cpu
  
  
b skip_bowser_check

refuse_key_cpu:
  lis r3, 0x8007
  ori r3, r3, 0x0B68 #ComKeySet
  mtctr r3
  bctrl 

  lis r3, 0x8007
  ori r3, r3, 0x0D7C #ComKeyFuncSet
  mtctr r3
  lis r3, 0x8007
  ori r3, r3, 0x13B0 #ExecComKeyDown
  bctrl 

b not_cpu_prompt


skip_bowser_check:
lis r3, 0x8007
ori r3, r3, 0x0B68 #ComKeySet
mtctr r3
bctrl 

lis r3, 0x8007
ori r3, r3, 0x0D7C #ComKeyFuncSet
mtctr r3
lis r3, 0x8007
ori r3, r3, 0x1290 #ExecComKeyLeft
bctrl 

not_cpu_prompt:

lis r14, 0x8007
ori r14, r14, 0x06e8 #Waitmessage
mtctr r14
bctrl

lis r14, 0x8007
ori r14, r14, 0x0738 #Killmessage
mtctr r14
bctrl

lis r14, 0x8007
ori r14, r14, 0x0378 #Get choice index
mtctr r14
bctrl

cmpwi r3, 0
beq use_key

cmpwi r3, 2
beq use_map

lis r14, 0x8007
ori r14, r14, 0x0530 #Create messagebox
mtctr r14
li r3, 1
lis r4, 0x0037
ori r4, r4, 0x0081 #Skeleton Key no use message
li r5, 1 #Skeleton Key portrait
bctrl

lis r3, 0x8007
ori r3, r3, 0x0a00 #BoardWinPlayerSet
mtctr r3
# Get current player ID
  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3)
bctrl

lis r14, 0x8007
ori r14, r14, 0x081C #Enable boardkeywait, so the message is displayed until player presses A
mtctr r14
bctrl

#CPU behavior: If the player is COM-controlled, press A
# Get current player, multiply by 0x30 (player struct size)
  lis r14, 0x8018
  ori r14, r14, 0xFD02
  lbz r14, 0 (r14)
  mulli r14, r14, 0x30

# Get current player struct
  lis r3, 0x8018
  ori r3, r3, 0xFC38
  add r3, r3, r14

# Get player struct first byte
  lbz r3, 0 (r3)

rlwinm r3, r3, 27, 31, 31
rlwinm r3, r3, 0, 24, 31 #Decode COM flag

cmpwi r3, 1 #If TRUE, the player is CPU-controlled, so execute CPU behavior
bne not_cpu_keep

#Sleep for 1 second
   li r3, 60
   lis r14, 0x8000
   ori r14, r14, 0xCF0C
   mtctr r14
   li r14, 0
   bctrl

#Kill the Window early
   lis r14, 0x8007
   ori r14, r14, 0x0738
   mtctr r14
   li r14, 0
   bctrl


not_cpu_keep:

lis r14, 0x8007
ori r14, r14, 0x06e8 #Waitmessage
mtctr r14
bctrl

lis r14, 0x8007
ori r14, r14, 0x0738 #Killmessage
mtctr r14
bctrl

b end_key

use_key:

#Activate temporary "Can pass minipipes" status effect, which will disappear as soon as the player moves 1 space
#Load base status effect struct
lis r14, 0x8018
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

#Add curplayer index to status effect struct address
add r14, r14, r15

li r15, 1 #Skeleton Key status effect enabled
stb r15, 1 (r14)


lis r14, 0x8007
ori r14, r14, 0x0530 #Create messagebox
mtctr r14
li r3, 1
lis r4, 0x0037
ori r4, r4, 0x007D #Skeleton Key "Ok, I'll open it. I'll miss you..." message
li r5, 1 #Skeleton Key portrait
bctrl

lis r3, 0x8007
ori r3, r3, 0x0a00 #BoardWinPlayerSet
mtctr r3
# Get current player ID
  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3)
bctrl

lis r14, 0x8007
ori r14, r14, 0x081C #Enable boardkeywait, so the message is displayed until player presses A
mtctr r14
bctrl

#CPU behavior: If the player is COM-controlled, press A
# Get current player, multiply by 0x30 (player struct size)
  lis r14, 0x8018
  ori r14, r14, 0xFD02
  lbz r14, 0 (r14)
  mulli r14, r14, 0x30

# Get current player struct
  lis r3, 0x8018
  ori r3, r3, 0xFC38
  add r3, r3, r14

# Get player struct first byte
  lbz r3, 0 (r3)

rlwinm r3, r3, 27, 31, 31
rlwinm r3, r3, 0, 24, 31 #Decode COM flag

cmpwi r3, 1 #If TRUE, the player is CPU-controlled, so execute CPU behavior
bne not_cpu_usekey


#Sleep for 1 second
   li r3, 60
   lis r14, 0x8000
   ori r14, r14, 0xCF0C
   mtctr r14
   li r14, 0
   bctrl

#Kill the Window early
   lis r14, 0x8007
   ori r14, r14, 0x0738
   mtctr r14
   li r14, 0
   bctrl

not_cpu_usekey:

lis r14, 0x8007
ori r14, r14, 0x06e8 #Waitmessage
mtctr r14
bctrl

lis r14, 0x8007
ori r14, r14, 0x0738 #Killmessage
mtctr r14
bctrl

#Delete the key
lis r3, 0x8006
ori r3, r3, 0x2C24 #BoardPlayerItemRemove
mtctr r3

# Get current player ID
  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3)

# Get skeleton key item num
lis r4, 0x8018
ori r4, r4, 0xFC38
mulli r14, r3, 0x30
add r4, r4, r14

mr r3, r15 #Restore r3 backup since r15 will be used

li r15, 0 #Iterator
key_to_delete_loop:
lbz r14, 5 (r4) #Currently iterated key ID
cmpwi r14, 0x19 #Skeleton Key ID
beq exit_loop

addi r15, r15, 1
addi r4, r4, 1
cmpwi r15, 3
bge exit_loop #Failsafe

b key_to_delete_loop

exit_loop:
mr r4, r15 #Skeleton key item num
mr r15, r3 #Put r3 backup back on r15

# Get current player ID
  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3)

bctrl

can_pass:
li r0, 1 #value required to be 1 for player to be allowed into the minipipe

end_key:
lis r14, 0x8013
ori r14, r14, 0x0642
li r3, 0x10
sth r3, 0 (r14) #Restore Bob-Omb portrait
b end

use_map:
lis r3, 0x8007
ori r3, r3, 0x29A4 #BoardViewOverheadExec
mtctr r3
# Get current player ID
  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3)
bctrl
lis r14, 0x8013
ori r14, r14, 0x0642
li r3, 0x10
sth r3, 0 (r14) #Restore Bob-Omb portrait

end:

mr r3, r15 #Restore r3
li r14, 0
li r15, 0 #Restore from hook
cmpwi r0, 1