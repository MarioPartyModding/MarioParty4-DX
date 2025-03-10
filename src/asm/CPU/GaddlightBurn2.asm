#To be inserted at 8009e434
#If CPU does not have enough coins to steal a Star, allow them to steal from players that have a Gaddlight, to force them to burn it for just 5 coins

# Get steal type
  lis r3, 0x801D
  ori r3, r3, 0x41E0
  lbz r3, 0 (r3)

# If is stealing a Star, make them not ignore gaddlights
cmpwi r3, 1
bne CoinSteal

avoid_repellent:
li r29, 0
b end

# If is stealing Coins, ignore all gaddlights IF the person with a Gaddlight is in first place
CoinSteal: 


lis r3, 0x8018
ori r3, r3, 0xFC38 #Get P1 struct

lis r14, 0x8018
ori r14, r14, 0xfcf8 
lbz r14, 0xA (r14) #Get current player

li r29, 0 #Iterator
li r22, 0 #ID of the opponent who has the most coins
li r16, 0 #Highest coin count

target_check_loop: #Check who the theft target will be based on Coin amount

cmpw r29, r14
beq target_check_loop_increment

lha r15, 0x1C (r3) #Load current player's coin amount

cmpw r15, r16
blt target_check_loop_increment

#If the current iterated player's coins are higher than the current highest coin amount, make the current iterated player the one who has the most coins and update highest coin count
mr r22, r29 #Iterated player is now player who has the most coins
mr r16, r15 #Iterated player's coin amount is now the highest coin amount


target_check_loop_increment:

addi r29, r29, 1
addi r3, r3, 0x30

cmpwi r29, 4
bge exit_loop

b target_check_loop

exit_loop:
#Now that the ID of the player who has the most coins has been found, check their placement


lis r3, 0x8018
ori r3, r3, 0xFC38 #Get P1 struct
mulli r22, r22, 0x30 #Multiply ID of player who has the most coins with 0x30, add to r3
add r3, r3, r22

lbz r3, 9 (r3) #player placement byte
andi. r3, r3, 0x60
srwi r3, r3, 5 #Get player placement

cmpwi r3, 0
bgt avoid_repellent #Ignore GaddLights if the person with the most coins is in first place. Do take them into consideration if the person with the most coins is 2ND-4TH.

li r29, 100 

end:
li r3, 100
li r14, 0
li r15, 0
li r16, 0
