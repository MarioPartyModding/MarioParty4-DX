#To be inserted at 800862e4
#To be inserted at 800862e4
#Apply all post-diceroll status effects. This approach of using a byte per status allows for double dip

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
bne not_plusdice

mr r15, r30 #Put the dice roll on r15
li r16, 0 #Use r16 as the iterator

#If has plusdice, give coins according to the value rolled
plusdice_loop:

lis r3, 0x8006
ori r3, r3, 0x3EEC 
mtctr r3 #Put coin add func on the CTR
lis r3, 0x8018 
ori r3, r3, 0xFD02
lbz r3, 0 (r3) #Player who will earn the coins (self)
li r4, 1 #Coins player will earn
bctrl #Execute board playercoinadd func

lis r3, 0x8003
ori r3, r3, 0x2A94
mtctr r3
li r3, 7 #Play Coin SFX
bctrl 

lis r3, 0x8000
ori r3, r3, 0xCF0C 
mtctr r3
li r3, 5 #Sleep for a small while
bctrl 

addi r16, r16, 1

cmpw r16, r15
beq exit_plusdice_loop #exit loop

b plusdice_loop

exit_plusdice_loop:
mr r30, r15 #Put the diceroll back on r30

not_plusdice:

#Check if has minusdice
lbz r15, 3 (r14)

cmpwi r15, 1
bne not_minusdice

mr r15, r30 #Put the dice roll on r15
mulli r28, r15, 2 #Multiply by 2 (amount of coins that will be lost)
li r16, 0 #Use r16 as the iterator

#If has minusdice, lose coins according to the value rolled X2
minusdice_loop:

lis r3, 0x8006
ori r3, r3, 0x3EEC 
mtctr r3 #Put coin add func on the CTR
lis r3, 0x8018 
ori r3, r3, 0xFD02
lbz r3, 0 (r3) #Player who will lose the coins (self)
li r4, -1 #Coins player will lose
bctrl #Execute board playercoinadd func

lis r3, 0x8003
ori r3, r3, 0x2A94
mtctr r3
li r3, 15 #Play Coin Loss SFX
bctrl 

lis r3, 0x8000
ori r3, r3, 0xCF0C 
mtctr r3
li r3, 5 #Sleep for a small while
bctrl 

addi r16, r16, 1

cmpw r16, r28
beq exit_minusdice_loop

b minusdice_loop

exit_minusdice_loop:


mr r30, r15 #Restore the dice roll

not_minusdice:
li r28, 0
li r14, 0
li r15, 0 #Restore hooks
li r16, 0
extsb r0, r0