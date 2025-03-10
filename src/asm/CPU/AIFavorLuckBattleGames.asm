#To be inserted at 8009ba8c
#Have the AI favor RNG games when picking battle minigames, so they stand more of a chance in solo matches against a skilled human player.
#Priority order goes like this: Bowser's Bigger Blast (pure RNG), Rumble Fishing (Reaction-time), Trace Race (high-level AI somewhat skilled at it), then everything else.
#r25 = Priority given to 1ST option
#r23 = Priority given to 2ND option
#The one with the highest priority gets chosen 

#Store the IDs of both battle minigames 
lis r25, 0x801D
ori r25, r25, 0x41F4
lha r25, 0 (r25)

lis r23, 0x801D
ori r23, r23, 0x41F6
lha r23, 0 (r23)

cmpwi r25, 0x1B8 #Bowser's Bigger Blast
beq choose_first
 
cmpwi r23, 0x1B8 #Bowser's Bigger Blast
beq choose_second

cmpwi r25, 0x1C7 #Rumble Fishing
beq choose_first
 
cmpwi r23, 0x1C7 #Rumble Fishing
beq choose_second

cmpwi r25, 0x194 #Trace Race
beq choose_first
 
cmpwi r23, 0x194 #Trace Race
beq choose_second

choose_first:
li r23, 0
li r25, 0
b end

choose_second:
li r23, 1
li r25, 1

end: