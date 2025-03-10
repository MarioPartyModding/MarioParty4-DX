#To be inserted at 80086480
#Load special dice models according to status effects.
#Original instruction
lwz r3, 0 (r4)

lis r14, 0x801D
ori r14, r14, 0x3F44
lbz r15, 0 (r14)
cmpwi r15, 0x17
bne skip_plunder_failsafe

li r15, 5
stb r15, 0 (r14) #Change Plunder Chest ID into pipe before the player rolls the die to prevent item bag glitch on the shop

skip_plunder_failsafe:

#Store current player's placement
#Load curplayer index, multiply by 0x30
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

mulli r15, r15, 0x30

#Get current player placement
lis r5, 0x8018
ori r5, r5, 0xFC38 #player structs start

add r5, r5, r15 #now points to cur player

lbz r5, 0x0009 (r5) #cur player placement byte
andi. r5, r5, 0x60
srwi r5, r5, 5 #return player placement

lis r15, 0x8007 
ori r15, r15, 0x1C98

sth r5, 0 (r15)

#Store current game phase (00: Early, 01: Mid, 02: Late)
#Get turn data used for the code
lis r14, 0x8018
ori r14, r14, 0xFCFC
lbz r5, 1 (r14) #Max Turn
lbz r14, 0 (r14) #Current Turn

li r14, 3
divw r5, r5, r14 #Divide Max Turn / 3.

lis r14, 0x8018 
ori r14, r14, 0xFCFC
lbz r14, 0 (r14) #Current Turn


li r15, 0 #Earlygame byte
cmpw r14, r5
ble set_gamephase

li r15, 1 #Midgame byte

mulli r5, r5, 2
cmpw r14, r5
ble set_gamephase 

li r15, 2 #Lategame byte

set_gamephase:

lis r5, 0x8007 
ori r5, r5, 0x1C9A #Store gamephase on 0x80071C9A

sth r15, 0 (r5)

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

#Check if has plusdice
lbz r15, 2 (r14)

cmpwi r15, 1
bne skip_plusdice

lis r3, 7
ori r3, r3, 212 #Give the player a Blue Dice Block while under the effect of a PlusDice
b end

skip_plusdice:

#Check if has minusdice
lbz r15, 3 (r14)
cmpwi r15, 1
bne skip_minusdice

lis r3, 7
ori r3, r3, 213 #Give the player a Red Dice Block while under the effect of a MinuSdICE
b end

skip_minusdice:

#Check if has speed dice
lbz r15, 4 (r14)
cmpwi r15, 1
blt skip_speeddice

lis r3, 7
ori r3, r3, 214 #Give the player a Green Dice Block while under the effect of a Speed Dice
b end

skip_speeddice:

#Check if has slow dice
lbz r15, 5 (r14)
cmpwi r15, 1
blt skip_slowdice

lis r3, 7
ori r3, r3, 215 #Give the player special dice
b end

skip_slowdice:

#Check if has cursed dice
lbz r15, 6 (r14)
cmpwi r15, 1
bne skip_curseddice

lis r3, 7
ori r3, r3, 216 #Give the player special dice
b end

skip_curseddice:

#Check if has reverse dice
lbz r15, 7 (r14)
cmpwi r15, 1
blt skip_reversedice

lis r3, 7
ori r3, r3, 217 #Give the player special dice
b end

skip_reversedice:



#Check if has multi shroom
lbz r15, 0 (r14)
cmpwi r15, 2
blt skip_multishroom

lis r3, 7
ori r3, r3, 218 #Give the player special dice
b end

skip_multishroom:

#Check if has shroom
lbz r15, 0 (r14)
cmpwi r15, 1
bne end

lis r3, 7
ori r3, r3, 219 #Give the player special dice


end:
li r14, 0
li r15, 0