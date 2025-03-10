#To be inserted at 80072720
# Improve AI junction decision making, per overlay 
# Get current overlay
# Backup vanilla result to r15
mr r15, r3
lis r28, 0x801D
ori r28, r28, 0x3CE0
lwz r28, 0 (r28)

  lis r3, 0x8007
  ori r3, r3, 0x59A4
  mtctr r3 #Load function to get current star space into CTR

# Get current player, multiply by 0x30 (player struct size)
  lis r4, 0x8018
  ori r4, r4, 0xFD02
  lbz r4, 0 (r4)
  mulli r4, r4, 0x30


cmpwi r28, 0x59
beq toad_check

cmpwi r28, 0x5A
beq goomba_check

cmpwi r28, 0x5B
beq shyguy_check

cmpwi r28, 0x5C
beq booie_check

cmpwi r28, 0x5D
beq koopa_check

cmpwi r28, 0x5E
beq bowser_check

b end

bowser_check:
# Get current player struct
  lis r28, 0x8018
  ori r28, r28, 0xFC38
  add r28, r28, r4

# Get current player space
  lbz r28, 0xD (r28)

  cmpwi r28, 0x49
  beq bowser_check_49

  cmpwi r28, 0x08
  beq bowser_08

  cmpwi r28, 0x3A
  beq bowser_3A

  cmpwi r28, 0x1E
  beq bowser_1E

  cmpwi r28, 0x6B
  beq bowser_check_6B
b end

bowser_check_49:
bctrl #Get current star space
cmpwi r3, 0x48
beq bowser_49_left
li r15, 0x4A #Go up if the star is not left
b end

bowser_check_6B:
bctrl #Get current star space
cmpwi r3, 0x27
beq bowser_6B_left
cmpwi r3, 0x2A
beq bowser_6B_left
li r15, 0x6A #Prefer the path with Booie unless the Star is by 
b end

bowser_6B_left:
li r15, 0x25
b end

bowser_08:
li r15, 0x07
b end

bowser_1E:
li r15, 0x1F #Go up for a chance of winning the lotto
b end

bowser_3A:
li r15, 0x3F #Avoid the item burning event
b end

bowser_49_left:
li r15, 0x4D
b end

koopa_check:
# Get current player struct
  lis r28, 0x8018
  ori r28, r28, 0xFC38
  add r28, r28, r4

# Get current player space
  lbz r28, 0xD (r28)

  cmpwi r28, 0x9
  beq koopa_check_09

  cmpwi r28, 0x34
  beq koopa_34 

  cmpwi r28, 0x6B
  beq koopa_6B 

  cmpwi r28, 0x27
  beq koopa_27

  cmpwi r28, 0x64
  beq koopa_check_64

  cmpwi r28, 0x5B
  beq koopa_check_5B

  cmpwi r28, 0x67
  beq koopa_check_67

b end

koopa_check_67:
bctrl #Get current star space
cmpwi r3, 0x1F
beq koopa_67_up
li r15, 0x66 #Go down if the star is not up
b end

koopa_check_5B:
bctrl #Get current star space
cmpwi r3, 0x29
beq koopa_5B_up
lis r3, 0x5A #Go down if the star is not up
b end

koopa_check_09:
bctrl #Get current star space
cmpwi r3, 0x0B
beq koopa_09_left
li r15, 0x8 #Go down if the star is not left
b end

koopa_check_64:
bctrl #Get current star space
cmpwi r3, 0x48
beq koopa_64_down
li r15, 0x63 #Go to Booie if the star isn't by
b end


koopa_09_left:
li r15, 0xA
b end

koopa_64_down:
li r15, 0x55
b end

koopa_67_up:
li r15, 0x65
b end

koopa_5B_up:
li r15, 0x5D #Go up
b end

koopa_6B:
li r15, 0x4D #Go up
b end

koopa_27:
li r15, 0x26 #Go to Booie
b end

koopa_34:
li r15, 0x50 #Go left
b end

toad_check:
# Get current player struct
  lis r28, 0x8018
  ori r28, r28, 0xFC38
  add r28, r28, r4

# Get current player space
  lbz r28, 0xD (r28)

  cmpwi r28, 0x42
  beq toad_check_42

  cmpwi r28, 0x53
  beq toad_53

  cmpwi r28, 0x4F
  beq toad_check_4F

  cmpwi r28, 0x0E
  beq toad_check_0E

  cmpwi r28, 0x10
  beq toad_check_10

  cmpwi r28, 0x5F
  beq toad_5F

  cmpwi r28, 0x27
  beq toad_check_27

  cmpwi r28, 0x13
  beq toad_check_13

b end

toad_53:
li r15, 0x4F
b end

toad_5F:
li r15, 0x5E #Go right
b end

toad_check_27:
bctrl #Get current star space
cmpwi r3, 0x2C
beq toad_27_left
li r15, 0x28 #Go up if the star is not left
b end

toad_check_13:
bctrl #Get current star space
cmpwi r3, 0x3E
beq toad_13_up

cmpwi r3, 0x46
beq toad_13_up

li r15, 0x34 #Only go up if the Star is up
b end


toad_check_0E:
bctrl #Get current star space
cmpwi r3, 0x51
beq toad_0E_right
li r15, 0x77 #Go up if the star is not right
b end

toad_check_10:
bctrl #Get current star space
cmpwi r3, 0x51
beq toad_10_right
li r15, 0x0F #Go up if the star is not right
b end

toad_check_4F:
bctrl #Get current star space
cmpwi r3, 0x51
beq toad_4F_left
li r15, 0x4E #Go up if the star is not left
b end

toad_check_42:
# Get current player, multiply by 0x30 (player struct size)
  lis r4, 0x8018
  ori r4, r4, 0xFD02
  lbz r4, 0 (r4)
  mulli r4, r4, 0x30

# Get current player struct
  lis r28, 0x8018
  ori r28, r28, 0xFC38
  add r28, r28, r4

  lbz r28, 0xA (r28) #Get amount of moves remaining

  cmpwi r28, 4
  blt toad_42_booie #If the player can't reach the star on the left, go to Booie instead


bctrl #Get current star space
cmpwi r3, 0x3E
beq toad_42_left
toad_42_booie:
li r15, 0x7A #Go to Booie. If the star is left and player can reach it, go left
b end

toad_27_left:
li r15, 0x2B
b end

toad_13_up:
li r15, 0x38
b end

toad_42_left:
li r15, 0x41
b end

toad_4F_left:
li r15, 0x50
b end

toad_10_right:
li r15, 0x69
b end

toad_0E_right:
li r15, 0x52
b end

shyguy_check:
# Get current player struct
  lis r28, 0x8018
  ori r28, r28, 0xFC38
  add r28, r28, r4

# Get current player space
  lbz r28, 0xD (r28)

  cmpwi r28, 0x7A
  beq shyguy_check_7A

  cmpwi r28, 0x2B
  beq shyguy_check_2B

  cmpwi r28, 0x4B
  beq shyguy_check_4B

  cmpwi r28, 0x4E
  beq shyguy_check_4E

  cmpwi r28, 0x12
  beq shyguy_check_12

b end

shyguy_check_7A:
bctrl #Get current star space
cmpwi r3, 0x80
beq shyguy_7A_down
li r15, 0x79 
b end

shyguy_check_12:
bctrl #Get current star space
cmpwi r3, 0x5F
beq shyguy_12_up #Go up if the star is up. Otherwise, go to Booie
li r15, 0x11 
b end

shyguy_check_2B:
bctrl #Get current star space
cmpwi r3, 0x57 #Go up if the Star is up. Otherwise go left for a chance of buying an item
beq shyguy_2B_up 
li r15, 0x2C 
b end

shyguy_check_4B:
bctrl #Get current star space
cmpwi r3, 0x46 #Go down if the Star is down. Otherwise, left.
beq shyguy_4B_down 
li r15, 0x09
b end

shyguy_check_4E:
bctrl #Get current star space
cmpwi r3, 0x51 #Go down if the Star is down. Otherwise, left.
beq shyguy_4E_down 
li r15, 0x4D
b end

shyguy_2B_up:
li r15, 0x55
b end

shyguy_12_up:
li r15, 0x6B
b end

shyguy_4B_down:
li r15, 0x4A
b end

shyguy_4E_down:
li r15, 0x4F
b end

shyguy_7A_down:
li r15, 0x7F #Go down only if the Star is down. Otherwise, go to Booie
b end

goomba_check:
# Get current player struct
  lis r28, 0x8018
  ori r28, r28, 0xFC38
  add r28, r28, r4

# Get current player space
  lbz r28, 0xD (r28)

  cmpwi r28, 0x0E
  beq goomba_check_0E

  cmpwi r28, 0x27
  beq goomba_27

  cmpwi r28, 0x36
  beq goomba_36

  cmpwi r28, 0x5A
  beq goomba_5A

  cmpwi r28, 0x7F
  beq goomba_check_7F


b end

goomba_check_0E:
bctrl #Get current star space
cmpwi r3, 0x55
beq goomba_0E_up
li r15, 0xB
b end

goomba_check_7F:
bctrl #Get current star space
cmpwi r3, 0x5B
beq goomba_7F_left
li r15, 0x4F #Always go to Booie unless the Star is left
b end

goomba_0E_up:
li r15, 0xD #Go up ONLY if the star is up, otherwise go to Booie
b end

goomba_27:
li r15, 0x3D #Going right is always right
b end

goomba_36:
li r15, 0x35 #UP!
b end

goomba_5A:
li r15, 0x5B #Always go right
b end

goomba_7F_left:
li r15, 0x5D
b end


booie_check:
# Get current player struct
  lis r28, 0x8018
  ori r28, r28, 0xFC38
  add r28, r28, r4

# Get current player space
  lbz r28, 0xD (r28)

  cmpwi r28, 0x1E
  beq booie_check_1E

  cmpwi r28, 0x5E
  beq booie_5E

  cmpwi r28, 0xC
  beq booie_0C

  cmpwi r28, 0x55
  beq booie_check_55

  cmpwi r28, 0x40
  beq booie_40

  cmpwi r28, 0x15
  beq booie_check_15

b end

  booie_check_1E:
  bctrl #Get current star space

  cmpwi r3, 0x20
  beq booie_1E_down
  li r15, 0x48 #Go right if the star is not down
  b end

  booie_check_55:
  bctrl #Get current star space

  cmpwi r3, 0x31
  beq booie_55_down
  li r15, 0x28 #Go right if the star is not down
  b end

  booie_check_15:
  bctrl #Get current star space

  cmpwi r3, 0x13
  beq booie_15_down
  li r15, 0x3c #Go right if the star is not down
  b end

booie_40:
li r15, 0x41 #Go up (Aiming for the Star and possibly for happening)
b end

booie_55_down:
li r15, 0x33
b end

booie_5E:
li r15, 0x5F #Go right
b end

booie_1E_down:
li r15, 0x1F #Go down if the STAR is there
b end

booie_15_down:
li r15, 0x14 #Go down if the STAR is there
b end

booie_0C:
li r15, 0xB #Go right no matter what
b end

end:
mr r3, r15 #Put the value of r15 on r3, whether it's the original vanilla value or changed
li r15, 0 #Restore r15
mr r28, r3




