#To be inserted at 80086970
#Apply any DiceRoll-modifying status effects
#PRIORITY ORDER is: Speed Dice, Slow Dice, Poison Shroom

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


#Check if has speeddice

lbz r15, 4 (r14)
cmpwi r15, 1
bne skip_speeddice

li r3, 2
# Run RNG function, the range will be 0-1
lis r15, 0x8005
ori r15, r15, 0xFB40
mtctr r15
bctrl

addi r0, r3, 9 #The dice roll will be RNG result + 9.

b end

skip_speeddice:

#Check if has slowdice

lbz r15, 5 (r14)
cmpwi r15, 1
bne skip_slowdice

li r0, 1 #The dice roll will be 1.

b end

skip_slowdice:

#Check if has slowdice

lbz r15, 6 (r14)
cmpwi r15, 1
bne end

li r3, 3
# Run RNG function, the range will be 0-2
lis r15, 0x8005
ori r15, r15, 0xFB40
mtctr r15
bctrl

addi r0, r3, 1 #The dice roll will be RNG result + 1.

b end


end:

#Check if has more than 3 dices (through DoubleDip). If they do, since MP4 softlocks when attempting to roll a 4th+ dice, add random extra points to their extra rolls
#Maximum amount of dices possible without hacking is 7 (Double Dip, Gold Shroom, Double Dip, Gold Shroom, Gold Shroom)

lis r14, 0x801D
ori r14, r14, 0x40A0 #NumDice
lbz r15, 0 (r14)
cmpwi r15, 3
ble skip_extradice

cmpwi r31, 2
blt skip_extradice

mr r14, r0 #Backup diceroll on r14

# Run RNG function, the range will be 0-9
lis r3, 0x8005
ori r3, r3, 0xFB40
mtctr r3
li r3, 10
bctrl

addi r3, r3, 1
add r14, r14, r3 #Add random 1-10 number to diceroll.

cmpwi r15, 5
bne skip_fifth_dice

li r3, 10
bctrl

addi r3, r3, 1
add r14, r14, r3 #Add random 1-10 number to diceroll.

skip_fifth_dice:

cmpwi r15, 6
bne skip_sixth_dice

li r3, 10
bctrl

addi r3, r3, 1
add r14, r14, r3 #Add random 1-10 number to diceroll.

skip_sixth_dice:

cmpwi r15, 6
bne skip_seventh_dice

li r3, 10
bctrl

addi r3, r3, 1
add r14, r14, r3 #Add random 1-10 number to diceroll.

skip_seventh_dice:

mr r0, r14 #Restore the diceroll to r0

#Change their NumDice to 3 if it's their third dice
lis r14, 0x801D
ori r14, r14, 0x40A0 #NumDice
li r15, 3
stb r15, 0 (r14)





skip_extradice:
extsb r0, r0
li r14, 0
li r15, 0
li r16, 0