#To be inserted at 800719a4
# MP4 ITEM EXPANSION MOD GECKO CODE - CPU Item Usage Check Functions
# Original instruction
lwz r24, 0 (r3)

# Get current player, multiply by 0x30 (player struct size)
  lis r15, 0x8018
  ori r15, r15, 0xFD02
  lbz r16, 0 (r15)
  mulli r15, r16, 0x30

# Get current player struct
  lis r14, 0x8018
  ori r14, r14, 0xFC38
  add r14, r14, r15

cmpwi r4, 0x14
beq pipe

cmpwi r4, 0x4
beq mega_check

cmpwi r4, 0xC
beq mega_check

cmpwi r4, 0x18
beq swapcard_check 

cmpwi r4, 0x28
beq bowser_suit_check 

cmpwi r4, 0x2C
beq should_kill_check

cmpwi r4, 0x30
beq should_kill_check

cmpwi r4, 0x4C
beq swapcard_check

cmpwi r4, 0x60
beq swapcard_check #SwapCard check: additional checks that the AI takes into consideration before using a Swap Card, Barter Box or Bowser Jr. Brush

b skip_swapcard_check

swapcard_check:
# Do not ever use a Swap Card if has powerful items

lbz r15, 5 (r14)
cmpwi r15, 0x3
beq dont_use

lbz r15, 6 (r14)
cmpwi r15, 0x3
beq dont_use

lbz r15, 7 (r14)
cmpwi r15, 0x3 #Super Mega Shroom
beq dont_use

lbz r15, 5 (r14)
cmpwi r15, 0xD
beq dont_use

lbz r15, 6 (r14)
cmpwi r15, 0xD
beq dont_use

lbz r15, 7 (r14) 
cmpwi r15, 0xD #Item Bag
beq dont_use

lbz r15, 5 (r14)
cmpwi r15, 0xC
beq dont_use

lbz r15, 6 (r14)
cmpwi r15, 0xC
beq dont_use

lbz r15, 7 (r14) 
cmpwi r15, 0xC #Magic Lamp
beq dont_use

lbz r15, 5 (r14)
cmpwi r15, 0xB
beq dont_use

lbz r15, 6 (r14)
cmpwi r15, 0xB
beq dont_use

lbz r15, 7 (r14)
cmpwi r15, 0xB #Booie's Crystal Ball
beq dont_use

lbz r15, 5 (r14)
cmpwi r15, 0x10
beq dont_use

lbz r15, 6 (r14)
cmpwi r15, 0x10
beq dont_use

lbz r15, 7 (r14)
cmpwi r15, 0x10 #Golden Shroom
beq dont_use

lbz r15, 5 (r14)
cmpwi r15, 0x11
beq dont_use

lbz r15, 6 (r14)
cmpwi r15, 0x11
beq dont_use

lbz r15, 7 (r14)
cmpwi r15, 0x11 #Hidden Block Card
beq dont_use

lbz r15, 5 (r14)
cmpwi r15, 0x14
beq dont_use

lbz r15, 6 (r14)
cmpwi r15, 0x14
beq dont_use

lbz r15, 7 (r14)
cmpwi r15, 0x14 #Chance Charm
beq dont_use

#if got there, branch to item steal check

b should_steal_check

skip_swapcard_check:

cmpwi r4, 0x20 #Gaddlight
bne skip_gaddlight_check

lbz r15, 0 (r14) #Load character bitfield
rlwinm r15, r15, 31, 28, 31 #Get character. 00: Mario, 01: Luigi, 02: Peach, 03: Yoshi, 04: Wario, 05: DK, 06: Daisy, 07: Waluigi

cmpwi r15, 0x1 #If Luigi, never get rid of Gaddlight
beq skip_gaddlight_check

li r24, 0 #Put gaddlight count in r24
lbz r15, 5 (r14)
cmpwi r15, 0x8
bne skip_gaddlight_1
addi r24, r24, 1

skip_gaddlight_1:

lbz r15, 6 (r14)
cmpwi r15, 0x8
bne skip_gaddlight_2
addi r24, r24, 1

skip_gaddlight_2:

lbz r15, 7 (r14)
cmpwi r15, 0x8
bne skip_gaddlight_3
addi r24, r24, 1

skip_gaddlight_3:

cmpwi r24, 2
beq two_gaddlight_check

cmpwi r24, 1
beq dont_use

b always_use #If has 3 Gaddlights, get rid of one, to open up inventory space

two_gaddlight_check: #Get rid of one Gaddlight if one of the detected items is:
#Skeleton Key, Reverse Shroom, Barter Box, Swap Card, Double Dip, Wacky Watch, Chance Charm

lbz r15, 5 (r14)
cmpwi r15, 0x19
beq always_use

lbz r15, 6 (r14)
cmpwi r15, 0x19
beq always_use

lbz r15, 7 (r14)
cmpwi r15, 0x19
beq always_use

lbz r15, 5 (r14)
cmpwi r15, 0x23
beq always_use

lbz r15, 6 (r14)
cmpwi r15, 0x23
beq always_use

lbz r15, 7 (r14)
cmpwi r15, 0x23
beq always_use

lbz r15, 5 (r14)
cmpwi r15, 0x13
beq always_use

lbz r15, 6 (r14)
cmpwi r15, 0x13
beq always_use

lbz r15, 7 (r14)
cmpwi r15, 0x13
beq always_use

lbz r15, 5 (r14)
cmpwi r15, 0x6
beq always_use

lbz r15, 6 (r14)
cmpwi r15, 0x6
beq always_use

lbz r15, 7 (r14)
cmpwi r15, 0x6
beq always_use

lbz r15, 5 (r14)
cmpwi r15, 0x22
beq always_use

lbz r15, 6 (r14)
cmpwi r15, 0x22
beq always_use

lbz r15, 7 (r14)
cmpwi r15, 0x22
beq always_use

lbz r15, 5 (r14)
cmpwi r15, 0x16
beq always_use

lbz r15, 6 (r14)
cmpwi r15, 0x16
beq always_use

lbz r15, 7 (r14)
cmpwi r15, 0x16
beq always_use

lbz r15, 5 (r14)
cmpwi r15, 0x15
beq always_use

lbz r15, 6 (r14)
cmpwi r15, 0x15
beq always_use

lbz r15, 7 (r14)
cmpwi r15, 0x15
beq always_use

b dont_use


skip_gaddlight_check:
cmpwi r4, 0x10 #MiniMegaHammer
bne skip_hammer_check

lbz r15, 0 (r14) #Load character bitfield
rlwinm r15, r15, 31, 28, 31 #Get character. 00: Mario, 01: Luigi, 02: Peach, 03: Yoshi, 04: Wario, 05: DK, 06: Daisy, 07: Waluigi

cmpwi r15, 0x4 #If DK, use MiniMega Hammer thoughtlessly
beq always_use

skip_hammer_check:
cmpwi r4, 0x14 #Custom items
bne custom_item_check

lbz r15, 0 (r14) #Load character bitfield
rlwinm r15, r15, 31, 28, 31 #Get character. 00: Mario, 01: Luigi, 02: Peach, 03: Yoshi, 04: Wario, 05: DK, 06: Daisy, 07: Waluigi

cmpwi r15, 0x4 #If DK, always warp unless close to the star
beq use_unless_closestar

custom_item_check:
# The value of r4 is 4 * item ID. It's higher than 0x30 for all custom items and Item Bag.
cmpwi r4, 0x30
ble end

# If it's a custom item or an item bag, assign custom item use func depending on the item

cmpwi r4, 0x34
beq always_use

cmpwi r4, 0x38
beq bowser_phone

cmpwi r4, 0x3C
beq mushroom

cmpwi r4, 0x40
beq mushroom

cmpwi r4, 0x44
beq always_use

cmpwi r4, 0x48
beq shopper

cmpwi r4, 0x50
beq super_pipe

cmpwi r4, 0x58
beq watch_check

cmpwi r4, 0x5C
beq should_steal_check

cmpwi r4, 0x54
beq chance_check

cmpwi r4, 0x64
beq key

cmpwi r4, 0x68
beq pipe

cmpwi r4, 0x6C
beq use_unless_closestar #Use Fly Guy to put opponents far away from the Star

cmpwi r4, 0x78 #Speed Block
beq mushroom

cmpwi r4, 0x7C #Slow Block
beq use_unless_closestar

cmpwi r4, 0x88
beq double_item

cmpwi r4, 0x8C
beq reverse

always_use:
   lis r24, 0x8007
   ori r24, r24, 0x1a9c #Always use
b end

reverse:

#Reverse Shroom usage check code: AI only uses Reverse Shroom on themselves, and in these cases:
#1. When Booie is 10 spaces or less behind them
#2. When the star is close to them from behind
#This will be done through hardcode, per overlay.

# Get current player space
lbz r16, 0xD (r14)

# Get current overlay
lis r15, 0x801D
ori r15, r15, 0x3CE0
lwz r15, 0 (r15)

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

toad_check:

# 1. Spaces where you can reverse yourself to Booie:
cmpwi r16, 0x7A
beq use_unless_closestar

cmpwi r16, 0x48
beq use_unless_closestar

# 9 through 0B
cmpwi r16, 0x42
blt skip_toad_A

cmpwi r16, 0x47
bgt skip_toad_A

b use_unless_closestar

skip_toad_A:

#2. Spaces that are close to the Star, from behind. If can afford it:

  lis r3, 0x8007
  ori r3, r3, 0x59A4
  mtctr r3
  bctrl #Get ID of the current Star Space, output to r3

cmpwi r3, 0x46
bne skip_toad_star_1

cmpwi r16, 0x47
beq mushroom

#Spaces 24 through 2A.
cmpwi r16, 0x24
blt skip_toad_star_1

cmpwi r16, 0x2A
bgt skip_toad_star_1

b mushroom

skip_toad_star_1:

cmpwi r3, 0x2C
bne skip_toad_star_2

cmpwi r16, 0x2B
beq mushroom

#Spaces 3E through 43
skip_toad_C:
cmpwi r16, 0x23
blt skip_toad_star_2

cmpwi r16, 0x27
bgt skip_toad_star_2

b mushroom

skip_toad_star_2:
cmpwi r3, 0x4A
bne skip_toad_star_3

cmpwi r16, 0x4B #The Booie code got everything covered here
beq mushroom

b dont_use

skip_toad_star_3:
cmpwi r3, 0x70
bne skip_toad_star_4

cmpwi r16, 0x71
beq mushroom

cmpwi r16, 0x72
beq mushroom

cmpwi r16, 0x79
beq mushroom

#Spaces 49 through 4D
cmpwi r16, 0x49
blt skip_toad_star_4

cmpwi r16, 0x4D
bgt skip_toad_star_4

b mushroom

skip_toad_star_4:
cmpwi r3, 0x3E
bne skip_toad_star_5

#Spaces 3f through 41
cmpwi r16, 0x3f
blt skip_toad_star_5

cmpwi r16, 0x41
bgt skip_toad_star_5

b mushroom

skip_toad_star_5:
cmpwi r3, 0x5B
bne skip_toad_star_6

#Spaces 5C through 63
cmpwi r16, 0x5C
blt skip_toad_star_6

cmpwi r16, 0x63
bgt skip_toad_star_6

b mushroom

skip_toad_star_6:
cmpwi r3, 0x51
bne dont_use

cmpwi r16, 0x50
beq mushroom

cmpwi r16, 0x56
beq mushroom

cmpwi r16, 0x53
beq mushroom

cmpwi r16, 0x57
beq mushroom

cmpwi r16, 0x58
beq mushroom

b dont_use

goomba_check:

# 1. Spaces where you can reverse yourself to Booie:
cmpwi r16, 0x5E
beq use_unless_closestar

# 9 through 0B
cmpwi r16, 0x9
blt skip_goomba_A

cmpwi r16, 0xB
bgt skip_goomba_A

b use_unless_closestar

skip_goomba_A:

#0E through 13
cmpwi r16, 0xE
blt skip_goomba_B

cmpwi r16, 0x13
bgt skip_goomba_B

b use_unless_closestar

skip_goomba_B:


#2. Spaces that are close to the Star, from behind. If can afford it:

  lis r3, 0x8007
  ori r3, r3, 0x59A4
  mtctr r3
  bctrl #Get ID of the current Star Space, output to r3

cmpwi r3, 0x50
bne skip_goomba_star_1

#Spaces 51 through 53. This is the Star that is right behind Booie, and the above code already covers the rest of the Booie-nearby spaces.
cmpwi r16, 0x51
blt skip_goomba_star_1

cmpwi r16, 0x53
bgt skip_goomba_star_1

b mushroom

skip_goomba_star_1:

cmpwi r3, 0x5B
bne skip_goomba_star_2

#Spaces 57 through 5A
cmpwi r16, 0x57
blt skip_goomba_C

cmpwi r16, 0x5A
bgt skip_goomba_C

b mushroom

#Spaces 3E through 43
skip_goomba_C:
cmpwi r16, 0x3E
blt skip_goomba_star_2

cmpwi r16, 0x43
bgt skip_goomba_star_2

b mushroom

skip_goomba_star_2:
cmpwi r3, 0x4B
bne skip_goomba_star_3

#Spaces 4C through 53
cmpwi r16, 0x4c
blt skip_goomba_star_3

cmpwi r16, 0x53
bgt skip_goomba_star_3

b mushroom

skip_goomba_star_3:
cmpwi r3, 0x33
bne skip_goomba_star_4

#Spaces 34 through 3D, EXCEPT 37
cmpwi r16, 0x34
blt skip_goomba_star_4

cmpwi r16, 0x3D
bgt skip_goomba_star_4

cmpwi r16, 0x37
beq skip_goomba_star_4

b mushroom

skip_goomba_star_4:
cmpwi r3, 0x3B
bne skip_goomba_star_5

#3C and 3D
cmpwi r16, 0x3C
beq mushroom

cmpwi r16, 0x3D
beq mushroom

#Spaces 27 through 2A
cmpwi r16, 0x27
blt skip_goomba_star_5

cmpwi r16, 0x2A
bgt skip_goomba_star_5

b mushroom

skip_goomba_star_5:
cmpwi r3, 0x24
bne skip_goomba_star_6

#Spaces 21 through 23
cmpwi r16, 0x21
blt skip_goomba_star_6

cmpwi r16, 0x23
bgt skip_goomba_star_6

b mushroom

skip_goomba_star_6:
cmpwi r3, 0x1B
bne dont_use

cmpwi r16, 0x24
beq mushroom

cmpwi r16, 0x25
beq mushroom

cmpwi r16, 0x26
beq mushroom

b dont_use

#Spaces 16 through 1A
cmpwi r16, 0x16
blt dont_use

cmpwi r16, 0x1A
bgt dont_use

b mushroom

b dont_use

shyguy_check:

# 1. Spaces where you can reverse yourself to Booie:
cmpwi r16, 0x87
beq use_unless_closestar

# 79 through 7D
cmpwi r16, 0x79
blt skip_shyguy_A

cmpwi r16, 0x7D
bgt skip_shyguy_A

b use_unless_closestar

skip_shyguy_A:

#2. Spaces that are close to the Star, from behind. If can afford it:

  lis r3, 0x8007
  ori r3, r3, 0x59A4
  mtctr r3
  bctrl #Get ID of the current Star Space, output to r3

cmpwi r3, 0x35
bne skip_shyguy_star_1

cmpwi r16, 0x3D
beq mushroom

cmpwi r16, 0x86
beq mushroom

#Spaces 36 through 3C
cmpwi r16, 0x36
blt skip_shyguy_star_1

cmpwi r16, 0x3C
bgt skip_shyguy_star_1

b mushroom

skip_shyguy_star_1:

cmpwi r3, 0x51
bne skip_shyguy_star_2

cmpwi r16, 0x5A
beq mushroom

cmpwi r16, 0x59
beq mushroom

#Spaces 4e through 50
skip_shyguy_C:
cmpwi r16, 0x4E
blt skip_shyguy_star_2

cmpwi r16, 0x50
bgt skip_shyguy_star_2

b mushroom

skip_shyguy_star_2:
cmpwi r3, 0x57
bne skip_shyguy_star_3

cmpwi r16, 0x27
beq mushroom

cmpwi r16, 0x28
beq mushroom

cmpwi r16, 0x29
beq mushroom

cmpwi r16, 0x2a
beq mushroom

cmpwi r16, 0x2b
beq mushroom

cmpwi r16, 0x55
beq mushroom

cmpwi r16, 0x56
beq mushroom

b dont_use

skip_shyguy_star_3:
cmpwi r3, 0x46
bne skip_shyguy_star_4

#Spaces 47 through 4D
cmpwi r16, 0x47
blt skip_shyguy_star_4

cmpwi r16, 0x4D
bgt skip_shyguy_star_4

b mushroom

skip_shyguy_star_4:
cmpwi r3, 0x76
bne skip_shyguy_star_5

cmpwi r16, 0x75
beq mushroom

cmpwi r16, 0x74
beq mushroom

cmpwi r16, 0x78
beq mushroom

b dont_use

skip_shyguy_star_5:
cmpwi r3, 0x5f
bne skip_shyguy_star_6

cmpwi r16, 0x88
beq mushroom

cmpwi r16, 0x4B
beq mushroom

cmpwi r16, 0x4C
beq mushroom

cmpwi r16, 0x4D
beq mushroom

#Spaces 5C through 5E
cmpwi r16, 0x5C
blt skip_shyguy_star_6

cmpwi r16, 0x5E
bgt skip_shyguy_star_6

b mushroom

skip_shyguy_star_6:
cmpwi r3, 0x6D
bne skip_shyguy_star_7

cmpwi r16, 0x67
beq mushroom

cmpwi r16, 0x68
beq mushroom

cmpwi r16, 0x69
beq mushroom

cmpwi r16, 0x6A
beq mushroom

cmpwi r16, 0x6B
beq mushroom

cmpwi r16, 0x6C
beq mushroom

skip_shyguy_star_7:
cmpwi r3, 0x80
bne dont_use

cmpwi r16, 0x7F
beq mushroom

cmpwi r16, 0x7A
beq mushroom

cmpwi r16, 0x7B
beq mushroom

cmpwi r16, 0x7C
beq mushroom

cmpwi r16, 0x7D
beq mushroom

cmpwi r16, 0x87
beq mushroom

b dont_use

booie_check:

# 1. Spaces where you can reverse yourself to Booie:
cmpwi r16, 0x4f
beq use_unless_closestar

# 1 through 7
cmpwi r16, 0x1
blt skip_booie_A

cmpwi r16, 0x7
bgt skip_booie_A

b use_unless_closestar

skip_booie_A:

#2. Spaces that are close to the Star, from behind. If can afford it:

  lis r3, 0x8007
  ori r3, r3, 0x59A4
  mtctr r3
  bctrl #Get ID of the current Star Space, output to r3

cmpwi r3, 0x49
bne skip_booie_star_1

cmpwi r16, 0x1E
beq mushroom

cmpwi r16, 0x22
beq mushroom

cmpwi r16, 0x23
beq mushroom

#Spaces 47 through 48
cmpwi r16, 0x47
blt skip_booie_star_1

cmpwi r16, 0x48
bgt skip_booie_star_1

b mushroom

skip_booie_star_1:

cmpwi r3, 0x41
bne skip_booie_star_2

cmpwi r16, 0x40
beq mushroom

#Spaces 4c through 5e
skip_booie_C:
cmpwi r16, 0x4c
blt skip_booie_star_2

cmpwi r16, 0x4E
bgt skip_booie_star_2

b mushroom

skip_booie_star_2:
cmpwi r3, 0x38
bne skip_booie_star_3

cmpwi r16, 0x39
beq mushroom

cmpwi r16, 0x3a
beq mushroom

cmpwi r16, 0x3c
beq mushroom

cmpwi r16, 0x15
beq mushroom

cmpwi r16, 0x16
beq mushroom

b dont_use

skip_booie_star_3:
cmpwi r3, 0x27
bne skip_booie_star_4

cmpwi r16, 0x28
beq mushroom

#Spaces 34 through 38
cmpwi r16, 0x34
blt skip_booie_star_4

cmpwi r16, 0x38
bgt skip_booie_star_4

b mushroom

skip_booie_star_4:
cmpwi r3, 0x0A
bne skip_booie_star_5

cmpwi r16, 0x0b
beq mushroom

cmpwi r16, 0x0b
beq mushroom

cmpwi r16, 0x29
beq mushroom

cmpwi r16, 0x2A
beq mushroom

cmpwi r16, 0x2B
beq mushroom

cmpwi r16, 0x2C
beq mushroom

b dont_use

skip_booie_star_5:
cmpwi r3, 0x31
bne skip_booie_star_6

#Spaces 32 through 3A
cmpwi r16, 0x32
blt skip_booie_star_6

cmpwi r16, 0x3A
bgt skip_booie_star_6

b mushroom

skip_booie_star_6:
cmpwi r3, 0x13
bne skip_booie_star_7

#Spaces 14 through 19
cmpwi r16, 0x14
blt skip_booie_star_7

cmpwi r16, 0x19
bgt skip_booie_star_7


skip_booie_star_7:
cmpwi r3, 0x20
bne dont_use

cmpwi r16, 0x1f
beq mushroom

cmpwi r16, 0x1b
beq mushroom

cmpwi r16, 0x22
beq mushroom

cmpwi r16, 0x23
beq mushroom

b dont_use

koopa_check:

# 1. Spaces where you can reverse yourself to Booie:
cmpwi r16, 0x27
beq use_unless_closestar

cmpwi r16, 0x28
beq use_unless_closestar

# 51 through 54
cmpwi r16, 0x51
blt skip_koopa_A

cmpwi r16, 0x54
bgt skip_koopa_A

b use_unless_closestar

skip_koopa_A:

#2. Spaces that are close to the Star, from behind. If can afford it:

  lis r3, 0x8007
  ori r3, r3, 0x59A4
  mtctr r3
  bctrl #Get ID of the current Star Space, output to r3

cmpwi r3, 0x38
bne skip_koopa_star_1

cmpwi r16, 0x1
beq mushroom

cmpwi r16, 0x2
beq mushroom

cmpwi r16, 0x3
beq mushroom

#Spaces 39 through 3c
cmpwi r16, 0x39
blt skip_koopa_star_1

cmpwi r16, 0x3c
bgt skip_koopa_star_1

b mushroom

skip_koopa_star_1:

cmpwi r3, 0x0B
bne skip_koopa_star_2

cmpwi r16, 0x9
beq mushroom

cmpwi r16, 0xA
beq mushroom

#Spaces 3E through 41
skip_koopa_C:
cmpwi r16, 0x3E
blt skip_koopa_star_2

cmpwi r16, 0x41
bgt skip_koopa_star_2

b mushroom

skip_koopa_star_2:
cmpwi r3, 0x29
bne skip_koopa_star_3

cmpwi r16, 0x28
beq mushroom

b dont_use

skip_koopa_star_3:
cmpwi r3, 0x1F
bne skip_koopa_star_4

cmpwi r16, 0x20
beq mushroom

cmpwi r16, 0x21
beq mushroom

#Spaces 55 through 59
cmpwi r16, 0x55
blt skip_koopa_star_4

cmpwi r16, 0x59
bgt skip_koopa_star_4

b mushroom

skip_koopa_star_4:
cmpwi r3, 0x50
bne skip_koopa_star_5

cmpwi r16, 0x60
beq mushroom

cmpwi r16, 0x2C
beq mushroom

cmpwi r16, 0x2B
beq mushroom

cmpwi r16, 0x2A
beq mushroom

cmpwi r16, 0x2B
beq mushroom

cmpwi r16, 0x32
beq mushroom

cmpwi r16, 0x33
beq mushroom

cmpwi r16, 0x34
beq mushroom

cmpwi r16, 0x35
beq mushroom

cmpwi r16, 0x36
beq mushroom

cmpwi r16, 0x29
beq mushroom

b dont_use

skip_koopa_star_5:
cmpwi r3, 0x48
bne skip_koopa_star_6

cmpwi r16, 0x19
beq mushroom

cmpwi r16, 0x18
beq mushroom

cmpwi r16, 0x17
beq mushroom

cmpwi r16, 0x1C
beq mushroom

cmpwi r16, 0x1B
beq mushroom

cmpwi r16, 0x1A
beq mushroom

#Spaces 49 through 4A
cmpwi r16, 0x49
blt skip_koopa_star_6

cmpwi r16, 0x4A
bgt skip_koopa_star_6

b mushroom

skip_koopa_star_6:
cmpwi r3, 0x04
bne skip_koopa_star_7

cmpwi r16, 0x3E
beq mushroom

#Spaces 5 through 9
cmpwi r16, 0x05
blt skip_koopa_star_7

cmpwi r16, 0x09
bgt skip_koopa_star_7


skip_koopa_star_7:
cmpwi r3, 0x43
bne dont_use

cmpwi r16, 0x4b
beq mushroom

cmpwi r16, 0x4c
beq mushroom

cmpwi r16, 0x4e
beq mushroom

cmpwi r16, 0x4f
beq mushroom

#Spaces 44 through 48
cmpwi r16, 0x44
blt dont_use

cmpwi r16, 0x48
bgt dont_use

b dont_use

bowser_check:

# 1. Spaces where you can reverse yourself to Booie:
# 45 through 4C
cmpwi r16, 0x45
blt skip_bowser_A

cmpwi r16, 0x4C
bgt skip_bowser_A

b use_unless_closestar

skip_bowser_A:

#2. Spaces that are close to the Star, from behind. If can afford it:

  lis r3, 0x8007
  ori r3, r3, 0x59A4
  mtctr r3
  bctrl #Get ID of the current Star Space, output to r3

cmpwi r3, 0x44
bne skip_bowser_star_1

cmpwi r16, 0x42
beq mushroom

cmpwi r16, 0x43
beq mushroom

#Spaces 3 through 6
cmpwi r16, 0x3
blt skip_bowser_star_1

cmpwi r16, 0x6
bgt skip_bowser_star_1

b mushroom

skip_bowser_star_1:

cmpwi r3, 0x60
bne skip_bowser_star_2

#Spaces 58 through 5F
skip_bowser_C:
cmpwi r16, 0x58
blt skip_bowser_star_2

cmpwi r16, 0x5F
bgt skip_bowser_star_2

b mushroom

skip_bowser_star_2:
cmpwi r3, 0x4E
bne skip_bowser_star_3

cmpwi r16, 0x4D #Booie reverse already does the work
beq mushroom

b dont_use

skip_bowser_star_3:
cmpwi r3, 0x27
bne skip_bowser_star_4

cmpwi r16, 0x61
beq mushroom

#Spaces 1f through 24
cmpwi r16, 0x1f
blt skip_bowser_star_4

cmpwi r16, 0x24
bgt skip_bowser_star_4

b mushroom

skip_bowser_star_4:
cmpwi r3, 0x2A
bne skip_bowser_star_5

cmpwi r16, 0x28
beq mushroom

cmpwi r16, 0x29
beq mushroom

b dont_use

skip_bowser_star_5:
cmpwi r3, 0x2f
bne skip_bowser_star_6

#Spaces 30 through 38
cmpwi r16, 0x30
blt skip_bowser_star_6

cmpwi r16, 0x38
bgt skip_bowser_star_6

b mushroom

skip_bowser_star_6:
cmpwi r3, 0x3D
bne skip_bowser_star_7

cmpwi r16, 0x3E
beq mushroom

#Spaces 7 through D
cmpwi r16, 0x07
blt skip_bowser_star_7

cmpwi r16, 0x0D
bgt skip_bowser_star_7


skip_bowser_star_7:
cmpwi r3, 0xC
bne dont_use

#Spaces D through 10
cmpwi r16, 0xd
blt dont_use

cmpwi r16, 0x10
bgt dont_use

b dont_use

bowser_suit_check:

   #First off, if has 3 Bowser Suits, waste one, unless character is Wario
   li r3, 0
   
   lbz r15, 0 (r14) #Load character bitfield
   rlwinm r15, r15, 31, 28, 31 #Get character. 00: Mario, 01: Luigi, 02: Peach, 03: Yoshi, 04: Wario, 05: DK, 06: Daisy, 07: Waluigi

   cmpwi r15, 4
   beq skip_bsuit_stockup_check
 
   lbz r15, 5 (r14)
   cmpwi r15, 0xA
   bne skip_bsuit_count1
   addi r3, r3, 1

   skip_bsuit_count1:
   lbz r15, 6 (r14)
   cmpwi r15, 0xA
   bne skip_bsuit_count2
   addi r3, r3, 1

   skip_bsuit_count2:
   lbz r15, 7 (r14)
   cmpwi r15, 0xA
   bne skip_bsuit_count3
   addi r3, r3, 1

   skip_bsuit_count3:
   lbz r15, 5 (r14)
   cmpwi r15, 0x8
   bne skip_bsuit_count4
   addi r3, r3, 1

   skip_bsuit_count4:
   lbz r15, 6 (r14)
   cmpwi r15, 0x8
   bne skip_bsuit_count5
   addi r3, r3, 1

   skip_bsuit_count5:
   lbz r15, 7 (r14)
   cmpwi r15, 0x8
   bne skip_bsuit_count6
   addi r3, r3, 1   #Also count Gaddlights: If inventory is stocked up with GaddLights and Bowser Suits, dispose of the Bowser Suit

   skip_bsuit_count6:

   lbz r15, 0 (r14) #Load character bitfield
   rlwinm r15, r15, 31, 28, 31 #Get character. 00: Mario, 01: Luigi, 02: Peach, 03: Yoshi, 04: Wario, 05: DK, 06: Daisy, 07: Waluigi

   cmpwi r15, 6
   bne bsuit_stockup_normal
   cmpwi r3, 3 #Daisy in particular doesn't like to have more than 1 Bowser Suit in her inventory, since it blocks shopping opportunities (now scrapped to accomodate for Gaddlight count)
   beq always_use

   bsuit_stockup_normal:
   cmpwi r3, 3
   beq always_use
   
   skip_bsuit_stockup_check:
   lbz r3, 0xD (r14)# Current iteration player's spot
   lis r14, 0x8018
   ori r14, r14, 0xFC38 #Get base player struct   
   li r24, 0

   #r3 = Own Spot ID
   #r14 = Base Player struct
   #r24 = Iteration

   suit_assessment_loop:
   
   mulli r15, r24, 0x30
   add r15, r14, r15 #Struct of the player currently iterating with. Include self as well, since it will always result on 0

   lbz r15, 0xD (r15)# Current iteration player's spot
   sub r15, r15, r3 # Substract Enemy Spot - Player Spot
   cmpwi r15, 10
   bgt suit_assessment_loop_increment 

   cmpwi r15, 0
   bgt always_use # Use the Bowser Suit if opponent is 1-10 spaces away from player.

   suit_assessment_loop_increment:
   addi r24, r24, 1
   cmpwi r24, 4
   beq dont_use

   b suit_assessment_loop

b dont_use

super_pipe:
   lis r15, 0x8007
   ori r15, r15, 0x59A4 #Get Current Star Space index
   mtctr r15
   bctrl

   #Calc own distance to the star
   lbz r15, 0xD (r14)
   sub r24, r3, r15 #Star Spot ID minus Own Spot ID
   cmpwi r24, 10
   ble check_negative_dist #If 10 spaces or less away from the Star, it -could- mean it's a bad moment to use the Super Pipe. But first, check if the value is negative or zero.

   star_dist_is_negative:
   lis r14, 0x8018
   ori r14, r14, 0xFC38 #Get base player struct

   #r3 = Star Spot ID
   #r14 = Base Player struct
   #r16 = self id
   #r4 = Iteration
   #r24 = Current target ID (for target select window)

   li r4, 0
   li r24, 0
   pipe_assessment_loop:

   cmpw r4, r16
   beq pipe_assessment_loop_increment #Do not increment the current target ID if self
   
   mulli r15, r4, 0x30
   add r15, r14, r15 #Struct of the player currently iterating with

   lbz r15, 0xD (r15)# Current iteration player's spot
   sub r15, r3, r15 # Substract Star Spot - Player Spot
   cmpwi r15, 10
   bgt pipe_assessment_loop_increment 

   cmpwi r15, 0
   bgt use_super_pipe # Use the Super Warp Pipe if one opponent is 1-10 spaces away from the Star.

   addi r24, r24, 1

   pipe_assessment_loop_increment:
   addi r4, r4, 1
   cmpwi r4, 4
   beq dont_use

   b pipe_assessment_loop

b dont_use

use_super_pipe:
lis r15, 0x8007
ori r15, r15, 0x1c3b
stb r24, 0 (r15) #Store target player's ID on 80071c3b, this will be used for the target select window
b always_use

check_negative_dist:
cmpwi r24, 0
ble star_dist_is_negative
b dont_use #Don't use if definitely known that player is 10 spaces or less away from the star

chance_check:

lis r14, 0x8018
ori r14, r14, 0xFD02
lbz r14, 0 (r14) #get current player index
mulli r14, r14, 0x30

lis r15, 0x8018
ori r15, r15, 0xFC38 #player structs start

add r15, r15, r14 #now points to cur player

lbz r15, 0x0009 (r15) #cur player placement byte
andi. r15, r15, 0x60
srwi r15, r15, 5 #return player placement

cmpwi r15, 0
beq dont_use #Don't use Chance Time item if winning

li r15, 0

b always_use

watch_check:

lis r14, 0x8018
ori r14, r14, 0xFD02
lbz r14, 0 (r14) #get current player index
mulli r14, r14, 0x30

lis r15, 0x8018
ori r15, r15, 0xFC38 #player structs start

add r15, r15, r14 #now points to cur player

lbz r15, 0x0009 (r15) #cur player placement byte
andi. r15, r15, 0x60
srwi r15, r15, 5 #return player placement

#Assess when to use the Wacky Watch based on placement and turn
lis r24, 0x8018
ori r24, r24, 0xfcf8 #Get globalstats address
lbz r14, 4 (r24) #Current Turn
lbz r24, 5 (r24) #Max Turns

cmpwi r15, 0
beq check_wacky_use_1st 

cmpwi r15, 1
bge check_wacky_use_other


check_wacky_use_1st:
subi r14, r24, r14
cmpwi r14, 6
bge always_use #First placers use the Wacky Watch when there's 6 turns or more left, to lessen chances of opponents coming back
b dont_use

check_wacky_use_other:
cmpw r24, r14
beq always_use #Other players use it on the last turn, in an attempt to comeback.
b dont_use

#Unused for now: Attempt at improving the AI behavior with Warp Pipes, Chomp Calls and MiniMega Hammers.
#Use the Mega Mushroom check function in reverse to improve Warp Pipe usage and to delete the original Warp Pipe check function
#If an opponent should NOT use a Mega Mushroom, that means they're close to the Star, so it's time to warp to them!!!

#boardchange_start:
#li r14, 0 #Store the iteration in r14
#boardchange_loop:
   #cmpw r14, r16
   #beq boardchange_increment #Don't proceed if it's self
   
   #mr r3, r14 #Use current player id as arg
   #lis r15, 0x8007
   #ori r15, r15, 0x1CBC #If not self, execute Mega Shroom check function
   #mtctr r15
   #li r15, 0
   #bctrl

   #cmpwi r3, 1
   #beq always_use #If the function's result is TRUE, use 

  # boardchange_increment:
  # addi r14, r14, 1   
   #cmpwi r14, 4
 # bge dont_use
#b boardchange_loop

should_steal_check:

  lis r14, 0x8007
  ori r14, r14, 0x1CA1
  li r15, 1
  stb r15, 0 (r14) #Store "1" flag on CPU_ShouldChest

  li r14, 0 #Use r14 as the iteration

  # Get player struct, store on r15
  lis r15, 0x8018
  ori r15, r15, 0xFC38

should_steal_loop:

  cmpw r14, r16
  beq should_steal_increment #Don't proceed if it's self
  
  #Valuable items are:
  #Swap Card, Gaddlight, Booie's Crystal Ball, Magic Lamp, Item Bag, Golden Shroom, Super Mega Shroom, Hidden Block Card, Barter Box, Super Pipe, Chance Charm, Wacky Watch, Plunder Chest, 
  #Reverse Shroom

  lbz r24, 5 (r15)
  
  cmpwi r24, 0x3
  beq always_use

  cmpwi r24, 0x6
  beq always_use

  cmpwi r24, 0x8
  beq always_use

  cmpwi r24, 0xB
  beq always_use

  cmpwi r24, 0xC
  beq always_use

  cmpwi r24, 0xD
  beq always_use
 
  cmpwi r24, 0x10
  beq always_use

  cmpwi r24, 0x11
  beq always_use

  cmpwi r24, 0x13
  beq always_use

  cmpwi r24, 0x14
  beq always_use 

  cmpwi r24, 0x15
  beq always_use

  cmpwi r24, 0x16
  beq always_use

  cmpwi r24, 0x17
  beq always_use

  cmpwi r24, 0x23
  beq always_use

  lbz r24, 6 (r15)
  
  cmpwi r24, 0x3
  beq always_use

  cmpwi r24, 0x6
  beq always_use

  cmpwi r24, 0x8
  beq always_use

  cmpwi r24, 0xB
  beq always_use

  cmpwi r24, 0xC
  beq always_use

  cmpwi r24, 0xD
  beq always_use
 
  cmpwi r24, 0x10
  beq always_use

  cmpwi r24, 0x11
  beq always_use

  cmpwi r24, 0x13
  beq always_use

  cmpwi r24, 0x14
  beq always_use 

  cmpwi r24, 0x15
  beq always_use

  cmpwi r24, 0x16
  beq always_use

  cmpwi r24, 0x17
  beq always_use

  cmpwi r24, 0x23
  beq always_use

  lbz r24, 7 (r15)
  
  cmpwi r24, 0x3
  beq always_use

  cmpwi r24, 0x6
  beq always_use

  cmpwi r24, 0x8
  beq always_use

  cmpwi r24, 0xB
  beq always_use

  cmpwi r24, 0xC
  beq always_use

  cmpwi r24, 0xD
  beq always_use
 
  cmpwi r24, 0x10
  beq always_use

  cmpwi r24, 0x11
  beq always_use

  cmpwi r24, 0x13
  beq always_use

  cmpwi r24, 0x14
  beq always_use 

  cmpwi r24, 0x15
  beq always_use

  cmpwi r24, 0x16
  beq always_use

  cmpwi r24, 0x17
  beq always_use

  cmpwi r24, 0x23
  beq always_use


  should_steal_increment:
    addi r14, r14, 1 
    addi r15, r15, 0x30  
     cmpwi r14, 4
     bge dont_use_chest
 b should_steal_loop
  

b end

should_kill_check:
lbz r15, 6 (r14)
  cmpwi r15, 0xFF
  bne use_normally

li r3, 0 #Use r3 as the iteration
# Get player struct, store on r15
  lis r15, 0x8018
  ori r15, r15, 0xFC38

should_kill_loop:

  cmpw r3, r16
  beq should_kill_increment #Don't proceed if it's self
    
  #Check if opponents have Plunder Chest or Barter Box. If they do, kill the item.

  lbz r24, 5 (r15)
  
  cmpwi r24, 0x13
  beq always_use

  cmpwi r24, 0x17
  beq always_use

  lbz r24, 6 (r15)
  
  cmpwi r24, 0x13
  beq always_use

  cmpwi r24, 0x17
  beq always_use

  lbz r24, 7 (r15)

  cmpwi r24, 0x13
  beq always_use

  cmpwi r24, 0x17
  beq always_use


  should_kill_increment:
    addi r3, r3, 1   
    addi r15, r15, 0x30 
     cmpwi r3, 4
     bge use_normally
 b should_kill_loop
  

b end

use_normally: #For valuable items not killed after checking for enemy Plunder Chests and Barter Boxes. Do the normal checks for these.

cmpwi r4, 0x2C
beq booie_ball_check

cmpwi r4, 0x30
beq mushroom


use_unless_closestar:
   lis r24, 0x8007
   ori r24, r24, 0x1cbc #Use when not too close to the Star
b end

bowser_phone:
   lis r24, 0x8007
   ori r24, r24, 0x2508 #Use like a Booie Crystal Ball
   
   lha r15, 0x1C (r14) #Load current player's coin amount

   cmpwi r15, 0
   beq always_use #Use Bowser Phone on self if lacks coins

   cmpwi r15, 15
   ble dont_use #Keep Bowser Phone hanging around if has few coins. Entertain the possibility of sending it to self if reaches 0 coins.

b end


booie_ball_check:
   lis r24, 0x8018
   ori r24, r24, 0xFCFC
   lbz r24, 0 (r24) #Load current turn

   cmpwi r24, 5
   ble dont_use #Don't use a Booie Ball at turn 5 and before (Because of the early Booie steal being tiny amounts of Coins)

   lis r24, 0x8007
   ori r24, r24, 0x2508 #Use like a Booie Crystal Ball

b end


mushroom:
   lis r24, 0x8007
   ori r24, r24, 0x2584 #Use Shrooms like Magic Lamps (only use if can afford the Star)
b end

dont_use_chest:

  lis r14, 0x8007
  ori r14, r14, 0x1CA1
  li r15, 0
  stb r15, 0 (r14) #Store "0" flag on CPU_ShouldChest
  b dont_use

b end

double_item:
   lbz r15, 7 (r14)
   cmpwi r15, 0xFF
   bne shopper #Use DoubleDip only if has 3 items, and if has at least 30 coins
b dont_use

key:
   #Count amount of skeleton keys. If has 2 keys or more, waste one
   li r3, 0 
   lbz r15, 5 (r14)
   cmpwi r15, 0x19
   bne key1
   addi r3, r3, 1

   key1:
   lbz r15, 6 (r14)
   cmpwi r15, 0x19
   bne key2
   addi r3, r3, 1

   key2:
   lbz r15, 7 (r14)
   cmpwi r15, 0x19
   bne key3
   addi r3, r3, 1
 
   key3:
   cmpwi r3, 2
   bge always_use
b dont_use

shopper:
   # Get current player, multiply by 0x30 (player struct size)
  lha r15, 0x1C (r14) #Load current player's coin amount

  cmpwi r15, 30 #AIs only use Cellullar Shoppers if they have at least 30 coins and aren't too close to the Star. Their optimal goal is to buy a Magic Lamp.
  blt dont_use

  lis r15, 0x8018
  ori r15, r15, 0xfcf8
  lbz r24, 4 (r15) #Current Turn
  lbz r15, 5 (r15) #Max Turns

  cmpwi r15, r24
  beq dont_use #Do not use a Cellullar Shopper on the Last Turn, because it's not possible to buy items.
 
    lis r24, 0x8007
    ori r24, r24, 0x1CBC #Use when not too close to the Star
b end

mega_check:

#Check if the Gecko Code "Event Accesibility doesn't depend on MiniMega status" is active. If it is, use Mega Shrooms with the same timing as normal Shrooms. 
lis r3, 0x8007
ori r3, r3, 0x5ff0
lwz r3, 0 (r3)

lis r24, 0x3860
ori r24, r24, 0x0000

cmpw r3, r24
beq mushroom

b use_unless_closestar

pipe:
   # Get current player, multiply by 0x30 (player struct size)
  lha r15, 0x1C (r14) #Load current player's coin amount

  cmpwi r15, 20 #AIs only use Warp Items if they have at least 20 coins and aren't too close to the Star.
  blt dont_use
    lis r24, 0x8007
    ori r24, r24, 0x1CBC #Use when not too close to the Star
b end

dont_use:
   li r24, 0 #Don't use item
b end

end:
li r14, 0
li r15, 0 #restore from hook
li r16, 0
