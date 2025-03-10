#To be inserted at 8008ef4c
# MP4 ITEM EXPANSION MOD GECKO CODE - Custom Item Functions

#First, reduce remaining doubledip turns by 1 if the player has doubledip
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


#Check if has double dip

lbz r15, 8 (r14)
cmpwi r15, 0
ble skip_doubledip

subi r15, r15, 1
stb r15, 8 (r14) #Substract 1 to the remaining doubledip turns, put it back on the respective address

skip_doubledip:
li r14, 0
li r15, 0

cmpwi r4, 0x04
beq is_cancel_effects

cmpwi r4, 0x8
beq is_cancel_effects

cmpwi r4, 0xC
beq is_cancel_effects

# The value of r4 is 4 * item ID. It's higher than 0x34 for all custom items.
cmpwi r4, 0x34
ble is_not_custom_item

# If the current item is a custom item, don't do the vanilla HuProcess to load a function, instead, use custom funcs

cmpwi r4, 0x38 # If item ID is 0x0E * 4
beq bowser_phone_func

cmpwi r4, 0x3C # If item ID is 0x0F * 4
beq mushroom_func

cmpwi r4, 0x40 # If item ID is 0x10 * 4
beq golden_mushroom_func

cmpwi r4, 0x44 # If item ID is 0x11 * 4
beq hidden_block_card_func

cmpwi r4, 0x48 # If item ID is 0x12 * 4
beq cellullar_shopper_func

cmpwi r4, 0x4C # If item ID is 0x13 * 4
beq swap_card_func

cmpwi r4, 0x50 # If item ID is 0x14 * 4
beq pipe_func

cmpwi r4, 0x54 # If item ID is 0x15 * 4
beq chance_func

cmpwi r4, 0x58 # If item ID is 0x16 * 4
beq watch_func

cmpwi r4, 0x5C # If item ID is 0x17 * 4
beq chest_func

cmpwi r4, 0x60 # If item ID is 0x18 * 4
beq swap_card_func

cmpwi r4, 0x64 # If item ID is 0x19 * 4
beq key_func

cmpwi r4, 0x68 # If item ID is 0x1a * 4
beq warp_func

cmpwi r4, 0x6C # If item ID is 0x1b * 4
beq shyguy_func

cmpwi r4, 0x70 # If item ID is 0x1c * 4
beq plus_func

cmpwi r4, 0x74 # If item ID is 0x1d * 4
beq minus_func

cmpwi r4, 0x78 # If item ID is 0x1e * 4
beq speed_func

cmpwi r4, 0x7c # If item ID is 0x1f * 4
beq slow_func

cmpwi r4, 0x80 # If item ID is 0x20 * 4
beq poison_func

cmpwi r4, 0x84 # If item ID is 0x21 * 4
beq poison_all_func

cmpwi r4, 0x88 # If item ID is 0x22 * 4
beq double_item_func

cmpwi r4, 0x8c # If item ID is 0x23 * 4
beq reverse_func

shyguy_func:
#Set special item used flag
   lis r14, 0x8007
   ori r14, r14, 0x1CA0
   li r15, 2
   stb r15, 0 (r14)
   li r15, 0

#Save the current camera for when the event ends
   lis r14, 0x8005
   ori r14, r14, 0xD1AC
   mtctr r14
   li r14, 0
   bctrl

#Set ItemUI status (make coins more visible)
   li r3, 3
   lis r14, 0x8008
   ori r14, r14, 0xC13C
   mtctr r14
   li r14, 0
   bctrl

#Execute warp space function. Custom stuff is handled within the func.
   lis r14, 0x8008
   ori r14, r14, 0x0D54
   mtctr r14
   li r14, 0
   bctrl

#Set special item used flag
   lis r14, 0x8007
   ori r14, r14, 0x1CA0
   li r15, 1
   stb r15, 0 (r14)
   li r15, 0

#Restore the camera
   lis r14, 0x8005
   ori r14, r14, 0xD1E8
   mtctr r14
   li r14, 0
   bctrl

b exit_custom_items

chance_func:
#Set special item used flag
   lis r14, 0x8007
   ori r14, r14, 0x1CA0
   li r15, 2
   stb r15, 0 (r14)
   li r15, 0

#Set ItemUI status (make coins more visible)
   li r3, 3
   lis r14, 0x8008
   ori r14, r14, 0xC13C
   mtctr r14
   li r14, 0
   bctrl

#Get current player
  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3) #Current player

#Do the Hit or Miss Chance Game
   lis r14, 0x8009
   ori r14, r14, 0xD148
   mtctr r14
   li r14, 0
   bctrl
b exit_custom_items

bowser_phone_func:
#Set special item used flag
   lis r14, 0x8007
   ori r14, r14, 0x1CA0
   li r15, 2
   stb r15, 0 (r14)
   li r15, 0

#Save the current camera for when the event ends
   lis r14, 0x8005
   ori r14, r14, 0xD1AC
   mtctr r14
   li r14, 0
   bctrl

#Set ItemUI status (make coins more visible)
   li r3, 3
   lis r14, 0x8008
   ori r14, r14, 0xC13C
   mtctr r14
   li r14, 0
   bctrl

# Make the Item Target window appear. Whoever the player picks will get attacked by Bowser.
   lis r14, 0x8008
   ori r14, r14, 0xF560
   mtctr r14
   li r14, 0
   bctrl

# Temporally store the target ID on r15 so it can be used for the Bowser summon too
   mr r15, r3

# Focus the camera on the targeted player
   lis r14, 0x8005
   ori r14, r14, 0xD834
   mtctr r14
   li r14, 0
   bctrl

# Summon Bowser
   mr r3, r15
   li r15, 0
   lis r14, 0x8009
   ori r14, r14, 0x75AC
   mtctr r14
   li r14, 0
   bctrl

#Set special item used flag
   lis r14, 0x8007
   ori r14, r14, 0x1CA0
   li r15, 1
   stb r15, 0 (r14)
   li r15, 0

#Restore the camera
   li r3, 2
   lis r14, 0x8005
   ori r14, r14, 0xD284 #BoardCameraViewSet: 2, that is, focus on the current player
   mtctr r14
   li r14, 0
   bctrl

b exit_custom_items

watch_func:
lis r14, 0x8018
ori r14, r14, 0xfcf8 #Get globalstats address

lbz r15, 5 (r14) 
subi r15, r15, 5 #Load max turn count into r15, substract 5 to it. (If it's a 20 turn game, it would be 15)

stb r15, 4 (r14) #Make the result the Current Turn

li r3, 0
li r4, 0xA #Battle song ID
lis r14, 0x8007
ori r14, r14, 0x0DEC #Change music to Battle music
mtctr r14
bctrl

lis r14, 0x8007
ori r14, r14, 0x0530 #Create message window
mtctr r14
li r3, 0
lis r4, 0x0037
ori r4, r4, 0x0079 #Wacky Watch message index
li r5, -1 #No chara portrait
bctrl

lis r14, 0x8007
ori r14, r14, 0x081C #Enable boardkeywait, so the message is displayed until player presses A
mtctr r14
bctrl

li r3, -1
lis r14, 0x8007
ori r14, r14, 0x0a00 #BoardWinPLayerSet
mtctr r14
bctrl

li r3, -1
lis r14, 0x8007
ori r14, r14, 0x0B68 #BoardWinStartComKeySet
mtctr r14
bctrl

lis r14, 0x8007
ori r14, r14, 0x06e8 #Waitmessage
mtctr r14
bctrl

lis r14, 0x8007
ori r14, r14, 0x0738 #Killmessage
mtctr r14
bctrl

li r14, 0


b exit_custom_items

double_item_func:

#Load base status effect struct
lis r14, 0x8018
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

add r14, r14, r15 #Get current player's status effect struct

lbz r15, 8 (r14) 
addi r15, r15, 2
stb r15, 8 (r14) #Get their current DoubleDip value, add 2, store back

b exit_custom_items

is_cancel_effects: #Allows Super Mini Shrooms to cancel negative statuses

#Load base status effect struct
lis r14, 0x8018
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

add r14, r14, r15 #Get current player's status effect struct


#For Mega Shroom and Super Mini Shroom, give 1 extra dice
cmpwi r4, 0x4
beq twodice

cmpwi r4, 0x8
beq twodice

b not_twodice

twodice:
lbz r15, 0 (r14) #Load amount of dices
addi r15, r15, 1 #Add one dice
stb r15, 0 (r14) #Add 1 dice

b skip_mega_extradice

not_twodice:
cmpwi r4, 0xC
bne skip_mega_extradice

lbz r15, 0 (r14) #Load amount of dices
addi r15, r15, 2 #Add two dice
stb r15, 0 (r14) #Add 2 dices

skip_mega_extradice:
#Cancel all negative status effects
li r15, 0
stb r15, 3 (r14) #Minus
stb r15, 6 (r14) #Poison

lbz r15, 7 (r14) #Load own reverse byte
cmpwi r15, 2
beq mega_extradice_nocancel_reverse

li r15, 0
stb r15, 7 (r14) #Only cancel Reverse if the status flag is NOT 02 (Self = Sender)

mega_extradice_nocancel_reverse:
lbz r15, 4 (r14) #Load own speed byte
cmpwi r15, 2
beq is_not_custom_item

li r15, 0
stb r15, 4 (r14) #Only cancel SPD if the status flag is NOT 02 (Self = Sender)

b is_not_custom_item

mushroom_func:

#Load base status effect struct
lis r14, 0x8018
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

add r14, r14, r15 #Get current player's status effect struct

lbz r15, 0 (r14) 
addi r15, r15, 1
stb r15, 0 (r14) #Get their current ExtraDice value, add 1 dice, store back on r14

#Cancel all negative status effects
li r15, 0
stb r15, 3 (r14) #Minus
stb r15, 6 (r14) #Poison

lbz r15, 7 (r14) #Load own reverse byte
cmpwi r15, 2
beq shroom_nocancel_reverse

li r15, 0
stb r15, 7 (r14) #Only cancel Reverse if the status flag is NOT 02 (Self = Sender)

shroom_nocancel_reverse:
lbz r15, 4 (r14) #Load own speed byte
cmpwi r15, 2
beq exit_custom_items

li r15, 0
stb r15, 4 (r14) #Only cancel SPD if the status flag is NOT 02 (Self = Sender)

b exit_custom_items

key_func:

lis r14, 0x8013
ori r14, r14, 0x0642
li r3, 0x21
sth r3, 0 (r14) #Hotswap Bob-Omb portrait with Skeleton Key portrait

lis r14, 0x8007
ori r14, r14, 0x0390 #Create choicebox
mtctr r14
li r3, 1
lis r4, 0x0037
ori r4, r4, 0x0080 #Skeleton Key message index
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
  lis r15, 0x8018
  ori r15, r15, 0xFD02
  lbz r15, 0 (r15)
  mulli r15, r15, 0x30

# Get current player struct
  lis r3, 0x8018
  ori r3, r3, 0xFC38
  add r3, r3, r15

# Get player struct first byte
  lbz r3, 0 (r3)

rlwinm r3, r3, 27, 31, 31
rlwinm r3, r3, 0, 24, 31 #Decode COM flag

cmpwi r3, 1 #If TRUE, the player is CPU-controlled, so execute CPU behavior
bne not_cpu_prompt

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

#Add the Key back
lis r3, 0x8006
ori r3, r3, 0x2B74 #BoardPlayerItemAdd
mtctr r3

# Get current player ID
  lis r3, 0x8018
  ori r3, r3, 0xFD02
  lbz r3, 0 (r3)

li r4, 0x19 #Skeleton Key ID

bctrl

#If the key is not thrown away, add 1 to the DoubleDip status flag (allowing player to use another item)
#Load base status effect struct
lis r14, 0x8018
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

add r14, r14, r15 #Get current player's status effect struct

lbz r15, 8 (r14) 
addi r15, r15, 1
stb r15, 8 (r14) #Get their current DoubleDip value, add 2, store back

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
  lis r15, 0x8018
  ori r15, r15, 0xFD02
  lbz r15, 0 (r15)
  mulli r15, r15, 0x30

# Get current player struct
  lis r3, 0x8018
  ori r3, r3, 0xFC38
  add r3, r3, r15

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

lis r14, 0x8007
ori r14, r14, 0x0530 #Create messagebox
mtctr r14
li r3, 1
lis r4, 0x0037
ori r4, r4, 0x0082 #Skeleton Key "I'll miss you..." message
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
  lis r15, 0x8018
  ori r15, r15, 0xFD02
  lbz r15, 0 (r15)
  mulli r15, r15, 0x30

# Get current player struct
  lis r3, 0x8018
  ori r3, r3, 0xFC38
  add r3, r3, r15

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

end_key:
lis r14, 0x8013
ori r14, r14, 0x0642
li r15, 0x10
sth r15, 0 (r14) #Restore Bob-Omb portrait


b exit_custom_items


#Ztar of Darkness Item: To be added in the future. This function is commented-out on the meantime.
#ztar_func:

#Hide every MDL in the board

#li r3, 1 #Set HideFlag to true
#lis r14, 0x8006
#ori r14, r14, 0xD5D8
#mtctr r14
#bctrl

#Hide the space MDLs too

#li r3, 1 #Set HideFlag to true
#lis r14, 0x8007
#ori r14, r14, 0x664C
#mtctr r14
#bctrl


#Load base status effect struct
#lis r14, 0x8018
#ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
#lis r15, 0x8018 
#ori r15, r15, 0xFD02
#lbz r15, 0 (r15)

#mulli r15, r15, 9

#add r14, r14, r15 #Get current player's status effect struct

#lbz r15, 0 (r14) 
#addi r15, r15, 1
#stb r15, 0 (r14) #Get their current ExtraDice value, add 1 dice, store back on r14

#Set self as dark sender
#li r15, 1
#stb r15, 1 (r14) #Ztar sender flag (This is now Skeleton Key Flag, so change this when adding Ztar of Darkness)


#Cancel all negative status effects
#li r15, 0
#stb r15, 3 (r14) #Minus
#stb r15, 6 (r14) #Poison

#lbz r15, 7 (r14) #Load own reverse byte
#cmpwi r15, 2
#beq exit_custom_items

#li r15, 0
#stb r15, 7 (r14) #Only cancel Reverse if the status flag is NOT 02 (Self = Sender)

#b exit_custom_items

plus_func:

#Load base status effect struct
lis r14, 0x8018
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

add r14, r14, r15 #Get current player's status effect struct

lbz r15, 0 (r14) 
addi r15, r15, 1
stb r15, 0 (r14) #Get their current ExtraDice value, add 1 dice, store back on r14

li r15, 1
stb r15, 2 (r14) #Activate Plus status effect

#Cancel all negative status effects
li r15, 0
stb r15, 3 (r14) #Minus
stb r15, 6 (r14) #Poison

lbz r15, 7 (r14) #Load own reverse byte
cmpwi r15, 2
beq plus_nocancel_reverse

li r15, 0
stb r15, 7 (r14) #Only cancel Reverse if the status flag is NOT 02 (Self = Sender)

plus_nocancel_reverse:
lbz r15, 4 (r14) #Load own speed byte
cmpwi r15, 2
beq exit_custom_items

li r15, 0
stb r15, 4 (r14) #Only cancel speed block if the status flag is not 02 (Self = Sender)

b exit_custom_items

minus_func:

# Make the Item Target window appear. Whoever the player picks will get a minus block
   lis r14, 0x8008
   ori r14, r14, 0xF560
   mtctr r14
   bctrl

lis r14, 0x8018
ori r14, r14, 0xFD62 #Load base status effect struct

mulli r15, r3, 9

add r14, r14, r15 #Get target player's status effect struct

li r15, 1
stb r15, 3 (r14) #Activate minus status effect for the opponent chosen


li r4, 0x12f #Surprised voice
   lis r14, 0x8003
   ori r14, r14, 0x3B80 #HuAudPlayerVoicePlay
   mtctr r14
   bctrl #Play the target's surprised sfx

b exit_custom_items

poison_func:

# Make the Item Target window appear. Whoever the player picks will get a minus block
   lis r14, 0x8008
   ori r14, r14, 0xF560
   mtctr r14
   bctrl

lis r14, 0x8018
ori r14, r14, 0xFD62 #Load base status effect struct

mulli r15, r3, 9

add r14, r14, r15 #Get target player's status effect struct

li r15, 1
stb r15, 6 (r14) #Activate minus status effect for the opponent chosen
li r15, 0
stb r15, 4 (r14) #Cancel Speed Status effect


li r4, 0x12f #Surprised voice
   lis r14, 0x8003
   ori r14, r14, 0x3B80 #HuAudPlayerVoicePlay
   mtctr r14
   bctrl #Play the target's surprised sfx

b exit_custom_items

reverse_func:

# Make the Item Target window appear. Whoever the player picks will get a minus block
   lis r14, 0x8008
   ori r14, r14, 0xF560
   mtctr r14
   bctrl

lis r14, 0x8018
ori r14, r14, 0xFD62 #Load base status effect struct

mulli r15, r3, 9

add r14, r14, r15 #Get target player's status effect struct


lis r15, 0x8018
ori r15, r15, 0xFD02 
lbz r15, 0 (r15) #Load current player

cmpw r15, r3
bne not_selfreverse
li r15, 2 #Reverse flag 0x02: Player reversed self, the status effect won't be cancelled if they use a positive item through Double Dip
b selfreverse

not_selfreverse:
li r15, 1 #Reverse flag 0x01: Someone else reversed player, the status effect will be cancelled if they use a positive item.

selfreverse:
stb r15, 7 (r14) #Activate reverse status effect for the opponent chosen


li r4, 0x12f #Surprised voice
   lis r14, 0x8003
   ori r14, r14, 0x3B80 #HuAudPlayerVoicePlay
   mtctr r14
   bctrl #Play the target's surprised sfx

b exit_custom_items

speed_func:

# Make the Item Target window appear. Whoever the player picks will get a minus block
   lis r14, 0x8008
   ori r14, r14, 0xF560
   mtctr r14
   bctrl

lis r14, 0x8018
ori r14, r14, 0xFD62 #Load base status effect struct

mulli r15, r3, 9

add r14, r14, r15 #Get target player's status effect struct

lis r15, 0x8018
ori r15, r15, 0xFD02 
lbz r15, 0 (r15) #Load current player

cmpw r15, r3
bne not_selfspeed
li r15, 2 #SPD flag 0x02: Player speeded self, the status effect won't be cancelled if they use a positive item through Double Dip
b selfspeed

not_selfspeed:
li r15, 1 #SPD flag 0x01: Someone else sped player, the status effect will be cancelled if they use a positive item.

selfspeed:
stb r15, 4 (r14) #Activate speed effect for the opponent chosen

li r15, 0
stb r15, 6 (r14) #Cancel Poison
#Cancel all negative status effects IF self is the sender
lis r15, 0x8018
ori r15, r15, 0xFD02 
lbz r15, 0 (r15) #Load current player ID

cmpw r15, r3
bne skip_speed_cancel #Cancel negative status effects if targeting self with own speed dice
li r15, 0
stb r15, 3 (r14) #Minus
lbz r15, 7 (r14) #Load own reverse byte
cmpwi r15, 2
beq skip_speed_cancel

li r15, 0
stb r15, 7 (r14) #Only cancel Reverse if the status flag is NOT 02 (Self = Sender)

skip_speed_cancel:
li r4, 0x12f #Surprised voice
   lis r14, 0x8003
   ori r14, r14, 0x3B80 #HuAudPlayerVoicePlay
   mtctr r14
   bctrl #Play the target's surprised sfx

b exit_custom_items

slow_func:

# Make the Item Target window appear. Custom stuff handled within the func.
# (Player will be allowed to choose a diceroll from 1 to 5)
   lis r14, 0x8008
   ori r14, r14, 0xF560
   mtctr r14
   bctrl

#Add 1 to chosen option
addi r3, r3, 1

#Load base status effect struct
lis r14, 0x8018
ori r14, r14, 0xFD62

#Load curplayer index, multiply by 9
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

add r14, r14, r15 #Get current player's status effect struct

stb r3, 5 (r14) #Activate slow status effect for player

#Cancel all negative status effects
li r15, 0
stb r15, 3 (r14) #Minus
stb r15, 4 (r14) #Speed; Cancel SpeedDice too
stb r15, 6 (r14) #Poison

lbz r15, 7 (r14) #Load own reverse byte
cmpwi r15, 2
beq exit_custom_items

li r15, 0
stb r15, 7 (r14) #Only cancel Reverse if the status flag is NOT 02 (Self = Sender)

b exit_custom_items

poison_all_func:

lis r14, 0x8018
ori r14, r14, 0xFD62 #Load base status effect struct

lis r15, 0x8018
ori r15, r15, 0xFD02
lbz r15, 0 (r15) #Load current player index

li r16, 0 #iterator

poison_all_loop:

cmpw r15, r16
beq poison_all_loop_increment #Don't do the effect if self

li r3, 1
stb r3, 6 (r14) #Activate poison status effect for the iterated player
li r3, 0
stb r3, 4 (r14) #Cancel Speed Status effect

   lis r3, 0x8003
   ori r3, r3, 0x3B80 #HuAudPlayerVoicePlay
   mtctr r3
   mr r3, r16 #Iterated player
   li r4, 0x12f #Surprised voice
   bctrl #Play the target's surprised sfx

poison_all_loop_increment:
addi r16, r16, 1
addi r14, r14, 9

cmpwi r16, 4
bge exit_custom_items

b poison_all_loop

golden_mushroom_func:

lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 9

lis r14, 0x8018
ori r14, r14, 0xFD62 #Load base status effect struct

add r14, r14, r15 #Get current player's status effect struct

lbz r15, 0 (r14) 
addi r15, r15, 2
stb r15, 0 (r14) #Get their current ExtraDice value, add 2 dice, store back on r14

#Cancel all negative status effects
li r15, 0
stb r15, 3 (r14) #Minus
stb r15, 6 (r14) #Poison

lbz r15, 7 (r14) #Load own reverse byte
cmpwi r15, 2
beq exit_custom_items

li r15, 0
stb r15, 7 (r14) #Only cancel Reverse if the status flag is NOT 02 (Self = Sender)

b exit_custom_items

hidden_block_card_func:

   #Set ItemUI status (make coins more visible)
   li r3, 3
   lis r14, 0x8008
   ori r14, r14, 0xC13C
   mtctr r14
   li r14, 0
   bctrl

   lis r14, 0x8008
   ori r14, r14, 0xDF68 #Hidden Block function
   mtctr r14
   li r14, 0
   bctrl

b exit_custom_items

cellullar_shopper_func:

   #Set special item used flag
   lis r14, 0x8007
   ori r14, r14, 0x1CA0
   li r15, 2
   stb r15, 0 (r14)
   li r15, 0

   #Set ItemUI status (make coins more visible)
   li r3, 3
   lis r14, 0x8008
   ori r14, r14, 0xC13C
   mtctr r14
   li r14, 0
   bctrl

   #Call Shop function
   li r3, 3
   lis r14, 0x8007
   ori r14, r14, 0x7C30
   mtctr r14
   li r14, 0
   bctrl

   #Set special item used flag
   lis r14, 0x8007
   ori r14, r14, 0x1CA0
   li r15, 1
   stb r15, 0 (r14)
   li r15, 0
b exit_custom_items

swap_card_func:
# Do Swap Card Func. Custom stuff is handled within the func
   lis r14, 0x8009
   ori r14, r14, 0x1020
   mtctr r14
   li r14, 0
   bctrl
b exit_custom_items

pipe_func:
# Do Pipe Func. Custom stuff is handled within the func
   lis r14, 0x8009
   ori r14, r14, 0x02EC
   mtctr r14
   li r14, 0
   bctrl
b exit_custom_items

warp_func:

# Load spacedata address into r15
   lis r15, 0x8019
   ori r15, r15, 0xDA10

warp_rng:
li r3, 103 #Highest amount of spaces for a board in the game + 1

# Run RNG function, the range will be 0-103
lis r14, 0x8005
ori r14, r14, 0xFB40
mtctr r14
bctrl

#If it's a bad targetspace (spacetype 00), redo the RNG roll

mulli r14, r3, 0x38
addi r14, r14, 0x28
lhzx r14, r15, r14 #Load current space's type

cmpwi r14, 0
bgt exit_warp_rng #Only exit warp rng loop if it isn't spacetype 00
b warp_rng

exit_warp_rng:
addi r3, r3, 1 #Add 1 to the resulting ID
li r15, 0

#Store targetspace on 0x80071c40
lis r14, 0x8007
ori r14, r14, 0x1c40
sth r3, 0 (r14)

# Do Pipe Func
   lis r14, 0x8009
   ori r14, r14, 0x02EC
   mtctr r14
   li r14, 0
   bctrl
b exit_custom_items

chest_func:
# Make the Item Target window appear. 
   lis r14, 0x8008
   ori r14, r14, 0xF560
   mtctr r14
   bctrl

#Store plunder target on 80071c3b
lis r14, 0x8007
ori r14, r14, 0x1c3b
stb r3, 0 (r14)

#Get plunder target's struct
mulli r3, r3, 0x30
lis r14, 0x8018
ori r14, r14, 0xfc38
add r14, r14, r3

li r15, 3 #Amount of items the target has

lbz r3, 7 (r14) #Third item
cmpwi r3, 0xFF
bne skip_plunder_sub1

subi r15, r15, 1 #Subtract 1 from that if third item doesn't exist

skip_plunder_sub1:

lbz r3, 6 (r14) #Second item
cmpwi r3, 0xFF
bne skip_plunder_sub2

subi r15, r15, 1 #Subtract 1 from that if second item doesn't exist

skip_plunder_sub2:

lbz r3, 5 (r14) #First item
cmpwi r3, 0xFF
beq exit_custom_items #Nothing happens if attempting to steal from someone who has no items

mr r3, r15 #Move player's item count to r3

# Run RNG function, the range will be 0-(Value in r3)
lis r15, 0x8005
ori r15, r15, 0xFB40
mtctr r15
bctrl

# Whatever item number comes up as the result will be the one stolen. Get the item's ID
addi r14, r14, 5
add r14, r14, r3 # (First item location + random 0-2 result. Will result on the item to steal's address)

lbz r15, 0 (r14) # Item to steal ID

lis r14, 0x801D
ori r14, r14, 0x4130

sth r15, 0 (r14) #Store item to steal as first "item bag" item.

# Lastly, do item bag function

lis r14, 0x8009
ori r14, r14, 0x6CD8
mtctr r14
li r14, 0
li r15, 0
bctrl

lis r14, 0x801D
ori r14, r14, 0x3F44
li r15, 5
stb r15, 0 (r14) #After it's done, change ItemPrev to 0x5 to prevent shop item bags from behaving like Plunder Chests if one is used during that turn

b exit_custom_items


exit_custom_items:
# Go to 8008ef70, skipping first two HuProcess functions. Do execute HuProcessEnd for the player to be able to roll.
lis r14, 0x8008
ori r14, r14, 0xef70
mtctr r14
li r14, 0
li r15, 0
li r16, 0
bctr

is_not_custom_item:
li r14, 0
li r15, 0
lwz r31, 0 (r3)







