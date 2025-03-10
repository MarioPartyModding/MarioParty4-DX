#To be inserted at 80083878
#To be inserted at 80083878
#Item Space weights struct
lis r7, 0x8007
ori r7, r7, 0x1C42

# Put globalstats address on r15, for use on conditional item skip code
      lis r15, 0x8018
	  ori r15, r15, 0xfcf8
	  
# Put current player struct on r14, for use on conditional item skip code
    # Get current player, multiply by 0x30 (player struct size)
	  lbz r5, 0xA (r15)
	  mulli r5, r5, 0x30
	  
# Get current player struct
	  lis r14, 0x8018
	  ori r14, r14, 0xFC38
	  add r14, r14, r5
	  
# Calculate the range of random values based on percentages
li r3, 0
li r4, 0

loop_calc:
    cmpwi r3, 0x24 # Exit at 0x24 
    beq- exit_calc
	
	# Skip or modify the odds certain items completely under certain circumstances. Edit or remove these to your liking according to the ruleset you want to play by
	cmpwi r3, 0xD #Item Bag ID 
	bne skip_itembag_check_calc
	   lbz r5, 6 (r14)
	   cmpwi r5, 0xFF
	   bne skip_item_calc #Skip item bag if player only has 1 item slot left
	   
	   lbz r5, 5 (r14)
	   cmpwi r5, 0xD
	   beq skip_item_calc #Skip item bag if player already has one
	   
	   lbz r5, 6 (r14)
	   cmpwi r5, 0xD
	   beq skip_item_calc #Skip item bag if player already has one
	   
	skip_itembag_check_calc:
        lbz r16, 0x2D (r7)	#Toggle Rare Item rarity. 0 = Rare. 1 or any other value = Common
	cmpwi r3, 0x11 #Hidden Block Card ID 
	beq rare_check_calc   
	
        lbz r16, 0x2E (r7)	#Toggle Rare Item rarity. 0 = Rare. 1 or any other value = Common
	cmpwi r3, 0x13 #Barter Box ID 
	beq rare_check_calc   
	
        lbz r16, 0x2F (r7)	#Toggle Rare Item rarity. 0 = Rare. 1 or any other value = Common
	cmpwi r3, 0x14 #Super Pipe
	beq rare_check_calc   
	
        lbz r16, 0x30 (r7)	#Toggle Rare Item rarity. 0 = Rare. 1 or any other value = Common
	cmpwi r3, 0x15 #Chance 
	beq rare_check_calc   
	
        lbz r16, 0x31 (r7)	#Toggle Rare Item rarity. 0 = Rare. 1 or any other value = Common
	cmpwi r3, 0x16 #Wacky Watch 
	beq rare_check_calc   
	
	b skip_rare_check_calc
	
	rare_check_calc:
	   cmpwi r16, 0 # Give players the option to make Hidden Block Card common by modifying this value on the Gecko Code
	   bne skip_rare_check_calc
	   lbz r5, 4 (r15) #Load current turn
	   lbz r16, 5 (r15) #Load max turns
	   sub r16, r16, r5
           lbz r5, 0x2C (r7)	#Homestretch turn byte
	   cmpw r16, r5 #Make Rare Items only appear on item spaces once there's a certain amount of turns left. Here, it will start appearing once the game is 10 turns or less away from ending.
	   bge skip_item_calc
	
	skip_rare_check_calc:
    lhzx r5, r7, r3 # Load the percentage for the current item using r3 as index
    add r4, r4, r5 # Add the percentage to the range of random values
	skip_item_calc:
	li r16, 0 
    addi r3, r3, 1 # Increment index by 1
    b loop_calc
exit_calc:

# Call the random integer function
lis r5, 0x8005
ori r5, r5, 0xFB40 # 0x8005FB40 get rand int function
mtctr r5
mr r3, r4
bctrl

# rand integer in r3 in range of percentages array

# Select the item based on the random integer
li r4, 0
li r5, 0
loop_select:
    cmpwi r5, 0x24 # Exit at 0x24
    beq- exit_select
	
	# Skip or modify the odds certain items completely under certain circumstances. Change or remove these to your liking.
	cmpwi r5, 0xD #Item Bag ID 
	bne skip_itembag_check_select
	   lbz r6, 6 (r14)
	   cmpwi r6, 0xFF
	   bne loop_increment #Skip item bag if player only has 1 item slot left
	   
	   lbz r6, 5 (r14)
	   cmpwi r6, 0xD
	   beq loop_increment #Skip item bag if player already has one
	   
	   lbz r6, 6 (r14)
	   cmpwi r6, 0xD
	   beq loop_increment #Skip item bag if player already has one
	   
	skip_itembag_check_select:
        lbz r16, 0x2D (r7)	#Toggle Rare Item rarity. 0 = Rare. 1 or any other value = Common
	cmpwi r5, 0x11
	beq rare_select_calc   
	
	lbz r16, 0x2E (r7)	#Toggle Rare Item rarity. 0 = Rare. 1 or any other value = Common 
	cmpwi r5, 0x13
	beq rare_select_calc   
	
	lbz r16, 0x2F (r7)	#Toggle Rare Item rarity. 0 = Rare. 1 or any other value = Common  
	cmpwi r5, 0x14
	beq rare_select_calc   
	
	lbz r16, 0x30 (r7)	#Toggle Rare Item rarity. 0 = Rare. 1 or any other value = Common 
	cmpwi r5, 0x15
	beq rare_select_calc   
	
	lbz r16, 0x31 (r7)	#Toggle Rare Item rarity. 0 = Rare. 1 or any other value = Common 
	cmpwi r5, 0x16
	beq rare_select_calc   
	
	b skip_rare_select_calc
	
	rare_select_calc:
	   cmpwi r16, 0 # Give players the option to make Hidden Block Card common by modifying this value on the Gecko Code
	   bne skip_rare_select_calc 
	   lbz r6, 4 (r15) #Load current turn
	   lbz r16, 5 (r15) #Load max turns
	   sub r16, r16, r6
           lbz r6, 0x2C (r7)	#Homestretch turn byte
	   cmpw r16, r6 #Make Rare Items only appear on item spaces once there's a certain amount of turns left. Here, it will start appearing once the game is 6 turns or less away from ending.
	   bge loop_increment
	
	skip_rare_select_calc:
	li r16, 0
    lhzx r6, r7, r5 # Load the percentage for the current item using r5 as index
    sub r3, r3, r6 # Subtract the percentage from the random integer
    cmpwi r3, 0 # Compare the updated random integer with 0
    bge+ loop_increment # If the updated random integer is greater than or equal to 0, continue to the next item
    b exit
loop_increment:
    addi r4, r4, 1 #item id increment
    addi r5, r5, 1 # Increment index by 1 
    b loop_select
exit:
lis r5, 0x817F
ori r5, r5, 0xFFF0
stw r4, 0 (r5)
cmpwi r4, 8
blt- skipModelIncrement
#there's a gap in the item models starting at gaddlight's item id (8)
addi r4, r4, 1

cmpwi r4, 0xF 
blt skipModelIncrement
mulli r4, r4, 2 
addi r4, r4, 0x19 #The custom items start from model ID 0xA4 onwards, with gaps of 1 between them. This will make the value 0xA4, then 0xA6, then 0xA8.. Making the custom models work.

skipModelIncrement:
lis r5, 0x0007
ori r5, r5, 0x006d #base item id
add r3, r4, r5
li r4, 0 #restore from hook
li r5, 0 #restore from hook
li r14, 0 #restore from hook
li r15, 0 #restore from hook
li r16, 0 #restore from hook