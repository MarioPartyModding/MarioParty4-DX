#To be inserted at 800661fc
#Reverse Mushroom Code.
#This approach has the game recursively check where every space on the board leads, and has any spaces that lead to the current space be considered spaces you can reverse to.
#A "reverse array" will be created which consists on the amount of paths + the space IDs you can reverse do
#Since for a few specific cases (invisible spaces, junctions) this doesn't work, these exception cases will be fixed by using hardcoded reverse arrays per each board overlay.

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


#Check if has reverse shroom

lbz r15, 7 (r14)
cmpwi r15, 1
blt exit_loop #Don't execute the custom instructions if not reverse shroom


# Get the amount of spaces in the board
li r3, 0 #Must always be 0
   lis r15, 0x8007
   ori r15, r15, 0x40B4
   mtctr r15
   bctrl

mr r4, r3 #Store it on r4

# Load spacedata initial address into r14
   lis r14, 0x8019
   ori r14, r14, 0xDA10

# Get current player, multiply by 0x30 (player struct size)
  lis r15, 0x8018
  ori r15, r15, 0xFD02
  lbz r15, 0 (r15)
  mulli r15, r15, 0x30

# Get current player struct
  lis r17, 0x8018
  ori r17, r17, 0xFC38
  add r17, r17, r15

# Get current player space
  lbz r17, 0xD (r17)

# Get current overlay
lis r15, 0x801D
ori r15, r15, 0x3CE0
lwz r15, 0 (r15)

lis r5, 0x8007
ori r5, r5, 0x1c30 #Address of the Reverse Array, which is 0x0A bytes long. 
                   #Its structure is: 0x0: Junction count. 0x2: Target Space 1. 0x4: Target space 2. 0x6: Target space 3. 0x7-0xA: Reverse Mushroom Flags P1-P4. Might just use 07 and write to it when it's the player's turn


cmpwi r15, 0x59
beq toad_check

cmpwi r15, 0x5A
beq goomba_check

cmpwi r15, 0x5B
beq shyguy_check

cmpwi r15, 0x5C
beq booie_check

cmpwi r15, 0x5D
beq koopa_check

cmpwi r15, 0x5E
beq bowser_check

b generate_reverse_array

bowser_check:

cmpwi r17, 0x3
bne skip_start_bowser #Prevent reversing into Start Space

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x42
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_start_bowser:

cmpwi r17, 0x55 #Bounce off MiniPipe reverse attempt
beq bounce

cmpwi r17, 0x2D #Bounce off MiniPipe reverse attempt
beq bounce

cmpwi r17, 0x54 #Brigde check
beq bowser_54_check

cmpwi r17, 0x41 #Brigde check
beq bowser_41_check

cmpwi r17, 0x14 #Brigde check
beq bowser_14_check

cmpwi r17, 0x7A #Brigde check
beq bowser_7A_check

cmpwi r17, 0xC #BowserShop check
beq bowser_C

cmpwi r17, 0x64 #BowserShop check 64
beq bowser_64

cmpwi r17, 0x2 #Bounce off fake Start Space
beq bounce

cmpwi r17, 0x17
bne skip_bowser1 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x16
sth r15, 2 (r5) #First path space ID

b exit_loop

bowser_C:

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x64
sth r15, 2 (r5) #First path space ID

b exit_loop

bowser_64:

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0xB
sth r15, 2 (r5) #First path space ID

b exit_loop

bowser_14_check:
lis r17, 0x8018
ori r17, r17, 0xFD08 #Get Bowser bridge flag
lbz r17, 0 (r17)
cmpwi r17, 0x60
beq bounce

cmpwi r17, 0xE0 #Bounce if the bottom bridge is currently vertical
beq bounce

cmpwi r17, 0x40
beq bounce

cmpwi r17, 0xC0 #Bounce if the bottom bridge is currently vertical
beq bounce

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x10
sth r15, 2 (r5) #First path space ID

b exit_loop

bowser_41_check:
lis r17, 0x8018
ori r17, r17, 0xFD08 #Get Bowser bridge flag
lbz r17, 0 (r17)
cmpwi r17, 0x20
beq bounce

cmpwi r17, 0xA0 #Bounce if the bottom bridge is currently horizontal
beq bounce

cmpwi r17, 0x0
beq bounce

cmpwi r17, 0x80 #Bounce if the bottom bridge is currently horizontal
beq bounce

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x10
sth r15, 2 (r5) #First path space ID

b exit_loop

bowser_54_check:
lis r17, 0x8018
ori r17, r17, 0xFD08 #Get Bowser bridge flag
lbz r17, 0 (r17)
cmpwi r17, 0xA0
beq bounce

cmpwi r17, 0xE0 #Bounce if the top bridge is currently vertical
beq bounce

cmpwi r17, 0x80
beq bounce

cmpwi r17, 0xC0 #Bounce if the top bridge is currently vertical
beq bounce

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x29
sth r15, 2 (r5) #First path space ID

b exit_loop

bowser_7A_check:
lis r17, 0x8018
ori r17, r17, 0xFD08 #Get Bowser bridge flag
lbz r17, 0 (r17)
cmpwi r17, 0x20
beq bounce

cmpwi r17, 0x60 #Bounce if the top bridge is currently horizontal
beq bounce

cmpwi r17, 0x0
beq bounce

cmpwi r17, 0x40 #Bounce if the top bridge is currently horizontal
beq bounce

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x29
sth r15, 2 (r5) #First path space ID

b exit_loop

skip_bowser1:

b generate_reverse_array

koopa_check:

cmpwi r17, 0x1
bne skip_start_koopa #Prevent reversing into Start Space

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x3c
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_start_koopa:

cmpwi r17, 0x34
bne skip_koopa1 #Reverse from monkey junction

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x50
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_koopa1:

cmpwi r17, 0x2E #Bounce off minipipe reverse attempt
beq bounce

cmpwi r17, 0x2D
bne skip_koopa2 #Reverse from monkey junction

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x50
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_koopa2:

cmpwi r17, 0x22 #Bounce off minipipe reverse attempt
beq bounce

cmpwi r17, 0x65
bne skip_koopa3 #Reverse from monkey junction

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x4A
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_koopa3:

cmpwi r17, 0x66
bne skip_koopa4 #Reverse from monkey junction

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x4A
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_koopa4:

b generate_reverse_array

booie_check:

cmpwi r17, 0x1
bne skip_start_booie #Prevent reversing into Start Space

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x2
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_start_booie:

cmpwi r17, 0x4D
bne skip_boo1 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x4C
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_boo1:

cmpwi r17, 0x5C #Bounce off minipipe reverse attempt
beq bounce

cmpwi r17, 0x46 #Check Booie bridge status, bounce if off
beq booie_check_46

cmpwi r17, 0x12 #Bounce off minipipe reverse attempt
beq bounce

cmpwi r17, 0x26 #Check Booie bridge status, bounce if off
beq booie_check_26

cmpwi r17, 0x21 #Check Booie bridge status, bounce if off
beq booie_check_21

cmpwi r17, 0x8
bne skip_boo2 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x7
sth r15, 2 (r5) #First path space ID

b exit_loop

booie_check_46:
lis r17, 0x8018
ori r17, r17, 0xFD08 #Get Booie bridge flag
lbz r17, 0 (r17)
cmpwi r17, 1
beq bounce

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x19
sth r15, 2 (r5) #First path space ID
b exit_loop

booie_check_26:
lis r17, 0x8018
ori r17, r17, 0xFD08 #Get Booie bridge flag
lbz r17, 0 (r17)
cmpwi r17, 1
beq bounce

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x58
sth r15, 2 (r5) #First path space ID
b exit_loop

booie_check_21:
lis r17, 0x8018
ori r17, r17, 0xFD08 #Get Booie bridge flag
lbz r17, 0 (r17)
cmpwi r17, 1
beq bounce

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x52
sth r15, 2 (r5) #First path space ID
b exit_loop


skip_boo2:

cmpwi r17, 0x11
bne skip_boo3 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x25
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_boo3:

cmpwi r17, 0x1A
bne skip_boo4 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x19
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_boo4:

cmpwi r17, 0x14
bne skip_boo5 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x13
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_boo5:

cmpwi r17, 0x13
bne skip_boo6 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x64
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_boo6:

cmpwi r17, 0x64
bne skip_boo7 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x12
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_boo7:

b generate_reverse_array

shyguy_check:

cmpwi r17, 0x21
bne skip_start_shy #Prevent reversing into Start Space

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x22
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_start_shy:

cmpwi r17, 0x43 #Bounce off minipipe reverse attempt
beq bounce

cmpwi r17, 0x70 #Bounce off minipipe reverse attempt
beq bounce

cmpwi r17, 0x4E
bne skip_shy1 #Fix reverse path

li r15, 2
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x4D
sth r15, 2 (r5) #First path space ID
li r15, 0x4F
sth r15, 4 (r5) #Second path space ID

b exit_loop
skip_shy1:

cmpwi r17, 0x54
bne skip_shy2 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x2D
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_shy2:

cmpwi r17, 0x41
bne skip_shy3 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x40
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_shy3:

cmpwi r17, 0x3D
bne skip_shy4 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0xC
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_shy4:

cmpwi r17, 0x86
bne skip_shy5 #Fix reverse path

lis r15, 0x8018
ori r15, r15, 0xFD08 #Get ShyGuy Bridge Flag
lbz r15, 0 (r15)

cmpwi r15, 0
beq not_flooded_A

b bounce #If it's flooded, bounce off the flood. If not, pass.

not_flooded_A:
li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0xC
sth r15, 2 (r5) #First path space ID

b exit_loop

skip_shy5:

cmpwi r17, 0x4B
bne skip_shy6 #Fix reverse path

lis r15, 0x8018
ori r15, r15, 0xFD08 #Get ShyGuy Bridge Flag
lbz r15, 0 (r15)

cmpwi r15, 0
beq not_flooded_B

#When the path is flooded, only allow the player to go down

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x4a
sth r15, 2 (r5) #First path space ID

b exit_loop

not_flooded_B:

#When the path is not flooded, the player can go down or left.

li r15, 2
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x4a
sth r15, 2 (r5) #First path space ID
li r15, 0x9
sth r15, 4 (r5) #Second path space ID

b exit_loop

skip_shy6:

b generate_reverse_array

toad_check:

cmpwi r17, 0x22
bne skip_start_toad #Prevent reversing into Start Space

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x7C
sth r15, 2 (r5) #First path space ID

b exit_loop
skip_start_toad:

cmpwi r17, 0x2E #Go down if reversing off early teacups
beq toad_to_7B

cmpwi r17, 0x33 #Go down if reversing off early teacups
beq toad_to_7B

cmpwi r17, 0x6B #Bounce off teapot reverse attempt
beq toad_to_69

cmpwi r17, 0x52 #Bounce off teapot reverse attempt
beq toad_to_69

cmpwi r17, 0x69 #Fix loop
beq toad_to_68

cmpwi r17, 0x34 #Fix loop
beq toad_to_35

cmpwi r17, 0x6C #Bounce off MiniPipe reverse attempt
beq bounce

cmpwi r17, 0x80 #Bounce off MiniPipe reverse attempt
beq bounce

cmpwi r17, 0x79
bne skip_toad1 #Fix reverse path

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x72
sth r15, 2 (r5) #First path space ID

b exit_loop

toad_to_7B:
  li r15, 1
  sth r15, 0 (r5) #Amount of possible paths
  li r15, 0x7B
  sth r15, 2 (r5) #First path space ID
b exit_loop

toad_to_69:
  li r15, 1
  sth r15, 0 (r5) #Amount of possible paths
  li r15, 0x69
  sth r15, 2 (r5) #First path space ID
b exit_loop

toad_to_68:
  li r15, 1
  sth r15, 0 (r5) #Amount of possible paths
  li r15, 0x68
  sth r15, 2 (r5) #First path space ID
b exit_loop

toad_to_35:
  li r15, 1
  sth r15, 0 (r5) #Amount of possible paths
  li r15, 0x35
  sth r15, 2 (r5) #First path space ID
b exit_loop

skip_toad1:

b generate_reverse_array

goomba_check:

cmpwi r17, 0x9
bne skip_start_goomba #Prevent reversing into Start Space

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x5E
sth r15, 2 (r5) #First path space ID

b exit_loop

skip_start_goomba:

cmpwi r17, 0x4F
bne skip_goombafix #On the junction behind Booie, go to the Item Shop side

li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x4E
sth r15, 2 (r5) #First path space ID

b exit_loop

skip_goombafix:

cmpwi r17, 0x57
bne skip_roulette_reverse1 #Don't reverse back to the roulette
li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x58
sth r15, 2 (r5) #First path space ID

b exit_loop

skip_roulette_reverse1:

cmpwi r17, 0x78 #Bounce off MiniPipe reverse attempt
beq bounce

cmpwi r17, 0x6B #Bounce off item space reverse attempt
beq bounce

cmpwi r17, 0x6F #Bounce off pink arrow on roulette
beq bounce

cmpwi r17, 0x7A #Bounce off MiniPipe reverse attempt
beq bounce

cmpwi r17, 0x19
bne skip_roulette_reverse2 #Don't reverse back to the roulette
li r15, 1
sth r15, 0 (r5) #Amount of possible paths
li r15, 0x1A
sth r15, 2 (r5) #First path space ID

b exit_loop

skip_roulette_reverse2:

b generate_reverse_array

bounce: #When reaching a dead end on a board, bounce off it, and lose reverse status effect. Said dead ends are hardcoded.
lis r14, 0x8018
ori r14, r14, 0xFD02
lbz r14, 0 (r14) #Current player ID

mulli r14, r14, 9 #multiply by 9 (status effect struct size)

#Load base status effect struct
lis r15, 0x8018
ori r15, r15, 0xFD62

add r14, r15, r14 #Current player's status struct

li r15, 0
stb r15, 7 (r14) #Kill reverse status

b exit_loop


generate_reverse_array:
li r16, 0
li r0, 0

#r4 = Space Count
#r5 = Reverse Array
#r14 = Spacedata Offset
#r16 = Iteration
#r17 = Current player's space ID

reverse_space_loop:

  cmpwi r16, 0
  beq skip_first_add

  addi r14, r14, 0x38 #Get current iteration space address

  skip_first_add:

  lha r15, 0x2A (r14) #Load amount of paths in the space 
                      
 
  cmpwi r15, 0
  beq reverse_loop_increment #Don't do anything if the space leads nowhere

  lha r15, 0x2C (r14) #Load first destination space

  cmpw r15, r17
  bne reverse_loop_increment
  #If the current iteration's space leads to the current space, it means that's from where the player came from. Therefore, let the player reverse to it.
  
  cmpwi r15, 0
  beq reverse_loop_increment #Don't do anything if the space leads nowhere

  lha r15, 0 (r5)

  cmpwi r15, 3
  beq exit_loop #Stop if there's already 3 spaces the junction leads to

  addi r15, r15, 1
  sth r15, 0 (r5) #Increase amount of possible paths by 1

  lha r15, 2 (r5)
  cmpwi r15, 0xFF
  beq add_new_space

  lha r15, 4 (r5)
  cmpwi r15, 0xFF
  beq add_new_space_2

  lha r15, 6 (r5)
  cmpwi r15, 0xFF
  beq add_new_space_3

reverse_loop_increment:
cmpw r16, r4 #for i=0, #(SPACES) do reverse_space_loop
bgt exit_loop

addi r16, r16, 1
b reverse_space_loop

add_new_space:
addi r15, r16, 1 #Add 1 to space id
sth r15, 2 (r5) #Store the space id of the current iteration into Reverse Array's first destination space ID.
b reverse_loop_increment

add_new_space_2:
addi r15, r16, 1 #Add 1 to space id
sth r15, 4 (r5) #Store the space id of the current iteration into Reverse Array's first destination space ID.
b reverse_loop_increment

add_new_space_3:
addi r15, r16, 1 #Add 1 to space id
sth r15, 6 (r5) #Store the space id of the current iteration into Reverse Array's first destination space ID.
b reverse_loop_increment


exit_loop:
#Original instruction
li r0, -1
li r5, 0
li r14, 0
li r15, 0
li r16, 0
li r17, 0 #Restore from hook
