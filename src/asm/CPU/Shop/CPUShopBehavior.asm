#To be inserted at 80079d3c
# MP4 ITEM EXPANSION MOD GECKO CODE - CPU Shop Behavior
# Various extended behaviors for the CPU characters on shops. Both to make them smarter and to give each character more detailed playstyle differences aside from initial item table.

# Get current character, multiply by 0x30 (player struct size)
  lis r15, 0x8018
  ori r15, r15, 0xFD02
  lbz r15, 0 (r15)
  mulli r15, r15, 0x30

# Get current player struct
  lis r14, 0x8018
  ori r14, r14, 0xFC38
  add r14, r14, r15

# Plunder Chest check - HIGHLY increase Plunder Chest priority under certain circumstances:
  cmpwi r4, 0x17
  bne lamp_prio_60

# 1 - Punish Magic Lamp and Booie Bell owners
# 2 - Potentially force players who can't afford the star to kill their lamps
# 3 - Snatch Gaddlight away from players who are in first place

  bl valuable_check

  cmpwi r14, 1
  bne end

  li r3, 59 #Make Plunder Chest second highest priority, only 1 under Magic Lamp

b end

lamp_prio_60:
# Make Magic Lamp Priority 60, to have more room for heightened priority items
  cmpwi r4, 0x0C
  bne gaddlight_check
  li r3, 60

# Check if has no other items
  lbz r15, 5 (r14)
  cmpwi r15, 0xFF
  bne end

# Now check if there's a Plunder Chest or Barter Box in the game. If there is, DON'T buy the Magic Lamp!

  bl plunder_chest_threat_check #Check if there's a Plunder Chest or Barter Box. Output result to r14. (0 = There isn't. 1 = There is. )

  cmpwi r14, 0
  beq end
  li r3, -1 #Kill Magic Lamp Priority if a Plunder Chest was found

  b end

plunder_chest_threat_check:
# Get P1 struct
  lis r14, 0x8018
  ori r14, r14, 0xFC38

# Check it item ID is 0x17 or 0x13
li r16, 0 #Use r16 as iterator
threat_check_loop:
  lbz r15, 5 (r14)

  cmpwi r15, 0x13
  beq chest_found

  lbz r15, 6 (r14)

  cmpwi r15, 0x13
  beq chest_found

  lbz r15, 7 (r14)

  cmpwi r15, 0x13
  beq chest_found

  lbz r15, 5 (r14)

  cmpwi r15, 0x17
  beq chest_found

  lbz r15, 6 (r14)

  cmpwi r15, 0x17
  beq chest_found

  lbz r15, 7 (r14)

  cmpwi r15, 0x17
  beq chest_found

  addi r16, r16, 1
  addi r14, r14, 0x30
  cmpwi r16, 4
  bge no_chest_found

b threat_check_loop

chest_found:
li r14, 1
blr

no_chest_found:
li r14, 0
blr

valuable_check:
# Get P1 struct
  lis r14, 0x8018
  ori r14, r14, 0xFC38

# Check it item ID is 0x17 or 0x13
li r16, 0 #Use r16 as iterator
valuable_check_loop:
  lbz r15, 5 (r14)

  cmpwi r15, 0xC
  beq valuable_found

  lbz r15, 6 (r14)

  cmpwi r15, 0xC
  beq valuable_found

  lbz r15, 7 (r14)

  cmpwi r15, 0xC
  beq valuable_found

  lbz r15, 5 (r14)

  cmpwi r15, 0xB
  beq valuable_found

  lbz r15, 6 (r14)

  cmpwi r15, 0xB
  beq valuable_found

  lbz r15, 7 (r14)

  cmpwi r15, 0xB
  beq valuable_found

  #If first place has a Booie Repellent, aggresively try to snatch it away from them. This also doubles as the same CPU having higher odds to buy a chest themselves if they're in first,
  #Defending against opponents who try to comeback
  lbz r15, 0x0009 (r14) #cur player placement byte
  andi. r15, r15, 0x60
  srwi r15, r15, 5 #return player placement

  cmpwi r15, 0
  bne dont_steal_booie_repellent

  lbz r15, 5 (r14)

  cmpwi r15, 0x8
  beq valuable_found

  lbz r15, 6 (r14)

  cmpwi r15, 0x8
  beq valuable_found

  lbz r15, 7 (r14)

  cmpwi r15, 0x8
  beq valuable_found

  dont_steal_booie_repellent:
  addi r16, r16, 1
  addi r14, r14, 0x30
  cmpwi r16, 4
  bge no_valuable_found

b valuable_check_loop

valuable_found:
li r14, 1
blr

no_valuable_found:
li r14, 0
blr

gaddlight_check:
# Don't buy a Gaddlight if already has one
  lbz r15, 5 (r14)
  cmpwi r15, 0x08
  beq avoid_gaddlight

  lbz r15, 6 (r14)
  cmpwi r15, 0x08
  beq avoid_gaddlight

  lbz r15, 7 (r14)
  cmpwi r15, 0x08
  beq avoid_gaddlight

key_check:
# Check if the Gecko Code "Mini Pipes work at normal Size" is enabled. If it is, Skeleton Keys are useless, so don't buy them.
  lis r15, 0x8006
  ori r15, r15, 0x6348 #Mini Pipes work at normal size insertion address
  lwz r15, 0 (r15)

  lis r16, 0x6000
  ori r16, r16, 0x0000
  
  cmpw r15, r16
  beq avoid_key

  li r16, 0

# Don't buy a Skeleton Key if already has one
  lbz r15, 5 (r14)
  cmpwi r15, 0x19
  beq avoid_key

  lbz r15, 6 (r14)
  cmpwi r15, 0x19
  beq avoid_key

  lbz r15, 7 (r14)
  cmpwi r15, 0x19
  beq avoid_key

# For Skeleton Key purchasing AI: Get the ID of the current star space
   
  cmpwi r4, 0x19
  bne swap_card_check 

  mr r15, r3 #Backup r3
  lis r3, 0x8007
  ori r3, r3, 0x59A4
  mtctr r3
  bctrl

  li r4, 0x19 #Restore r4 to the Skeleton Key's ID
  cmpwi r3, 0x76 #ShyGuy Jungle Jam Star behind the pipe
  beq pursue_key

  cmpwi r3, 0x46 #ShyGuy Jungle Jam Star behind the pipe
  beq pursue_key

  cmpwi r3, 0x70 #Toad Midway Madness star near the top teacups
  beq pursue_key

  cmpwi r3, 0x13 #Booie Star behind the pipe
  beq pursue_key
 
  cmpwi r3, 0x60 #Bowser Board Star behind the pipe
  beq pursue_key

  cmpwi r3, 0x2F #Bowser Board Star behind the pipe
  beq pursue_key

#If didn't end up pursuing the key, restore r3
  mr r3, r15

swap_card_check:
# Don't buy a Swap Card if already has one
  lbz r15, 5 (r14)
  cmpwi r15, 0x06
  beq avoid_swapcard

  lbz r15, 6 (r14)
  cmpwi r15, 0x06
  beq avoid_swapcard

  lbz r15, 7 (r14)
  cmpwi r15, 0x06
  beq avoid_swapcard

swap_card_check_gaddlight:
# Don't buy a Swap Card if has a Gaddlight
  lbz r15, 5 (r14)
  cmpwi r15, 0x08
  beq avoid_swapcard_gaddlight

  lbz r15, 6 (r14)
  cmpwi r15, 0x08
  beq avoid_swapcard_gaddlight

  lbz r15, 7 (r14)
  cmpwi r15, 0x08
  beq avoid_swapcard_gaddlight

swap_card_check_lamp:
# Don't buy a Swap Card if has a Magic Lamp
  lbz r15, 5 (r14)
  cmpwi r15, 0x0C
  beq avoid_swapcard_lamp

  lbz r15, 6 (r14)
  cmpwi r15, 0x0C
  beq avoid_swapcard_lamp

  lbz r15, 7 (r14)
  cmpwi r15, 0x0C
  beq avoid_swapcard_lamp

item_bag_check:
# Avoid item bag altogether if Wario
  cmpwi r4, 0x0D
  bne shopper_check
  
  lbz r15, 0 (r14) #Load character bitfield
  rlwinm r15, r15, 31, 28, 31 #Get character. 00: Mario, 01: Luigi, 02: Peach, 03: Yoshi, 04: Wario, 05: DK, 06: Daisy, 07: Waluigi

  cmpwi r15, 0x4
  beq kill_priority

# Increase Item Bag Priority if all item slots are free
  lbz r15, 5 (r14)
  cmpwi r15, 0xFF
  beq pursue_item_bag

# Let DK buy item bags if he only has 2 free item slots and moneys to spare
  lha r15, 0x1C (r14) #Load current player's coin amount
  cmpwi r15, 77
  ble end

  lbz r15, 0 (r14) #Load character bitfield
  rlwinm r15, r15, 31, 28, 31 #Get character. 00: Mario, 01: Luigi, 02: Peach, 03: Yoshi, 04: Wario, 05: DK, 06: Daisy, 07: Waluigi

  cmpwi r15, 5
  bne end

  lbz r15, 6 (r14)
  cmpwi r15, 0xFF
  beq pursue_item_bag

shopper_check:
# Don't buy a cellullar shopper with a cellullar shopper
  lis r15, 0x8013
  ori r15, r15, 0x839C
  lbz r15, 0 (r15) #Load Celullar Shopper Flag
  cmpwi r15, 0x2
  beq avoid_shopper

booie_check:
# Pursue Booie's Crystal Ball if has enough coins to steal a Star
  lha r15, 0x1C (r14) #Load current player's coin amount
  cmpwi r15, 72 #72 coins: 72 coins - 25 from Booie Crystal Ball Price = 47. Chances are they will land on a blue space and have 50 coins.
  bge pursue_booie

b end

avoid_gaddlight:
  cmpwi r4, 0x08
  bne key_check
  
  lbz r15, 0 (r14) #Load character bitfield
  rlwinm r15, r15, 31, 28, 31 #Get character. 00: Mario, 01: Luigi, 02: Peach, 03: Yoshi, 04: Wario, 05: DK, 06: Daisy, 07: Waluigi

  cmpwi r15, 1
  beq key_check #Luigi stocks up on Gaddlights

  li r3, -1 #Kill Gaddlight priority if found out that player already has one, and current shop item is Gaddlight. 
  b end

avoid_key:
  li r16, 0
  cmpwi r4, 0x19
  bne swap_card_check

  li r3, -1 #Kill Skeleton Key priority if found out that player already has one, and current shop item is Skeleton Key.
  b end

avoid_swapcard:
  cmpwi r4, 0x06
  bne swap_card_check_gaddlight
  li r3, -1 #Kill Swap Card priority if found out that player already has one, and current shop item is Swap Card
  b end

avoid_swapcard_gaddlight:
  cmpwi r4, 0x06
  bne swap_card_check_lamp
  li r3, -1 #Kill Swap Card priority if found out that player has a Gaddlight, and current shop item is Swap Card
  b end

avoid_swapcard_lamp:
  cmpwi r4, 0x06
  bne item_bag_check
  li r3, -1 #Kill Swap Card priority if found out that player has a Lamp, and current shop item is Swap Card
  b end

kill_priority:
  li r3, -1 #Kill priority of item right away, no conditionals, no further checks
b end

pursue_item_bag:
  cmpwi r4, 0x0D
  bne shopper_check

  lbz r15, 0 (r14) #Load character bitfield
  rlwinm r15, r15, 31, 28, 31 #Get character. 00: Mario, 01: Luigi, 02: Peach, 03: Yoshi, 04: Wario, 05: DK, 06: Daisy, 07: Waluigi

  cmpwi r15, 5
  bne pursue_item_bag_mild

  cmpwi r15, 6
  bne pursue_item_bag_mild

  li r3, 55 # Pursue Item Bags aggresively if Daisy or DK. Only ever turn it down for a Magic Lamp.
  b end

pursue_item_bag_mild:
  li r3, 48  # Pursue Item Bag a bit less aggresively (This value is 50 - Amount of Rare items in the game - 1)
             # If the character's favorite item (the one right after Magic Lamp and Rare Items) is in the shop, they will pass up the item bag
             # If it's not, they will buy the bag
b end

avoid_shopper:
  cmpwi r4, 0x12
  bne booie_check
  li r3, -1 #Kill Cellullar Shopper priority if player is buying from a Cellullar Shopper
b end

pursue_key:
 li r3, 53 #Very high priority given to Skeleton Key when the Star is locked behind a MiniPipe
b end

pursue_booie:
  cmpwi r4, 0x0B
  bne end

  lbz r15, 0 (r14) #Load character bitfield
  rlwinm r15, r15, 31, 28, 31 #Get character. 00: Mario, 01: Luigi, 02: Peach, 03: Yoshi, 04: Wario, 05: DK, 06: Daisy, 07: Waluigi

  cmpwi r15, 7
  bne pursue_booie_moderate

  bl plunder_chest_threat_check #Check if there's a Plunder Chest or Barter Box. Output result to r14. (0 = There isn't. 1 = There is. )
  cmpwi r14, 1
  beq kill_priority

  li r3, 70 # Heavy Booie pursuit: Buy Booie Crystal Ball EVEN if there is a Magic Lamp. Spiteful play. Waluigi specific-behavior.
  b end

pursue_booie_moderate:
  bl plunder_chest_threat_check #Check if there's a Plunder Chest or Barter Box. Output result to r14. (0 = There isn't. 1 = There is. )
  cmpwi r14, 1
  beq kill_priority

  li r3, 54 # Moderate Booie pursuit: Buy Boo Crystal Ball unless there's a Magic Lamp
b end

end:
# Original instruction, restore r14 and r15
extsb r30, r3
li r14, 0
li r15, 0
li r16, 0
